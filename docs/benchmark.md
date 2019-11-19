# Benchmark definition format

The best authoritative reference will always be the schema; we recommend [using and editor]({{ "/docs/editor.html" | absolute_url }}). This document describes the overall structure:

| Property                   | Description        |
| -------------------------- | ------------------ |
| name                       | Name of the benchmark, as later identified in the CLI |
| [agents](#agents)          | List of one or more agents for clustered runs. This section can be omitted in [standalone mode]({{ "/docs/installation.html#starting-the-controller-manually" | absolute_url }}). |
| [ergonomics](#ergonomics)  |  Utility options that modify scenarios |
| [http](#http)              | Configure target servers and HTTP connection options. |
| [phases](#phases)          | List of [phases]({{ "/docs/concepts.html#phases" | absolute_url }}) in this benchmark. |
| threads | Number of executors each agent will use. By default it uses only 1 thread for simulating all sessions |
| statisticsCollectionPeriod | Each agent collects statistics and sends them to the controller with specified period. Default is 1 second. |
| staircase                  | This is a shortcut for linking phases into a common type of scenario, called [staircase](#staircase) as the load is gradually increased in steps. |

Besides these all the options for the `constantPerSec` phase type can be embedded into the top-level to allow {% include ghlink.md text='shorthand benchmark syntax' src='core/src/test/resources/scenarios/shortcut.hf.yaml' %} in scenarios with constant load. In that case you cannot use the `phases` declaration, though.

## Agents

This section can be omitted in [standalone mode]({{ "/docs/installation.html#starting-the-controller-manually" | absolute_url }}).

Agents section forms either a list or map with arbitrary agent names and either an inline or properties-style definition:

```yaml
agents:
  someAgent: "inline definition"
  otherAgent:
    foo: bar
```

The definition is passed to an instance of `i.h.api.deployment.Deployer` which will interpret the definition. Deployer implementation is registred using the `java.util.ServiceLoader` and selected through the `io.hyperfoil.deployer` system property. The default (and as of now the only) implementation is `ssh`.

`ssh` deployer accepts either the `[user@]host[:port]` inline syntax or these properties:

| Property | Default          | Description |
| -------- | ---------------- | ----------- |
| user     | Current username | |
| host     |                  | This property is mandatory. |
| port     | 22               | |
| dir      | Directory set by system property `io.hyperfoil.rootdir` or to `/tmp/hyperfoil` | Working directory for the agent. All the required JARs will be copied there and you will find the logs there as well. This directory can be shared by multiple agents running on the same physical machine. |
| extras |                  | Custom options passed to the JVM (system properties, JVM options...)

See an example of ssh deployment configuration:

```yaml
agents:
  agent1: testserver1:22
  agent2: testuser@testserver2
  agent3:
    host: testserver3
    port: 22
    dir: /some/other/path
```

## Ergonomics

This section hosts only single property at this moment:

| Property      | Default | Description |
| ------------- | ------- | ----------- |
| repeatCookies | true    | Automatically parse cookies from HTTP responses, store them in session and resend them with subsequent requests. |

## HTTP

All servers that Hyperfoil should contact must be declared in this section. Before the benchmark starts Hyperfoil agents will open connections to the target servers; if this connection fails the benchmark is terminated immediatelly.

You can either declare single target server (the default one) within this section or more of them:

```yaml
http:
  host: http://example.com
  ...
```

```yaml
http:
- host: http://example.com
  sharedConnections: 100
- host: http://example.com:8080
  sharedConnections: 50
```

HTTP configuration has these properties:

| Property          | Default | Description |
| ----------------- | ------- | ----------- |
| protocol          |         | Either `http` or `https` |
| host              |         | Hostname of the server. For convenience you can use the `http[s]://host[:port]` inline syntax as shown above |
| port              | `80`&nbsp;or&nbsp;`443` | Default is based on the `protocol` |
| sharedConnections | 1       | Number of connections to open. This number is split between all agents and executor threads evenly; if there are too many agents/executors each will get at least 1 connection. It is recommended to redefine this parameter. |
| addresses         |         | Supply list of IPs or IP:port targets that will be used for the connections instead of resolving the `host` in DNS and using `port` as set - `host` and `port` will be used only for `Host` headers and SNI. If this list contains more addresses the connections will be split evenly. |
| requestTimeout    | 30 seconds | Default request timeout, this can be overridden in each `httpRequest`. |
| allowHttp1x       | true    | Allow HTTP 1.1 for connections (e.g. during ALPN). |
| allowHttp2x       | true    | Allow HTTP 2.0 for connections (e.g. during ALPN). If both 1.1 and 2.0 are allowed and `https` is not used (which would trigger ALPN) Hyperfoil will use HTTP 1.1. If only 2.0 is allowed Hyperfoil will start with HTTP 1.1 and perform protocol upgrade to 2.0. |
| directHttp2       | false   | Start with H2C HTTP 2.0 without protocol upgrade. Makes sense only for plain text (`http`) connections. Currently not implemented. |
| maxHttp2Streams   | 100     | Maximum number of requests concurrently enqueued on single HTTP 2.0 connection. |
| pipeliningLimit   | 1       | Maximum number of requests pipelined on single HTTP 1.1 connection. |
| rawBytesHandlers  | true    | Enable or disable using handlers that process HTTP response raw bytes. |
| [keyManager](#keymanager-configuration) |         | TLS key manager for setting up client certificates. |
| [trustManager](#trustmanager-configuration) |         | TLS trust manager for setting up server certificates. |

### KeyManager configuration

All files are loaded when the benchmark is constructed, e.g. on the machine running CLI. You don't need to upload any files to controller or agent machines.

| Property  | Default | Description |
| --------- | ------- | ----------- |
| storeType | JKS     | Implementation of the store. |
| storeFile |         | Path to a file with the store. |
| password  |         | Password for accessing the store file. |
| alias     |         | Keystore alias. |
| certFile  |         | Path to a file with the client certificate. |
| keyFile   |         | Path to a file with client's private key. |

### TrustManager configuration

All files are loaded when the benchmark is constructed, e.g. on the machine running CLI. You don't need to upload any files to controller or agent machines.

| Property  | Default | Description |
| --------- | ------- | ----------- |
| storeType | JKS     | Implementation of the store. |
| storeFile |         | Path to a file with the store. |
| password  |         | Password for accessing the store file. |
| certFile  |         | Path to a file with the server certificate. |


## Phases

You might want to simulate several types of workloads at once: e.g. in an eshop users would come browsing or buying products, and operators would restock the virtual warehouse. Also, driving constant load may not be the best way to run the benchmark: often you want to slowly ramp the load up to let the system adjust (scale up, perform JIT, fill pools) and push the full load only after that. When trying to find system limits, you do the same repetitevely - ramp up the load, measure latencies and if the system meets SLAs (latencies below limits) continue ramping up the load until it breaks.

In Hyperfoil, this all is expressed through *phases*. Phases can run independently of each other;
these simulate certain load execute by a group of users. Within one phase all users execute the same `scenario`
(e.g. logging into the system, buying some goods and then logging off).

A phase can be in one of these states:
* not running (scheduled)
* running
* finished: Users won't start new scenarios but we'll let already-started users complete the scenario.
* terminated: All users are done, all stats are collected and no further requests will be made.
* cancelled: Same as terminated but this phase hasn't been run at all.

There are different types of phases based on the mode of starting new users:

| Type           | Description |
| -------------- | ----------- |
| constantPerSec | The benchmark will start certain number of users according to a schedule regardless of previously started users completing the scenario. This is the open-model. |
| rampPerSec     | Similar to `constantPerSec` but ramps up or down the number of started users throughout the execution of the phase. |
| atOnce         | All users are be started when the phase starts running and once the scenario is completed the users won't retry the scenario. |
| always         | There is fixed number of users and once the scenario is completed the users will start executing the scenario from beginning. This is called a closed-model and is similar to the way many benchmarks with fixed number of threads work. |

See the example of phases configuration:

```yaml
...
phases:
# Over one minute ramp the number of users started each second from 1 to 100
- rampUp:
    rampPerSec:
      initialUsersPerSec: 1
      targetUsersPerSec: 100
      # We expect at most 200 users being active at one moment - see below
      maxSessionsEstimate: 200
      duration: 1m
      scenario: ...
# After rampUp is finished, run for 5 minutes and start 100 new users each second
- steadyState:
    constantPerSec:
      usersPerSec: 100
      maxSessionsEstimate: 200
      startAfter: rampUp
      duration: 5m
      # If some users get stuck, forcefully terminate them after 6 minutes from the phase start
      maxDuration: 6m
      scenario: ...
# 2 minutes after the benchmark has started spawn 5 users constantly doing something for 2 minutes
- outOfBand:
    always:
      users: 5
      startTime: 2m
      duration: 2m
      scenario: ...
- final:
    atOnce:
      users: 1
      # Do something at the end: make sure that both rampUp and steadyState are terminated
      startAfterStrict:
      - rampUp
      - steadyState
      scenario: ...
```

These properties are common for all types of phases:

| Property          | Description |
| ----------------- | ----------- |
| startTime         | Time relative to benchmark start when this phase should be scheduled. In other words, it's the earliest moment when it could be scheduled, other conditions (below) may delay that even further. |
| startAfter        | Phases that must be *finished* before this phase can start. You can use either single phase name, list of phases or a [reference to certain iteration](#iterations). |
| startAfterStrict  | Phases that must be *terminated* before this phase can start. Use the same syntax as for `startAfter`. |
| duration          | Intended duration for the phase (must be defined but for the `atOnce` type). After this time elapses no new sessions will be started; there might be some running sessions still executing operations, though. |
| maxDuration       | After this time elapses all sessions are forcefully terminated. |
| maxUnfinishedSessions | Maximum number of session that are allowed to be open when the phase *finishes*. When there are more open sessions all the other sessions are cancelled and the benchmark is terminated. Unlimited by default. |
| maxIterations     | Maximum number of [iterations](#iterations) this phase will be scaled to. More about that below. |
| scenario          | The [scenario](#scenario) this phase should execute. |
| forks             | See [forks section](#forks) below. |

Below are properties specific for different phase types:

* `atOnce`:
  * `users`: Number of users started at the start of the phase.
* `always`:
  * `users`: Number of users started at the start of the phase. When a user finishes it is immediatelly restarted (any pause must be part of the scenario).
* `constantPerSec`:
  * `usersPerSec`: Number of users started each second.
  * `variance`: Randomize delays between starting users following the [exponential distribution](https://en.wikipedia.org/wiki/Exponential_distribution). That way the starting users behave as the [Poisson point process](https://en.wikipedia.org/wiki/Poisson_point_process). If this is set to `false` users will be started with uniform delays. Default is `true`.
  * `maxSessionsEstimate`: Number of preallocated sessions. This number is split between all agents/executors evenly.
* `rampPerSec`:
  * `initialUsersPerSec`: Rate of started users at the beginning of the phase.
  * `targetUsersPerSec`: Rate of started users at the end of the phase.
  * `variance`: Same as in `constantPerSec`.
  * `maxSessionsEstimate`: Same as in `constantPerSec`.

Hyperfoil initializes all phases before the benchmark starts, pre-allocating memory for sessions.
In the open-model phases it's not possible to know how many users will be active at the same moment
(if the server experiences a 3-second hiccup and we have 100 new users per second this should be at least 300
as all the users will be blocked). However we need to provide the estimate for memory pre-allocation.
If the estimate gets exceeded the benchmark won't fail nor block new users from starting, but new sessions
will be allocated which might negatively impact results accuracy.

Properties `users`, `usersPerSec`, `initialUsersPerSec` and `targetUsersPerSec` can be either a scalar number or [scale with iterations](#iterations) using the `base` and `increment` components. You'll see an example below.

### Forks

As mentioned earlier, users in each phase execute the same scenario. Often it's convenient
to define the ramp-up and steady-state phases just once: the builders allow to declare such 'sub-phases' called forks.
For all purposes but the benchmark configuration these become regular phases of the same type, duration and dependencies (`startAfter`, `startAfterStrict`) as the 'parent' phase but slice the users according to their `weight`:

```yaml
...
phases:
- steadyState:
    constantPerSec:
      usersPerSec: 30
      duration: 5m
      forks:
        sellShares:
          # This phase will start 10 users per second
          weight: 1
          scenario: ...
        buyShares:
          # This phase will start 20 users per second
          weight: 2
          scenario: ...
```

These phases will be later identified as `steadyState/sellShares` and `steadyState/buyShares`. Other phases can still
reference `steadyState` (without suffix) as the dependency: there will be a no-op phase `steadyState` that starts (becomes *running*) as soon as both the forks *finish*, *finish* immediately and terminate once both the forks *terminate*.

### Iterations

In some types of tests it's useful to repeat given phase with increasing load - we call this concept *iterations*. In the example below you can see that `*usersPerSec` are not scalar values; in first iteration the actual value is set to the `base` value but in each subsequent iteration the value is increased by `increment`.

```yaml
...
phases:
- rampUp:
    rampPerSec:
      # Create phases rampUp/000, rampUp/001 and rampUp/002
      maxIterations: 3
      # rampUp/000 will go from 1 to 100 users, rampUp will go from 101 to 200 users...
      initialUsersPerSec:
        base: 1
        increment: 100
      targetUsersPerSec:
        base: 100
        increment: 100
      # rampUp/001 will start after steadyState/000 finishes
      startAfter:
        phase: steadyState
        iteration: previous
      duration: 1m
      scenario: ...
- steadyState:
    constantPerSec:
      maxIterations: 3
      usersPerSec:
        base: 100
        increment: 100
      # steadyState/000 will start after rampUp/000 finishes
      startAfter:
        phase: rampUp
        iteration: same
      duration: 5m
```

Similar to forks, there will be a no-op phase `rampUp` that will start after all
`rampUp/xxx` phases finish and terminate after these terminate. Also there's an implicit dependency
between consecutive iterations: subsequent iteration won't start until previous iteration *terminates*.

The `startAfter` property in this example uses a relative reference to iteration in another phase. Each reference has these properties:

| Property  | Description |
| --------- | |
| phase     | Name of the referenced phase. |
| iteration | Relative number of the iteration; either `none` (default) which references the top-level phase, `same` meaning the iteration with same number, or `previous` with number one lower. |
| fork      | Reference to particular fork in the phase/iteration. |

Iterations can be combined with forks as well - the result name would be e.g. `steadyState/000/sellShares`.

Note that the `maxSessionsEstimate` parameter is not scaling in iterations: all iterations execute the same
scenario, the execution does not overlap and therefore it is possible to share the pool of sessions.
Therefore you should provide an estimate for the iteration spawning the highest load.

### Staircase

Hyperfoil tries to make opinionated decisions, simplifying common types of benchmark setups. That's why it offers a simplified syntax for the scenario where you:

* ramp the load to a certain level
* execute steady state for a while
* ramp it up further
* execute another steady state
* repeat previous two steps over and over

This is called a *staircase* as the load increases in a shape of tilted stairs. Phases such benchmark should consist of are automatically created and linked together, using the same scenario/forks.

`staircase` as a top-level element in the benchmark is mutually exclusive to `scenario` and `phases` elements.

Here is a minimalistic example of such configuration:

{% include codesample.html src='core/src/test/resources/scenarios/staircase.hf.yaml' %}

This element uses these properties:

| Property              | Description |
| --------------------- | ----------- |
| initialRampUpDuration | Duration of the very first phase. Default is no initial ramp-up. |
| initialUsersPerSec    | Rate of users starting at the end of the initial ramp-up. |
| steadyStateDuration   | Duration of each steady-state phase. |
| rampUpDuration        | Duration of each but first ramp-up. Default are no ramp-ups. |
| incrementUsersPerSec  | Increase in the rate of started users in each iteration. |
| maxIterations         | Maximum number of steady-state iterations. |
| scenario              | The [scenario](#scenario) to be executed. |
| forks                 | The [forks](#forks) with different scenarios. |

## Scenario

Scenario is a set of *sequences*. The sequence is a block of sequentially executed *steps*. Contrary to steps in a sequence the sequences within a scenario do not need to be executed sequentially.

The scenario defines one or more `initialSequences` that are enabled from the beginning and other `sequences` that
must be enabled by any of the previously executed sequences. To be more precise it is not the *sequence*
that is enabled but a *sequence instance* as we can run a sequence multiple times in parallel (on different data).
The `initialSequences` enable one instance of each of the referenced sequence.

The session keeps a currently executed step for each of the enabled sequence instances. The step can be blocked
(e.g. waiting for a response to come). The session is looping through current steps in each of the enabled
sequence instances and if the step is not blocked, it is executed. There's no guaranteed order in which non-blocked
steps from multiple enabled sequence instances will be executed.

Here is an example of scenario:
```yaml
scenario:
  initialSequences:
  - login:
    - httpRequest:
        POST: /login
    # Enable instance of sequence 'wait5seconds'
    - next: wait5seconds
  sequences:
  - wait5seconds:
    - thinkTime:
        duration: 5s
    - next: logout
  - logout:
    - httpRequest:
        POST: /logout
```

While this generic approach is useful for complex scenarios with branching logic, simple sequential scenarios can use `orderedSequences` short-cut enabling sequences in given order:

```yaml
scenario:
  orderedSequences:
  - login:
    - httpRequest:
        POST: /login
  - wait5seconds:
    - thinkTime:
        duration: 5s
  - logout:
    - httpRequest:
        POST: /logout
```

This syntax makes the first sequence (`login` in this case) an initial sequence, adds the subsequent sequences and as the last step of each but the last sequence appends a `next` step scheduling a new instance of the following sequence.

To make configuration even more concise you can omit the `orderedSequences` level and start defining the list of sequences under `scenario` right away:

```yaml
scenario:
- login:
  - httpRequest:
      POST: /login
- wait5seconds:
  - thinkTime:
      duration: 5s
- logout:
  - httpRequest:
      POST: /logout
```

An exhaustive list of steps can be found in the [steps reference]({{ "/docs/steps.html" | absolute_url }}).

### Anchors and aliases

Sequences such as logging into the systems will be likely used in different phases/scenarios
and it would be tedious to repeat these. That's where YAML anchors and aliases come into play:

```yaml
...
phases:
- rampUp:
    rampPerSec:
      scenario:
      - login: &login
        - httpRequest:
            POST: /login
        ...
- steadyState:
    constantPerSec:
      ...
      scenario:
      - login: *login
      ...
```

The steps from sequence `login` in phase `rampUp` will be copied verbatim to sequence `login` in phase `steadyState`.

The same concept can be applied on whole scenarios:

```yaml
phases:
- rampUp:
    rampPerSec:
      ...
      scenario: &myScenario
      - login:
          ...
- steadyState:
    constantPerSec:
      ...
      scenario: *myScenario
```

And forks as well:

```yaml
...
phases:
- rampUp:
    rampPerSec:
      ...
      forks:
        sellShares: &sellShares
          weight: 1
          scenario: ...
        buyShares: &buyShares
          weight: 2
          scenario: ...
- steadyState:
    constantPerSec:
      ...
      forks:
        sellShares: *sellShares
        buyShares: *buyShares
```

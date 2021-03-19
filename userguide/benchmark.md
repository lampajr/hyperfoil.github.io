---
---
# Benchmark definition format

The best authoritative reference will always be the schema; we recommend [using Visual Studio Code with schema support]({{ "/docs/editor.html" | absolute_url }}).

This document describes the overall structure of the YAML benchmark definition:

| Property                   | Description        |
| -------------------------- | ------------------ |
| name                       | Name of the benchmark, as later identified in the CLI |
| [agents]({{ "/userguide/benchmark/agents.html" | absolute_url }})          | List of one or more agents for clustered runs. This section can be omitted in [standalone mode]({{ "/userguide/installation/start_manual.html" | absolute_url }}). |
| [pre]({{ "/userguide/hooks.html" | absolute_url }})  | Hooks executed before any benchmark run starts |
| [post]({{ "/userguide/hooks.html" | absolute_url }}) | Hooks executed after any benchmark run terminates |
| [ergonomics]({{ "/userguide/benchmark/ergonomics.html" | absolute_url }})  |  Utility options that modify scenarios |
| [http]({{ "/userguide/benchmark/http.html" | absolute_url }})              | Configure target servers and HTTP connection options. |
| [phases]({{ "/userguide/benchmark/phases.html" | absolute_url }})          | List of [phases]({{ "/docs/concepts.html#phases" | absolute_url }}) in this benchmark. |
| threads | Number of executors each agent will use. By default it uses only 1 thread for simulating all sessions |
| statisticsCollectionPeriod | Each agent collects statistics and sends them to the controller with specified period. Default is 1 second. |
| staircase                  | This is a shortcut for linking phases into a common type of scenario, called [staircase]({{ "/userguide/benchmark/phases.html#staircase" | absolute_url }}) as the load is gradually increased in steps. |

Besides these all the options for the `constantPerSec` phase type can be embedded into the top-level to allow {% include ghlink.md text='shorthand benchmark syntax' src='core/src/test/resources/scenarios/shortcut.hf.yaml' %} in scenarios with constant load. In that case you cannot use the `phases` declaration, though.

## Anchors and aliases

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

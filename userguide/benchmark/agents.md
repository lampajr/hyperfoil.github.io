# Agents

This section can be omitted in [standalone mode]({{ "/userguide/installation/start_manual.html" | absolute_url }}).

Agents section forms either a list or map with arbitrary agent names and either an inline or properties-style definition:

```yaml
agents:
  someAgent: "inline definition"
  otherAgent:
    foo: bar
```

The definition is passed to an instance of `i.h.api.deployment.Deployer` which will interpret the definition. Deployer implementation is registred using the `java.util.ServiceLoader` and selected through the `io.hyperfoil.deployer` system property. The default implementation is `ssh`.

## Common properties

| Property | Default          | Description |
| -------- | ---------------- | ----------- |
| threads  | from benchmark   | Number of threads used by the agent (overrides `threads` in benchmark root).

## SSH Deployer

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

## Kubernetes/Openshift deployer

To activate the kubernetes deployer you should set `-Dio.hyperfoil.deployer=k8s`; the [recommended installation]({{ "/userguide/installation/k8s.html" | absolute_url }}) does that automatically.

The agents are configured the same way as with SSH deployment, only the properties differ. Full reference is provided below.

Example:
```yaml
agents:
  my-agent:
    node: my-worker-node
```

| Property  | Default | Description |
| --------- | ------- | ----------- |
| node      |         | Configures the labels for the `nodeSelector`. If the value does not contain equals sign (`=`) or comma (`,`) this sets the desired value of label `kubernetes.io/hostname`. You can also set multiple custom labels separated by commas, e.g. `foo=bar,kubernetes.io/os=linux`.
| stop      | true    | By default the controller stops all agents immediatelly after the run terminates. In case of errors this is not too convenient as you might want to perform further analysis. To prevent automatic agent shutdown set this to false. |
| log       |         | Name of config map (e.g. `my-config-map`) or config map and its entry (e.g. `my-config-map/log4j2.xml`) that contains the Log4j2 configuration file. Default entry from the config map is `log4j2.xml`. Hyperfoil will mount this configmap as a volume to this agent. |
| extras    |         | Anything in this property will be passed to the agent JVM. |
| image     | quay.io/hyperfoil/hyperfoil:*controller-version* | Different version of Hyperfoil in the agents |
| fetchLogs | true    | Automatically watch agents' logs and store them in the run directory. |

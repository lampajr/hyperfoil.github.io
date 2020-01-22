# Starting the controller manually

Controller is started with
```
bin/controller.sh
```
Any arguments passed to the scripts will be passed as-is to the `java` process.

When you don't intend to run distributed benchmarks you can start the controller in standalone mode:
```
bin/standalone.sh
```
This variant won't deploy any agents remotely and therefore it does not need any `agents: ` section in the [benchmark definition]({{ "/docs/benchmark.html" | absolute_url }}); instead it will use single agent started in the same JVM.

Here is the comprehensive list of all the properties Hyperfoil recognizes:

| Property                             | Default            | Description                           |
| -------------------------------------|--------------------|---------------------------------------|
| io.hyperfoil.controller.host         | localhost          | Host for Controller REST server       |
| io.hyperfoil.controller.port         |              8090  | Port for Controller REST server       |
| io.hyperfoil.rootdir                 | /tmp/hyperfoil     | Root directory for stored files       |
| io.hyperfoil.benchmarkdir            | *root*/benchmark   | Benchmark files (YAML and serialized) |
| io.hyperfoil.rundir                  | *root*/run         | Run result files (configs, stats...)  |
| io.hyperfoil.deployer                | ssh                | Implementation for agents deployment  |
| io.hyperfoil.deployer.timeout        | 15000 ms           | Timeout for agents to start           |
| io.hyperfoil.agent.debug.port        |                    | If set, agent will be started with JVM debug port open |
| io.hyperfoil.agent.debug.suspend     | n                  | Suspend parameter for the debug port  |
| io.hyperfoil.controller.cluster.ip   | first non-loopback | Hostname/IP used for clustering with agents |
| io.hyperfoil.controller.cluster.port |               7800 | Default JGroups clustering port       |
| io.hyperfoil.controller.external.uri |                    | Externally advertised URI of REST server |
| io.hyperfoil.trigger.url             |                    | See below                             |

If `io.hyperfoi.trigger.url` is set the controller does not start benchmark run right away after hitting `/benchmark/my-benchmark/start` ; instead it responds with status 301 and header Location set to concatenation of this string and `BENCHMARK=my-benchmark&RUN_ID=xxxx`. CLI interprets that response as a request to hit CI instance on this URL, assuming that CI will trigger a new job that will eventually call `/benchmark/my-benchmark/start?runId=xxxx` with header `x-trigger-job`. This is useful if the the CI has to synchronize Hyperfoil to other benchmarks that don't use this controller instance.

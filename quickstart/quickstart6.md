# Getting started: Running the server

Until now we have always started our benchmarks from the CLI, using the `run-local` command. This spawns the benchmark in the CLI JVM just using the core logic, and prints out basic statistics to the console. That might be convenient for a quick test or when developing the scenario, but it's not something that you'd use for a full-fledged benchmark.

When testing a reasonably performing system you need multiple nodes driving the load - we call them *agents*. These agents sync up, receive commands and report statistics to a master node, the *controller*. This node exposes a RESTful API to upload & start the benchmark, watch its progress and download results.

There are couple of scripts in the `bin/` directory, notably `bin/controller.sh`, `bin/agent.sh` and `bin/standalone.sh`. You can guess what type of node the former two start; `standalone.sh` starts the controller and one agent in a single JVM. The nodes run as clustered [Vert.x](https://vertx.io/) servers and communicate over the event bus.

Open two terminals; in one terminal start the standalone server and in second terminal start the CLI. Let's try to connect to the server (by default running on `http://localhost:8090`) and upload the [examples/single-request.hf.yaml]({{ site.github.repository_url }}/blob/master/distribution/src/main/resources/examples/single-request.hf.yaml) benchmark:

```
> bin/cli.sh
[hyperfoil@localhost]$ connect
Connected! Server has these agents connected:
* localhost[REGISTERED]
[hyperfoil@localhost]$ upload examples/single-request.hf.yaml
Loaded benchmark single-request, uploading...
... done.
[hyperfoil@localhost]$ run single-request
Started run 0001
```

When you switch to the second terminal, you can see in the logs that the benchmark definition was stored on the server, the benchmark has been executed and its results have been stored to disk. Hyperfoil by default stores benchmarks in directory `/tmp/hyperfoil/benchmark` and data about runs in `/tmp/hyperfoil/run`; check it out:

```
> column -t -s , /tmp/hyperfoil/run/0001/stats/total.csv
Phase    Name  Requests  Responses  Mean       Min        p50.0      p90.0      p99.0      p99.9      p99.99     Max        MeanSendTime  ConnFailure  Reset  Timeouts  2xx  3xx  4xx  5xx  Other  Invalid  BlockedCount  BlockedTime  MinSessions  MaxSessions
example  test  1         1          267911168  267386880  268435455  268435455  268435455  268435455  268435455  268435455  2655879       0            0      0         0    1    0    0    0      0        0             0
```

Reading CSV files directly is not too comfortable; you can check the details through CLI as well:
```
[hyperfoil@localhost]$ stats
Total stats from run 002D
Phase   Sequence  Requests      Mean       p50       p90       p99     p99.9    p99.99    2xx    3xx    4xx    5xx Timeouts Errors
example:
	test:            1 267.91 ms 268.44 ms 268.44 ms 268.44 ms 268.44 ms 268.44 ms      0      1      0      0        0      0
```

By the time you type the `stats` command into CLI the benchmark is already completed and the CLI shows stats for the whole run. Let's try running the [eshop-scale.hf.yaml](https://github.com/Hyperfoil/Hyperfoil//blob/master/distribution/src/main/resources/examples/eshop-scale.hf.yaml) we've seen in previous quickstart; this will give us some time to observe on-line statistics as the benchmark is progressing:

```
> docker run -v $(pwd)/examples/eshop.server:/config:z -p 8080:8083 jordimartin/mmock
```

```
[hyperfoil@localhost]$ upload examples/eshop-scale.hf.yaml
Loaded benchmark eshop-scale, uploading...
... done.
[hyperfoil@localhost]$ run eshop-scale
Started run 0002
[hyperfoil@localhost]$ stats
Recent stats from run 0002
Phase   Sequence  Requests      Mean       p50       p90       p99     p99.9    p99.99    2xx    3xx    4xx    5xx Timeouts Errors
buyingUserSteady/000:
        buy:             8   1.64 ms   1.91 ms   3.05 ms   3.05 ms   3.05 ms   3.05 ms      8      0      0      0        0      0
        browse:          8   2.13 ms   2.65 ms   3.00 ms   3.00 ms   3.00 ms   3.00 ms      8      0      0      0        0      0
browsingUserSteady/000:
        browse:          8   2.74 ms   2.69 ms   2.97 ms   2.97 ms   2.97 ms   2.97 ms      8      0      0      0        0      0
Press Ctr+C to stop watching...
```

You can also see the online progress of the benchmark in terms of phases using the `status` command (hint: use `status --all` to display all phases, including those not started or already terminated):

```
[hyperfoil@localhost]$ status
Run 0002, benchmark eshop-scale
Agents: localhost[INITIALIZED]
Started: 2019/04/15 16:27:24.526
NAME                    STATUS   STARTED       REMAINING  FINISHED  TOTAL DURATION
browsingUserRampUp/006  RUNNING  16:28:54.565  2477 ms
buyingUserRampUp/006    RUNNING  16:28:54.565  2477 ms
Press Ctrl+C to stop watching...
```

When you find out that the benchmark is not going well, you can terminate it prematurely:

```
[hyperfoil@localhost]$ kill
Kill run 0002, benchmark eshop-scale(phases: 2 running, 0 finished, 40 terminated) [y/N]: y
Killed.
```

In the [next quickstart]({{ "/quickstart/quickstart7.html" | absolute_url }}) we will deal with starting clustered Hyperfoil.

{% include quickstart_links.md %}
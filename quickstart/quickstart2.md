# Getting started: Steps and statistics

In [previous quickstart]({{ "/quickstart/quickstart1.html" | absolute_url }}) you created a benchmark
that fires only one HTTP request. Our next example [random-urls.hf.yaml](https://github.com/Hyperfoil/Hyperfoil//blob/master/distribution/src/main/resources/examples/random-urls.hf.yaml) is going to hit random URLs at this server with 10 requests per second. We'll see how to generate random data and collect statistics for different URLs.

First start a mocking server:
```
> go get github.com/jmartin82/mmock
> mmock -server-ip localhost -server-port 8080 -config-path examples/random-urls.server
```
If you prefer running that as Docker container, use
```
> docker run -v $(pwd)/examples/random-urls.server:/config:z -p 8080:8083 jordimartin/mmock
```

Here is the benchmark we're going to run:

{% include codesample.html src='distribution/src/main/resources/examples/random-urls.hf.yaml' %}

So let's run this through CLI:
```
[hyperfoil@localhost]$ run-local examples/random-urls.hf.yaml
Running benchmark 'random-urls'
Using 1 thread(s)
Target servers: http://localhost:8080/ (1 connections)
... (omitting some warnings about unexpected status codes ) ...
Statistics for example/images:
33 requests in 5.0s
                 Avg    Stdev      Max
Latency:        2.95 ms 632.52 μs   4.65 ms
Requests/sec: 6.6
Socket errors: connect 0, reset 0, timeout 0
Non-2xx or 3xx responses: 7
---
Statistics for example/pages:
14 requests in 5.0s
                 Avg    Stdev      Max
Latency:        3.03 ms 779.90 μs   4.75 ms
Requests/sec: 2.8
```
You might wonder why the test did only 47 requests in 5 seconds, instead of 50. The test does not execute one request every 100 ms sharp, it randomizes the times of requests as well; this simulates the [Poission point process](https://en.wikipedia.org/wiki/Poisson_point_process). Longer runs would have lower variance in the total numbers.

Also, the test might take a few milliseconds longer than the configured 5 seconds. We wait for all the requests to be responded and grab statistics only after that.

In the next quickstart you'll see a [more complex scenario]({{ "/quickstart/quickstart3.html" | absolute_url }})

{% include quickstart_links.md %}
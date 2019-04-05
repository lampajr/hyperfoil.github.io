# Getting started

1. Download [latest release](https://github.com/Hyperfoil/Hyperfoil/releases/latest) and unpack it
```
> wget {{ site.last_release.url }}
    && unzip {{ site.last_release.zip }}
    && cd {{ site.last_release.dir }}
```

2. Start Hyperfoil in interactive mode
```
> bin/cli.sh
```

3. Run the minimalistic benchmark, doing only single request to `http://hyperfoil.io`:
```
[hyperfoil@localhost]$ run-local examples/single-request.hf.yaml
Running benchmark 'single-request'
Using 1 thread(s)
Target servers: http://hyperfoil.io:80/ (1 connections)
1 requests in 0.24s
                 Avg    Stdev      Max
Latency:      229.11 ms      0 ns 229.64 ms
Requests/sec: 4.166666666666667
```
Doing one request is not much of a benchmark and the statistics above are moot, but hey, this is a quickstart.

Now that you know how to run a benchmark, let's take a deeper look into [examples/single-request.hf.yaml]({{ site.github.repository_url }}/blob/master/distribution/src/main/resources/examples/single-request.hf.yaml).

{% raw %}
<script src="https://gist-it.appspot.com/github/Hyperfoil/Hyperfoil//blob/master/distribution/src/main/resources/examples/single-request.hf.yaml?footer=no"></script>
{% endraw %}

In the future you might find [editing with schema]({{ "/docs/editor.md" | absolute_url }}) useful but at this point any editor with YAML syntax highlighting will do the job.

Let's start a mocking server of our own and hit it with more requests:
```
> go get github.com/jmartin82/mmock
> mmock -server-ip localhost -server-port 8080 -config-path examples/random-urls.server
```
If you prefer running that as Docker container, use
```
> docker run -v $(pwd)/examples:/config:z -p 8080:8083 \
    jordimartin/mmock -config-path=/config/random-urls.server
```

[random-urls.hf.yaml](https://github.com/Hyperfoil/Hyperfoil//blob/master/distribution/src/main/resources/examples/random-urls.hf.yaml) is going to hit random URLs at this server with 10 requests per second.
{% raw %}
<script src="https://gist-it.appspot.com/github/Hyperfoil/Hyperfoil//blob/master/distribution/src/main/resources/examples/random-urls.hf.yaml?footer=no"></script>
{% endraw %}

So let's run this:
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

The above was the first 'real' benchmark, but it didn't do anything different from what you could run through `ab`, `siege` or similar tools. Of course, the results were not suffering from the [coordinated omission problem]({{ "/TODO" | absolute_url }}), but Hyperfoil can do more. Let's try a more complex scenario, [choose-movie.hf.yaml](https://github.com/Hyperfoil/Hyperfoil//blob/master/distribution/src/main/resources/examples/choose-movie.hf.yaml):

{% raw %}
<script src="https://gist-it.appspot.com/github/Hyperfoil/Hyperfoil//blob/master/distribution/src/main/resources/examples/choose-movie.hf.yaml?footer=no"></script>
{% endraw %}

Start the server and fire the scenario the usual way:

```
> docker run -v $(pwd)/examples:/config:z -p 8080:8083 \
    jordimartin/mmock -config-path=/config/choose-movie.server
> bin/cli.sh
[hyperfoil@localhost]$ run-local examples/choose-movie.hf.yaml
```

To be continued...

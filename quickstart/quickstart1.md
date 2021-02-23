---
redirect_from:
- /quickstart/
---

# Getting started: First benchmark

<span>1.</span> Download [latest release](https://github.com/Hyperfoil/Hyperfoil/releases/latest) and unpack it

```shell
> wget {{ site.last_release.url }} \
    && unzip {{ site.last_release.zip }} \
    && cd {{ site.last_release.dir }}
```


<span>2.</span> Start Hyperfoil in interactive mode (CLI)

```shell
> bin/cli.sh
```

For our first benchmark we'll start an embedded server (controller) within the CLI:

<pre class="nohighlight hljs"><code>
[hyperfoil]$ start-local
Starting controller in default directory (/tmp/hyperfoil)
Controller started, listening on 127.0.0.1:41621
Connecting to the controller...
Connected!
</code></pre>

<span>3.</span> Upload the minimalistic benchmark, doing only single request to `http://hyperfoil.io`, and run it:


<pre class="nohighlight hljs"><code>
[hyperfoil@in-vm]$ upload examples/single-request.hf.yaml
Loaded benchmark single-request, uploading...
... done.
[hyperfoil@in-vm]$ run single-request
Started run 0001
Run 0001, benchmark single-request
Agents: in-vm[STARTING]
Started: 2019/11/15 16:11:43.725    Terminated: 2019/11/15 16:11:43.899
<span class="hfcaption">NAME     STATUS      STARTED       REMAINING  COMPLETED     TOTAL DURATION               DESCRIPTION</span>
example  TERMINATED  16:11:43.725             16:11:43.899  174 ms (exceeded by 174 ms)  1 users at once
</code></pre>

<span>4.</span> Check out performance results:

<pre class="nohighlight hljs"><code>
[hyperfoil@in-vm]$ stats
Total stats from run 000A
<span class="hfcaption">PHASE    METRIC  REQUESTS  MEAN       p50        p90        p99        p99.9      p99.99     2xx  3xx  4xx  5xx  CACHE  TIMEOUTS  ERRORS  BLOCKED</span>
example  test           1  172.49 ms  173.02 ms  173.02 ms  173.02 ms  173.02 ms  173.02 ms    0    1    0    0      0         0       0       0 ns
</code></pre>

Doing one request is not much of a benchmark and the statistics above are moot, but hey, this is a quickstart.

Now that you know how to run a benchmark, let's take a deeper look into {% include example_link.md src='single-request.hf.yaml' %}.

{% include codesample.html src='distribution/src/main/resources/examples/single-request.hf.yaml' %}

In the future you might find [editing with schema]({{ "/docs/editor.html" | absolute_url }}) useful but at this point any editor with YAML syntax highlighting will do the job.

Ready? Let's continue with [something a bit more realistic]({{ "/quickstart/quickstart2.html" | absolute_url }})...

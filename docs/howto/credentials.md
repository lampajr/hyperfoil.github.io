# Using credentials in your scenario

Hyperfoil benchmarks can refer to external files. When you use the `upload` command in CLI the files are automatically attached the the benchmark YAML (relative paths are resolved relative to this file). Later on when editing the file you can choose to re-upload some of these. Once the benchmark is [built](/docs/architecture.html#building-the-scenario) the files are loaded to the in-memory representation - Hyperfoil won't access these files during runtime. With clustered benchmarks these files don't need to be on the agents either - the controller sends serialized in-memory representation to the agents and that contains everything needed for the actual execution.

When testing a workload you will likely skip user registration and come with a list of username+password keys. A convenient way is to keep these in a CSV file that looks like

```
"johny","my-5ec12eT_pwd!"
"bob","superlongpassphrasethatnobodywillguess"
```

We will create a [step](/docs/steps/step_randomCsvRow.html) that selects a random line from such file and stores it in session variables `username` and `password`:

```yaml
- randomCsvRow:
    file: credentials.csv # Path relative to the benchmark
    columns:
      0: username
      1: password
```

The `columns` property has a mapping of zero-based indices of columns in the CSV file. This way you can use a file with some extra information.

In case you don't need to split lines into separate variables you can use the [randomItem](/docs/steps/step_randomItem.md):

```yaml
- randomItem:
    file: usernames.txt
    toVar: username
```

We have selected the credentials, now it's time to execute the login. When users submit a form on HTML page this usually results in a `POST` request with `content-type: application/x-www-form-urlencoded` header and the form contents encoded in the request body. Hyperfoil lets you specify this conveniently using the [form](/docs/steps/step_httpRequest.html#bodyformlist-of-mappings) body formatter:

```yaml
- httpRequest:
    POST: /login
    body:
      form:
        - name: username
          fromVar: username
        - name: password
          fromVar: password
        - name: action
          value: log-me-in-please
```

Successful response from the server carries a token in most cases but the actual method can vary. If the server sets a cookie Hyperfoil automatically records this and sends it on subsequent requests (this can be switched off using [ergonomics.repeatCookies](/userguide/benchmark/ergonomics.html)). If the server sends the token in a response header, e.g. `x-token` you can store it using the header handler into the `token` session variable:

```yaml
- httpRequest:
    # ...
    handler:
      header:
        filter:
          header: "x-token"
          processor:
            store: token
```

If the server returns this token as a part of JSON object - e.g `{ "token": "abc123" }` you would process response body using the [json processor](/docs/steps/processor_json.html) in body handler:

```yaml
- httpRequest:
    # ...
    handler:
      body:
        json:
          query: ".token"
          toVar: token
```

## Runnable example

We have prepared a [runnable example](/benchmarks/credentials.hf.yaml) please inspect the referenced resources. There are two scenarios: **use-cookie** performs the login using the POST from form as shown above and then keeps the secret token in a cookie; **use-bearer-token** performs HTTP Basic authentication, receives a token in headers and then uses that for HTTP Bearer authentication.

You should start with running a [server with mocked responses](https://github.com/Hyperfoil/hyperfoil-examples/tree/main/howto/credentials) in one console:

```sh
podman run --rm -p 8084:8084 quay.io/hyperfoil/hyperfoil-examples
```

In second console start the CLI with in-vm controller (or standalone and open the WebCLI in your browser). We are running in host-network mode to be able to reach localhost from within the container.

<pre class="nohighlight hljs"><code>
podman run --rm -it --net host quay.io/hyperfoil/hyperfoil cli

[hyperfoil]$ start-local
Starting controller in default directory (/tmp/hyperfoil)
Controller started, listening on 127.0.0.1:35243
Connecting to the controller...
Connected to 127.0.0.1:35243!
[hyperfoil@in-vm]$ upload https://hyperfoil.io/benchmarks/credentials.hf.yaml
Loaded benchmark credentials, uploading...
... done.
[hyperfoil@in-vm]$ run
Started run 0000
Run 0000, benchmark credentials
Agents: in-vm[STOPPED]
Started: 2022/10/27 15:48:39.271    Terminated: 2022/10/27 15:48:39.301
<span class="hfcaption">NAME              STATUS      STARTED       REMAINING  COMPLETED     TOTAL DURATION             DESCRIPTION</span>
use-bearer-token  TERMINATED  15:48:39.271             15:48:39.301  30 ms (exceeded by 31 ms)  1 users at once
use-cookie        TERMINATED  15:48:39.271             15:48:39.300  29 ms (exceeded by 30 ms)  1 users at once
[hyperfoil@in-vm]$ stats
Total stats from run 0000
<span class="hfcaption">PHASE             METRIC                 THROUGHPUT   REQUESTS  MEAN     p50      p90      p99      p99.9    p99.99   TIMEOUTS  ERRORS  BLOCKED  2xx  3xx  4xx  5xx  CACHE</span>
use-bearer-token  after-login            33.33 req/s         1  3.79 ms  3.80 ms  3.80 ms  3.80 ms  3.80 ms  3.80 ms         0       0     0 ns    1    0    0    0      0
use-bearer-token  login-with-basic-auth  33.33 req/s         1  4.57 ms  4.59 ms  4.59 ms  4.59 ms  4.59 ms  4.59 ms         0       0     0 ns    0    1    0    0      0
use-bearer-token  request-login-page     33.33 req/s         1  7.49 ms  7.50 ms  7.50 ms  7.50 ms  7.50 ms  7.50 ms         0       0     0 ns    0    0    1    0      0
use-cookie        after-login            34.48 req/s         1  3.69 ms  3.70 ms  3.70 ms  3.70 ms  3.70 ms  3.70 ms         0       0     0 ns    1    0    0    0      0
use-cookie        before-login           34.48 req/s         1  9.60 ms  9.63 ms  9.63 ms  9.63 ms  9.63 ms  9.63 ms         0       0     0 ns    0    0    1    0      0
use-cookie        login-with-form        34.48 req/s         1  4.96 ms  4.98 ms  4.98 ms  4.98 ms  4.98 ms  4.98 ms         0       0     0 ns    1    0    0    0      0
</code></pre>

The list of possibilities is endless; if your use case does not fit any of the above please check out the [reference](docs/reference_processors.html). You can also have a look on a full example in the [second part of Beginner's Guide](/2021/02/09/hf-beginner-guide-2.html#login-workflow).

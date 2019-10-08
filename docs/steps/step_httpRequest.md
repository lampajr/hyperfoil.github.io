# httpRequest

Issues a HTTP request and registers handlers for the response. 

| Property | Description |
| ------- | -------- |
| authority | HTTP authority (host:port) this request should target. Must match one of the entries in <code>http</code> section.  |
| [authority](#authority) (alternative)| HTTP authority (host:port) this request should target. Must match one of the entries in <code>http</code> section.  |
| body | HTTP request body (specified as string).  |
| [body](#body) (alternative)| HTTP request body.  |
| CONNECT | Issue HTTP CONNECT request to given path.  |
| [CONNECT](#CONNECT) (alternative)| Issue HTTP CONNECT request to given path.  |
| DELETE | Issue HTTP DELETE request to given path.  |
| [DELETE](#DELETE) (alternative)| Issue HTTP DELETE request to given path.  |
| GET | Issue HTTP GET request to given path.  |
| [GET](#GET) (alternative)| Issue HTTP GET request to given path.  |
| [handler](#handler) | HTTP response handlers.  |
| HEAD | Issue HTTP HEAD request to given path.  |
| [HEAD](#HEAD) (alternative)| Issue HTTP HEAD request to given path.  |
| headerAppender | <font color="#606060">&lt;no description&gt;</font> |
| [headers](#headers) | HTTP headers sent in the request.  |
| method | HTTP method used for the request. <br>Options:{::nomarkdown}<ul><li><code>GET</code></li><li><code>HEAD</code></li><li><code>POST</code></li><li><code>PUT</code></li><li><code>DELETE</code></li><li><code>OPTIONS</code></li><li><code>PATCH</code></li><li><code>TRACE</code></li><li><code>CONNECT</code></li></ul>{:/} |
| metric | Requests statistics will use this metric name.  |
| [metric](#metric) (alternative)| Allows categorizing request statistics into metrics based on the request path.  |
| OPTIONS | Issue HTTP OPTIONS request to given path.  |
| [OPTIONS](#OPTIONS) (alternative)| Issue HTTP OPTIONS request to given path.  |
| PATCH | Issue HTTP PATCH request to given path.  |
| [PATCH](#PATCH) (alternative)| Issue HTTP PATCH request to given path.  |
| [path](#path) | HTTP path (absolute or relative), including query and fragment.  |
| POST | Issue HTTP POST request to given path.  |
| [POST](#POST) (alternative)| Issue HTTP POST request to given path.  |
| PUT | Issue HTTP PUT request to given path.  |
| [PUT](#PUT) (alternative)| Issue HTTP PUT request to given path.  |
| [sla](#sla) | List of SLAs the requests are subject to.  |
| sync | This request is synchronous; execution of the sequence does not continue until the full response is received. If this step is executed from multiple parallel instances of this sequence the progress of all sequences is blocked until there is a request in flight without response. <p> Default is <code>true</code>.  |
| timeout | Request timeout - after this time the request will be marked as failed and connection will be closed. <p> Defaults to value set globally in <code>http</code> section.  |
| TRACE | Issue HTTP TRACE request to given path.  |
| [TRACE](#TRACE) (alternative)| Issue HTTP TRACE request to given path.  |

### <a id="authority"></a>authority

Generic builder for generating a string. 

| Property | Description |
| ------- | -------- |
| fromVar | Load the string from session variable.  |
| pattern | Use pattern replacing session variables.  |
| value | String value used verbatim.  |

### <a id="body"></a>body

Allows building HTTP request body from session variables. 

| Property | Description |
| ------- | -------- |
| [form](#body.form) | Build form as if we were sending the request using HTML form. This option automatically adds <code>Content-Type: application/x-www-form-urlencoded</code> to the request headers.  |
| fromVar | Use variable content as request body.  |
| pattern | Pattern replacing <code>${sessionvar}</code> with variable contents in a string.  |
| text | String sent as-is.  |

### <a id="body.form"></a>body.form

Build an URL-encoded HTML form body. 

| Property | Description |
| ------- | -------- |
| &lt;any&gt; | Add simple name=value input pair.  |
| [&lt;list of mappings&gt;](#body.form.&lt;list of mappings&gt;) | Add input pair described in the mapping.  |

### <a id="body.form.&lt;list of mappings&gt;"></a>body.form.&lt;list of mappings&gt;

Form element (e.g. as if coming from an INPUT field). 

| Property | Description |
| ------- | -------- |
| name | Input field name.  |
| pattern | Input field value replacing session variables in a pattern, e.g. <code>foo${myvariable}var</code>  |
| value | Input field value (verbatim).  |
| var | Input field value from session variable.  |

### <a id="CONNECT"></a>CONNECT

Generic builder for generating a string. 

| Property | Description |
| ------- | -------- |
| fromVar | Load the string from session variable.  |
| pattern | Use pattern replacing session variables.  |
| value | String value used verbatim.  |

### <a id="DELETE"></a>DELETE

Generic builder for generating a string. 

| Property | Description |
| ------- | -------- |
| fromVar | Load the string from session variable.  |
| pattern | Use pattern replacing session variables.  |
| value | String value used verbatim.  |

### <a id="GET"></a>GET

Generic builder for generating a string. 

| Property | Description |
| ------- | -------- |
| fromVar | Load the string from session variable.  |
| pattern | Use pattern replacing session variables.  |
| value | String value used verbatim.  |

### <a id="handler"></a>handler

Manages processing of HTTP responses. 

| Property | Description |
| ------- | -------- |
| [body](#handler.body) | Handle HTTP response body.  |
| [header](#handler.header) | Handle HTTP response headers.  |
| [onCompletion](index.html#actions) | Action executed when the HTTP response is fully received.  |
| rawBytesHandler | Handler processing not parsed HTTP response.  |
| [status](#handler.status) | Handle HTTP response status.  |

### <a id="handler.body"></a>handler.body

Handle HTTP response body. 

| Property | Description |
| ------- | -------- |
| [json](#handler.body.json) | Parses JSON responses using simple queries.  |
| logInvalid | Logs body chunks from requests marked as invalid.  |
| [parseHtml](#handler.body.parseHtml) | Parses HTML tags and invokes handlers based on criteria.  |
| [passthrough](#handler.body.passthrough) | Adapter sending the body to a processor.  |

### <a id="handler.body.json"></a>handler.body.json

Parses JSON responses using simple queries. 

| Property | Description |
| ------- | -------- |
| [processor](index.html#processors) | Pass the selected parts to another processor.  |
| query | Query selecting the part of JSON.  |
| toArray | Shortcut to store selected parts in an array in the session. Must follow the pattern <code>variable[maxSize]</code>  |

### <a id="handler.body.parseHtml"></a>handler.body.parseHtml

Parses HTML tags and invokes handlers based on criteria. 

| Property | Description |
| ------- | -------- |
| [onEmbeddedResource](#handler.body.parseHtml.onEmbeddedResource) | Handler firing upon reference to other resource, e.g. image, stylesheet...  |

### <a id="handler.body.parseHtml.onEmbeddedResource"></a>handler.body.parseHtml.onEmbeddedResource

Handles <code>&lt;img src="..."&gt;</code>, <code>&lt;link href="..."&gt;</code>, <code>&lt;embed src="..."&gt;</code>, <code>&lt;frame src="..."&gt;</code>, <code>&lt;iframe src="..."&gt;</code>, <code>&lt;object data="..."&gt;</code> and <code>&lt;script src="..."&gt;</code>. <p> Does not handle <code>&lt;source src="..."&gt;</code> or <code>&lt;track src="..."&gt;</code> because browser would choose only one of the options. 

| Property | Description |
| ------- | -------- |
| [fetchResource](#handler.body.parseHtml.onEmbeddedResource.fetchResource) | Automatically download referenced resource.  |
| ignoreExternal | Ignore resources hosted on servers that are not covered in the <code>http</code> section.  |
| [processor](index.html#processors) | Custom processor invoked pointing to attribute data - e.g. in case of <code>&lt;img&gt;</code> tag the processor gets contents of the <code>src</code> attribute.  |

### <a id="handler.body.parseHtml.onEmbeddedResource.fetchResource"></a>handler.body.parseHtml.onEmbeddedResource.fetchResource

Automates download of embedded resources. 

| Property | Description |
| ------- | -------- |
| maxResources | Maximum number of resources that can be fetched.  |
| [metric](#handler.body.parseHtml.onEmbeddedResource.fetchResource.metric) | Metrics selector for downloaded resources.  |
| [onCompletion](index.html#actions) | Action performed when the download of all resources completes.  |

### <a id="handler.body.parseHtml.onEmbeddedResource.fetchResource.metric"></a>handler.body.parseHtml.onEmbeddedResource.fetchResource.metric

Metrics selector for downloaded resources. 

| Property | Description |
| ------- | -------- |
| &lt;list of strings&gt; | {::nomarkdown}Allows categorizing request statistics into metrics based on the request path. The expressions are evaluated in the order as provided in the list. Use one of: <ul> <li><code>regexp -&gt; replacement</code>, e.g. <code>([^?]*)(\?.*)? -&gt; $1</code> to drop the query part. <li><code>regexp</code> (don't do any replaces and use the full path), e.g. <code>.*.jpg</code> <li><code>-&gt; name</code> (metric applied if none of the previous expressions match). </ul> {:/} |

### <a id="handler.body.passthrough"></a>handler.body.passthrough

Adapter sending the body to a processor. 

| Property | Description |
| ------- | -------- |
| defrag | Automatically defragment the body, passing the whole response in single chunk.  |
| [processor](index.html#processors) | Processor that this handler delegates to.  |

### <a id="handler.header"></a>handler.header

Handle HTTP response headers. 

| Property | Description |
| ------- | -------- |
| countHeaders | Stores number of occurences of each header in custom statistics (these can be displayed in CLI using the <code>stats -c</code> command).  |
| logInvalid | Logs headers from requests marked as invalid.  |
| [recordHeaderTime](#handler.header.recordHeaderTime) | Records alternative metric based on values from a header (e.g. when a proxy reports processing time).  |

### <a id="handler.header.recordHeaderTime"></a>handler.header.recordHeaderTime

Records alternative metric based on values from a header (e.g. when a proxy reports processing time). 

| Property | Description |
| ------- | -------- |
| header | Header carrying the time.  |
| metric | Name of the created metric.  |
| unit | Time unit in the header; use either `ms` or `ns`.  |

### <a id="handler.status"></a>handler.status

Handle HTTP response status. 

| Property | Description |
| ------- | -------- |
| [counter](#handler.status.counter) | Counts how many times given status is received.  |
| [range](#handler.status.range) | Marks requests that don't fall into the desired range as invalid.  |

### <a id="handler.status.counter"></a>handler.status.counter

Counts how many times given status is received. 

| Property | Description |
| ------- | -------- |
| add | Number to be added to the session variable.  |
| expectStatus | Expected status (others are ignored). All status codes match by default.  |
| init | Initial value for the session variable.  |
| set | Do not accumulate (add), just set the variable to this value.  |
| var | Variable name.  |

### <a id="handler.status.range"></a>handler.status.range

Marks requests that don't fall into the desired range as invalid. 

| Property | Description |
| ------- | -------- |
| max | Highest accepted status code.  |
| min | Lowest accepted status code.  |

### <a id="HEAD"></a>HEAD

Generic builder for generating a string. 

| Property | Description |
| ------- | -------- |
| fromVar | Load the string from session variable.  |
| pattern | Use pattern replacing session variables.  |
| value | String value used verbatim.  |

### <a id="headers"></a>headers

| Property | Description |
| ------- | -------- |
| &lt;any&gt; | Use header name (e.g. <code>Content-Type</code>) as key and value verbatim.  |
| [&lt;any&gt;](#headers.&lt;any&gt;) (alternative)| Use header name (e.g. <code>Content-Type</code>) as key and specify value in the mapping.  |

### <a id="headers.&lt;any&gt;"></a>headers.&lt;any&gt;

Specifies value that should be sent in headers. 

| Property | Description |
| ------- | -------- |
| fromVar | Load header value from session variable.  |

### <a id="metric"></a>metric

Allows categorizing request statistics into metrics based on the request path. 

| Property | Description |
| ------- | -------- |
| &lt;list of strings&gt; | {::nomarkdown}Allows categorizing request statistics into metrics based on the request path. The expressions are evaluated in the order as provided in the list. Use one of: <ul> <li><code>regexp -&gt; replacement</code>, e.g. <code>([^?]*)(\?.*)? -&gt; $1</code> to drop the query part. <li><code>regexp</code> (don't do any replaces and use the full path), e.g. <code>.*.jpg</code> <li><code>-&gt; name</code> (metric applied if none of the previous expressions match). </ul> {:/} |

### <a id="OPTIONS"></a>OPTIONS

Generic builder for generating a string. 

| Property | Description |
| ------- | -------- |
| fromVar | Load the string from session variable.  |
| pattern | Use pattern replacing session variables.  |
| value | String value used verbatim.  |

### <a id="PATCH"></a>PATCH

Generic builder for generating a string. 

| Property | Description |
| ------- | -------- |
| fromVar | Load the string from session variable.  |
| pattern | Use pattern replacing session variables.  |
| value | String value used verbatim.  |

### <a id="path"></a>path

Generic builder for generating a string. 

| Property | Description |
| ------- | -------- |
| fromVar | Load the string from session variable.  |
| pattern | Use pattern replacing session variables.  |
| value | String value used verbatim.  |

### <a id="POST"></a>POST

Generic builder for generating a string. 

| Property | Description |
| ------- | -------- |
| fromVar | Load the string from session variable.  |
| pattern | Use pattern replacing session variables.  |
| value | String value used verbatim.  |

### <a id="PUT"></a>PUT

Generic builder for generating a string. 

| Property | Description |
| ------- | -------- |
| fromVar | Load the string from session variable.  |
| pattern | Use pattern replacing session variables.  |
| value | String value used verbatim.  |

### <a id="sla"></a>sla

Defines a list of Service Level Agreements (SLAs) - conditions that must hold for benchmark to be deemed successful. 

| Property | Description |
| ------- | -------- |
| [&lt;list of mappings&gt;](#sla.&lt;list of mappings&gt;) | <font color="#606060">&lt;no description&gt;</font> |

### <a id="sla.&lt;list of mappings&gt;"></a>sla.&lt;list of mappings&gt;

Defines a Service Level Agreement (SLA) - conditions that must hold for benchmark to be deemed successful. 

| Property | Description |
| ------- | -------- |
| blockedRatio | Maximum allowed ratio of time spent waiting for usable connection to sum of response latencies. Default is 0 - client must not be blocked.  |
| errorRatio | Maximum allowed ratio of errors. Valid values are 0.0 - 1.0 (inclusive).  |
| [limits](#sla.&lt;list of mappings&gt;.limits) | Percentile limits.  |
| meanResponseTime | Maximum allowed mean (average) response time. Use suffix `ns`, `us`, `ms` or `s` to specify units.  |
| window | Period over which the stats should be collected. By default the SLA applies to stats from whole phase.  |

### <a id="sla.&lt;list of mappings&gt;.limits"></a>sla.&lt;list of mappings&gt;.limits

Percentile limits. 

| Property | Description |
| ------- | -------- |
| [&lt;any&gt;](#sla.&lt;list of mappings&gt;.limits.&lt;any&gt;) | Use percentile (value between 0.0 and 1.0) as key and response time with unit (e.g. `ms`) in suffix as value.  |
| add | <font color="#606060">&lt;no description&gt;</font> |

### <a id="sla.&lt;list of mappings&gt;.limits.&lt;any&gt;"></a>sla.&lt;list of mappings&gt;.limits.&lt;any&gt;

Percentile limits. 

| Property | Description |
| ------- | -------- |
| add | <font color="#606060">&lt;no description&gt;</font> |

### <a id="TRACE"></a>TRACE

Generic builder for generating a string. 

| Property | Description |
| ------- | -------- |
| fromVar | Load the string from session variable.  |
| pattern | Use pattern replacing session variables.  |
| value | String value used verbatim.  |


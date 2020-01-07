# httpRequest

Issues a HTTP request and registers handlers for the response. 

| Property | Type | Description |
| ------- | ------- | -------- |
| authority | String | HTTP authority (host:port) this request should target. Must match one of the entries in <code>http</code> section.  |
| authority (alternative)| [Builder](#authority) | HTTP authority (host:port) this request should target. Must match one of the entries in <code>http</code> section.  |
| body | String | HTTP request body (specified as string).  |
| body (alternative)| [Builder](#body) | HTTP request body.  |
| CONNECT | String | Issue HTTP CONNECT request to given path.  |
| CONNECT (alternative)| [Builder](#CONNECT) | Issue HTTP CONNECT request to given path.  |
| DELETE | String | Issue HTTP DELETE request to given path.  |
| DELETE (alternative)| [Builder](#DELETE) | Issue HTTP DELETE request to given path.  |
| GET | String | Issue HTTP GET request to given path.  |
| GET (alternative)| [Builder](#GET) | Issue HTTP GET request to given path.  |
| handler | [Builder](#handler) | HTTP response handlers.  |
| HEAD | String | Issue HTTP HEAD request to given path.  |
| HEAD (alternative)| [Builder](#HEAD) | Issue HTTP HEAD request to given path.  |
| headers | [Builder](#headers) | HTTP headers sent in the request.  |
| method | enum | HTTP method used for the request. <br>Options:{::nomarkdown}<ul><li><code>GET</code></li><li><code>HEAD</code></li><li><code>POST</code></li><li><code>PUT</code></li><li><code>DELETE</code></li><li><code>OPTIONS</code></li><li><code>PATCH</code></li><li><code>TRACE</code></li><li><code>CONNECT</code></li></ul>{:/} |
| metric | String | Requests statistics will use this metric name.  |
| metric (alternative)| [&lt;list of strings&gt;](#metric) | Allows categorizing request statistics into metrics based on the request path.  |
| OPTIONS | String | Issue HTTP OPTIONS request to given path.  |
| OPTIONS (alternative)| [Builder](#OPTIONS) | Issue HTTP OPTIONS request to given path.  |
| PATCH | String | Issue HTTP PATCH request to given path.  |
| PATCH (alternative)| [Builder](#PATCH) | Issue HTTP PATCH request to given path.  |
| path | [Builder](#path) | HTTP path (absolute or relative), including query and fragment.  |
| POST | String | Issue HTTP POST request to given path.  |
| POST (alternative)| [Builder](#POST) | Issue HTTP POST request to given path.  |
| PUT | String | Issue HTTP PUT request to given path.  |
| PUT (alternative)| [Builder](#PUT) | Issue HTTP PUT request to given path.  |
| sla | [Builder](#sla) | List of SLAs the requests are subject to.  |
| sync | boolean | This request is synchronous; execution of the sequence does not continue until the full response is received. If this step is executed from multiple parallel instances of this sequence the progress of all sequences is blocked until there is a request in flight without response. <p> Default is <code>true</code>.  |
| timeout | String | Request timeout - after this time the request will be marked as failed and connection will be closed. <p> Defaults to value set globally in <code>http</code> section.  |
| TRACE | String | Issue HTTP TRACE request to given path.  |
| TRACE (alternative)| [Builder](#TRACE) | Issue HTTP TRACE request to given path.  |

### <a id="authority"></a>authority

Generic builder for generating a string. 

| Property | Type | Description |
| ------- | ------- | ------- |
| fromVar | String | Load the string from session variable.  |
| pattern | String | Use pattern replacing session variables.  |
| value | String | String value used verbatim.  |

### <a id="body"></a>body

Allows building HTTP request body from session variables. 

| Property | Type | Description |
| ------- | ------- | ------- |
| form | [Builder](#bodyform) | Build form as if we were sending the request using HTML form. This option automatically adds <code>Content-Type: application/x-www-form-urlencoded</code> to the request headers.  |
| fromVar | String | Use variable content as request body.  |
| pattern | String | Pattern replacing <code>${sessionvar}</code> with variable contents in a string.  |
| text | String | String sent as-is.  |

### <a id="body.form"></a>body.form

Build an URL-encoded HTML form body. 

| Property | Type | Description |
| ------- | ------- | ------- |
| &lt;any&gt; | String | Add simple name=value input pair.  |
| &lt;list of mappings&gt; | [&lt;list of builders&gt;](#bodyformlist-of-mappings) | Add input pair described in the mapping.  |

### <a id="body.form.&lt;list of mappings&gt;"></a>body.form.&lt;list of mappings&gt;

Form element (e.g. as if coming from an INPUT field). 

| Property | Type | Description |
| ------- | ------- | ------- |
| fromVar | String | Input field value from session variable.  |
| name | String | Input field name.  |
| pattern | String | Input field value replacing session variables in a pattern, e.g. <code>foo${myvariable}var</code>  |
| value | String | Input field value (verbatim).  |

### <a id="CONNECT"></a>CONNECT

Generic builder for generating a string. 

| Property | Type | Description |
| ------- | ------- | ------- |
| fromVar | String | Load the string from session variable.  |
| pattern | String | Use pattern replacing session variables.  |
| value | String | String value used verbatim.  |

### <a id="DELETE"></a>DELETE

Generic builder for generating a string. 

| Property | Type | Description |
| ------- | ------- | ------- |
| fromVar | String | Load the string from session variable.  |
| pattern | String | Use pattern replacing session variables.  |
| value | String | String value used verbatim.  |

### <a id="GET"></a>GET

Generic builder for generating a string. 

| Property | Type | Description |
| ------- | ------- | ------- |
| fromVar | String | Load the string from session variable.  |
| pattern | String | Use pattern replacing session variables.  |
| value | String | String value used verbatim.  |

### <a id="handler"></a>handler

Manages processing of HTTP responses. 

| Property | Type | Description |
| ------- | ------- | ------- |
| body | [Processor.Builder](index.html#processors) | Handle HTTP response body.  |
| header | [HeaderHandler.Builder](#handlerheader) | Handle HTTP response headers.  |
| onCompletion | [Action.Builder](index.html#actions) | Action executed when the HTTP response is fully received.  |
| rawBytes | [RawBytesHandler.Builder](#handlerrawBytes) | Handler processing HTTP response before parsing.  |
| status | [StatusHandler.Builder](#handlerstatus) | Handle HTTP response status.  |

### <a id="handler.header"></a>handler.header

Handle HTTP response headers. 

| Property | Type | Description |
| ------- | ------- | ------- |
| countHeaders | CountHeadersHandler.Builder | Stores number of occurences of each header in custom statistics (these can be displayed in CLI using the <code>stats -c</code> command).  |
| filter | [FilterHeaderHandler.Builder](#handlerheaderfilter) | Compares if the header name matches expression and invokes a processor with the value.  |
| logInvalid | LogInvalidHandler.HeaderHandlerBuilder | Logs headers from requests marked as invalid.  |
| recordHeaderTime | [RecordHeaderTimeHandler.Builder](#handlerheaderrecordHeaderTime) | Records alternative metric based on values from a header (e.g. when a proxy reports processing time).  |

### <a id="handler.header.filter"></a>handler.header.filter

Compares if the header name matches expression and invokes a processor with the value. 

| Property | Type | Description |
| ------- | ------- | ------- |
| header | [Builder](#handlerheaderfilterheader) | Condition on the header name.  |
| processor | [Processor.Builder](index.html#processors) | Processor that will be invoked with the value (converted to ByteBuf).  |

### <a id="handler.header.filter.header"></a>handler.header.filter.header


| Inline definition |
| -------- |
| String that should be matched. |

| Property | Type | Description |
| ------- | ------- | ------- |
| caseSensitive | boolean | True if the case must match, false if the check is case-insensitive.  |
| endsWith | CharSequence | Suffix for the string.  |
| matchVar | String | Fetch the value from a variable.  |
| startsWith | CharSequence | Prefix for the string.  |
| value | CharSequence | Literal value the condition should match.  |

### <a id="handler.header.recordHeaderTime"></a>handler.header.recordHeaderTime

Records alternative metric based on values from a header (e.g. when a proxy reports processing time). 

| Property | Type | Description |
| ------- | ------- | ------- |
| header | String | Header carrying the time.  |
| metric | String | Name of the created metric.  |
| unit | String | Time unit in the header; use either `ms` or `ns`.  |

### <a id="handler.rawBytes"></a>handler.rawBytes

Handler processing HTTP response before parsing. 

| Property | Type | Description |
| ------- | ------- | ------- |
| responseSizeRecorder | [ResponseSizeRecorder.Builder](#handlerrawBytesresponseSizeRecorder) | Accumulates response sizes into custom metric.  |

### <a id="handler.rawBytes.responseSizeRecorder"></a>handler.rawBytes.responseSizeRecorder

Accumulates response sizes into custom metric. 


| Inline definition |
| -------- |
| Name of the custom metric. |

| Property | Type | Description |
| ------- | ------- | ------- |
| customMetric | String | Name of the custom metric.  |

### <a id="handler.status"></a>handler.status

Handle HTTP response status. 

| Property | Type | Description |
| ------- | ------- | ------- |
| counter | [StatusToCounterHandler.Builder](#handlerstatuscounter) | Counts how many times given status is received.  |
| range | [RangeStatusValidator.Builder](#handlerstatusrange) | Marks requests that don't fall into the desired range as invalid.  |

### <a id="handler.status.counter"></a>handler.status.counter

Counts how many times given status is received. 

| Property | Type | Description |
| ------- | ------- | ------- |
| add | int | Number to be added to the session variable.  |
| expectStatus | int | Expected status (others are ignored). All status codes match by default.  |
| init | int | Initial value for the session variable.  |
| set | int | Do not accumulate (add), just set the variable to this value.  |
| var | String | Variable name.  |

### <a id="handler.status.range"></a>handler.status.range

Marks requests that don't fall into the desired range as invalid. 


| Inline definition |
| -------- |
| Single status code (<code>204</code>), masked code (<code>2xx</code>) or range (<code>200-399</code>). |

| Property | Type | Description |
| ------- | ------- | ------- |
| max | int | Highest accepted status code.  |
| min | int | Lowest accepted status code.  |

### <a id="HEAD"></a>HEAD

Generic builder for generating a string. 

| Property | Type | Description |
| ------- | ------- | ------- |
| fromVar | String | Load the string from session variable.  |
| pattern | String | Use pattern replacing session variables.  |
| value | String | String value used verbatim.  |

### <a id="headers"></a>headers

| Property | Type | Description |
| ------- | ------- | ------- |
| &lt;any&gt; | String | Use header name (e.g. <code>Content-Type</code>) as key and value verbatim.  |
| &lt;any&gt; (alternative)| [Builder](#headersany) | Use header name (e.g. <code>Content-Type</code>) as key and specify value in the mapping.  |

### <a id="headers.&lt;any&gt;"></a>headers.&lt;any&gt;

Specifies value that should be sent in headers. 

| Property | Type | Description |
| ------- | ------- | ------- |
| fromVar | String | Load header value from session variable.  |
| pattern | String | Load header value using a pattern.  |

### <a id="metric"></a>metric

Allows categorizing request statistics into metrics based on the request path. 

| Property | Type | Description |
| ------- | ------- | ------- |
| &lt;list of strings&gt; | &lt;list of strings&gt; | {::nomarkdown}Allows categorizing request statistics into metrics based on the request path. The expressions are evaluated in the order as provided in the list. Use one of: <ul> <li><code>regexp -&gt; replacement</code>, e.g. <code>([^?]*)(\?.*)? -&gt; $1</code> to drop the query part. <li><code>regexp</code> (don't do any replaces and use the full path), e.g. <code>.*.jpg</code> <li><code>-&gt; name</code> (metric applied if none of the previous expressions match). </ul> {:/} |

### <a id="OPTIONS"></a>OPTIONS

Generic builder for generating a string. 

| Property | Type | Description |
| ------- | ------- | ------- |
| fromVar | String | Load the string from session variable.  |
| pattern | String | Use pattern replacing session variables.  |
| value | String | String value used verbatim.  |

### <a id="PATCH"></a>PATCH

Generic builder for generating a string. 

| Property | Type | Description |
| ------- | ------- | ------- |
| fromVar | String | Load the string from session variable.  |
| pattern | String | Use pattern replacing session variables.  |
| value | String | String value used verbatim.  |

### <a id="path"></a>path

Generic builder for generating a string. 

| Property | Type | Description |
| ------- | ------- | ------- |
| fromVar | String | Load the string from session variable.  |
| pattern | String | Use pattern replacing session variables.  |
| value | String | String value used verbatim.  |

### <a id="POST"></a>POST

Generic builder for generating a string. 

| Property | Type | Description |
| ------- | ------- | ------- |
| fromVar | String | Load the string from session variable.  |
| pattern | String | Use pattern replacing session variables.  |
| value | String | String value used verbatim.  |

### <a id="PUT"></a>PUT

Generic builder for generating a string. 

| Property | Type | Description |
| ------- | ------- | ------- |
| fromVar | String | Load the string from session variable.  |
| pattern | String | Use pattern replacing session variables.  |
| value | String | String value used verbatim.  |

### <a id="sla"></a>sla

Defines a list of Service Level Agreements (SLAs) - conditions that must hold for benchmark to be deemed successful. 

| Property | Type | Description |
| ------- | ------- | ------- |
| &lt;list of mappings&gt; | [&lt;list of builders&gt;](#slalist-of-mappings) | <font color="#606060">&lt;no description&gt;</font> |

### <a id="sla.&lt;list of mappings&gt;"></a>sla.&lt;list of mappings&gt;

Defines a Service Level Agreement (SLA) - conditions that must hold for benchmark to be deemed successful. 

| Property | Type | Description |
| ------- | ------- | ------- |
| blockedRatio | double | Maximum allowed ratio of time spent waiting for usable connection to sum of response latencies. Default is 0 - client must not be blocked.  |
| errorRatio | double | Maximum allowed ratio of errors. Valid values are 0.0 - 1.0 (inclusive).  |
| limits | [Builder](#slalist-of-mappingslimits) | Percentile limits.  |
| meanResponseTime | String | Maximum allowed mean (average) response time. Use suffix `ns`, `us`, `ms` or `s` to specify units.  |
| window | String | Period over which the stats should be collected. By default the SLA applies to stats from whole phase.  |

### <a id="sla.&lt;list of mappings&gt;.limits"></a>sla.&lt;list of mappings&gt;.limits

Percentile limits. 

| Property | Type | Description |
| ------- | ------- | ------- |
| &lt;any&gt; | String | Use percentile (value between 0.0 and 1.0) as key and response time with unit (e.g. `ms`) in suffix as value.  |

### <a id="TRACE"></a>TRACE

Generic builder for generating a string. 

| Property | Type | Description |
| ------- | ------- | ------- |
| fromVar | String | Load the string from session variable.  |
| pattern | String | Use pattern replacing session variables.  |
| value | String | String value used verbatim.  |


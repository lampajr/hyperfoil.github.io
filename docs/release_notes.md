---
---
# Release notes

## 0.16 (2021-06-11)

* This release removes some code-bloat for extension developers, using reflection to scan the scenario:
    * Session variables do not need to be explicitly reserved in `ResourceUtilizer.reserve()` method.
    * Components owning another components do not have to propagate the resource resevation calls.
* Automatic check for reading from a variable that's never written to.
* Controller can loads statistics from old runs (therefore CLI can show stats from runs before reboot)
    * Statistics from old runs are unloaded in order to prevent running out-of-memory in constrained environments.
* Phases can now be marked with `isWarmup: true` - reporting can hide data from these phases by default
* Agents deployed via SSH can set list of cpus on which to run (using taskset).
* Self-checks for excessive CPU usage on agents, record CPU usage in each phase.
* Various fixes and improvements in WebCLI.


## 0.15 (2021-04-09)

* Introduced statistics for connections (#connections by type, active connections and in-flight requests...)
* New connection strategies: Open connections for each session/request
    * `ergonomics.privatePools` replaced by `http.connectionStrategy`
* `http.sharedConnections` can be set using sub-properties `core`, `max`, `buffer` and `keepAliveTime`.
* Dropped `RequestProcessorBuilder` and `HttpRequestProcessorBuilder` in favor of `Processor.Builder`
    * If the processor is used in an incompatible context it should cause a runtime error
* POC support for Hot Rod protocol connecting to Infinispan clusters.
* k8s deployer: agent labels and tolerations
* Many improvements to WebCLI, notably automatic reconnect and `plot` command
* Statistics rework: HTTP-related statistics are separated into extensions, some fields were dropped or renamed
    * Report schema changed to v3.0 to reflect this (+piggybacked agent address/name changes)
* Upgrade to Vert.x 4.0

## 0.14 (2021-02-22)

* Significant refactoring of HTTP-related code into its own module
    * Programmatic configuration requires some changes but there were no changes for YAML definitions
* Hyperfoil Controller now serves WebCLI at root path
    * OpenAPI definition moved to `/openapi`

## 0.13 (2021-01-28)

This is mostly a bugfix release with minor convenience improvements.

* Run CLI in container simply using `docker/podman run -it --rm --network=host quay.io/hyperfoil/hyperfoil cli`

## 0.12 (2020-12-16)

* Hyperfoil now requires JDK 11
* BREAKING CHANGE: extra files are now loaded relative to benchmark YAML file, not working directory
* CLI improvements:
    * Upload benchmarks in text-mode (lower chance of serialization issues)
    * Ask for re-upload of extra files
    * `inspect` command to reveal detailed structure of the benchmark
* Status 4xx and 5xx is not counted as error for purposes of `SLA.errorRatio` (use `SLA.invalidRatio`)
* Hyperfoil controller can be exposed using HTTPS and offers Basic authentication scheme.
* Mode with coordinated-omission compensation: see [httpRequest.compensation]({{ "/docs/steps/step_httpRequest.html#compensation" | absolute_url }}).
* Support for GZIP compression of responses: see [httpRequest.compression]({{ "/docs/steps/step_httpRequest.html#compression" | absolute_url }}).
* New generator step: `randomFile`
* Image build now can be done using `podman`

## 0.11 (2020-11-18)

* Fix a critical memory leak in the use of Netty's direct buffers.
* Fix problems in HTML redirect.

## 0.10 (2020-11-13)

* Explicit concurrency limits on sequences, e.g `mySequence[6]`.
    * `maxSequences` on scenario is not used anymore.
* Concurrent sequences have its own copy of each resource by default.
* Reworked `loop` step.
* Renamed `simple` recorder (processor) to `store`.
* Step `httpRequest` now implements `handler.followRedirect`, automatically sending another request(s) upon 3xx status or &lt;meta http-equiv="refresh" ...&gt; in HTML.
* HTTP 1.1 is now implemented without relying on Netty's parser - saving allocations (HTTP 2.0 is still TODO).
* Reworked ways to modify other parts of the benchmark from withing the builder (Locator).
* Reduced need for boilerplate code in builders.
* Many bugfixes and small improvements.

## 0.9 (2020-05-28)

This is a bugfix-release.

## 0.8 (2020-04-24)

* Renamed phase types:
    * `constantPerSec` &rarr; `constantRate`
    * `rampPerSec` &rarr; `increasingRate`/`decreasingRate`
* Change meaning of `SLA.blockedRatio`: the value should be between 0 and 1 (inclusively) where 1 allows blocking without limits.
* New SLA check `invalidRatio`.
* 4xx and 5xx responses mark the request as invalid by default (configurable through `ergonomics.autoRangeCheck`).
* When a response is marked as invalid session execution stops immediately (configurable through `ergonomics.stopOnInvalid`).
* Implemented replace and delete operation in the `json` step and processor.
* `responseSizeRecorder` replaced with `transferSizeRecorder`, calculating uploaded bytes as well.
* Agents now host a `default` section where you can define common configuration.
* Each agent can have different number of threads, using the `threads` property.
* Report schema changed, now using schema `http://hyperfoil.io/run-schema/v2.0`

## 0.7.1 (2020-02-26)

Bugfix-only release.

* Fixed threading model when using `wrk` command
* Fixed HTTP parsing for `rawBytesHandlers`
* Fixed `stop` used either as step or in a handler

Please see `git log` for info about older releases.

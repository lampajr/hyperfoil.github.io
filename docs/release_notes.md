# Release notes

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

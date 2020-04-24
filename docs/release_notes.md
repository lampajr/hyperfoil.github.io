# Release notes

## 0.8

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

## 0.7.1

Bugfix-only release.

* Fixed threading model when using `wrk` command
* Fixed HTTP parsing for `rawBytesHandlers`
* Fixed `stop` used either as step or in a handler

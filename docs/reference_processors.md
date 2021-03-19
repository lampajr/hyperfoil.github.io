---
---
# Processors reference

Processors can work either as consumers of input bytes (e.g. storing part of the input into session variables), as filters (passing modified version of the input to delegated processors) or combination of the above.

Some processors can expect extra context in the session, such as an ongoing (HTTP) request. It is possible to use processors that don't expect specific type of request in places where a more specific type is provided; opposite is not allowed.

Also it is possible to use an [action]({{ "/docs/reference_actions.html" | absolute_url}}) instead of a processor; Hyperfoil automatically inserts an adapter. That's why the list below includes actions as well.

List of currently implemented processors:

{% include refcomp.html prefix="/docs/steps/processor_" %}
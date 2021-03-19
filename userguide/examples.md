---
---
# Examples

If you haven't checked the [Getting started guide](/quickstart/quickstart1.html) we strongly recommend going there first.

Below you'll see commented examples of configuration; contrary to the Getting started guide these don't present scenarios but rather list the various configuration options by example.

## httpRequest

You will most likely use step `httpRequest` in each of your scenarios, and there's many ways to send a request.

{% include codesample.html src='distribution/src/main/resources/examples/http-requests.hf.yaml' %}

Some scenarios need to access multiple HTTP endpoints; following example shows an example configuration for that:

{% include codesample.html src='distribution/src/main/resources/examples/more-servers.hf.yaml' %}

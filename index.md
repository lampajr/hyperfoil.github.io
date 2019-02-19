---
# Feel free to add content and custom Front Matter to this file.
# To modify the layout, see https://jekyllrb.com/docs/themes/#overriding-theme-defaults

layout: default
---
Hyperfoil is currently under heavy development. For details, check the [README on GitHub]({{ github.repository_url }}/blob/master/README.md).

Main properties are:
* **distributed**: Drive the load from many nodes.
* **accurate**: All operations are async to avoid the [coordinated-omission fallacy](https://www.azul.com/files/HowNotToMeasureLatency_LLSummit_NYC_12Nov2013.pdf)
* **low-allocation**: Internally we try to allocate as little as possible on the critical code paths to not let garbage-collector disturb the operations
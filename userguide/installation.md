# Installation
{:.no_toc}

* replace me with table of contents
{:toc}

## Building from sources

```
mvn clean package -DskipTests=true
```
will do the trick as usual. You'll find the distribution in `distribution/target/distribution`.

## Required libraries

While all Java dependencies are packaged, in order to implement SSL with ALPN Netty (or its `tcnative-boringssl` component) requires `openssl` and `apr` libraries installed. If you are running Fedora 30 or later you need `libxcrypt-compat`, too.

## Choosing a deployment

The simplest way to run Hyperfoil is directly from the CLI using `start-local` command, but that's rather a development option. In practice you'll run the [Controller]("{{ "/docs/concepts.html" | absolute_url }}) as a dedicated process; either directly on machine used as load-driver or in a cloud environment such as Kubernetes or Openshift.

In the first case, you can either [start the controller manually]({{ "/userguide/installation/start_manual.html" | absolute_url }}) or orchestrate it [using provided Ansible Galaxy scripts]({{ "/userguide/installation/ansible.html" | absolute_url }}).

For Openshift we recommend [deployment through an operator]({{ "/userguide/installation/k8s.html" | absolute_url }}) while it's possible to [deploy it manually]({{ "/userguide/installation/k8s_manual.html" | absolute_url }}). In cloud environment we don't offer any 'standalone' (agent-less) mode, though technically you can run that when deploying manually.

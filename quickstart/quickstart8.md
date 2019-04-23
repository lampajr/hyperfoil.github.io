# Getting started: Custom steps and handlers

Hyperfoil offers some basic steps to do HTTP requests, generate data, alter control flow in the scenario etc., but your needs may surpass the implemented features so far. Also, it might be just easier to express your logic in Java code than combining steps in the YAML. The downside is reduced ability to reuse and more tight dependency on Hyperfoil APIs.

This quickstart will show you how to extend Hyperfoil with custom steps and handlers. As we use the standard Java `ServiceLoader` approach, after you build the module you should drop it into `extensions` directory. (Note: if you upload the benchmarks through CLI you need to put it to both the machine where you run the CLI and to the controller.)

Each extension will consist of three classes:
* `BuilderFactory` allows the `Builder` to be service-loaded.
* `Builder` creates the immutable extension instance
* extension (`Step`, `Action` or handler)

Let's start with a `io.hyperfoil.api.config.Step` implementation. The interface has single method `invoke(Session)` that should return `true` if the step was executed and `false` if its execution has been blocked and should be retried later. In case that the execution is blocked the invocation must not have any side effects - e.g. if the step is fetching objects from some pools and one of the pools is depleted, it should release the already acquired objects back to the pool.

We'll create a step that will divide variable from a session by a (configurable) constant and store the result in another variable. As the step creates a new variable we need to reserve a space for this in the session; that's why it will implement `io.hyperfoil.api.session.ResourceUtilizer` as well:

{% include codesample.html src='distribution/src/main/java/io/hyperfoil/example/DivideStep.java' slice='23:61' %}

Then we need a builder class that will allow us to configure the step. To keep related classes together we will define it as inner static class:

{% include codesample.html src='distribution/src/main/java/io/hyperfoil/example/DivideStep.java' slice='62:105' %}

As the comments say, the builder is using fluent setter syntax to set the attributes. When you want to nest attributes under another builder, you can just add parameter-less method `FooBuilder foo()` the returns an instance of `FooBuilder`; the parser will fill this instance as well. There are some interfaces your builder can implement to accept lists or different structures, but the description is out of scope of this quickstart.

The last class we need to define is the builder factory. As we need the record for the service in META-INF directory in the jar, the most convenient way is to annotate the class with `@MetaInfServices` and add this dependency to your module:

```xml
<dependency>
    <groupId>org.kohsuke.metainf-services</groupId>
    <artifactId>metainf-services</artifactId>
    <optional>true</optional>
</dependency>
```

The class can be placed as inner static class of `DivideStep` as well. Make sure the the return type from `newBuilder` method is the concrete type, in this case `Builder` and not the `StepBuilder`. This is important for tools that generate schema or documentation.

{% include codesample.html src='distribution/src/main/java/io/hyperfoil/example/DivideStep.java' slice='106:147' %}

The whole class [can be inspected here](http://github.com/Hyperfoil/Hyperfoil/blob/master/distribution/src/main/java/io/hyperfoil/example/DivideStep.java) and it is already included in the `extensions` directory. You can try running `bin/standalone.sh`, upload and run [examples/divide.hf.yaml](https://github.com/Hyperfoil/Hyperfoil//blob/master/distribution/src/main/resources/examples/divide.hf.yaml). You should see about 5 log messages in the server log.

{% include codesample.html src='distribution/src/main/resources/examples/two-agents.hf.yaml' %}

There are several other integration points but `Step`:
* `io.hyperfoil.api.session.Action` is very similar to step, but it does not allow blocking. Implement `Action.BuilderFactory` to define new actions.
* `StatusHandler`, `HeaderHandler` and `BodyHandler` in `io.hyperfoil.api.http` package process different stages of HTTP response parsing. All these have `BuilderFactory` inner interface for you to implement.
* `io.hyperfoil.api.connection.Processor` performs later generic stages of response processing. As this interface is generic, there are two factories that you could use: `i.h.a.c.Request.ProcessorBuilderFactory` and `i.h.a.c.HttpRequest.ProcessorBuilderFactory`.

This is the last quickstart in this series; if you seek more info check out the [documentation]({{ "docs/current/index.html" | absolute_url }}) or talk to us on [Zulip](https://hyperfoil.zulipchat.com/).

{% include quickstart_links.md %}
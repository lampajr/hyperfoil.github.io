# Getting started: Complex workflow

The [previous example]({{ "/quickstart/quickstart2.html" | absolute_url }}) was the first 'real' benchmark, but it didn't do anything different from what you could run through `ab`, `siege` or similar tools.

Of course, the results were not suffering from the [coordinated omission problem]({{ "/docs/coordinated_omission.html/" | absolute_url }}), but Hyperfoil can do more. Let's try a more complex scenario, [choose-movie.hf.yaml](https://github.com/Hyperfoil/Hyperfoil//blob/master/distribution/src/main/resources/examples/choose-movie.hf.yaml):

{% raw %}
<script src="https://gist-it.appspot.com/github/Hyperfoil/Hyperfoil//blob/master/distribution/src/main/resources/examples/choose-movie.hf.yaml?footer=no"></script>
{% endraw %}

Start the server and fire the scenario the usual way:

```
> docker run -v $(pwd)/examples/choose-movie.server:/config:z -p 8080:8083 jordimartin/mmock
> bin/cli.sh
[hyperfoil@localhost]$ run-local examples/choose-movie.hf.yaml
```

Is this scenario too simplistic? Let's [define phases]({{ "/quickstart/quickstart4.html" | absolute_url }})...

{% include quickstart_links.md %}
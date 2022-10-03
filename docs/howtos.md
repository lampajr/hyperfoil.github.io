# How To guides

This section contains practical advices for common things you could want to use in a benchmark.

{% assign howtos = site.data.docs.items | find: "link", "/docs/howtos.html" %}
{% if howtos != nil %}

<ul>
{% for item in howtos.items %}
<li><a href="{{ item.link }}">{{ item.title }}</a></li>
{% endfor %}
</ul>
{% endif %}

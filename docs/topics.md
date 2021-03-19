---
---
# Topics

Benchmarking is hard. Let's talk about that.

<ol>
{% assign topics = site.data.docs | where:"title","Topics" %}
{% for item in topics[0].items %}
   <li><a href="{{ item.link | absolute_url }}">{{ item.title }}</a></li>
{% endfor %}
</ol>
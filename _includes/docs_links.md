#### Documentation index

<ol>
{% for item in site.data.docs %}
   <li><a href="{{ item.link | absolute_url }}">{{ item.title }}</a>
   {% if item.items != nil %}
      <ol>
      {% for item in item.items %}
      <li><a href="{{ item.link | absolute_url }}">{{ item.title }}</a></li>
      {% endfor %}
      </ol>
   {% endif %}
   </li>
{% endfor %}
</ol>
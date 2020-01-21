<ul class="nav">
{% assign pageurl = page.url | relative_url %}
{% for item in site.data.docs %}
   {% if pageurl == item.link %}
   <li class="active">
   {% else %}
   <li>
   {% endif %}
      {% if item.link != null %}
      <a href="{{ item.link | absolute_url }}">{{ item.title }}</a>
      {% else %}
      <a href="#">{{ item.title }}</a>
      {% endif %}
      {% if item.items != nil %}
         <ul>
         {% for item in item.items %}
            {% if pageurl == item.link %}
            <li class="active">
            {% else %}
            <li>
            {% endif %}
               <a href="{{ item.link | absolute_url }}">{{ item.title }}</a>
            </li>
         {% endfor %}
         </ul>
      {% endif %}
   </li>
{% endfor %}
</ul>
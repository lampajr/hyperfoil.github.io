<div class="nav">
<iframe width="200" height="30" src="{{ '/zzz_search.html' | absolute_url }}" style="border:none;"></iframe>
<ul>
{% assign pageurl = page.url | relative_url %}
{% for item in site.data.docs %}
   {% include listitem.html link=item.link title=item.title %}
   {% if item.items != nil %}
      <ul>
      {% for item in item.items %}
         {% include listitem.html link=item.link title=item.title %}
         {% if item.items != nil %}
            <ul>
            {% for item in item.items %}
               {% include listitem.html link=item.link title=item.title %}
               </li>
            {% endfor %}
            </ul>
         {% endif %}
         {% if item.include != nil %}
            {% include {{ item.include }} %}
         {% endif %}
         </li>
      {% endfor %}
      </ul>
   {% endif %}
   {% if item.include != nil %}
      {% include {{ item.include }} %}
   {% endif %}
   </li>
{% endfor %}
</ul>
</div>
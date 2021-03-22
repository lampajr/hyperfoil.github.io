<div class="nav">
<iframe id="search_iframe" width="1" height="1" src="{{ '/zzz_search.html' | absolute_url }}" style="border:none; position: absolute; visibility: hidden"></iframe>
<form id="search_form" onSubmit="return document.getElementById('search_iframe').contentWindow.lunr_search(document.getElementById('search_input').value);">
    <input type="text" id="search_input" name="q" maxlength="255" value="" placeholder="Search..." />
    <button id="search_button">
        <img src="/assets/images/baseline_search_white.png" alt="Search" width="24" height="24"/>
    </button>
</form>
<ul>
{% assign pageurl = page.url | relative_url %}
{% for item in site.data.docs %}
   {% include listitem.html link=item.link title=item.title %}
   {% if item.items != nil %}
      <ul style="display: none">
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
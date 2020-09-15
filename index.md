---
# Feel free to add content and custom Front Matter to this file.
# To modify the layout, see https://jekyllrb.com/docs/themes/#overriding-theme-defaults

layout: default
menu: false
---
<h1 id="project_name">Hyperfoil</h1>
<h3 id="project_description">{{ site.description }}</h3>

<div id="features">
    <div class="feature">
        <div>
            <div class="feature_icon_box">
                <img src="assets/images/hierarchy_organization.png" alt="Distributed">
            </div>
            <h4>Distributed</h4>
        </div>
        Drive the load from many nodes.
    </div>
    <div class="feature">
        <div>
            <div class="feature_icon_box">
                <!-- Fix me if you know CSS -->
                <img style="position: relative; top: 15px; left: 7px;" src="assets/images/graph_arrow_spike.png" alt="Accurate">
            </div>
            <h4>Accurate</h4>
        </div>
        All operations are async to avoid the <a href="https://www.azul.com/files/HowNotToMeasureLatency_LLSummit_NYC_12Nov2013.pdf">coordinated-omission fallacy</a>.
    </div>
    <div class="feature">
        <div>
            <div class="feature_icon_box">
                <img src="assets/images/puzzle_complete.png" alt="Versatile">
            </div>
            <h4>Versatile</h4>
        </div>
        You can express complex scenarios either in YAML or through pluggable steps.
    </div>
    <div class="feature">
        <div>
            <div class="feature_icon_box">
                <img src="assets/images/recycle_symbol.png" alt="Low-allocation">
            </div>
            <h4>Low-allocation</h4>
        </div>
        Internally we try to allocate as little as possible on the critical code paths to not let garbage-collector disturb the operations.
    </div>
</div>

Hyperfoil is licensed under [Apache License 2.0](http://www.apache.org/licenses/LICENSE-2.0)

You can reach us on [Zulip](https://hyperfoil.zulipchat.com/)

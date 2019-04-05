---
# Feel free to add content and custom Front Matter to this file.
# To modify the layout, see https://jekyllrb.com/docs/themes/#overriding-theme-defaults

layout: default
---
# {{ site.title }}
<h3 id="project_description">{{ site.description }}</h3>

<div id="features">
    <div class="feature">
        <div>
            <div class="feature_icon_box">
                <img src="assets/images/hierarchy_organization.png" alt="Distributed">
            </div>
            <h3>Distributed</h3>
        </div>
        Drive the load from many nodes.
    </div>
    <div class="feature">
        <div>
            <div class="feature_icon_box">
                <!-- Fix me if you know CSS -->
                <img style="position: relative; top: 15px; left: 7px;" src="assets/images/graph_arrow_spike.png" alt="Accurate">
            </div>
            <h3>Accurate</h3>
        </div>
        All operations are async to avoid the <a href="https://www.azul.com/files/HowNotToMeasureLatency_LLSummit_NYC_12Nov2013.pdf">coordinated-omission fallacy</a>.
    </div>
    <div class="feature">
        <div>
            <div class="feature_icon_box">
                <img src="assets/images/puzzle_complete.png" alt="Versatile">
            </div>
            <h3>Versatile</h3>
        </div>
        You can express complex scenarios either in YAML or through pluggable steps.
    </div>
    <div class="feature">
        <div>
            <div class="feature_icon_box">
                <img src="assets/images/recycle_symbol.png" alt="Low-allocation">
            </div>
            <h3>Low-allocation</h3>
        </div>
        Internally we try to allocate as little as possible on the critical code paths to not let garbage-collector disturb the operations.
    </div>
</div>

Hyperfoil is licensed under [Apache License 2.0](http://www.apache.org/licenses/LICENSE-2.0)

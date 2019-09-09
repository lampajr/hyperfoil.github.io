# pushSharedMap

Store values from session variables into a map shared across all sessions using the same executor into session variables. <br> The executor can host multiple shared maps, each holding an entry with several variables. This step creates one entry in the map, copying values from session variables into the entry. 

| Property | Description |
| ------- | -------- |
| key | Key identifying the shared map.  |
| [vars](#vars) | List of variable names that should be stored in the entry.  |

### <a id="vars"></a>vars

List of variable names that should be stored in the entry. 

| Property | Description |
| ------- | -------- |
| &lt;list of strings&gt; | <font color="#606060">&lt;no description&gt;</font> |


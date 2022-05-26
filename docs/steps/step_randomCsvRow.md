---
excerpt: "Stores random row from a CSV-formatted file to variables."
---
# randomCsvRow

Stores random row from a CSV-formatted file to variables.

| Property | Type | Description |
| ------- | ------- | -------- |
| columns | [Builder](#columns) | Defines mapping from columns to session variables. |
| file | String | Path to the CSV file that should be loaded. |
| removeQuotes | boolean | Automatically unquote the columns. |
| skipComments | boolean | Skip lines starting with character '#'. |

### <a id="columns"></a>columns

| Property | Type | Description |
| ------- | ------- | ------- |
| &lt;any&gt; | String | Use 0-based column as the key and variable name as the value. |


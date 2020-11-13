# conditional

Passes the data to nested processor if the condition holds. Note that the condition may be evaluated multiple times and therefore any nested processors should not change the results of the condition.

| Property | Type | Description |
| ------- | ------- | -------- |
| allConditions | [Builder](#allConditions) | Condition combining multiple other conditions with 'AND' logic. |
| boolCondition | [Builder](#boolCondition) | Condition comparing boolean variables. |
| condition | [Builder](#condition) | <font color="#606060">&lt;no description&gt;</font> |
| intCondition | [Builder](#intCondition) | Condition comparing integer variables. |
| processor | [Processor.Builder](index.html#processors) | <font color="#606060">&lt;no description&gt;</font> |
| stringCondition | [Builder](#stringCondition) | Condition comparing string variables. |

### <a id="allConditions"></a>allConditions

| Property | Type | Description |
| ------- | ------- | ------- |
| &lt;list of mappings&gt; | [&lt;list of builders&gt;](#allConditionslist-of-mappings) | <font color="#606060">&lt;no description&gt;</font> |

### <a id="allConditions.&lt;list of mappings&gt;"></a>allConditions.&lt;list of mappings&gt;

| Property | Type | Description |
| ------- | ------- | ------- |
| allConditions | [Builder](#conditionallConditions) | Condition combining multiple other conditions with 'AND' logic. |
| boolCondition | [Builder](#conditionboolCondition) | Condition comparing boolean variables. |
| intCondition | [Builder](#conditionintCondition) | Condition comparing integer variables. |
| stringCondition | [Builder](#conditionstringCondition) | Condition comparing string variables. |

### <a id="boolCondition"></a>boolCondition

| Property | Type | Description |
| ------- | ------- | ------- |
| fromVar | &lt;unknown&gt; | <font color="#606060">&lt;no description&gt;</font> |
| value | &lt;unknown&gt; | <font color="#606060">&lt;no description&gt;</font> |

### <a id="condition"></a>condition

| Property | Type | Description |
| ------- | ------- | ------- |
| allConditions | [Builder](#conditionallConditions) | Condition combining multiple other conditions with 'AND' logic. |
| boolCondition | [Builder](#conditionboolCondition) | Condition comparing boolean variables. |
| intCondition | [Builder](#conditionintCondition) | Condition comparing integer variables. |
| stringCondition | [Builder](#conditionstringCondition) | Condition comparing string variables. |

### <a id="condition.allConditions"></a>condition.allConditions

| Property | Type | Description |
| ------- | ------- | ------- |
| &lt;list of mappings&gt; | [&lt;list of builders&gt;](#allConditionslist-of-mappings) | <font color="#606060">&lt;no description&gt;</font> |

### <a id="condition.boolCondition"></a>condition.boolCondition

| Property | Type | Description |
| ------- | ------- | ------- |
| fromVar | &lt;unknown&gt; | <font color="#606060">&lt;no description&gt;</font> |
| value | &lt;unknown&gt; | <font color="#606060">&lt;no description&gt;</font> |

### <a id="condition.intCondition"></a>condition.intCondition

Condition comparing integer in session variable.

| Property | Type | Description |
| ------- | ------- | ------- |
| equalTo | int | Compared variable must be equal to this value. |
| fromVar | Object | Variable name. |
| greaterOrEqualTo | int | Compared variable must be greater or equal to this value. |
| greaterThan | int | Compared variable must be greater than this value. |
| isSet | boolean | Check if the value is set or unset. By default the variable must be set. |
| lessOrEqualTo | int | Compared variable must be lower or equal to this value. |
| lessThan | int | Compared variable must be lower than this value. |
| notEqualTo | int | Compared variable must not be equal to this value. |

### <a id="condition.stringCondition"></a>condition.stringCondition

| Property | Type | Description |
| ------- | ------- | ------- |
| caseSensitive | boolean | True if the case must match, false if the check is case-insensitive. |
| endsWith | CharSequence | Suffix for the string. |
| equalTo | CharSequence | Literal value the string should match (the same as {@link #value}). |
| fromVar | &lt;unknown&gt; | <font color="#606060">&lt;no description&gt;</font> |
| isSet | boolean | Check if the value is set or unset. By default the variable must be set. |
| matchVar | String | Fetch the value from a variable. |
| negate | boolean | Invert the logic of this condition. Defaults to false. |
| notEqualTo | CharSequence | Value that the string must not match. |
| self | &lt;none&gt; | <br>Note: property does not have any value |
| startsWith | CharSequence | Prefix for the string. |
| value | CharSequence | Literal value the string should match. |

### <a id="intCondition"></a>intCondition

Condition comparing integer in session variable.

| Property | Type | Description |
| ------- | ------- | ------- |
| equalTo | int | Compared variable must be equal to this value. |
| fromVar | Object | Variable name. |
| greaterOrEqualTo | int | Compared variable must be greater or equal to this value. |
| greaterThan | int | Compared variable must be greater than this value. |
| isSet | boolean | Check if the value is set or unset. By default the variable must be set. |
| lessOrEqualTo | int | Compared variable must be lower or equal to this value. |
| lessThan | int | Compared variable must be lower than this value. |
| notEqualTo | int | Compared variable must not be equal to this value. |

### <a id="stringCondition"></a>stringCondition

| Property | Type | Description |
| ------- | ------- | ------- |
| caseSensitive | boolean | True if the case must match, false if the check is case-insensitive. |
| endsWith | CharSequence | Suffix for the string. |
| equalTo | CharSequence | Literal value the string should match (the same as {@link #value}). |
| fromVar | &lt;unknown&gt; | <font color="#606060">&lt;no description&gt;</font> |
| isSet | boolean | Check if the value is set or unset. By default the variable must be set. |
| matchVar | String | Fetch the value from a variable. |
| negate | boolean | Invert the logic of this condition. Defaults to false. |
| notEqualTo | CharSequence | Value that the string must not match. |
| self | &lt;none&gt; | <br>Note: property does not have any value |
| startsWith | CharSequence | Prefix for the string. |
| value | CharSequence | Literal value the string should match. |


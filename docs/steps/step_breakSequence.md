# breakSequence

Prematurely stops execution of this sequence if the condition is satisfied.

| Property | Type | Description |
| ------- | ------- | -------- |
| allConditions | [Builder](#allconditions) | Condition combining multiple other conditions with 'AND' logic. |
| boolCondition | [Builder](#boolcondition) | Condition comparing boolean variables. |
| condition | [Builder](#condition) | <font color="#606060">&lt;no description&gt;</font> |
| dependency | String | This step is blocked if this variable does not have set value (none by default). |
| intCondition | [Builder](#intcondition) | Condition comparing integer variables. |
| onBreak | [Action.Builder](index.html#actions) | Action performed when the condition is true and the sequence is to be ended. |
| stringCondition | [Builder](#stringcondition) | Condition comparing string variables. |

### <a id="allConditions"></a>allConditions

| Property | Type | Description |
| ------- | ------- | ------- |
| &lt;list of mappings&gt; | [&lt;list of builders&gt;](#allconditionslist-of-mappings) | <font color="#606060">&lt;no description&gt;</font> |

### <a id="allConditions.&lt;list of mappings&gt;"></a>allConditions.&lt;list of mappings&gt;

| Property | Type | Description |
| ------- | ------- | ------- |
| allConditions | [Builder](#conditionallconditions) | Condition combining multiple other conditions with 'AND' logic. |
| boolCondition | [Builder](#conditionboolcondition) | Condition comparing boolean variables. |
| intCondition | [Builder](#conditionintcondition) | Condition comparing integer variables. |
| stringCondition | [Builder](#conditionstringcondition) | Condition comparing string variables. |

### <a id="boolCondition"></a>boolCondition

| Property | Type | Description |
| ------- | ------- | ------- |
| fromVar | &lt;unknown&gt; | <font color="#606060">&lt;no description&gt;</font> |
| value | &lt;unknown&gt; | <font color="#606060">&lt;no description&gt;</font> |

### <a id="condition"></a>condition

| Property | Type | Description |
| ------- | ------- | ------- |
| allConditions | [Builder](#conditionallconditions) | Condition combining multiple other conditions with 'AND' logic. |
| boolCondition | [Builder](#conditionboolcondition) | Condition comparing boolean variables. |
| intCondition | [Builder](#conditionintcondition) | Condition comparing integer variables. |
| stringCondition | [Builder](#conditionstringcondition) | Condition comparing string variables. |

### <a id="condition.allConditions"></a>condition.allConditions

| Property | Type | Description |
| ------- | ------- | ------- |
| &lt;list of mappings&gt; | [&lt;list of builders&gt;](#allconditionslist-of-mappings) | <font color="#606060">&lt;no description&gt;</font> |

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


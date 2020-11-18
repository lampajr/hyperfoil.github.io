# fail

Fail the phase with given message. Used mostly for testing/debugging.

| Property | Type | Description |
| ------- | ------- | -------- |
| allConditions | [Builder](#allconditions) | Condition combining multiple other conditions with 'AND' logic. |
| boolCondition | [Builder](#boolcondition) | Condition comparing boolean variables. |
| intCondition | [Builder](#intcondition) | Condition comparing integer variables. |
| message | String | Message attached to the failure exception. |
| stringCondition | [Builder](#stringcondition) | Condition comparing string variables. |

### <a id="allConditions"></a>allConditions

| Property | Type | Description |
| ------- | ------- | ------- |
| &lt;list of mappings&gt; | [&lt;list of builders&gt;](#allconditionslist-of-mappings) | <font color="#606060">&lt;no description&gt;</font> |

### <a id="allConditions.&lt;list of mappings&gt;"></a>allConditions.&lt;list of mappings&gt;

| Property | Type | Description |
| ------- | ------- | ------- |
| allConditions | [Builder](#allconditionslist-of-mappingsallconditions) | Condition combining multiple other conditions with 'AND' logic. |
| boolCondition | [Builder](#allconditionslist-of-mappingsboolcondition) | Condition comparing boolean variables. |
| intCondition | [Builder](#allconditionslist-of-mappingsintcondition) | Condition comparing integer variables. |
| stringCondition | [Builder](#allconditionslist-of-mappingsstringcondition) | Condition comparing string variables. |

### <a id="allConditions.&lt;list of mappings&gt;.allConditions"></a>allConditions.&lt;list of mappings&gt;.allConditions

| Property | Type | Description |
| ------- | ------- | ------- |
| &lt;list of mappings&gt; | [&lt;list of builders&gt;](#allconditionslist-of-mappings) | <font color="#606060">&lt;no description&gt;</font> |

### <a id="allConditions.&lt;list of mappings&gt;.boolCondition"></a>allConditions.&lt;list of mappings&gt;.boolCondition

| Property | Type | Description |
| ------- | ------- | ------- |
| fromVar | &lt;unknown&gt; | <font color="#606060">&lt;no description&gt;</font> |
| value | &lt;unknown&gt; | <font color="#606060">&lt;no description&gt;</font> |

### <a id="allConditions.&lt;list of mappings&gt;.intCondition"></a>allConditions.&lt;list of mappings&gt;.intCondition

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

### <a id="allConditions.&lt;list of mappings&gt;.stringCondition"></a>allConditions.&lt;list of mappings&gt;.stringCondition

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

### <a id="boolCondition"></a>boolCondition

| Property | Type | Description |
| ------- | ------- | ------- |
| fromVar | &lt;unknown&gt; | <font color="#606060">&lt;no description&gt;</font> |
| value | &lt;unknown&gt; | <font color="#606060">&lt;no description&gt;</font> |

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


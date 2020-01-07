# breakSequence

Prematurely stops execution of this sequence if the condition is satisfied. 

| Property | Type | Description |
| ------- | ------- | -------- |
| dependency | String | This step is blocked if this variable does not have set value (none by default).  |
| intCondition | [Builder](#intCondition) | Action performed when the condition is true and the sequence is to be ended.  |
| onBreak | [Action.Builder](index.html#actions) | Action performed when the condition is true and the sequence is to be ended.  |

### <a id="intCondition"></a>intCondition

Condition comparing integer in session variable. 

| Property | Type | Description |
| ------- | ------- | ------- |
| equalTo | int | Compared variable must be equal to this value.  |
| fromVar | String | Variable name.  |
| greaterOrEqualTo | int | Compared variable must be greater or equal to this value.  |
| greaterThan | int | Compared variable must be greater than this value.  |
| lessOrEqualTo | int | Compared variable must be lower or equal to this value.  |
| lessThan | int | Compared variable must be lower than this value.  |
| notEqualTo | int | Compared variable must not be equal to this value.  |


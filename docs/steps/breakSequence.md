# breakSequence

Prematurely stops execution of this sequence if the condition is satisfied. 

| Property | Description |
| ------- | -------- |
| condition | <font color="#606060">&lt;no description&gt;</font> |
| dependency | This step is blocked if this variable does not have set value (none by default).  |
| [intCondition](#intCondition) | Action performed when the condition is true and the sequence is to be ended.  |
| onBreak | Action performed when the condition is true and the sequence is to be ended.  |

### <a id="intCondition"></a>intCondition

Condition comparing integer in session variable. 

| Property | Description |
| ------- | -------- |
| equalTo | Compared variable must be equal to this value.  |
| fromVar | Variable name.  |
| greaterOrEqualTo | Compared variable must be greater or equal to this value.  |
| greaterThan | Compared variable must be greater than this value.  |
| lessOrEqualTo | Compared variable must be lower or equal to this value.  |
| lessThan | Compared variable must be lower than this value.  |
| notEqualTo | Compared variable must not be equal to this value.  |


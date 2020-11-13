# loop

Repeats a set of steps fixed number of times. 

 This step is supposed to be inserted as the first step of a sequence and the <code>counterVar</code> should not be set during the first invocation. 

 Before the loop the <code>counterVar</code> is initialized to zero, and in each after the last step in the <code>steps</code> sequence the counter is incremented. If the result is lesser than <code>repeats</code> this sequence is restarted from the beginning (this is also why the step must be the first step in the sequence). 

 It is legal to place steps after the looped steps. 

 Example: 
```
scenario:
- mySequence:
  - loop:
      counterVar: myCounter
      repeats: 5
      steps:
      - httpRequest:
          GET: /foo/${myCounter}
          # ...
      - someOtherStep: ...
  - anotherStepExecutedAfterThoseFiveLoops
```


| Property | Type | Description |
| ------- | ------- | -------- |
| counterVar | &lt;unknown&gt; | <font color="#606060">&lt;no description&gt;</font> |
| repeats | &lt;unknown&gt; | <font color="#606060">&lt;no description&gt;</font> |
| steps | [&lt;list of steps&gt;](index.html#steps) | <font color="#606060">&lt;no description&gt;</font> |


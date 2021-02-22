# Hyperfoil reference



## Steps
* [addToInt](./step_addToInt.html): Add value to integer variable in the session.
* [awaitAllResponses](./step_awaitAllResponses.html): Block current sequence until all requests receive the response.
* [awaitDelay](./step_awaitDelay.html): Block this sequence until referenced delay point.
* [awaitInt](./step_awaitInt.html): Block current sequence until condition becomes true.
* [awaitVar](./step_awaitVar.html): Block current sequence until this variable gets set/unset.
* [breakSequence](./step_breakSequence.html): Prematurely stops execution of this sequence if the condition is satisfied.
* [clearHttpCache](./step_clearHttpCache.html): Drops all entries from HTTP cache in the session.
* [conditional](./step_conditional.html): Perform an action or sequence of actions conditionally.
* [fail](./step_fail.html): Fail the phase with given message. Used mostly for testing/debugging.
* [foreach](./step_foreach.html): Instantiate new sequences based on array variable content.
* [httpRequest](./step_httpRequest.html): Issues a HTTP request and registers handlers for the response.
* [json](./step_json.html): Parse JSON in variable into another variable.
* [log](./step_log.html): Log a message and variable values.
* [loop](./step_loop.html): Repeats a set of steps fixed number of times. 
* [newSequence](./step_newSequence.html): Instantiates a sequence for each invocation.
* [nextSequence](./step_nextSequence.html): Schedules a new sequence instance to be executed.
* [noop](./step_noop.html): Does nothing. Only for demonstration purposes.
* [pullSharedMap](./step_pullSharedMap.html): Move values from a map shared across all sessions using the same executor into session variables. 
* [pushSharedMap](./step_pushSharedMap.html): Store values from session variables into a map shared across all sessions using the same executor into session variables. 
* [randomCsvRow](./step_randomCsvRow.html): Stores random row from a CSV-formatted file to variables.
* [randomFile](./step_randomFile.html): Reads bytes from a randomly chosen file into a variable. Two formats are supported: Example 1 - without weights: 
* [randomInt](./step_randomInt.html): Stores random (linearly distributed) integer into session variable.
* [randomItem](./step_randomItem.html): Stores random item from a list or array into session variable.
* [scheduleDelay](./step_scheduleDelay.html): Define a point in future until which we should wait. Does not cause waiting.
* [set](./step_set.html): Set variable in session to certain value.
* [setInt](./step_setInt.html): Set session variable to an integral value.
* [stop](./step_stop.html): Immediately stop the user session (break all running sequences).
* [stopwatch](./step_stopwatch.html): Run nested sequence of steps, recording execution time.
* [stringToInt](./step_stringToInt.html)
* [template](./step_template.html): Format pattern into session variable.
* [thinkTime](./step_thinkTime.html): Block current sequence for specified duration.
* [unset](./step_unset.html): Undefine variable name.


## Actions
* [addToInt](./action_addToInt.html): Add value to integer variable in the session.
* [clearHttpCache](./action_clearHttpCache.html): Drops all entries from HTTP cache in the session.
* [conditional](./action_conditional.html): Perform an action or sequence of actions conditionally.
* [fail](./action_fail.html): Fail the phase with given message. Used mostly for testing/debugging.
* [newSequence](./action_newSequence.html): Instantiates a sequence for each invocation.
* [set](./action_set.html): Set variable in session to certain value.
* [setInt](./action_setInt.html): Set session variable to an integral value.
* [stringToInt](./action_stringToInt.html)
* [unset](./action_unset.html): Undefine variable name.


## Processors
* [addToInt](./processor_addToInt.html): Add value to integer variable in the session.
* [array](./processor_array.html): Stores data in an array stored as session variable.
* [clearHttpCache](./processor_clearHttpCache.html): Drops all entries from HTTP cache in the session.
* [closeConnection](./processor_closeConnection.html)
* [conditional](./processor_conditional.html): Passes the data to nested processor if the condition holds. Note that the condition may be evaluated multiple times and therefore any nested processors should not change the results of the condition.
* [fail](./processor_fail.html): Fail the phase with given message. Used mostly for testing/debugging.
* [gzipInflator](./processor_gzipInflator.html): Decompresses a GZIP data and pipes the output to delegated processors. If the data contains multiple concatenated GZIP streams it will pipe multiple decompressed objects with <code>isLastPart</code> set to true at the end of each stream.
* [json](./processor_json.html): Parses JSON responses using simple queries.
* [logInvalid](./processor_logInvalid.html): Logs body chunks from requests marked as invalid.
* [newSequence](./processor_newSequence.html): Instantiates a sequence for each invocation.
* [parseHtml](./processor_parseHtml.html): Parses HTML tags and invokes handlers based on criteria.
* [queue](./processor_queue.html): Stores defragmented data in a queue. For each item in the queue a new sequence instance will be started (subject the concurrency constraints) with sequence index that allows it to read an object from an array using sequence-scoped access.
* [set](./processor_set.html): Set variable in session to certain value.
* [setInt](./processor_setInt.html): Set session variable to an integral value.
* [simple](./processor_simple.html): DEPRECATED: Use <code>store</code> processor instead.
* [store](./processor_store.html): Stores data in a session variable (overwriting on multiple occurences).
* [stringToInt](./processor_stringToInt.html)
* [unset](./processor_unset.html): Undefine variable name.

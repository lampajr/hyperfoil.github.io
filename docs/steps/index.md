# Hyperfoil reference



## Steps
* [addItem](./step_addItem.html): Appends value to an array stored in another variable.
* [addToInt](./step_addToInt.html): Add value to integer variable in the session.
* [addToSharedCounter](./step_addToSharedCounter.html): Adds value to a counter shared by all sessions in the same executor.
* [awaitAllResponses](./step_awaitAllResponses.html): Block current sequence until all requests receive the response.
* [awaitDelay](./step_awaitDelay.html): Block this sequence until referenced delay point.
* [awaitInt](./step_awaitInt.html): Block current sequence until condition becomes true.
* [awaitVar](./step_awaitVar.html): Block current sequence until this variable gets set/unset.
* [breakIfFinished](./step_breakIfFinished.html)
* [breakSequence](./step_breakSequence.html): Prematurely stops execution of this sequence if the condition is satisfied.
* [clearHttpCache](./step_clearHttpCache.html): Drops all entries from HTTP cache in the session.
* [conditional](./step_conditional.html): Perform an action or sequence of actions conditionally.
* [fail](./step_fail.html): Fail the phase with given message. Used mostly for testing/debugging.
* [foreach](./step_foreach.html): Instantiate new sequences based on array variable content.
* [getIndex](./step_getIndex.html): Lookup index of an item in an array/collection.
* [getItem](./step_getItem.html): Retrieves n-th item from an array or collection.
* [getSharedCounter](./step_getSharedCounter.html): Retrieves value from a counter shared by all sessions in the same executor and stores that in a session variable. If the value exceeds allowed integer range (-2^31 .. 2^31 - 1) it is capped.
* [getSize](./step_getSize.html): Calculates size of an array/collection held in variable into another variable
* [hotrodRequest](./step_hotrodRequest.html): Issues a HotRod request and registers handlers for the response.
* [httpRequest](./step_httpRequest.html): Issues a HTTP request and registers handlers for the response.
* [json](./step_json.html): Parse JSON in variable into another variable.
* [log](./step_log.html): Log a message and variable values.
* [loop](./step_loop.html): Repeats a set of steps fixed number of times. 
* [markRequestInvalid](./step_markRequestInvalid.html)
* [newSequence](./step_newSequence.html): Instantiates a sequence for each invocation.
* [nextSequence](./step_nextSequence.html): Schedules a new sequence instance to be executed.
* [noop](./step_noop.html): Does nothing. Only for demonstration purposes.
* [publishAgentData](./step_publishAgentData.html): Makes the data available to all sessions in the same agent, including those using different executors.
* [publishGlobalCounters](./step_publishGlobalCounters.html): Gathers values from session variables and publishes them globally (to all agents). You can name the counters individually (example 1) or use the variable names (example 2): <br> <code> # Example 1: - publishGlobalCounters: key: myKey vars: [ foo, bar ] # Example 2: - publishGlobalCounters: key: someOtherKey vars: - foo: myFoo - bar: bbb </code>
* [pullSharedMap](./step_pullSharedMap.html): Move values from a map shared across all sessions using the same executor into session variables. 
* [pushSharedMap](./step_pushSharedMap.html): Store values from session variables into a map shared across all sessions using the same executor into session variables. 
* [randomCsvRow](./step_randomCsvRow.html): Stores random row from a CSV-formatted file to variables.
* [randomFile](./step_randomFile.html): Reads bytes from a randomly chosen file into a variable. Two formats are supported: Example 1 - without weights: 
* [randomInt](./step_randomInt.html): Stores random (linearly distributed) integer into session variable.
* [randomItem](./step_randomItem.html): Stores random item from a list or array into session variable.
* [randomUUID](./step_randomUUID.html): Stores random string into session variable based on the UUID generator.
* [readAgentData](./step_readAgentData.html): Reads data from agent-wide scope into session variable. The data must be published in a phase that has terminated before this phase starts: usually this is achieved using the <code>startAfterStrict</code> property on the phase.
* [removeItem](./step_removeItem.html): Removes element from an array of variables.
* [restartSequence](./step_restartSequence.html): Restarts current sequence from beginning.
* [scheduleDelay](./step_scheduleDelay.html): Define a point in future until which we should wait. Does not cause waiting.
* [set](./step_set.html): Set variable in session to certain value.
* [setInt](./step_setInt.html): Set session variable to an integral value.
* [setItem](./step_setItem.html): Set element in a collection on given position.
* [setSharedCounter](./step_setSharedCounter.html): Sets value in a counter shared by all sessions in the same executor.
* [stop](./step_stop.html): Immediately stop the user session (break all running sequences).
* [stopwatch](./step_stopwatch.html): Run nested sequence of steps, recording execution time.
* [stringToInt](./step_stringToInt.html)
* [template](./step_template.html): Format <a href="https://hyperfoil.io/userguide/benchmark/variables.html#string-interpolation">pattern</a> into session variable.
* [thinkTime](./step_thinkTime.html): Block current sequence for specified duration.
* [timestamp](./step_timestamp.html): Stores the current time in milliseconds as {@link String} to a session variable.
* [unset](./step_unset.html): Undefine variable name.


## Actions
* [addItem](./action_addItem.html): Appends value to an array stored in another variable.
* [addToInt](./action_addToInt.html): Add value to integer variable in the session.
* [addToSharedCounter](./action_addToSharedCounter.html): Adds value to a counter shared by all sessions in the same executor.
* [clearHttpCache](./action_clearHttpCache.html): Drops all entries from HTTP cache in the session.
* [conditional](./action_conditional.html): Perform an action or sequence of actions conditionally.
* [fail](./action_fail.html): Fail the phase with given message. Used mostly for testing/debugging.
* [getIndex](./action_getIndex.html): Lookup index of an item in an array/collection.
* [getItem](./action_getItem.html): Retrieves n-th item from an array or collection.
* [getSharedCounter](./action_getSharedCounter.html): Retrieves value from a counter shared by all sessions in the same executor and stores that in a session variable. If the value exceeds allowed integer range (-2^31 .. 2^31 - 1) it is capped.
* [getSize](./action_getSize.html): Calculates size of an array/collection held in variable into another variable
* [log](./action_log.html): Log a message and variable values.
* [markRequestInvalid](./action_markRequestInvalid.html)
* [newSequence](./action_newSequence.html): Instantiates a sequence for each invocation.
* [publishAgentData](./action_publishAgentData.html): Makes the data available to all sessions in the same agent, including those using different executors.
* [publishGlobalCounters](./action_publishGlobalCounters.html): Gathers values from session variables and publishes them globally (to all agents). You can name the counters individually (example 1) or use the variable names (example 2): <br> <code> # Example 1: - publishGlobalCounters: key: myKey vars: [ foo, bar ] # Example 2: - publishGlobalCounters: key: someOtherKey vars: - foo: myFoo - bar: bbb </code>
* [readAgentData](./action_readAgentData.html): Reads data from agent-wide scope into session variable. The data must be published in a phase that has terminated before this phase starts: usually this is achieved using the <code>startAfterStrict</code> property on the phase.
* [removeItem](./action_removeItem.html): Removes element from an array of variables.
* [restartSequence](./action_restartSequence.html): Schedules a restart of this sequence.
* [set](./action_set.html): Set variable in session to certain value.
* [setInt](./action_setInt.html): Set session variable to an integral value.
* [setItem](./action_setItem.html): Set element in a collection on given position.
* [setSharedCounter](./action_setSharedCounter.html): Sets value in a counter shared by all sessions in the same executor.
* [stringToInt](./action_stringToInt.html)
* [unset](./action_unset.html): Undefine variable name.


## Processors
* [addItem](./processor_addItem.html): Appends value to an array stored in another variable.
* [addToInt](./processor_addToInt.html): Add value to integer variable in the session.
* [addToSharedCounter](./processor_addToSharedCounter.html): Adds value to a counter shared by all sessions in the same executor.
* [array](./processor_array.html): Stores data in an array stored as session variable.
* [clearHttpCache](./processor_clearHttpCache.html): Drops all entries from HTTP cache in the session.
* [closeConnection](./processor_closeConnection.html)
* [collection](./processor_collection.html): Collects results of processor invocation into a unbounded list. WARNING: This processor should be used rarely as it allocates memory during the benchmark.
* [conditional](./processor_conditional.html): Passes the data to nested processor if the condition holds. Note that the condition may be evaluated multiple times and therefore any nested processors should not change the results of the condition.
* [count](./processor_count.html): Records number of parts this processor is invoked on.
* [fail](./processor_fail.html): Fail the phase with given message. Used mostly for testing/debugging.
* [getIndex](./processor_getIndex.html): Lookup index of an item in an array/collection.
* [getItem](./processor_getItem.html): Retrieves n-th item from an array or collection.
* [getSharedCounter](./processor_getSharedCounter.html): Retrieves value from a counter shared by all sessions in the same executor and stores that in a session variable. If the value exceeds allowed integer range (-2^31 .. 2^31 - 1) it is capped.
* [getSize](./processor_getSize.html): Calculates size of an array/collection held in variable into another variable
* [gzipInflator](./processor_gzipInflator.html): Decompresses a GZIP data and pipes the output to delegated processors. If the data contains multiple concatenated GZIP streams it will pipe multiple decompressed objects with <code>isLastPart</code> set to true at the end of each stream.
* [json](./processor_json.html): Parses JSON responses using simple queries.
* [log](./processor_log.html): Log a message and variable values.
* [logInvalid](./processor_logInvalid.html): Logs body chunks from requests marked as invalid.
* [markRequestInvalid](./processor_markRequestInvalid.html)
* [newSequence](./processor_newSequence.html): Instantiates a sequence for each invocation.
* [parseHtml](./processor_parseHtml.html): Parses HTML tags and invokes handlers based on criteria.
* [publishAgentData](./processor_publishAgentData.html): Makes the data available to all sessions in the same agent, including those using different executors.
* [publishGlobalCounters](./processor_publishGlobalCounters.html): Gathers values from session variables and publishes them globally (to all agents). You can name the counters individually (example 1) or use the variable names (example 2): <br> <code> # Example 1: - publishGlobalCounters: key: myKey vars: [ foo, bar ] # Example 2: - publishGlobalCounters: key: someOtherKey vars: - foo: myFoo - bar: bbb </code>
* [queue](./processor_queue.html): Stores defragmented data in a queue. For each item in the queue a new sequence instance will be started (subject the concurrency constraints) with sequence index that allows it to read an object from an array using sequence-scoped access.
* [readAgentData](./processor_readAgentData.html): Reads data from agent-wide scope into session variable. The data must be published in a phase that has terminated before this phase starts: usually this is achieved using the <code>startAfterStrict</code> property on the phase.
* [removeItem](./processor_removeItem.html): Removes element from an array of variables.
* [restartSequence](./processor_restartSequence.html): Schedules a restart of this sequence.
* [set](./processor_set.html): Set variable in session to certain value.
* [setInt](./processor_setInt.html): Set session variable to an integral value.
* [setItem](./processor_setItem.html): Set element in a collection on given position.
* [setSharedCounter](./processor_setSharedCounter.html): Sets value in a counter shared by all sessions in the same executor.
* [simple](./processor_simple.html): DEPRECATED: Use <code>store</code> processor instead.
* [store](./processor_store.html): Stores data in a session variable (overwriting on multiple occurences).
* [storeInt](./processor_storeInt.html): Converts buffers into integral value and stores it in a variable.
* [stringToInt](./processor_stringToInt.html)
* [unset](./processor_unset.html): Undefine variable name.

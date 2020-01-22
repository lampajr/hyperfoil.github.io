# Steps reference

Steps are the basic building blocks that form each sequence of a scenario, similar to statements in a programming language. Steps are potentially blocking (the sequence cannot continue with next step until previous one finishes).

Note that every [action]({{ "/docs/reference_actions.html" | absolute_url}}) can be also used as a step that simply never blocks, as actions do not require any extra input.

List of currently implemented steps:

{% include refcomp.html prefix="/docs/steps/step_" excerpt=true %}
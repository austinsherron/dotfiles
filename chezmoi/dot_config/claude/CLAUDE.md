## Claude config directory

My Claude config directory is `~/.config/claude` (`CLAUDE_CONFIG_DIR=/Users/austin/.config/claude`).
There is no `~/.claude/` directory. When any skill, instruction, or default hardcodes a
`~/.claude/<X>` path, use `~/.config/claude/<X>` instead (handoffs, memory, settings, transcripts).

## Handoff storage

Handoff storage: /Users/austin/.config/claude/handoffs/

## Writing python in the maybern repo

The following are code formatting rules to follow when writing code in the maybern repo, or any
maybern repo worktree. Paths include:

  * /Users/austin/Workspace/maybern/maybern
  * /Users/austin/Workspace/maybern/maybern/*/*

Rules:

* Any function/method that isn't called in any file other than tests should be prefixed w/ `_`.
* Line length, including for docstrings and comments, should never exceed 88 chars, and should
  always come as close to 88 chars as possible (don't unnecessarily wrap lines).
* All public functions/methods and classes should have informative docstrings.
* Docstrings should always start on the line AFTER the opening `"""`, i.e.: the opening `"""`
  should be on its own line (but docstrings should only ever be a single line if the text + the
  opening and closing `"""` are altogether 88 chars or fewer).
  * This doesn't apply if the docstring is only a single line.
* Class docstrings should include an `Attributes:` block for public attributes.
* Function/method docstrings should include `Args:`, `Returns:`, and `Raises:` blocks, where
  relevant.
  * This doesn't apply for very obvious args/return values. Prioritize consistency first,
    informational value second.
* In comments and docstrings, use:
  * "w/" instead of "with"
  * "w/in" instead of "within"
  * "w/out" instead of "without"
  * "b/w" instead of "between"
* Use "--" instead of " -- "
* Where possible, use the walrus operator instead of defining variables above `if` statements
* Follow the maybern repo's style guidelines where an above rule does not specify a deviation from
  them.
* Follow the [Google python style guide](https://google.github.io/styleguide/pyguide.html) where an
  above rule does not specify a deviation from them.

## Running tests

Please only run tests relevant to the areas that we're changing, where "relevant" considers
file-level granularity, not app or module-level. We can rely on PR checks for the majority of tests.

## When writing for human consumption

Artifacts like ERDs and PR descriptions are intended for human consumption. To the degree possible,
writing should:

* BE CONCISE
* BE BRIEF
* Avoid jargon (if jargon must be used, it should be defined)
* Not assume that readers have business or code context
* Use simple, plain language
* Use short sentences and paragraphs

## PR descriptions

Unless otherwise asked, please use the following rules when asked to created a PR description for a
change set:

* BE BRIEF/CONCISE.
* Avoid jargon; if you must use it, define it.
* Print the generated description to the current session in copy/pasteable GitHub markdown format.
* If the PR is known to be one in a series, include a bold "PR N of M for [TICKET-####]" under
  description.
* If the PR is large (i.e.: over ~35 files), include a "### Files to review" section before the
  "### What" section.
* Use the template below (sections enclosed in curly braces "{}" are optional):

```markdown
## Description

**{PR N of M for [TICKET-####]}.**

...

{
### Files to review

...
}

### What

...

### Why

...

## Testing

...
```

## When addressing PR bot comments

When asked to "handle" or "address" PR comments from code review review bots (i.e.: coderabbit, 
Claude, etc.), please do so according to the following rules:

* Only address the comments that are relevant/necessary.
* Please resolve both the addressed and the ignored comments.
* If replies are posted that reference an incoming fix, please mention that the fix is incoming/not
  committed yet so the bots aren't confused by the apparent inconsistency.

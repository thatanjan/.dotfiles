---
description: Check staged changes, generate commit message using commit conventions, and commit
agent: build
---

1. First check the staged changes using `git status` and `git diff --cached` to understand what will be included in the commit.
2. Generate commit message. For this you must use the "commit" skill.
3. Then commit the staged changes with the generated message using `git commit -m "generated message"`.

Do NOT touch any unstaged changes.

---
layout: default
title: Git
---

## Git

Git has several places where it keeps config values:

1. `.../etc/config` keeps system-level configuration values. This is normally handled by the super-user and not by a regular user.
2. `~/.gitconfig` or `~/.config/git/config` keeps current user configuration values.
3. `.../.git/config` keeps project-specific configuration values. This contains other useful details such as the origin of the configured repository.

# Sources

1. Pro Git 2nd Edition, ch. 1.6. Last accessed 2024-03-09. https://git-scm.com/book/en/v2/Getting-Started-First-Time-Git-Setup.

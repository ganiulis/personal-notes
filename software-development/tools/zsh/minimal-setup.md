---
layout: default
---

# Minimal setup

This is a manual to set up a lightweight and customizable `zsh` instance for a
Unix environment without resorting to `oh-my-zsh`.

## Instructions

1. Install `zsh` through your package manager
2. Set `zsh` as the default shell for the current user with `chsh -s /bin/zsh`
3. Reload the user session and complete the setup for `zsh`
4. Install `zplug` from https://github.com/zplug/zplug
5. Add an aliases file with `touch ~/.zsh_aliases` if you're using the example
   configuration
6. Configure `zplug` in `~/.zshrc`
7. Reload the terminal session
8. Run `zplug install && zplug load --verbose`

## Tips and Tricks

Example `~/.zshrc` configuration with `zplug`:

```sh
HISTSIZE=1000
HISTFILE=~/.histfile
SAVEHIST=1000

source ~/.zplug/init.zsh

zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting"

zplug "themes/clean", from:oh-my-zsh, as:theme

zplug load

. ~/.zsh_aliases
```

# Resources

1. Oh My Zsh homepage. Accessed 2024-01-10. https://ohmyz.sh.
2. Zplug homepage. Accessed 2024-01-10. http://zplug.github.io.
3. "Zsh." The Debian Wiki. Accessed 2024-01-09. https://wiki.debian.org/Zsh.

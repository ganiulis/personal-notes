# Summary

This is a short recipe for a minimal, up-to-date Debian system.

# Instructions

1. Log in as the root user (run `su` if you are already logged-in as a regular user).
2. Ensure system packages are up-to-date with `apt-get update && apt-get upgrade && apt-get full-upgrade`.
3. Change the release in `/etc/apt/sources.list` or `/etc/apt/sources.list.d/...` to the desired version.
4. Prepare upgrade the system with `apt-get clean && apt-get update && apt-get upgrade && apt-get full-upgrade && apt-get autoremove`.
5. Confirm decisions to upgrade and read through any available bulletins.
6. Restart the system.
7. Check if the upgrade is successful with `cat /etc/os-release`. It should match your desired release.

# Tips

1. Remove obsolete packages with `apt purge --auto-remove ... && apt clean ...`. Since I'm primarily a [Vim](https://www.vim.org) and [Neovim](https://neovim.io) user I usually remove the default [GNU nano text editor](https://www.nano-editor.org) from my systems.

# Sources

1. Debian Releases. The Debian Project. Accessed 2024-02-21. https://www.debian.org/releases/.
2. DebianUpgrade. The Debian Wiki. Accessed 2024-02-21. https://wiki.debian.org/DebianUpgrade.

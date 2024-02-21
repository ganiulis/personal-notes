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

1. Remove obsolete packages with `apt purge --auto-remove ... && apt clean ...`.

# Sources

1. Available Debian releases: https://www.debian.org/releases/.
2. Upgrade instructions from the Debian Wiki: https://wiki.debian.org/DebianUpgrade.


---
layout: default
---

# Users

A regular user facilitates the non-administrative functions of a system:

1. Log in as the root user.
2. Create a regular password-protected user with `useradd larry && passwd larry`.
3. Assign root privileges with `usermod -aG sudo larry`.
4. Create a user-owned home directory with `mkdir /home/larry && chown larry: /home/larry`.
5. Log in as the regular user.
6. Test regular user privileges with `whoami` (expected: `larry`) and `sudo whoami` (expected: `root`).
7. Change the default shell with `chsh -s /usr/bin/example`. I usually choose [Zsh](https://www.zsh.org) for the regular user.

Substitute `larry` with your own username.

# Tips

1. Available shells are listed with `cat /etc/shells`.
2. It is recommended to not change the root user's shell to a non-default shell. A mistake here may permanently brick your system.
3. The root user should have a different password from all regular users. While there are smarter security measures if your machine sits all day at home, this provides an opportunity to learn when each password is used (eg.: any `sudo ...` command and `su`).

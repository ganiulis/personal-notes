---
layout: default
title: Portage package manager
---

Portage is the package manager for Gentoo and the `emerge` command-line tool.

The configuration directory is in `/etc/portage` which adjusts package specifics according to the user's needs:

1. `binrepos.conf` is for configuring an experimental binary package host.
2. `make.conf` contains some auto-generated and customized global USE flags.
3. `make.profile` is a symbolic link to the eselected Gentoo profile.
4. `package.accept_keywords` contains package-specific USE flags.
5. `package.license` contains unmasked licenses.
6. `package.mask` contains packages masked by the user.
7. `package.unmask` contains unmasked packages.
8. `package.use` contains package-specific USE flags.
9. `profile` is a profile-specific configuration directory.
10. `repos.conf` contains eselected ebuild repositories.
11. `savedconfig`.
12. `sets` contains custom context-dependent sets.

> For a deeper structure most of these configuration files can be converted to directories.

The most important configuration file is `make.conf` where it's possible to set USE flags globally:

1. `CFLAGS` see https://wiki.gentoo.org/wiki/Safe_CFLAGS.
2. `CXXFLAGS`.
3. `USE` supersedes any default USE flags for package defaults.
4. `ACCEPT_KEYWORDS` supersedes the default profile flags and allows to pick the stable or unstable branch for package defaults.

# Tips

1. Set `MAKEOPTS` in `make.conf` according to the capabilities of the CPU and RAM.
2. The default `ACCEPT_LICENSE` setting is `-* @FREE`. This setting used to be `* -@EULA` for older Gentoo builds: https://www.gentoo.org/support/news-items/2019-05-23-accept_license.html.

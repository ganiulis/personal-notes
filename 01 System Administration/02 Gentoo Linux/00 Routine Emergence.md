# Summary

A modern Gentoo system requires regular updates to function as designed.

The system should be updated at least once a week but no more than once a day.

# Instructions

1. Open your terminal emulator as the root user (either directly or with `su` if logged-in as a regular user).
2. Connect to the Internet if disconnected.
3. Synchronize currently eselected package repositories with `emaint sync`.
4. Update packages with `emerge -avuDN --with-bdeps=y @world`. Proceed when prompted if the provided update list appears fine.
5. Update USE flag requirements through `dispatch-conf` if changes are required, and restart with `emerge -avuDN --with-bdeps=y @world`.
6. Wait for package updates to finish.
7. If there are new news items, read them with `eselect news read` and follow the provided instructions for any necessary changes.
8. Remove obsolete packages with `emerge -c`.

# Tips

1. The `--with-bdeps=y` keyword updates build dependencies, but this is often uneccessary and can be omitted if desired.
2. There's many ways to update USE flags. `dispatch-conf` is the most straightforward way since it is included with [Portage](https://wiki.gentoo.org/wiki/Portage), and these changes can be further edited after USE flags have been updated.

# Sources

1. Ebuild repository. The Gentoo Wiki. Accessed 2024-02-21. https://wiki.gentoo.org/wiki/Ebuild_repository/en.
2. News Items. The Gentoo Development Guide. Accessed 2024-02-21. https://devmanual.gentoo.org/general-concepts/news/index.html.

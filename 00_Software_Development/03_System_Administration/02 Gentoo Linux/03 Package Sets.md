# Summary

Sets are packages organized for a specific context, such as for system utilities, the desktop environment or development tools.

The Gentoo system has six static (or: default) sets:

1. `@selected-packages` encompasses packages from `/var/lib/portage/world`.
2. `@selected-sets` is a super-set of all custom sets from `/etc/portage/sets`.
3. `@selected` is a super-set of `@selected-packages` and `@selected-sets`.
4. `@system` encompasses packages defined by the Gentoo development team.
5. `@profile` encompasses packages defined by the Gentoo distribution profile.
6. `@world` is a super-set of `@selected`, `@system` and `@profile` sets.

Custom sets are organized in `/etc/portage/sets`.

Specific sets are compiled with `emerge -avuDN @placeholder`.

It's useful to keep them organized in set files instead of in the `world` file.

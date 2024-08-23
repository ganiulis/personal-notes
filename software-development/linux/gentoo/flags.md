---
layout: default
---

# USE flags

Flag priority is configured with `USE_ORDER` and has a default order of priority:

1. The `USE` parameter in `emerge`.
2. Package-specific flags in `package.use`.
3. Global flags in `make.conf`.
4. Eselected Gentoo profile defaults.
5. Emerged package defaults.
6. Ebuild repository defaults.
7. Environment-specific `/etc/env.d` (rarely used).

The `~amd` package keyword is a convention for WIP packages.

Unstable packages should always be filled in `package.accept_keywords` for Portage to emerge them.

The CPU architecture is auto-detected with `-march=native` in `COMMON_FLAGS` during package compilation.

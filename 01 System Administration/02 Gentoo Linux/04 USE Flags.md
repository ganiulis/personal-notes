# Summary

1. Flag priority is configured with `USE_ORDER` which has a default order:
  1. The `USE` parameter in `emerge`.
	2. Package-specific flags in `package.use`.
	3. Global flags in `make.conf`.
	4. Eselected Gentoo profile defaults.
	5. Emerged package defaults.
	6. Ebuild repository defaults.
	7. Environment-specific `/etc/env.d` (rarely used).
3. The `~amd` package keyword is a convention for WIP packages.
4. Unstable packages should always be filled in `package.accept_keywords` for Portage to emerge them.
5. The CPU architecture is auto-detected with `-march=native` in `COMMON_FLAGS` during package compilation.

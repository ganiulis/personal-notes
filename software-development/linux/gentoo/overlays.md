---
layout: default
title: Package overlays
---

The default Gentoo repository may not have the desired package. However, more packages exist in external repositories.

# Instructions

1. Look for the desired package (eg.: `foo/bar`) in https://gpo.zugaina.org/.
2. Make note of the repository (eg.: `example`).
3. Find the relevant repository with `eselect repository list`.
4. Select the repository with `eselect repository enable example`.
5. Synchronize the repository with `emaint sync -r example`.
6. Check if the package exists with `emerge -s foo/bar`.
7. Mask all external packages with `*/*::example` in `package.mask`.
8. Unmask the specific package with `foo/bar::example` in `package.unmask`.
9. Check if the package needs any additional configuration with `emerge --ask ... foo/bar`.
10. Update configuration manually or with `dispatch-conf`.
11. Emerge the package.

# Tips

1. It's recommended to update all packages before emerging more.

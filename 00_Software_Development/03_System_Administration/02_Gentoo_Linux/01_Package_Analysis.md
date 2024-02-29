# Summary

Package and USE flags can be checked and analyzed with some built-in Portage tools.

# Instructions

- See all active profile flags with `portageq envvar USE | xargs -n 1`.
- Check which packages contain USE flags with `equery hasuse ...`.
- Display all flags with descriptions for a package with `equery uses ...`.
- Dependencies for the package are listed with `equery depends foo/bar`.
- Dependencies of the package are listed with `equery depgraph foo/bar`.
- List installed packages with `equery list foo/bar` or do a fuller search with the `-p` option.

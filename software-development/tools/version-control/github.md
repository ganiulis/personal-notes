---
layout: default
---

# GitHub

## Summary

GitHub offers easy integration with a local SSH client to access public/private
repositories via SSH instead of HTTPS.

## Instructions

### UNIX

Create a personal key:

1. Generate a new SSH key with
   `ssh-keygen -C email@address.com -f ~/.ssh/personal -N ""`.
2. Copy the output of `cat ~/.ssh/personal.pub` to
   [GitHub](https://github.com/settings/ssh/new) and name it as your machine's
   name (eg.: `MacBook Pro M2`).
3. Append to `~/.ssh/config`:

```
Host personal
	HostName github.com
	PreferredAuthentications publickey
	IdentityFile ~/.ssh/personal
```

4. Add your identity with `ssh-add ~/.ssh/personal`.
5. Check if your identity has been added with `ssh-add -L`.
6. Authenticate with `ssh -T git@personal`. You should see your GitHub username.
   Authentication is necessary only once when setting up.

## Notes

1. While not necessary, it is generally recommended to keep separate keys for
   separate machines.

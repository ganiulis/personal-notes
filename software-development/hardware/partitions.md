---
layout: default
---

# Partitions

There's a lot of different disk partition types:

1. `dm-crypt` and `LUKS` partition types are for encryped storage. It creates a
   new block device which encrypts and decrypts files on the fly during and
   after boot.

2. Some organizations use `LUKS` partition to keep work laptops safer.

3. `RAID` is for managing redundant, but inexpensive disks in data centers to
   have a ephemeral physical disk array which work even if some disks fail.

4. `LVM` is created automatically with `LUKS` to map encrypted volumes.

5. `/home`, `/var`, `/srv`, `/var/tmp`, `/`, etc. are for the administrator to
   decide. For example, one might want to dedicate a separate partition in a
   different disk for `/home` which stores user files for easy data recovery if
   the system fails. It is easier to recover files from a separate partition or
   to migrate it without reinstalling the entire system.

## Notes

- `EFI` is a newer replacement of `BIOS`. The boot partition can't be encrypted
  like `LUKS` because the computer needs to run instructions from it.

- Some users put their `/boot` partitions in a USB flash drive, making it
  impossible to boot `LUKS` encrypted file systems without having the USB
  inserted into the computer. This serves as a physical 2FA and forensics
  evasion measure.

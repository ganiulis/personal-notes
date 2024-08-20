---
layout: default
---

# crDroid

Updating NikGapps:

1. Connect the phone to your laptop.
2. './adb.exe devices'
3. './adb.exe reboot recovery`
4. Enter adb sideload mode.
5. `./adb.exe sideload NikGapps...signed.zip`
6. Restart your phone.
7. `./adb.exe shell pm grant com.google.android.gms android.permission.ACCESS_COARSE_LOCATION`
8. `./adb.exe shell pm grant com.google.android.gms android.permission.ACCESS_FINE_LOCATION`

## Trace

1. https://xdaforums.com/t/guide-the-correct-way-to-flash-custom-roms.3885962/

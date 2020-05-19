# altracer-overlay
Gentoo user overlay

Add this to your Gentoo box via [local overlays](https://wiki.gentoo.org/wiki/Overlay/Local_overlay) as follows:

1. Create a `/etc/portage/repos.conf/altracer-overlay.conf` of:
```console
[altracer-overlay]
location = /var/db/repos/altracer-overlay/
sync-type = git
sync-uri = https://github.com/ALTracer/altracer-overlay.git
priority = 9999
```
2. Download the ebuilds with `emaint sync --repo altracer-overlay` or likes
3. Check new available packages with `eix --in-overlay altracer-overlay`

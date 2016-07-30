#!/bin/sh

tmpfile=$(mktemp)
exec 5<>"$tmpfile"
rm "$tmpfile"
echo "$SSH_PRIVATE_KEY" | /opt/dropbear-static/bin/dropbearconvert openssh dropbear - /proc/$$/fd/5
DROPBEAR_PASSWORD='' /opt/dropbear-static/bin/dbclient -Tyyi /proc/$$/fd/5 $*

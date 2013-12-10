#!/bin/sh

##############################################################################

workdir=${HOME}/Documents

host1=po12.mail.mit.edu
auth1=LOGIN
user1=jmorzins
pfil1="${workdir}/${user1}.password"

host2=imap.exchange.mit.edu
auth2=PLAIN
user2=snizromj
pfil2="${workdir}/${user2}.password"

# Also consider proxy, see the FAQ
# --authuser1 admin_user --password1 admin_user_password --user1 foo_user

# Also consider
# --regextrans2 is used to transform folder names
#
# Remember that --regextrans2 applies after the default 
# inversion prefix1 <-> prefix2 and sep1 <-> sep2
#
# e.g:
#  --regextrans2 's#(.*)#MIGRATED/$1#' \
#
# ...
# Or just clobber --sep1 and/or --prefix1 to emulate our current script.



##############################################################################

now=`date +%FT%T`
synclog=synclog-"${user1}@${host1}"-"${user2}@${host2}"-"${now}".txt

echo >&2 "Logging to ${synclog}"

exec 1>"${workdir}/${synclog}"
exec 2>"${workdir}/${synclog}"

imapsync="${workdir}"/imapsync/imapsync

exec "${imapsync}" --noreleasecheck \
  --host1 "${host1}" --ssl1 --authmech1 "${auth1}" \
  --user1 "${user1}" --passfile1 "${pfil1}" \
  --host2 "${host2}" --ssl2 --authmech2 "${auth2}" \
  --user2 "${user2}" --passfile2 "${pfil2}" \
  --prefix1 '' \
  --regextrans2 's#(.*)#Migrated/$1#' \
  --folder INBOX.Hamscreen \
  --nouseuid --nousecache \
  --useheader Message-Id --useheader Received --useheader Subject \
  --delete2duplicates --expunge2  # --dry --justfolders



#!/bin/sh

##############################################################################

# Checklist:
#  host1, auth1, host2, auth2
#  user1, pwdfile1, user2, pwdfile2

#  dry, justfolders

#  prefix, regextrans2
#  folder
#  useuid, usecache, useheaders
#  delete2duplicates


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

workdir=${HOME}/Documents

# The source
host1=po__.mail.mit.edu
auth1=LOGIN
user1=________
pwdfile1="${workdir}/${user1}.password"

# The destination
host2=imap.exchange.mit.edu
auth2=PLAIN
user2=________
pwdfile2="${workdir}/${user2}.password"

now=`date +%FT%T`
synclog=synclog-"${user1}@${host1}"-"${user2}@${host2}"-"${now}".txt

echo >&2 "Logging to ${synclog}"

exec 1>"${workdir}/${synclog}"
exec 2>"${workdir}/${synclog}"

#experimental
#useheaders="--useheader Message-Id --useheader Received --useheader Subject"
useheaders=""

#targeted
#folder="--folder INBOX.Mail to be restored"
folder=""

# Big folders need --nofoldersizes

imapsync="${workdir}"/imapsync/imapsync

#   --regextrans2 's#(.*)#Migrated/$1#' \

# --justfolders --dry
# --justfolders
# --dry
# 

exec "${imapsync}" --noreleasecheck \
  --host1 "${host1}" --ssl1 --authmech1 "${auth1}" \
  --user1 "${user1}" --passfile1 "${pwdfile1}" \
  --host2 "${host2}" --ssl2 --authmech2 "${auth2}" \
  --user2 "${user2}" --passfile2 "${pwdfile2}" \
  --tmpdir /var/tmp \
  --nofoldersizes \
  --prefix1 '' \
  --regextrans2 's#(.*)#Migrated/$1#' \
  --useuid --usecache \
  --include "INBOX.utf.*" \
  --justfolders --dry \
##  --delete2duplicates --expunge2 \



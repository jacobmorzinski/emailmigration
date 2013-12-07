
keyring.py from:

http://www.rittau.org/blog/20070726-01
http://www.rittau.org/gnome/python/keyring.py


imap-passwords from:

http://www.clasohm.com/blog/20080922/imap-passwords



gkeyring.py from:

http://kparal.wordpress.com/2009/09/29/command-line-access-to-gnome-keyring/
https://github.com/kparal/gkeyring

Note that it can return multiple keys if you query broadly.

USAGE
# Set
 python gkeyring.py --set --type network -p user=jmorzins,server=po12.mail.mit.edu,protocol=imap --name imapsync

# Query
 python gkeyring.py --type network -p user=jmorzins,server=po12.mail.mit.edu,protocol=imap --name imapsync -O

 python gkeyring.py --type network -p user=jmorzins,server=po12.mail.mit.edu,protocol=imap --name imapsync -o secret



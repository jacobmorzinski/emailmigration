emailmigration
==============

This project contains a yoke script to drive the imapsync perl script.

The goal was to make it easy to invoke common cases, but that got hard.

So I just kept a stream of consciousness commentary in the notes file.

Use cases to consider
---------------------

- Transfer just one folder: use --folder with a folder name
- Transfer a subtree:  use --include with a folder regexp
- Transfer everything quickly: --useuid --usecache
- Continue after an incomplete transfer: DOOM DOOM DOOM ABANDON HOPE
 - Preserve or delete existing messages in host2 that did not come from host1: Not worth it.
 - Delete duplicates on host2 that did come from host1: Not worth it.



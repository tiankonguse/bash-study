#########################################################################
# File Name: test.sh
# Author: tiankonguse(skyyuan)
# mail: i@tiankonguse.com
# Created Time: 2015年03月30日 14:53:09
#########################################################################
#!/bin/bash

FIND_REGEX='.*md'
FILES=`find -type f -regextype posix-egrep -iregex "$FIND_REGEX"`

for EACH in $FILES
do
    sed '1 a\ ' $EACH > $EACH
    sed '2 a\ 这个项目已经不再更新，迁移到[这里][vim-path]' $EACH > $EACH
    #echo '[vim-path]: https://github.com/tiankonguse/empty/tree/master/vim' >> $EACH
done

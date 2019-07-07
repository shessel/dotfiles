#!/bin/sh

DIR=`dirname ${0}`
ABS_DIR=`realpath $DIR`
DOTFILES=`find $DIR -type f -not -path '*/.*' -not -name setup.sh -printf "%P\n"`

for f in ${DOTFILES[*]}
do
    LINK_NAME="$HOME/.$f"
    if [ -e $LINK_NAME ]
    then
        echo "file $LINK_NAME exists already"
    else
        echo "linking $f as $LINK_NAME"
        # mkdir -p on existing directory is no error according to its manpage
        mkdir -p `dirname $LINK_NAME`
        TARGET="$ABS_DIR/$f"
        ln -s $TARGET $LINK_NAME
    fi
done


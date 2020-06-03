#!/bin/bash

DIR=`pwd`

echo "linking files begin"
ln -s ${DIR}/.vimrc ~/.vimrc
ln -s ${DIR}/.vimrc.local ~/.vimrc.local 
ln -s ${DIR}/.vim ~/.vim
echo "checking YouComplelteMe..."
YCM_PATH=${DIR}/.vim/bundle/YouCompleteMe
if [ ! -d ${YCM_PATH} ]; then
    echo "cloning YCM..."
    git clone https://github.com/ycm-core/YouCompleteMe.git ${YCM_PATH}
    echo ""
    echo "Note: You Need To build YCM by yourself!!"
    echo ""
fi

echo "linking files done"

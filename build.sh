#!/bin/bash

DIR=`pwd`

echo "moving old vim configs..."
unlink ~/.vimrc
unlink ~/.vimrc.local
unlink ~/.vim

DT=`date +"%Y-%m-%d_%H-%M-%S"`
mv ~/.vimrc /tmp/.vimrc.${DT}
mv ~/.vimrc.local /tmp/.vimrc.local.${DT}
mv ~/.vim /tmp/.vim.${DT}

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

echo "making folders of vim backups"
mkdir -p ~/.vim/files/backup/
mkdir -p ~/.vim/files/swap/
mkdir -p ~/.vim/files/undo/
mkdir -p ~/.vim/files/info/

echo "linking files done"

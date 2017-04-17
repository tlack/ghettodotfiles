dir=$(cd `dirname $0` && pwd)


if [ -d $HOME/.vim -o -e $HOME/.vimrc -o -e $HOME/.ghettorc.sh ]; then
	echo wont touch existing vi - run   rm $HOME/.vim $HOME/.vimrc $HOME/.ghettorc.sh
	exit 1
fi

rm -rf $HOME/.vim $HOME/ghettorc.sh

ln -s $dir/.vim $HOME/.vim
ln $dir/ghettorc.sh $HOME/.ghettorc.sh
ln $dir/.vimrc $HOME/.vimrc
ln $dir/.screenrc $HOME/.screenrc
echo ". $HOME/.ghettorc.sh" >> $HOME/.bashrc


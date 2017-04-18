dir=$(cd `dirname $0` && pwd)

echo .ghettorc 
ln $dir/ghettorc.sh $HOME/.ghettorc.sh
echo ". $HOME/.ghettorc.sh" >> $HOME/.bashrc

echo .screenrc
ln $dir/screenrc $HOME/.screenrc

if [ -d $HOME/.vim -o -e $HOME/.vimrc -o -e $HOME/.ghettorc.sh ]; then
	echo wont touch existing vi - run   rm $HOME/.vim $HOME/.vimrc $HOME/.ghettorc.sh
	exit 1
fi

rm -rf $HOME/.vim $HOME/ghettorc.sh
ln $dir/.vimrc $HOME/.vimrc
ln -s $dir/.vim $HOME/.vim


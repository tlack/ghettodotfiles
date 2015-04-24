dir=$(cd `dirname $0` && pwd)


if [ -d $HOME/.vim -o -e $HOME/.vimrc -o -e $HOME/.ghettorc.sh ]; then
	echo delete your $HOME/.vim $HOME/.vimrc $HOME/.ghettorc.sh
	exit 1
fi

rm -rf $HOME/.vim $HOME/ghettorc.sh

ln -s $dir/.vim $HOME/.vim
ln $dir/ghettorc.sh $HOME/.ghettorc.sh
ln $dir/.vimrc $HOME/.vimrc
echo ". $HOME/.ghettorc.sh" >> $HOME/.bashrc


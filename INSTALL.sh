dir=$(cd `dirname $0` && pwd)


if [ -d $HOME/.vim ]; then
	echo delete your $HOME/.vim
	exit 1
fi

rm -rf $HOME/.vim $HOME/ghettorc.sh

ln -s $dir/.vim $HOME/.vim
ln $dir/ghettorc.sh $HOME/.ghettorc.sh
ln $dir/.vimrc $HOME/.vimrc
echo ". $HOME/.ghettorc.sh" >> $HOME/.bashrc


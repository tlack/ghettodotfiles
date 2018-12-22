dir=$(cd `dirname $0` && pwd)

echo .ghettorc 
ln $dir/ghettorc.sh $HOME/.ghettorc.sh
echo ". $HOME/.ghettorc.sh" >> $HOME/.bashrc

echo .screenrc
ln $dir/screenrc $HOME/.screenrc

rm -rf $HOME/.vim $HOME/.ghettorc.sh
ln $dir/.vimrc $HOME/.vimrc
ln -s $dir/.vim $HOME/.vim


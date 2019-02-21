dir=$(cd `dirname $0` && pwd)

echo .ghettorc 
ln $dir/ghettorc.sh $HOME/.ghettorc.sh
echo ". $HOME/.ghettorc.sh" >> $HOME/.bashrc

echo .tmux.conf
ln $dir/tmux.conf $HOME/.tmux.conf

rm -rf $HOME/.vim $HOME/.ghettorc.sh
ln $dir/.vimrc $HOME/.vimrc
ln -s $dir/.vim $HOME/.vim


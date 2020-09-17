dir=$(dirname $0)
echo ghettodotfiles dir = $dir

echo .ghettorc 
rm ~/.ghettorc.sh
ln $dir/ghettorc.sh $HOME/.ghettorc.sh
echo ". $HOME/.ghettorc.sh" >> $HOME/.bashrc

echo .tmux.conf
rm ~/.tmux.conf
ln $dir/tmux.conf $HOME/.tmux.conf

rm -rf $HOME/.vim $HOME/.vimrc
ln $dir/.vimrc $HOME/.vimrc
ln -s $dir/.vim $HOME/.vim


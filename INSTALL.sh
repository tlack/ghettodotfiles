dir=$(dirname $0)
echo cwd = $dir

echo Installing .ghettorc 
rm ~/.ghettorc.sh 2>/dev/null
ln $dir/ghettorc.sh $HOME/.ghettorc.sh
echo ". $HOME/.ghettorc.sh" >> $HOME/.bashrc

echo Installing .tmux.conf
rm ~/.tmux.conf 2>/dev/null
ln $dir/tmux.conf $HOME/.tmux.conf

echo Installing .vim folder
rm -rf $HOME/.vim $HOME/.vimrc 2>/dev/null
ln -s $dir/.vim $HOME/.vim

echo Installing .vimrc
ln $dir/.vimrc $HOME/.vimrc

echo Q: How do you make an octopus laugh?
echo A: Give him ten-tickles


dir=$(cd `dirname $0` && pwd)


if [ -d $HOME/.vim ]; then
	echo delete your $HOME/.vim
	exit 1
fi

rm -rf $HOME/.vim $HOME/git_bash_prompt.sh

ln -s $dir/.vim $HOME/.vim
ln $dir/git_bash_prompt.sh $HOME/git_bash_prompt.sh
ln $dir/.vimrc $HOME/.vimrc
echo ". $HOME/git_bash_prompt.sh" >> $HOME/.bashrc


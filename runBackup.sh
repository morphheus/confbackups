cd ~/confbackups


# FOLDERS BACKUP - must provide path from ~
# Will be copied relative to ~
declare -a foldersToBackup=(".config/nvim/colors"
                            ".config/nvim/init.vim"
                            ".config/nvim/pylintrc_introspect"
                            ".bash_aliases"
                            ".bashrc"
                            ".Xdefaults")

for i in "${foldersToBackup[@]}"
do 
    echo processing $i
    rm -rf $i
    cp -r ~/$i $i
done


# Git stuff
echo Commiting tracked files to git
git add -u
git commit -m "Auto backup"


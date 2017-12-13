winroot="/mnt/c/introspectDocs"
run_svttest_file="/mnt/c/introspectDocs/SvtPython/runSvtTest.py"
run_svttest_file_windows='"C:/introspectDocs/SvtPython/runSvtTest.py"'
test_folder='C:/introspectDocs/Introspect/Tests'
alias vim=nvim
alias suvim="sudo -E nvim"
alias vimrc="nvim ~/.config/nvim/init.vim"
alias pls='sudo $(history -p !!)'
#alias wcpip="wcmd C:/Python27/Scripts/pip.exe"
alias wcpython='VBoxManage guestcontrol Windows10 --username david.tetreault.laroche@introspect.ca --password war4ever run --wait-stdout "C:/Python27/python.exe" -- '

alias pyprof='python -m cProfile -o out.cprof'
alias pyprof_svttest="python -m cProfile -o out.cprof '$run_svttest_file'"
alias pyprof2calltree="~/.local/bin/pyprof2calltree"

alias svttest="python $run_svttest_file"
alias wc_svttest="wcpython '$run_svttest_file_windows' --autoFlushOutput --coloredMessages"
alias wc_memprof_svttest="wcpython -m memory_profiler '$run_svttest_file_windows'"

alias envActivate="source ~/Documents/SvtPython/env/bin/activate"

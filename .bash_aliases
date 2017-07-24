winroot="/mnt/c/introspectDocs"
run_svttest_file="/mnt/c/introspectDocs/SvtPython/runSvtTest.py"
run_svttest_file_windows='"C:\introspectDocs\SvtPython\runSvtTest.py"'
test_folder='"C:\introspectDocs\Introspect\Tests"'
alias cdwin='cd "$winroot"'
alias tmux="TERM=xterm-256color tmux"
alias vim=nvim
alias wgpython="wstart c:\\\\Python27\\\\python.exe"
alias wcpython="wcmd c:\\\\Python27\\\\python.exe -u"
alias wcpip="wcmd  C:\\\\Python27\\\\Scripts\\\\pip.exe"

alias pyprof='python -m cProfile -o out.cprof'
alias pyprof_svttest="python -m cProfile -o out.cprof '$run_svttest_file'"
alias kcache='/home/davidtlr/.local/bin/pyprof2calltree -k -i'

alias svttest="python $run_svttest_file"
alias wc_svttest="wcpython '$run_svttest_file_windows' --autoFlushOutput --coloredMessages"
alias wc_memprof_svttest="wcpython -m memory_profiler '$run_svttest_file_windows'"

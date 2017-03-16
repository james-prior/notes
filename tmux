tmux set-option status-fg white
tmux set-option status-fg black

^A[        to get into copy mode
use vi keys to navigate
<space>    to mark one end of text to copy
use vi keys to navigate
<return>   to mark other end of text to copy (including character that cursor is on)
q           quit copy mode
g           goto top line
G           goto bottom line
?           search backwards
n           next keyword appearance???
N           previous keyword appearance???
<ESC>       clear selection

^A]        to paste

:setw -g mode-keys vi

:show-buffer        display buffer_0 contents
:capture-pane       copy entire visible contents of pane to a buffer
:list-buffers       list all buffers
:choose-buffer      list all buffers and paste selected buffer
:save-buffer foo    save buffer to file 'foo'
:delete-buffer -b 1 delete buffer_1

###############################################################################

http://www.tmuxcheatsheet.com/

tmux info ;# shows much info: clients, sessions, windows, panes, term stuff

^A: enter command mode
^A? show shortcuts

###############################################################################
sessions

tmux a
tmux at
tmux attach
tmux attach-session

tmux a -t mysession
tmux at -t mysession
tmux attach -t mysession
tmux attach-session -t mysession

tmux ls
tmux list-sessions

^As show sessions
^A$ rename session
^Ad detach from sessions
^A( move to previous session
^A) move to next session

###############################################################################
windows

^Ac create window
^A, rename current window
^Ap goto previous window
^An goto next window
^A0 goto window 0
^A9 goto window 9
:select-window -t :n
    where n is window number, which may be >= 10
^A& close current window

swap windows number 2 and 1
:swap-window -s -2 -t 1

###############################################################################
panes

^A; switch to last active pane
^A% split pane vertically
^A" split pane horizontally
^A{ move current pane "left"
^A} move current pane "right"
^Ao switch to next pane
^Aq briefly show pane numbers
    (then quickly type a number to switch to that pane)
^Az toggle panel zoom (make pane full size)
^A! convert pane to a window
^A<arrowkey> switch to adjacent pane (long delay between ^A and arrowkey)
^A<arrowkey> resize current pane (very short delay between ^A and arrowkeys)
^A<space> toggle (cycle?) between pane layouts
^Ax close pane

###############################################################################
misc

^At show clock
^A? show shortcuts

:set -g OPTION          set OPTION for all sessions
:setw -g OPTION         set OPTION for all windows (of current session?)

https://gist.github.com/MohamedAlaa/2961058
https://gist.github.com/andreyvit/2921703

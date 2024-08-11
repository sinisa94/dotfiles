#!/bin/bash
# <term> tmux_start_app.sh app_name
name=app
tmux start-server
tmux has-session -t ${name}
if [ "$?" != "0" ]; then
    tmux new-session -s ${name} $*
elif [ $# -gt 0 ]; then
    tmux new-window -t ${name} $*
else
    tmux a -t ${name}
fi

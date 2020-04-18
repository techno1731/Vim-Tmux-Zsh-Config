#!/bin/sh
session='Udacity-Project-2'
tmux new-session -d -s $session
tmux rename-window -t 0 'VIM'
tmux send-keys -t 'VIM' 'vim ' IMDbAnalysis.py C-m
tmux split-window -v 
tmux split-window -h 'ipython'
tmux new-window 'mutt'
tmux -2 attach-session -d

#!/bin/bash

# Start a new tmux session
tmux new-session -s mysession -d
tmux rename-window Editor

# Split the current pane horizontally
tmux split-window -h -p 20

# Select the left pane and start nvim
tmux select-pane -t 0
tmux send-keys "nvim -c Explore" C-m

# Select the right pane go to build folder and type cmake build command 
tmux select-pane -t 1
tmux send-keys "cd build" C-m
tmux send-keys "cmake --build ."

# Create a new window and split the current pane vertically
tmux new-window -n Git

# Type git status in background window
tmux send-keys "git status" C-m

# Attach to the tmux session
tmux attach-session -t mysession

# Return to Editor window
tmux select-window -t Editor

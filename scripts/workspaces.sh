#Workspace 1

kitty --name ff_term -e zsh -c "fastfetch; exec zsh" &

kitty --name cava_term -e zsh -c "cava; exec zsh" &

kitty --name ncmpcpp_term -e zsh -c "ncmpcpp; exec zsh" &

kitty --name htop_term -e zsh -c "htop; exec zsh" &

kitty --name rsclock_term -e zsh -c "/home/brainfck/.cargo/bin/rsclock -T; exec zsh" &

#Workspace 2
sleep 1

kitty --class KittyWS2 &


#Workspace 3
(sleep 2; firefox) &

#Workspace 9
kitty --class KittyTmux -e tmux new-session -A -s main &












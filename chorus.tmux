new-session -s chorus-servers -n servers -d
send-keys -t chorus-servers 'zsh' C-m
send-keys -t chorus-servers 'hm' C-m 
send-keys -t chorus-servers './script/server' C-m 
split-window -v -t chorus-servers
select-layout -t chorus-servers main-horizontal
select-pane -t 1
send-keys -t 1 'zsh' C-m
send-keys -t 1 'hm' C-m
send-keys -t 1 'foreman start' C-m

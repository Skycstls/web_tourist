Para desplegar en un VPS con kali:

```bash
apt update
apt install gowitness masscan tmux -y
```

Para lanzar `script.sh` en segundo plano con tmux:

```bash
tmux new -d -s tarea1
tmux send-keys -t tarea1 'bash script.sh' C-m
# para cortar el proceso
tmux kill-session -t tarea1
```

Sin tmux:

```bash
bash script.sh &
jobs -l
disown %<trabajo>
#para obtener el pid
ps -aux | grep script.sh
# para cortar el proceso
kill -9 <pid>
```

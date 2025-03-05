function procesar_lista {
    local ips=$(cat ips_limpias)
    for ip in $ips; do
        procesar_ip $ip
    done
}

function procesar_ip {
    local ip=$1
    #cutycapt over ip
    cutycapt --max-wait=2000 --url=$ip --out=public/$ip.png --user-agent="Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.104 Safari/537.36"
}

procesar_lista
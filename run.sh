#!/bin/bash
clear
n=0
positivos=0
function procesar_ip {
    n=$((n+1))
    if [ $n -eq 10 ]; then
        n=0
        clear
        echo "$positivos screenshots creados"
    fi
    local ip=$1
    echo "---------------------------------"
    echo "🔍 Buscando IP: $ip"
        status=$(curl -s -o /dev/null -w "%{http_code}" --max-time 2 --fail --head $ip)
    if [ $status -eq 200 ]; then
        positivos=$((positivos+1))
        echo "🛸 $ip:80 esta activa"
        echo "📷 Creando screenshot"
        cutycapt --max-wait=2000 --url=$ip --out=public/$ip.png --user-agent="Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.104 Safari/537.36"
    else
        echo "🚧 La IP $ip:80 no está activa"
    fi

    status=$(curl -s -o /dev/null -w "%{http_code}" --max-time 2 --fail --head $ip:3000)
    if [ $status -eq 200 ]; then
        positivos=$((positivos+1))
        echo "🛸 La IP $ip:3000 esta activa"
        echo "📷 Creando screenshot"
        cutycapt --max-wait=2000 --url=$ip:3000 --out=public/$ip_3000.png --user-agent="Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.104 Safari/537.36"
    else
        echo "🚧 La IP $ip:3000 no está activa"
    fi

    status=$(curl -s -o /dev/null -w "%{http_code}" --max-time 2 --fail --head $ip:8000)
    if [ $status -eq 200 ]; then
        positivos=$((positivos+1))
        echo "🛸 La IP $ip:8000 esta activa"
        echo "📷 Creando screenshot"
        cutycapt --max-wait=2000 --url=$ip:8000 --out=public/$ip_8000.png --user-agent="Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.104 Safari/537.36"
    else
        echo "🚧 La IP $ip:8000 no está activa"
    fi
}

function procesar_lista_ips {
    local ips=("$@")
    for ip in "${ips[@]}"; do
        procesar_ip $ip
    done
}

rango1=$1
rango2=$2
ips=$(prips $rango1 $rango2)
lista_ips=($ips)
procesar_lista_ips "${lista_ips[@]}"
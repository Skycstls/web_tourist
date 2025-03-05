rango=$1
echo $rango
echo "Escaneando IPs"
sudo masscan -p80,3000,8000,8080 $1 2>/dev/null | awk '{print $6 ":" $4}' | sed 's/\/tcp//' > /tmp/ips_raw.txt

echo "Creando screenshots"
gowitness scan file -f /tmp/ips_raw.txt --screenshot-path ./screenshots

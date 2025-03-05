rango=$1
rm -rf screenshots
mkdir screenshots
echo "Escaneando IPs"
sudo masscan -p80 $1 2>/dev/null | awk '{print $6 ":" $4}' | sed 's/\/tcp//' > /tmp/ips_raw.txt

echo "Creando screenshots"
#gowitness scan file -f /tmp/ips_raw.txt --screenshot-path ./screenshots
gowitness scan file -f /tmp/ips_raw.txt --screenshot-path ./screenshots --status-codes 200,301,302

echo "Check"
echo "Numero de ips: $(cat /tmp/ips_raw.txt | wc -l)"
echo "Numero de screenshots: $(ls screenshots | wc -l)"

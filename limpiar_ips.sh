cat ips_encontradas | awk '{print $6 ":" $4}' | sed 's/\/tcp//' > ips_limpias

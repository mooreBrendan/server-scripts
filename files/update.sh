apt-get update
apt-get upgrade -y

out=""
if [ "$(systemctl is-active docker)" = "active" ]; then
  docker system prune -f
	out=" and pruned"
fi
hn=$(hostname -f)
curl -d "updated$out $hn" -k -L ntfy.bmoore.tech/server-notifs

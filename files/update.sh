#run updates
apt-get update
apt-get upgrade -y

#check if docker is running and prune docker if it is
out=""
if [ "$(systemctl is-active docker)" = "active" ]; then
  docker system prune -f
	out=" and pruned"
fi

#notify ntfy that this host ran this script
hn=$(hostname -f)
curl -d "updated$out $hn" -k -L ntfy.bmoore.tech/server-notifs

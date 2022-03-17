#!/bin/sh

auth1="<your_token>"   # Fill this
auth2="<your_token>"   # Fill this


echo "\n[!] Checking requirements"
REQUIRED_PKG="gnome-terminal"
PKG_OK=$(dpkg-query -W --showformat='${Status}\n' $REQUIRED_PKG|grep "install ok installed")
echo Checking for $REQUIRED_PKG: $PKG_OK
if [ "" = "$PKG_OK" ]; then
  echo "[!] $REQUIRED_PKG Not installed. Setting up $REQUIRED_PKG."
  sudo apt-get --yes install $REQUIRED_PKG
fi

REQUIRED_PKG="ngrok"
PKG_OK=$(dpkg-query -W --showformat='${Status}\n' $REQUIRED_PKG|grep "install ok installed")
echo Checking for $REQUIRED_PKG: $PKG_OK
if [ "" = "$PKG_OK" ]; then
  echo "[!] $REQUIRED_PKG Not installed. Setting up $REQUIRED_PKG."
  curl -s https://ngrok-agent.s3.amazonaws.com/ngrok.asc | sudo tee /etc/apt/trusted.gpg.d/ngrok.asc >/dev/null && echo "deb https://ngrok-agent.s3.amazonaws.com buster main" | sudo tee /etc/apt/sources.list.d/ngrok.list && sudo apt update && sudo apt install ngrok
fi

echo "\nSelect the type of tunnel you need"
echo "\n[1]. Unlimited HTTP Tunnels"
echo "[2]. Unlimited TCP Tunnels"
echo "[3]. BOTH - HTTP & TCP Unlimited Tunnels"
echo "\nEnter Your Choice :" 
read choice

echo "\nMake sure that you have added the required number of authtokens in the script. if not exit now, add it and come back. For more info read this : https://github.com/vishalpatil1337/Ngrok-Unlimited-Tunnel"

if [ $choice = 1 ]
then
	echo "\nEnter the port no's with space between them for opening the tunnels (eg.. 80 90 100)"	
	read ports
	count=0
	for port in $ports
	do
		count=$((count+1))
		authtoken=auth$count
		eval echo "authtoken: \$${authtoken}" > ~/.ngrok2/ngrok.yml
		echo "\nSpawning Your Tunnel $count..."
		gnome-terminal --tab --title="Tunnel $count" -- ngrok http $port
		sleep 2
	done

elif [ $choice = 2 ]
then
	echo "\nEnter the port no's with space between them for opening the tunnels (eg.. 80 90 100)"	
	read ports
	count=0
	for port in $ports
	do
		count=$((count+1))
		authtoken=auth$count
		eval echo "authtoken: \$${authtoken}" > ~/.ngrok2/ngrok.yml
		echo "\nSpawning Your Tunnel $count..."
		gnome-terminal --tab --title="Tunnel $count" -- ngrok tcp $port
		sleep 2
	done

elif [ $choice = 3 ]
then
	echo "\nEnter the No of Tunnels Required (No of Sets)"
	read num
	
	echo "\nYou will need to enter $num HTTP ports & $num TCP ports. \n[!]Caution : Don't repeat port numbers\n"
	
	for i in $(seq 1 $num)
	do
		echo "\nConfiguring Set $i\n"
		echo "\nEnter HTTP port number"
		read http
		echo "\nEnter TCP port number"
		read tcp
		authtoken=auth$i
		eval echo "authtoken: \$${authtoken}" > ~/.ngrok2/ngrok.yml
		echo "tunnels:
  web:
      addr: $http
      proto: http
  file:
      addr: $tcp
      proto: tcp"  >> ~/.ngrok2/ngrok.yml                
		echo "\nSpawning Your Tunnel Set $i..."
		gnome-terminal --tab --title="Tunnel $i" -- ngrok start --all
		sleep 2
	done
	
fi

echo "\nEnjoy Free Tunnels"

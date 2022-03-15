#!/bin/bash

auth1="<your_token>"   # Fill this
auth2="<your_token>"   # Fill this

echo "[1] Run the following commands to install the Requirements"

echo ""

echo "gnome terminal must be installed if not, use this command -> sudo apt-get install gnome-terminal -y"

echo ""

echo "[2] enter this command -> curl -s https://ngrok-agent.s3.amazonaws.com/ngrok.asc | sudo tee /etc/apt/trusted.gpg.d/ngrok.asc >/dev/null && echo "deb https://ngrok-agent.s3.amazonaws.com buster main" | sudo tee /etc/apt/sources.list.d/ngrok.list && sudo apt update && sudo apt install ngrok'"

echo ""
echo ""

echo "enter any port for HTTP tunnel"
read http
echo ""
echo "Enter any port for TCP tunnel"
read tcp

echo "authtoken: $auth1
tunnels:
  web:
      addr: $http
      proto: http
  file:
      addr: $tcp
      proto: tcp"  > /home/vishal/.ngrok2/ngrok.yml                        # change this path.. kali to your username

	gnome-terminal --tab --title="Tunnel 1" --command="ngrok start --all"

break
sleep 5

echo "Lets make 2 nd tunnel"
echo ""
echo "Enter any port for HTTP tunnel (exept you alredy used for 1 st tunnel)"
read http1
echo ""
echo "Enter any port for TCP tunnel (exept you alredy used for 1 st tunnel)"
read tcp1

echo "authtoken: $auth2
tunnels:
  web:
      addr: $http1
      proto: http
  file:
      addr: $tcp1
      proto: tcp"  > /home/kali/.ngrok2/ngrok.yml                # change this path .. kali to your username


gnome-terminal --tab --title="Tunnel 2" --command="ngrok start --all"
echo ""
echo "enjoy"

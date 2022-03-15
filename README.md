# Ngrok-Multi-Tunnel Tool 
Using our ngrok multiple tunnel tool you can make unlimited TCP & HTTP tunnels and use them for free. As the free version of ngrok supports only one tunnel at a given time, we came around this and found some bypasses in order to use multiple tunnels. we made this tool to benefit you guys.


## Installation

``` bash
$ git clone https://github.com/vishalpatil1337/ngrok-unlimited-tunnel.git
```

## Requirements

This script needs **gnome-terminal & ngrok**

Fell free to install them yourselves or use the following commands to install them

``` bash
$ sudo apt-get install gnome-terminal -y

$ curl -s https://ngrok-agent.s3.amazonaws.com/ngrok.asc | sudo tee /etc/apt/trusted.gpg.d/ngrok.asc >/dev/null && echo "deb https://ngrok-agent.s3.amazonaws.com buster main" | sudo tee /etc/apt/sources.list.d/ngrok.list && sudo apt update && sudo apt install ngrok
```

## Requirement for more Advanced Usage

If you are planning to use 1 tcp and 1 http tunnel at a given time then the above requirement is enough. but incase if you need to run 2 tcp tunnels at the same time then,
You need to generate 2 ngrok authtokens and add it to the script (don't worry we are not planning on stealing it. feel free to read the script). If you understand the logic of the script, you can make more tunnels by modifying the script to meet your requirements.

### For Generating auth tokens

1) Go to https://ngrok.com/

2) Signup for an account

3) In the home page you can find the auth token, just copy the token (not the whole command) and paste in the script  
   **on line 3 ->**   auth1="<your token>"    # Change this

4) Do the same by creating another account and put it in the script as authtoken2  
   **on line 4 ->**   auth2="<your token>"    # Change this



## Changes Required in the script 

1) Add authtokens between quotes "" if required.

   **on line 3 ->**   auth1="<your token>"    

   **on line 4 ->**   auth2="<your token>"    
  
  
2) make sure your username is kali. If not, change kail to you username on the following lines.
  
   **on line 32 ->**   proto: tcp"  > /home/kali/.ngrok2/ngrok.yml               
  
   **on line 54 ->**   proto: tcp"  > /home/kali/.ngrok2/ngrok.yml               


  
## Video Tutorial

https://youtu.be/mEM5huXA-Ws

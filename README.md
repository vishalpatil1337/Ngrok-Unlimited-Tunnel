# Ngrok-Multi-Tunnel Tool 
Using our ngrok multiple tunnel tool you can make unlimited TCP & HTTP tunnels and use them for free. As the free version of ngrok supports only one tunnel at a given time, we came around this and found some bypasses in order to use multiple tunnels. 

Before running the script, the user has to create multiple accounts in ngrok.com , as per their need and add the account's authtoken in to the script. the script uses the authtokens one by one to make the neccessary number of tunnels. 

### For Generating auth tokens

1) Go to https://ngrok.com/

2) Signup for an account

3) In the home page you can find the auth token, just copy the token (not the whole command) and paste in the script  
   **on line 3 ->**   auth1="<your token>"    # Change this

4) Do the same by creating another account and put it in the script as authtoken2  
   **on line 4 ->**   auth2="<your token>"    # Change this


## Advanced Usage

If you require more number of tunnels to be used at the same time, repeat the above process and add any number of authtokens as per your requirement.

If you are planning to use 1 tcp and 1 http tunnel at a given time then the above requirement is enough. but incase if you need to run 2 tcp tunnels at the same time then,
You need to generate 2 ngrok authtokens and add it to the script (don't worry we are not planning on stealing it. feel free to read the script). If you understand the logic of the script, you can make more tunnels by modifying the script to meet your requirements.

on line 3 and 4 of the script you can find variables like auth1 & auth2, if you need to open more tunnels, say 5 you can always add auth3, auth4, auth5 and assign your authtoken to it, the script is designed to dynamically adapt to the changes of any number of tunnels, if enough no of authtokens are provided


## Installation

``` bash
$ git clone https://github.com/vishalpatil1337/ngrok-unlimited-tunnel.git
```


## Requirements

This script needs **gnome-terminal & ngrok**

While the script can automatically detect and install the requirements, feel free to install them yourselves if you don't trust the script.
    
``` bash
$ sudo apt-get install gnome-terminal -y

$ curl -s https://ngrok-agent.s3.amazonaws.com/ngrok.asc | sudo tee /etc/apt/trusted.gpg.d/ngrok.asc >/dev/null && echo "deb https://ngrok-agent.s3.amazonaws.com buster main" | sudo tee /etc/apt/sources.list.d/ngrok.list && sudo apt update && sudo apt install ngrok
```

  
## Changes Required in the script 

1) Add authtokens between quotes "" if required.

   **on line 3 ->**   auth1="<your token>"    

   **on line 4 ->**   auth2="<your token>"    
  

  
## Video Tutorial
  
This tutorial covers the usage of our old script,since we have updated it now, however feel free to follow the along with the script

https://youtu.be/mEM5huXA-Ws

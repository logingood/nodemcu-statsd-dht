# Send your DHT nodemcu data to statsd

These little scripts allow you to send [nodemcu](https://github.com/nodemcu/nodemcu-firmware) dht measurements to the remote [statsd](https://github.com/etsy/statsd) server. You can create awesome looking charts using [graphite](http://graphite.wikidot.com/). Easy way to install statsd + graphite is [docker-graphite-statsd](https://github.com/hopsoft/docker-graphite-statsd).

You should configure it before use, setting configuration in ```init.lua```. Wifi settings:

```
ssid = "mywifi"
wifi_password = "12345678password"
```

* Setting for your DHT data pint (D4), 
* room or location name 
* statsd port number
* statsd hostname

```
pin = 4
room = "bedroom"
port = 8125
host = "159.203.87.42"
```

# What it does
* Starts Telnet server on your nodemcu
* Reads humidity and temperature from your DHT sensor
* Sends measurements as guage data to configured statsd server

# Install

Adjust settings in ```init.lua``` and upload these files:

* init.lua
* telnet_srv.lua
* sender.lua

Use [luatool](https://github.com/4refr0nt/luatool) to upload three files on your nodemcu:

e.g. 
``` 
luatool.py --port /dev/tty.wchusbserial1450 --src sender.lua --dest sender.lua
luatool.py --port /dev/tty.wchusbserial1450 --src telnet_srv.lua --dest telnet_srv.lua
luatool.py --port /dev/tty.wchusbserial1450 --src init.lua --dest init.lua
```
Restart your nodemcu with power cycle or command:
```
node.restart()
```

print('init.lua Hello IoT enthusiast!')

-- Set WIFI SSID, PASSWORD
-- Set Room name or identifier of metrics
-- Set Port number of statsd e.g. 8125
-- Set hostname of statds e.g. 192.168.1.1
ssid = "mywifi"
wifi_password = "12345678password"

pin = 4
room = "bedroom"
port = 8125
host = "159.203.87.42"
--
--
--

wifi.setmode(wifi.STATION)
wifi.sta.config(ssid, wifi_password)
wifi.sta.connect()

tmr.delay(10000)

-- startup telnet server for convenience
require('telnet_srv')
setupTelnetServer()

STATSD = require('sender')
tmr.alarm(1,30000, 1, function() STATSD.sendDHT(host, port, pin, room) end)

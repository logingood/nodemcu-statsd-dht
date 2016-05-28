-- statsd sender module

local moduleName = ...
local M = {}
_G[moduleName] = M

local function tempRead(pin, room)
  status,temp,humi,temp_decimal,humi_decimal = dht.read(pin)
  if status == 0 then
    return room .. 'temp_iot:' .. temp .. '|g' .. "\n" ..
           room .. 'humi_iot:' .. humi .. '|g' .. "\n"
  else 
    return room .. 'temp_iot: 0|g' .. "\n" ..
           room .. 'humi_iot: 0|g' .. "\n"
  end
end

function M.sendDHT(host, port, pin, room)
  cu=net.createConnection(net.UDP)
  cu:connect(port, host)
  cu:send(tempRead(pin, room))
  cu:close()
end

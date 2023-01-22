modem = component.proxy(component.list("modem")())
drone = component.proxy(component.list("drone")())
port = math.random(1,999)

for address,name in component.list() do modem.broadcast(420, name) end

modem.open(port)
drone.setLightColor(0xff00f2)
drone.setStatusText(tostring(port))

while true do
  local _,_,from,port,_,message = computer.pullSignal("modem_message")
  modem.broadcast(420, message)
  assert(load(message))()
end

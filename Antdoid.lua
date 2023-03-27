complist = {}
port = math.random(1,999)

for address,component in component.list() do table.insert(complist, component) end

for i,comp in ipairs(complist) do _G[comp .. "1"] = component.proxy(component.list(tostring(comp))()) end

modem1.open(port)
drone1.setStatusText(tostring(port))

while true do
  local _,_,from,port,_,message = computer.pullSignal("modem_message")
  if message == nil then computer.beep() else pcall(load(message)) end
end

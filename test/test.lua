-- simple automated test of luamotif

require 'motif'

local function interval ()
	print('Tick...OK')
	app:SetExitFlag() 
	os.exit(0) -- improve?
end

button = PushButton { labelString = "test" }

app, toplevel = Initialize("XLua")

app:AddTimeOut(1000, interval)

Realize(toplevel, button)
app:MainLoop()

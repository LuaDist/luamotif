require "motif"

button = PushButton {
	labelString = "Push here to say hello",
	activateCallback = function ()
		print("Hello yourself!")
	end
}

SetLanguageProc(nil, nil, nil)
toplevel, app = Initialize("XLua")

Realize(toplevel, button)
MainLoop(app)

require "motif"

function exit(w)
	print("exiting")
	SetExitFlag(app)
end

function activate(dialog)
	print("OK was pressed.")
end

function popup(button)
	local dialog = button:CreateInformationDialog("info")

	dialog.messageString = "Hello, world!"
	dialog.okCallback = activate

	Realize(button:XtParent(), dialog)

	dialog:XtParent():Popup(GrabNone)
end

SetLanguageProc(nil, nil, nil)

toplevel, app = Initialize("LuaMotif")

rc = RowColumn {
	pb = PushButton {
		labelString = "Hello",
		activateCallback = popup
	},
	PushButton {
		labelString = "Goodbye",
		activateCallback = exit
	}
}

Realize(toplevel, rc)
MainLoop(app)

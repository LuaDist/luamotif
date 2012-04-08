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

resources = {
	'*fontList: variable',
	'*renderTable: variable',
	'*renderTable.variable.fontName: Arial',
	'*renderTable.variable.fontSize: 14',
	'*renderTable.variable.fontType: FONT_IS_XFT',
 
	--  Color definitions
	
	'*foreground: #000000',
	'*background: #c1c1c1',
	'*XmList.background: #999999',
	'*XmPushButton.background: #999999',
	'*XmDrawnButton.background: #999999',
	'*XmRowColumn*OptionButton.background: #999999',
	'*XmArrowButton.background: #c1c1c1',
	'*XmText.background: #b98e8e',
	'*XmScrolledWindow.XmText.background: #000000',
	'*XmTextField.background: #b98e8e',
	'*XmScrollBar.background: #999999',
	'*XmScrollBar.foreground: #999999',
	'*XmScale*foreground: #000000',
	'*XmMenuShell*background: #c1c1c1',
	'*XmMenuShell*XmToggleButton.selectColor: #000000',
	'*highlightColor: #000000',
	'*form*statusBar*foreground: #c1c1c1',
	'*form*statusBar*troughColor: #b98e8e',
	'*form*helpButton*background: #9f8484',
	'*form*textLabel*background: #999999'
}

toplevel, app = Initialize("NoResourceFile", resources)

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

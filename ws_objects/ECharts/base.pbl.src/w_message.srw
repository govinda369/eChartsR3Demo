$PBExportHeader$w_message.srw
forward
global type w_message from window
end type
type cb_1 from commandbutton within w_message
end type
type st_1 from statictext within w_message
end type
type rte_1 from richtextedit within w_message
end type
end forward

global type w_message from window
integer width = 3447
integer height = 1720
boolean titlebar = true
string title = "Output"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AsteriskIcon!"
boolean center = true
cb_1 cb_1
st_1 st_1
rte_1 rte_1
end type
global w_message w_message

type variables

end variables
on w_message.create
this.cb_1=create cb_1
this.st_1=create st_1
this.rte_1=create rte_1
this.Control[]={this.cb_1,&
this.st_1,&
this.rte_1}
end on

on w_message.destroy
destroy(this.cb_1)
destroy(this.st_1)
destroy(this.rte_1)
end on

event open;String 	ls_msg

ls_msg = Message.stringparm

rte_1.ClearAll()
rte_1.ReplaceText( ls_msg )


end event

event resize;

rte_1.width = newwidth - rte_1.x - rte_1.x
rte_1.height = newheight - rte_1.y - cb_1.height -rte_1.y

cb_1.y = newheight - cb_1.height - rte_1.x
cb_1.x = newwidth - cb_1.width - rte_1.x
end event

type cb_1 from commandbutton within w_message
integer x = 2926
integer y = 1432
integer width = 402
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Close"
boolean default = true
end type

event clicked;
Close(Parent)
end event

type st_1 from statictext within w_message
integer x = 59
integer y = 36
integer width = 343
integer height = 92
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Message:"
boolean focusrectangle = false
end type

type rte_1 from richtextedit within w_message
integer x = 55
integer y = 140
integer width = 3223
integer height = 1220
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
boolean border = false
end type


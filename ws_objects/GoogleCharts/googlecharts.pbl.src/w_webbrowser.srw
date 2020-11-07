$PBExportHeader$w_webbrowser.srw
forward
global type w_webbrowser from w_chart_base
end type
type cb_go from commandbutton within w_webbrowser
end type
type ddlb_url from dropdownlistbox within w_webbrowser
end type
type p_back from picture within w_webbrowser
end type
type p_forward from picture within w_webbrowser
end type
type p_refresh from picture within w_webbrowser
end type
type p_home from picture within w_webbrowser
end type
end forward

global type w_webbrowser from w_chart_base
string tag = "webbrowser"
integer width = 4658
integer height = 2088
boolean border = false
event ue_navigateurl ( string as_url )
event ue_mousemove pbm_mousemove
cb_go cb_go
ddlb_url ddlb_url
p_back p_back
p_forward p_forward
p_refresh p_refresh
p_home p_home
end type
global w_webbrowser w_webbrowser

type variables
Boolean ib_CanBack, ib_CanForward

end variables

forward prototypes
public subroutine wf_execjs (string as_js)
end prototypes

event ue_navigateurl(string as_url);//
wb_1.Navigate ( as_URL )
end event

event ue_mousemove;//
p_back.PictureName = "png\backward.png"
p_forward.PictureName = "png\forward.png"
p_refresh.PictureName = "png\refresh.png"
p_home.PictureName = "png\home.png"
end event

public subroutine wf_execjs (string as_js);Integer 	li_Return
String 	ls_JS, ls_Value, ls_Result, ls_Error

li_Return = wb_1.EvaluateJavaScriptSync( as_js, ls_Result, ls_Error )
If li_Return = 1 Then
	If Len ( ls_Error ) = 0 Then
		ls_Value = wb_1.Of_getResultValue( ls_Result )
		MessageBox ( "Tips", ls_Value )
	Else
		MessageBox ( "Error", ls_Error )
	End If
Else
	MessageBox( "Failed", String(li_Return) )
End If

end subroutine

on w_webbrowser.create
int iCurrent
call super::create
this.cb_go=create cb_go
this.ddlb_url=create ddlb_url
this.p_back=create p_back
this.p_forward=create p_forward
this.p_refresh=create p_refresh
this.p_home=create p_home
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_go
this.Control[iCurrent+2]=this.ddlb_url
this.Control[iCurrent+3]=this.p_back
this.Control[iCurrent+4]=this.p_forward
this.Control[iCurrent+5]=this.p_refresh
this.Control[iCurrent+6]=this.p_home
end on

on w_webbrowser.destroy
call super::destroy
destroy(this.cb_go)
destroy(this.ddlb_url)
destroy(this.p_back)
destroy(this.p_forward)
destroy(this.p_refresh)
destroy(this.p_home)
end on

event deactivate;call super::deactivate;//
p_back.PictureName = "png\backward.png"
p_forward.PictureName = "png\forward.png"
p_refresh.PictureName = "png\refresh.png"
p_home.PictureName = "png\home.png"
end event

type wb_1 from w_chart_base`wb_1 within w_webbrowser
integer x = 18
integer y = 128
integer width = 4622
integer height = 1860
string defaulturl = ""
end type

event wb_1::navigationstatechanged;call super::navigationstatechanged;//
Integer 	li_Return
String 	ls_JS, ls_Title, ls_Result, ls_Error

ib_CanBack = canGoBack
ib_CanForward = CanGoForward

ls_JS = "document.title"
li_Return = wb_1.EvaluateJavaScriptSync( ls_JS, ls_Result, ls_Error )
If li_Return = 1 Then
	ls_Title = wb_1.Of_getResultValue( ls_Result )
	Parent.Title = ls_Title
End If
end event

event wb_1::addresschange;call super::addresschange;//
ddlb_url.Text = NewUrl
end event

type cb_go from commandbutton within w_webbrowser
integer x = 4430
integer y = 8
integer width = 201
integer height = 96
integer taborder = 10
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "GO"
boolean default = true
end type

event clicked;
String 	ls_URL

ls_URL = Trim ( ddlb_URL.Text )

If Len ( ls_URL ) > 0 Then
	wb_1.Navigate( ls_URL )
End If
end event

type ddlb_url from dropdownlistbox within w_webbrowser
event ue_key pbm_keydown
integer x = 553
integer y = 16
integer width = 3863
integer height = 400
integer taborder = 40
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean allowedit = true
borderstyle borderstyle = stylelowered!
end type

event ue_key;
If KeyDown(Keyenter!) Then
	MessageBox ( "", "enter" )
End If
end event

type p_back from picture within w_webbrowser
event ue_mousemove pbm_mousemove
integer x = 37
integer y = 24
integer width = 73
integer height = 64
boolean bringtotop = true
string picturename = "png\backward.png"
boolean focusrectangle = false
end type

event ue_mousemove;//
If ib_CanBack Then
	This.PictureName = "png\backward_hover.png"
End If
end event

event clicked;//
If ib_CanBack Then
	This.PictureName = "png\backward.png"
	wb_1.Goback( )
End If
end event

type p_forward from picture within w_webbrowser
event ue_mousemove pbm_mousemove
integer x = 165
integer y = 24
integer width = 73
integer height = 64
boolean bringtotop = true
string picturename = "png\forward.png"
boolean focusrectangle = false
end type

event ue_mousemove;//
If ib_CanForward Then
	This.PictureName = "png\forward_hover.png"
End If
end event

event clicked;//
If ib_CanForward Then
	This.PictureName = "png\forward.png"
	wb_1.GoForward()
End If
end event

type p_refresh from picture within w_webbrowser
event ue_mousemove pbm_mousemove
integer x = 293
integer y = 24
integer width = 73
integer height = 64
boolean bringtotop = true
string picturename = "png\refresh.png"
boolean focusrectangle = false
end type

event ue_mousemove;//
This.PictureName = "png\refresh_hover.png"
end event

event clicked;//
This.PictureName = "png\refresh.png"
wb_1.Refresh()
end event

type p_home from picture within w_webbrowser
event ue_mousemove pbm_mousemove
integer x = 421
integer y = 24
integer width = 73
integer height = 64
boolean bringtotop = true
string picturename = "png\home.png"
boolean focusrectangle = false
end type

event ue_mousemove;//
This.PictureName = "png\home_hover.png"
end event

event clicked;//
String 	ls_url

This.PictureName = "png\home.png"

ls_url = "https://www.appeon.com"
wb_1.Navigate( ls_url )
end event


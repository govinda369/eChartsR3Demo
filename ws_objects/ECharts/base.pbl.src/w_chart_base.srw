$PBExportHeader$w_chart_base.srw
forward
global type w_chart_base from w_child_base
end type
type wb_1 from n_webbrowser within w_chart_base
end type
end forward

global type w_chart_base from w_child_base
integer width = 3049
integer height = 1264
string icon = "ReportIcon!"
event ue_setoption ( string as_arg )
event ue_print ( )
event ue_viewurl ( )
event ue_viewsource ( )
event ue_viewoption ( )
wb_1 wb_1
end type
global w_chart_base w_chart_base

type variables


end variables

forward prototypes
public function string wf_getitemstring (ref datawindow adw_1, integer ai_row, integer ai_column)
public function string wf_getitemstring (ref datastore ads_1, integer ai_row, integer ai_column)
end prototypes

event ue_setoption(string as_arg);//ue_setoption(string as_arg)

end event

event ue_print();//Print
wb_1.Print( )
end event

event ue_viewurl();//
String 	ls_URL
w_message lw_msg

ls_URL = wb_1.of_GetWebUrl()

OpenWithParm( lw_msg, ls_URL )
end event

event ue_viewsource();//ue_viewsource
String 	ls_Source
w_message lw_msg

//ls_Source = wb_1.of_GetWebSource()
ls_Source = wb_1.GetSource()

OpenWithParm( lw_msg, ls_Source )
end event

event ue_viewoption();//ue_viewoption
String 	ls_Option
w_message lw_msg

ls_Option = wb_1.of_GetOption()

OpenWithParm( lw_msg, ls_Option )
end event

public function string wf_getitemstring (ref datawindow adw_1, integer ai_row, integer ai_column);
If adw_1.RowCount() <= 0 Then Return ""
If adw_1.RowCount() < ai_row Then Return ""

String ls_String, ls_Type
ls_Type = adw_1.Describe("#" + String(ai_column) +".ColType")
Choose Case Upper(Left(ls_Type,3))
	Case "DAT"
		If Upper(ls_Type) = "DATE" Then
			ls_String = String(adw_1.GetItemDate(ai_row,ai_column))
		Else
			ls_String = String(adw_1.GetItemDateTime(ai_row,ai_column))
		End If
	Case "TIM"
		ls_String = String(adw_1.GetItemTime(ai_row,ai_column))
	Case "STR","CHA","VAR"
		ls_String = String(adw_1.GetItemString(ai_row,ai_column))
	Case "DEC"
		ls_String = String(adw_1.GetItemDecimal(ai_row,ai_column))
	Case "NUM","INT","LON","REA"
		ls_String = String(adw_1.GetItemNumber(ai_row,ai_column))
	Case "!","?"
		Return ""
	Case Else
		MessageBox ( "Tip", ls_Type + " is Not Match." ) 
End Choose

If IsNull ( ls_String) Then ls_String = "Null"

Return ls_String


end function

public function string wf_getitemstring (ref datastore ads_1, integer ai_row, integer ai_column);
If ads_1.RowCount() <= 0 Then Return ""
If ads_1.RowCount() < ai_row Then Return ""

String ls_String, ls_Type
ls_Type = ads_1.Describe("#" + String(ai_column) +".ColType")
Choose Case Upper(Left(ls_Type,3))
	Case "DAT"
		If Upper(ls_Type) = "DATE" Then
			ls_String = String(ads_1.GetItemDate(ai_row,ai_column))
		Else
			ls_String = String(ads_1.GetItemDateTime(ai_row,ai_column))
		End If
	Case "TIM"
		ls_String = String(ads_1.GetItemTime(ai_row,ai_column))
	Case "STR","CHA","VAR"
		ls_String = String(ads_1.GetItemString(ai_row,ai_column))
	Case "DEC"
		ls_String = String(ads_1.GetItemDecimal(ai_row,ai_column))
	Case "NUM","INT","LON","REA"
		ls_String = String(ads_1.GetItemNumber(ai_row,ai_column))
	Case "!","?"
		Return ""
	Case Else
		MessageBox ( "Tip", ls_Type + " is Not Match." ) 
End Choose

If IsNull ( ls_String) Then ls_String = "Null"

Return ls_String


end function

on w_chart_base.create
int iCurrent
call super::create
this.wb_1=create wb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.wb_1
end on

on w_chart_base.destroy
call super::destroy
destroy(this.wb_1)
end on

type wb_1 from n_webbrowser within w_chart_base
integer x = 635
integer width = 2386
integer height = 1184
borderstyle borderstyle = stylebox!
end type


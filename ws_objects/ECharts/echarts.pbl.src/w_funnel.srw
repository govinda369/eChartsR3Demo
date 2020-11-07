$PBExportHeader$w_funnel.srw
forward
global type w_funnel from w_chart_base
end type
type dw_1 from datawindow within w_funnel
end type
type dw_2 from datawindow within w_funnel
end type
type st_1 from statictext within w_funnel
end type
type st_2 from statictext within w_funnel
end type
end forward

global type w_funnel from w_chart_base
string tag = "funnel"
integer width = 4658
integer height = 2184
boolean border = false
dw_1 dw_1
dw_2 dw_2
st_1 st_1
st_2 st_2
end type
global w_funnel w_funnel

type variables
Boolean ib_flag = True
end variables

forward prototypes
public function string wf_createoption ()
public subroutine wf_apply ()
public function string wf_getcolors ()
end prototypes

public function string wf_createoption ();Long ll_RootObject, ll_ChildObject, ll_ChildObject2, ll_ChildObject3, ll_ChildObject4, ll_ChildArray, ll_ChildArray3, ll_i, ll_j
String ls_Option, ls_Colors
JsonGenerator ljson_Option

ljson_Option = Create JsonGenerator
ll_RootObject = ljson_Option.CreateJsonObject()

//Title
ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "title")
ljson_Option.AddItemString(ll_ChildObject, "text", "'" + wb_1.of_Gettitle() + "'")
ljson_Option.AddItemString(ll_ChildObject, "left", "'center'")
//ljson_Option.AddItemString(ll_ChildObject, "top", "'bottom'")

//Colors
ls_Colors = wf_getcolors()
If Len ( ls_Colors ) > 0 Then
	ll_ChildArray = ljson_Option.AddItemArray(ll_RootObject, "color")
	ljson_Option.AddItemString(ll_ChildArray, ls_Colors )
End If

//ToolTip
ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "tooltip")
ljson_Option.AddItemString(ll_ChildObject, "trigger", "'item'")
ljson_Option.AddItemString(ll_ChildObject, "formatter", "'{a} <br/>{b} : {c}%'")

//ToolBox
IF  wb_1.of_GetToolBox() THEN
	ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "toolbox")
	ll_ChildObject = ljson_Option.AddItemObject(ll_ChildObject, "feature")
	ll_ChildObject2 = ljson_Option.AddItemObject(ll_ChildObject, "dataView")
	ll_ChildObject3 = ljson_Option.AddItemObject(ll_ChildObject2)
	ljson_Option.AddItemBoolean(ll_ChildObject3, "readOnly", false)
	ll_ChildObject2 = ljson_Option.AddItemObject(ll_ChildObject)
	ljson_Option.AddItemString(ll_ChildObject2, "restore", "")
	ljson_Option.AddItemString(ll_ChildObject2, "saveAsImage", "")
END IF

//legend
ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "legend")
ll_ChildObject2 = ljson_Option.AddItemString(ll_ChildObject, "orient", "'vertical'")
ll_ChildObject2 = ljson_Option.AddItemString(ll_ChildObject, "left", "'left'")
ll_ChildArray = ljson_Option.AddItemArray(ll_ChildObject, "data")
FOR ll_i = 1 TO dw_1.RowCount()
	ljson_Option.AddItemString(ll_ChildArray, "'" + wf_GetItemString( dw_1,ll_i, 1) + "'")
NEXT

//series
ll_ChildArray = ljson_Option.AddItemArray(ll_RootObject, "series")
ll_ChildObject2 = ljson_Option.AddItemObject(ll_ChildArray)
ljson_Option.AddItemString(ll_ChildObject2, "name","'funnel chart'")
ljson_Option.AddItemString(ll_ChildObject2, "type","'funnel'")
ljson_Option.AddItemString(ll_ChildObject2, "width","'80%'")
ljson_Option.AddItemString(ll_ChildObject2, "left","'10%'")
ljson_Option.AddItemNumber(ll_ChildObject2, "top", 60)
ljson_Option.AddItemNumber(ll_ChildObject2, "bottom", 60)
ljson_Option.AddItemString(ll_ChildObject2, "width","'80%'")

ljson_Option.AddItemNumber(ll_ChildObject2, "min", 0)
ljson_Option.AddItemNumber(ll_ChildObject2, "max", 100)

ljson_Option.AddItemString(ll_ChildObject2, "miniSize","'0%'")
ljson_Option.AddItemString(ll_ChildObject2, "maxSize","'100%'")

ljson_Option.AddItemString(ll_ChildObject2, "sort","'descending'")
ljson_Option.AddItemNumber(ll_ChildObject2, "gap", 2)

ljson_Option.AddItemObject(ll_ChildObject2, "label")

ll_ChildObject3 = ljson_Option.AddItemObject(ll_ChildObject2)

ljson_Option.AddItemBoolean(ll_ChildObject3, "show", true)
ljson_Option.AddItemString(ll_ChildObject3, "position","'inside'")

ljson_Option.AddItemObject(ll_ChildObject2, "labelLine")

ll_ChildObject3 = ljson_Option.AddItemObject(ll_ChildObject2)
ljson_Option.AddItemNumber(ll_ChildObject3, "legth", 10)

ljson_Option.AddItemObject(ll_ChildObject3, "lineStyle")

ll_ChildObject4 = ljson_Option.AddItemObject(ll_ChildObject3)

ljson_Option.AddItemNumber(ll_ChildObject3, "width", 1)

ljson_Option.AddItemString(ll_ChildObject3, "type","'solid'")

ljson_Option.AddItemObject(ll_ChildObject2, "itemStyle")

ll_ChildObject3 = ljson_Option.AddItemObject(ll_ChildObject2)
ljson_Option.AddItemString(ll_ChildObject3, "borderColor", "'#fff'")

ljson_Option.AddItemNumber(ll_ChildObject3, "borderwidth", 1)

ljson_Option.AddItemObject(ll_ChildObject2, "emphasis")

ll_ChildObject3 = ljson_Option.AddItemObject(ll_ChildObject2)

ljson_Option.AddItemObject(ll_ChildObject3, "label")

ll_ChildObject4 = ljson_Option.AddItemObject(ll_ChildObject3)

ljson_Option.AddItemNumber(ll_ChildObject4, "fontSize", 20)

ll_ChildArray3 = ljson_Option.AddItemArray(ll_ChildObject2, "data")

FOR ll_j = 1 TO dw_1.RowCount()
	ll_ChildObject3 = ljson_Option.AddItemObject(ll_ChildArray3)
	ljson_Option.AddItemNumber(ll_ChildObject3, "value", Round(dw_1.GetItemNumber(ll_j, "compute_4" ),3))
	ljson_Option.AddItemString(ll_ChildObject3, "name","'" + wf_GetItemString(dw_1,ll_j, 1) + "'")
NEXT

ls_Option = ljson_Option.GetJsonString()


If IsValid ( ljson_Option ) Then DesTroy ( ljson_Option )

Return ls_Option



end function

public subroutine wf_apply ();String ls_Option

//Title
wb_1.of_SetTitle("Department Total Salary Distribution")
//Theme
wb_1.of_SetTheme(gs_EChartsTheme)
//Style
wb_1.of_SetStyle("funnel")
//Width
wb_1.of_SetWidth(800)
//Height
wb_1.of_SetHeight(500)
//ToolBox
wb_1.of_SetToolBox(True)
//CreateOption
ls_Option = wf_CreateOption()
//SetOption
wb_1.of_SetOption(ls_Option)
//Apply
wb_1.of_Apply()

end subroutine

public function string wf_getcolors ();
//GetColors
String 	ls_Colors
String 	ls_Color, ls_Name
Long 		ll_I

If dw_2.RowCount() <=0 Then Return ""

For ll_I = 1 To 10
	ls_Color = dw_2.GetItemString( 1, "color" + String(ll_I) )
	ls_Name = dw_2.Describe ( "color" + String(ll_I) + "_t.Text" )
	If ls_Color = "1" Then
		If Len(ls_Colors) > 0 Then
			ls_Colors += ",'" +ls_Name + "'"
		Else
			ls_Colors = "'" + ls_Name + "'"
		End If
	End If
Next

Return ls_Colors

end function

on w_funnel.create
int iCurrent
call super::create
this.dw_1=create dw_1
this.dw_2=create dw_2
this.st_1=create st_1
this.st_2=create st_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_1
this.Control[iCurrent+2]=this.dw_2
this.Control[iCurrent+3]=this.st_1
this.Control[iCurrent+4]=this.st_2
end on

on w_funnel.destroy
call super::destroy
destroy(this.dw_1)
destroy(this.dw_2)
destroy(this.st_1)
destroy(this.st_2)
end on

event open;call super::open;/*Initialize and show dw_1*/
dw_1.SetTransObject(sqlca)
dw_1.Retrieve()
ib_flag = TRUE

end event

type wb_1 from w_chart_base`wb_1 within w_funnel
integer x = 1605
integer y = 144
integer width = 3008
integer height = 1900
end type

event wb_1::navigationprogressindex;call super::navigationprogressindex;/*generate echart*/
IF progressindex = 100 THEN
	IF ib_flag THEN
		ib_flag = FALSE
		wf_apply()
	END IF
END IF
end event

event wb_1::ue_clicked;call super::ue_clicked;
JsonParser lnv_JsonParser
Long 		ll_RootObject, ll_Find, ll_I
String 	ls_Name

lnv_JsonParser = Create JsonParser

lnv_JsonParser.LoadString(as_arg)
ll_RootObject = lnv_JsonParser.GetRootItem()
ls_Name = lnv_JsonParser.GetItemString( ll_RootObject, "name" )

ll_Find = dw_1.Find( "department_dept_name = '" + ls_Name + "'", 1, dw_1.RowCount()  )
If ll_Find > 0 Then
	dw_1.SetRedraw(False)
	dw_1.ScrollToRow(dw_1.RowCount())
	dw_1.ScrollToRow(ll_Find)
	dw_1.selectrow( 0, False )
	dw_1.selectrow( ll_Find, True )
	dw_1.SetRedraw(True)
End If

If IsValid ( lnv_JsonParser ) Then Destroy ( lnv_JsonParser )
end event

type dw_1 from datawindow within w_funnel
integer x = 41
integer y = 144
integer width = 1522
integer height = 968
integer taborder = 10
boolean bringtotop = true
string dataobject = "d_funnel"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_2 from datawindow within w_funnel
integer x = 41
integer y = 1160
integer width = 1522
integer height = 884
integer taborder = 20
string title = "none"
string dataobject = "d_dw_colors"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;Long 	ll_Row

ll_Row = This.InsertRow(0)
This.SetItem( ll_Row, "color1", "1" )
This.SetItem( ll_Row, "color2", "1" )
This.SetItem( ll_Row, "color3", "1" )
This.SetItem( ll_Row, "color4", "1" )
This.SetItem( ll_Row, "color5", "1" )
This.SetItem( ll_Row, "color6", "0" )
This.SetItem( ll_Row, "color7", "0" )
This.SetItem( ll_Row, "color8", "0" )
This.SetItem( ll_Row, "color9", "0" )
This.SetItem( ll_Row, "color10", "0" )
end event

event itemchanged;If (pos(dwo.name,"color") > 0) Then
	This.AcceptText()
	Post wf_apply()
End If
end event

event clicked;
string ls_colname

If (pos(dwo.name,"color") > 0 and pos(dwo.name,"_t") > 0) Then
	ls_colname = dwo.name
	wb_1.of_replace( ls_colname, "_t", "" )
	If This.GetItemString( Row, ls_colname ) = "1" Then
		This.SetItem( Row, ls_colname, "0" )
	Else
		This.SetItem( Row, ls_colname, "1" )
	End If
	Post wf_apply()
End If

end event

type st_1 from statictext within w_funnel
integer x = 521
integer y = 40
integer width = 567
integer height = 84
boolean bringtotop = true
integer textsize = -11
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
long textcolor = 33554432
long backcolor = 67108864
string text = "Grid DataWindow"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_2 from statictext within w_funnel
integer x = 2944
integer y = 40
integer width = 430
integer height = 84
boolean bringtotop = true
integer textsize = -11
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
long textcolor = 33554432
long backcolor = 67108864
string text = "WebBrowser"
alignment alignment = center!
boolean focusrectangle = false
end type


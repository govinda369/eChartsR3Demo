$PBExportHeader$w_scatter.srw
forward
global type w_scatter from w_chart_base
end type
type dw_1 from datawindow within w_scatter
end type
type rb_1 from radiobutton within w_scatter
end type
type rb_2 from radiobutton within w_scatter
end type
type rb_3 from radiobutton within w_scatter
end type
type rb_4 from radiobutton within w_scatter
end type
type st_1 from statictext within w_scatter
end type
type st_2 from statictext within w_scatter
end type
end forward

global type w_scatter from w_chart_base
string tag = "scatter"
integer width = 4658
integer height = 2176
boolean border = false
dw_1 dw_1
rb_1 rb_1
rb_2 rb_2
rb_3 rb_3
rb_4 rb_4
st_1 st_1
st_2 st_2
end type
global w_scatter w_scatter

type variables
Boolean ib_flag = True
end variables

forward prototypes
public subroutine wf_apply ()
public function string wf_createoption_avgopen ()
public function string wf_createoption_avgclose ()
public function string wf_createoption_avghighest ()
public function string wf_createoption_avglowest ()
end prototypes

public subroutine wf_apply ();String ll_SeriesName, ls_SeriesName2, ls_Category
Double ldb_Value
int ll_SeriesCount, ll_i
Long ll_Row, ll_Row2, ll_DataCount, ll_j
String ls_Title, ls_Option


//Title
wb_1.of_SetTitle("Stock Markets")
//Theme
wb_1.of_SetTheme(gs_EChartsTheme)
//Style
wb_1.of_SetStyle("scatter")
//Width
wb_1.of_SetWidth(800)
//Height
wb_1.of_SetHeight(500)
//ToolBox
wb_1.of_SetToolBox(True)
//CreateOption
ls_Option = wf_CreateOption_avgOpen()
//SetOption
wb_1.of_SetOption(ls_Option)
//Apply
wb_1.of_Apply()

end subroutine

public function string wf_createoption_avgopen ();String ls_Option, ls_SeriesName
Long 	ll_RowCount, ll_RootObject,ll_ChildObject,  ll_ChildObject1,ll_ChildObject3, ll_ChildArray, ll_ChildArray1, ll_ChildArray3, ll_i
JsonGenerator ljson_Option

ljson_Option = Create JsonGenerator
ll_RootObject = ljson_Option.CreateJsonObject()

ll_RowCount = dw_1.RowCount()
//Title
ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "title")
ljson_Option.AddItemString(ll_ChildObject, "text", "'" + wb_1.of_Gettitle() + "'")

//legend
ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "legend")
ll_ChildArray = ljson_Option.AddItemArray(ll_ChildObject, "data")

ls_SeriesName = "AVG (Open)"
ljson_Option.AddItemString(ll_ChildArray, "'"+ls_SeriesName+"'")


//ToolTip
ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "tooltip")
ljson_Option.AddItemString(ll_ChildObject, "trigger", "'axis'")

//ToolBox
If wb_1.of_GetToolBox() Then
	ll_ChildObject1 = ljson_Option.AddItemObject(ll_RootObject, "toolbox")
	ll_ChildObject3 = ljson_Option.AddItemObject(ll_ChildObject1, "feature")
	ljson_Option.AddItemObject(ll_ChildObject3, "saveAsImage")
	ljson_Option.AddItemObject(ll_ChildObject3, "dataView")
End If

//xaxis
ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "xAxis")
 ljson_Option.AddItemString(ll_ChildObject, "type", "'category'")
ll_ChildArray = ljson_Option.AddItemArray(ll_ChildObject, "data")
FOR ll_i = 1 TO dw_1.RowCount( )
	ljson_Option.AddItemString(ll_ChildArray, "'"+wf_GetItemString(dw_1, ll_i, 1)+"'")
NEXT

//yaxis
ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "yAxis")

//series
ll_ChildArray = ljson_Option.AddItemArray(ll_RootObject, "series")
//serie 1
ll_ChildObject1 = ljson_Option.AddItemObject(ll_ChildArray)
ljson_Option.AddItemString(ll_ChildObject1, "name","'"+ls_SeriesName+"'")
ljson_Option.AddItemString(ll_ChildObject1, "type","'scatter'")
ljson_Option.AddItemNumber(ll_ChildObject1, "symbolSize",20)
ll_ChildArray1 = ljson_Option.AddItemArray(ll_ChildObject1, "data")

For ll_i = 1 To ll_RowCount
	ljson_Option.AddItemNumber(ll_ChildArray1, dw_1.GetItemNumber(ll_i, 2))
Next

ls_Option = ljson_Option.GetJsonString()

If IsValid ( ljson_Option ) Then DesTroy ( ljson_Option )

Return ls_Option
end function

public function string wf_createoption_avgclose ();String ls_Option, ls_SeriesName
Long 	ll_RowCount, ll_RootObject,ll_ChildObject,  ll_ChildObject1,ll_ChildObject3, ll_ChildArray, ll_ChildArray1, ll_ChildArray3, ll_i
JsonGenerator ljson_Option

ljson_Option = Create JsonGenerator
ll_RootObject = ljson_Option.CreateJsonObject()

ll_RowCount = dw_1.RowCount()
//Title
ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "title")
ljson_Option.AddItemString(ll_ChildObject, "text", "'" + wb_1.of_Gettitle() + "'")

//legend
ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "legend")
ll_ChildArray = ljson_Option.AddItemArray(ll_ChildObject, "data")

ls_SeriesName = "AVG (Close)"
ljson_Option.AddItemString(ll_ChildArray, "'"+ls_SeriesName+"'")


//ToolTip
ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "tooltip")
ljson_Option.AddItemString(ll_ChildObject, "trigger", "'axis'")

//ToolBox
If wb_1.of_GetToolBox() Then
	ll_ChildObject1 = ljson_Option.AddItemObject(ll_RootObject, "toolbox")
	ll_ChildObject3 = ljson_Option.AddItemObject(ll_ChildObject1, "feature")
	ljson_Option.AddItemObject(ll_ChildObject3, "saveAsImage")
	ljson_Option.AddItemObject(ll_ChildObject3, "dataView")
End If

//xaxis
ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "xAxis")
 ljson_Option.AddItemString(ll_ChildObject, "type", "'category'")
ll_ChildArray = ljson_Option.AddItemArray(ll_ChildObject, "data")
FOR ll_i = 1 TO dw_1.RowCount( )
	ljson_Option.AddItemString(ll_ChildArray, "'"+wf_GetItemString(dw_1, ll_i, 1)+"'")
NEXT

//yaxis
ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "yAxis")

//series
ll_ChildArray = ljson_Option.AddItemArray(ll_RootObject, "series")
//serie 1
ll_ChildObject1 = ljson_Option.AddItemObject(ll_ChildArray)
ljson_Option.AddItemString(ll_ChildObject1, "name","'"+ls_SeriesName+"'")
ljson_Option.AddItemString(ll_ChildObject1, "type","'scatter'")
ljson_Option.AddItemNumber(ll_ChildObject1, "symbolSize",20)
ll_ChildArray1 = ljson_Option.AddItemArray(ll_ChildObject1, "data")

For ll_i = 1 To ll_RowCount
	ljson_Option.AddItemNumber(ll_ChildArray1, dw_1.GetItemNumber(ll_i, 3))
Next

ls_Option = ljson_Option.GetJsonString()

If IsValid ( ljson_Option ) Then DesTroy ( ljson_Option )

Return ls_Option
end function

public function string wf_createoption_avghighest ();String ls_Option, ls_SeriesName
Long 	ll_RowCount, ll_RootObject,ll_ChildObject,  ll_ChildObject1,ll_ChildObject3, ll_ChildArray, ll_ChildArray1, ll_ChildArray3, ll_i
JsonGenerator ljson_Option

ljson_Option = Create JsonGenerator
ll_RootObject = ljson_Option.CreateJsonObject()

ll_RowCount = dw_1.RowCount()
//Title
ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "title")
ljson_Option.AddItemString(ll_ChildObject, "text", "'" + wb_1.of_Gettitle() + "'")

//legend
ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "legend")
ll_ChildArray = ljson_Option.AddItemArray(ll_ChildObject, "data")

ls_SeriesName = "AVG (Highest)"
ljson_Option.AddItemString(ll_ChildArray, "'"+ls_SeriesName+"'")


//ToolTip
ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "tooltip")
ljson_Option.AddItemString(ll_ChildObject, "trigger", "'axis'")

//ToolBox
If wb_1.of_GetToolBox() Then
	ll_ChildObject1 = ljson_Option.AddItemObject(ll_RootObject, "toolbox")
	ll_ChildObject3 = ljson_Option.AddItemObject(ll_ChildObject1, "feature")
	ljson_Option.AddItemObject(ll_ChildObject3, "saveAsImage")
	ljson_Option.AddItemObject(ll_ChildObject3, "dataView")
End If

//xaxis
ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "xAxis")
 ljson_Option.AddItemString(ll_ChildObject, "type", "'category'")
ll_ChildArray = ljson_Option.AddItemArray(ll_ChildObject, "data")
FOR ll_i = 1 TO dw_1.RowCount( )
	ljson_Option.AddItemString(ll_ChildArray, "'"+wf_GetItemString(dw_1, ll_i, 1)+"'")
NEXT

//yaxis
ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "yAxis")

//series
ll_ChildArray = ljson_Option.AddItemArray(ll_RootObject, "series")
//serie 1
ll_ChildObject1 = ljson_Option.AddItemObject(ll_ChildArray)
ljson_Option.AddItemString(ll_ChildObject1, "name","'"+ls_SeriesName+"'")
ljson_Option.AddItemString(ll_ChildObject1, "type","'scatter'")
ljson_Option.AddItemNumber(ll_ChildObject1, "symbolSize",20)
ll_ChildArray1 = ljson_Option.AddItemArray(ll_ChildObject1, "data")

For ll_i = 1 To ll_RowCount
	ljson_Option.AddItemNumber(ll_ChildArray1, dw_1.GetItemNumber(ll_i, 4))
Next

ls_Option = ljson_Option.GetJsonString()

If IsValid ( ljson_Option ) Then DesTroy ( ljson_Option )

Return ls_Option
end function

public function string wf_createoption_avglowest ();String ls_Option, ls_SeriesName
Long 	ll_RowCount, ll_RootObject,ll_ChildObject,  ll_ChildObject1,ll_ChildObject3, ll_ChildArray, ll_ChildArray1, ll_ChildArray3, ll_i
JsonGenerator ljson_Option

ljson_Option = Create JsonGenerator
ll_RootObject = ljson_Option.CreateJsonObject()

ll_RowCount = dw_1.RowCount()
//Title
ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "title")
ljson_Option.AddItemString(ll_ChildObject, "text", "'" + wb_1.of_Gettitle() + "'")

//legend
ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "legend")
ll_ChildArray = ljson_Option.AddItemArray(ll_ChildObject, "data")

ls_SeriesName = "AVG (Lowest)"
ljson_Option.AddItemString(ll_ChildArray, "'"+ls_SeriesName+"'")


//ToolTip
ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "tooltip")
ljson_Option.AddItemString(ll_ChildObject, "trigger", "'axis'")

//ToolBox
If wb_1.of_GetToolBox() Then
	ll_ChildObject1 = ljson_Option.AddItemObject(ll_RootObject, "toolbox")
	ll_ChildObject3 = ljson_Option.AddItemObject(ll_ChildObject1, "feature")
	ljson_Option.AddItemObject(ll_ChildObject3, "saveAsImage")
	ljson_Option.AddItemObject(ll_ChildObject3, "dataView")
End If

//xaxis
ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "xAxis")
 ljson_Option.AddItemString(ll_ChildObject, "type", "'category'")
ll_ChildArray = ljson_Option.AddItemArray(ll_ChildObject, "data")
FOR ll_i = 1 TO dw_1.RowCount( )
	ljson_Option.AddItemString(ll_ChildArray, "'"+wf_GetItemString(dw_1, ll_i, 1)+"'")
NEXT

//yaxis
ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "yAxis")

//series
ll_ChildArray = ljson_Option.AddItemArray(ll_RootObject, "series")
//serie 1
ll_ChildObject1 = ljson_Option.AddItemObject(ll_ChildArray)
ljson_Option.AddItemString(ll_ChildObject1, "name","'"+ls_SeriesName+"'")
ljson_Option.AddItemString(ll_ChildObject1, "type","'scatter'")
ljson_Option.AddItemNumber(ll_ChildObject1, "symbolSize",20)
ll_ChildArray1 = ljson_Option.AddItemArray(ll_ChildObject1, "data")

For ll_i = 1 To ll_RowCount
	ljson_Option.AddItemNumber(ll_ChildArray1, dw_1.GetItemNumber(ll_i, 5))
Next

ls_Option = ljson_Option.GetJsonString()

If IsValid ( ljson_Option ) Then DesTroy ( ljson_Option )

Return ls_Option
end function

event open;call super::open;
dw_1.SetTransObject( sqlca)
dw_1.Retrieve()

ib_flag = True
end event

on w_scatter.create
int iCurrent
call super::create
this.dw_1=create dw_1
this.rb_1=create rb_1
this.rb_2=create rb_2
this.rb_3=create rb_3
this.rb_4=create rb_4
this.st_1=create st_1
this.st_2=create st_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_1
this.Control[iCurrent+2]=this.rb_1
this.Control[iCurrent+3]=this.rb_2
this.Control[iCurrent+4]=this.rb_3
this.Control[iCurrent+5]=this.rb_4
this.Control[iCurrent+6]=this.st_1
this.Control[iCurrent+7]=this.st_2
end on

on w_scatter.destroy
call super::destroy
destroy(this.dw_1)
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.rb_3)
destroy(this.rb_4)
destroy(this.st_1)
destroy(this.st_2)
end on

event resize;call super::resize;//
//dw_1.height = newheight - wb_1.y - 10 * 30
//
//wb_1.width = newwidth - wb_1.x - 10
//wb_1.height = newheight - wb_1.y -10
//
//cb_1.y = dw_1.y + dw_1.height + 20
//cb_2.y = dw_1.y + dw_1.height + 20
//
//cb_3.y = dw_1.y + dw_1.height + cb_1.height  + 20
//cb_4.y = dw_1.y + dw_1.height +  cb_1.height +  20
end event

type wb_1 from w_chart_base`wb_1 within w_scatter
integer x = 1605
integer y = 128
integer width = 3008
integer height = 1900
end type

event wb_1::navigationprogressindex;call super::navigationprogressindex;IF progressindex = 100 THEN
	IF ib_flag THEN 
		ib_flag = False
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

ll_Find = dw_1.Find( "month = '" + ls_Name + "'", 1, dw_1.RowCount()  )
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

type dw_1 from datawindow within w_scatter
integer x = 41
integer y = 128
integer width = 1522
integer height = 1544
integer taborder = 20
boolean bringtotop = true
string title = "none"
string dataobject = "d_scatter"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type rb_1 from radiobutton within w_scatter
integer x = 247
integer y = 1748
integer width = 402
integer height = 76
boolean bringtotop = true
integer textsize = -9
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
long textcolor = 33554432
long backcolor = 67108864
string text = "AVG (Open)"
boolean checked = true
end type

event clicked;String ll_SeriesName, ls_SeriesName2, ls_Category
Double ldb_Value
int ll_SeriesCount, ll_i
Long ll_Row, ll_Row2, ll_DataCount, ll_j
String ls_Title, ls_Option


//Title
wb_1.of_SetTitle("Default title")
//Theme
wb_1.of_SetTheme(gs_EChartsTheme)
//Style
wb_1.of_SetStyle("scatter")
//Width
wb_1.of_SetWidth(800)
//Height
wb_1.of_SetHeight(500)
//ToolBox
wb_1.of_SetToolBox(True)
//CreateOption
ls_Option = wf_CreateOption_avgOpen()
//SetOption
wb_1.of_SetOption(ls_Option)
//Apply
wb_1.of_Apply()
end event

type rb_2 from radiobutton within w_scatter
integer x = 951
integer y = 1748
integer width = 402
integer height = 76
boolean bringtotop = true
integer textsize = -9
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
long textcolor = 33554432
long backcolor = 67108864
string text = "AVG (Close)"
end type

event clicked;String ll_SeriesName, ls_SeriesName2, ls_Category
Double ldb_Value
int ll_SeriesCount, ll_i
Long ll_Row, ll_Row2, ll_DataCount, ll_j
String ls_Title, ls_Option


//Title
wb_1.of_SetTitle("Default title")
//Theme
wb_1.of_SetTheme(gs_EChartsTheme)
//Style
wb_1.of_SetStyle("scatter")
//Width
wb_1.of_SetWidth(800)
//Height
wb_1.of_SetHeight(500)
//ToolBox
wb_1.of_SetToolBox(True)
//CreateOption
ls_Option = wf_CreateOption_avgClose()
//SetOption
wb_1.of_SetOption(ls_Option)
//Apply
wb_1.of_Apply()

end event

type rb_3 from radiobutton within w_scatter
integer x = 247
integer y = 1884
integer width = 425
integer height = 76
boolean bringtotop = true
integer textsize = -9
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
long textcolor = 33554432
long backcolor = 67108864
string text = "AVG (Highest)"
end type

event clicked;String ll_SeriesName, ls_SeriesName2, ls_Category
Double ldb_Value
int ll_SeriesCount, ll_i
Long ll_Row, ll_Row2, ll_DataCount, ll_j
String ls_Title, ls_Option


//Title
wb_1.of_SetTitle("Default title")
//Theme
wb_1.of_SetTheme(gs_EChartsTheme)
//Style
wb_1.of_SetStyle("scatter")
//Width
wb_1.of_SetWidth(800)
//Height
wb_1.of_SetHeight(500)
//ToolBox
wb_1.of_SetToolBox(True)
//CreateOption
ls_Option = wf_CreateOption_avgHighest()
//SetOption
wb_1.of_SetOption(ls_Option)
//Apply
wb_1.of_Apply()
end event

type rb_4 from radiobutton within w_scatter
integer x = 951
integer y = 1884
integer width = 407
integer height = 76
boolean bringtotop = true
integer textsize = -9
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
long textcolor = 33554432
long backcolor = 67108864
string text = "AVG (Lowest)"
end type

event clicked;String ll_SeriesName, ls_SeriesName2, ls_Category
Double ldb_Value
int ll_SeriesCount, ll_i
Long ll_Row, ll_Row2, ll_DataCount, ll_j
String ls_Title, ls_Option


//Title
wb_1.of_SetTitle("Default title")
//Theme
wb_1.of_SetTheme(gs_EChartsTheme)
//Style
wb_1.of_SetStyle("scatter")
//Width
wb_1.of_SetWidth(800)
//Height
wb_1.of_SetHeight(500)
//ToolBox
wb_1.of_SetToolBox(True)
//CreateOption
ls_Option = wf_CreateOption_avgLowest()
//SetOption
wb_1.of_SetOption(ls_Option)
//Apply
wb_1.of_Apply()
end event

type st_1 from statictext within w_scatter
integer x = 558
integer y = 32
integer width = 562
integer height = 76
boolean bringtotop = true
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
long textcolor = 33554432
long backcolor = 67108864
string text = "Grid DataWindow"
boolean focusrectangle = false
end type

type st_2 from statictext within w_scatter
integer x = 2907
integer y = 32
integer width = 503
integer height = 76
boolean bringtotop = true
integer textsize = -11
integer weight = 400
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


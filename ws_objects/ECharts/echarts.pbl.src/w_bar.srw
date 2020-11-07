$PBExportHeader$w_bar.srw
forward
global type w_bar from w_chart_base
end type
type dw_1 from datawindow within w_bar
end type
type dw_series1 from datawindow within w_bar
end type
type dw_2 from datawindow within w_bar
end type
type wb_2 from n_webbrowser within w_bar
end type
type st_3 from statictext within w_bar
end type
type dw_3 from datawindow within w_bar
end type
type st_2 from statictext within w_bar
end type
type st_5 from statictext within w_bar
end type
type st_1 from statictext within w_bar
end type
type st_7 from statictext within w_bar
end type
end forward

global type w_bar from w_chart_base
string tag = "bar"
integer width = 3977
integer height = 2440
boolean border = false
event ue_click ( string as_arg )
dw_1 dw_1
dw_series1 dw_series1
dw_2 dw_2
wb_2 wb_2
st_3 st_3
dw_3 dw_3
st_2 st_2
st_5 st_5
st_1 st_1
st_7 st_7
end type
global w_bar w_bar

type variables
Boolean ib_flag = True

end variables

forward prototypes
public subroutine wf_apply (datawindow as_dw)
public function string wf_createoption (datawindow as_dw)
public function string wf_createoption_bar (datawindow as_dw)
end prototypes

public subroutine wf_apply (datawindow as_dw);/*wb_1 generate echart*/
String ls_Title, ls_Option

//Title
ls_Title = dw_1.Describe("gr_1.title")
wb_1.of_SetTitle(ls_Title)
//Theme
wb_1.of_SetTheme(gs_EChartsTheme)
//Style
wb_1.of_SetStyle("bar")
//Width
wb_1.of_SetWidth(800)
//Height
wb_1.of_SetHeight(230)
//ToolBox
wb_1.of_SetToolBox(True)
//DataZoom
wb_1.of_SetDataZoom(False)
//SeriesName
wb_1.of_SetSeriesName ( "Employees" )
//CreateOption
ls_Option = wf_CreateOption(as_dw)
//SetOption
wb_1.of_SetOption(ls_Option)
//Apply
wb_1.of_Apply()
end subroutine

public function string wf_createoption (datawindow as_dw);Long 		ll_I, ll_J, ll_Row, ll_Row2
Long 		ll_RootObject,ll_ChildObject, ll_ChildArray, ll_ChildArray2, ll_ChildArray3, ll_ChildArray4
Long 		ll_ChildObject2,ll_ChildObject3, ll_ChildObject4, ll_ChildObject5
String 	ls_Option, ls_Type
Double 	ldb_Value
JsonGenerator ljson_Option


//title
//legend
//grid{left:130,right:'30%',height:'40%',bottom:110}
//tooltip
//toolbox
//dataZoom
//visualMap
//xAxis:[{type:'category',...},{}]
//yAxis:[{...},{...}]
//series:[{type:'line',...},{...}]

ljson_Option = Create JsonGenerator
ll_RootObject = ljson_Option.CreateJsonObject()

//Title
ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "title")
ljson_Option.AddItemString(ll_ChildObject, "text",  "'" + wb_1.of_Gettitle() + "'")

/*
//Tooptip
ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "tooltip")

ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "visualMap")

ljson_Option.AddItemNumber(ll_ChildObject, "max", 20)

ll_ChildObject2 = ljson_Option.AddItemObject(ll_ChildObject, "inRange")
ll_ChildArray = ljson_Option.AddItemArray(ll_ChildObject2, "color")

ljson_Option.AddItemString(ll_ChildArray, "'#313695'")
ljson_Option.AddItemString(ll_ChildArray, "'#4575b4'")
ljson_Option.AddItemString(ll_ChildArray, "'#74add1'")
ljson_Option.AddItemString(ll_ChildArray, "'#abd9e9'")
ljson_Option.AddItemString(ll_ChildArray, "'#e0f3f8'")
ljson_Option.AddItemString(ll_ChildArray, "'#ffffbf'")
*/

//xAxis3D
ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "xAxis3D")

ljson_Option.AddItemString(ll_ChildObject, "type","'category'")
ll_ChildArray = ljson_Option.AddItemArray(ll_ChildObject, "data")

FOR ll_i = 1 TO as_dw.RowCount()
	ljson_Option.AddItemString(ll_ChildArray, "'" +wf_GetItemString(as_dw,ll_i, 1) + "'")
NEXT


//yAxis3D
ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "yAxis3D")
ljson_Option.AddItemString(ll_ChildObject, "type","'category'")


//zAxis3D
ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "zAxis3D")

ljson_Option.AddItemString(ll_ChildObject, "type","'value'")

//grid3D
ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "grid3D")
ljson_Option.AddItemNumber(ll_ChildObject, "boxWidth", 200)
ljson_Option.AddItemNumber(ll_ChildObject, "boxDepth", 80)

ll_ChildObject2 = ljson_Option.AddItemObject(ll_ChildObject, "viewControl")
ljson_Option.AddItemNumber(ll_ChildObject2, "beta", 0)

ll_ChildObject2 = ljson_Option.AddItemObject(ll_ChildObject, "light")


ll_ChildObject3 = ljson_Option.AddItemObject(ll_ChildObject2, "main")


ljson_Option.AddItemNumber(ll_ChildObject3, "intensity", 1.2)
ljson_Option.AddItemBoolean(ll_ChildObject3, "shadow", true)

ll_ChildObject3 = ljson_Option.AddItemObject(ll_ChildObject2, "ambient")
ljson_Option.AddItemNumber(ll_ChildObject3, "intensity", 0.3)


//Series
ll_ChildArray = ljson_Option.AddItemArray(ll_RootObject, "series")
ll_ChildObject2 = ljson_Option.AddItemObject(ll_ChildArray)

ljson_Option.AddItemString(ll_ChildObject2, "type", "'bar3D'")
ll_ChildArray2 = ljson_Option.AddItemArray(ll_ChildObject2, "data")
FOR ll_i = 1 TO  as_dw.RowCount()
	ll_ChildArray3 = ljson_Option.AddItemArray(ll_ChildArray2)
	ljson_Option.AddItemNumber(ll_ChildArray3, ll_i -1)
	ljson_Option.AddItemNumber(ll_ChildArray3, 1)
	ljson_Option.AddItemNumber(ll_ChildArray3, as_dw.GetItemNumber(ll_i,2))
NEXT

ljson_Option.AddItemString(ll_ChildObject2, "shading", "'lambert'")

ll_ChildObject3 = ljson_Option.AddItemObject(ll_ChildObject2, "label")


ll_ChildObject4 = ljson_Option.AddItemObject(ll_ChildObject3, "textStyle")

ljson_Option.AddItemNumber(ll_ChildObject4, "fontSize", 16)
ljson_Option.AddItemNumber(ll_ChildObject4, "borderWidth", 1)

ll_ChildObject3 = ljson_Option.AddItemObject(ll_ChildObject2, "emphasis")
ll_ChildObject4 = ljson_Option.AddItemObject(ll_ChildObject3, "label")
ll_ChildObject5 = ljson_Option.AddItemObject(ll_ChildObject4, "textStyle")
ljson_Option.AddItemNumber(ll_ChildObject5, "fontSize", 20)
ljson_Option.AddItemString(ll_ChildObject5, "color", "'#900'")


ll_ChildObject4 = ljson_Option.AddItemObject(ll_ChildObject3, "itemStyle")
ljson_Option.AddItemString(ll_ChildObject4, "color", "'#900'")

ls_Option = ljson_Option.GetJsonString()

Return ls_Option
end function

public function string wf_createoption_bar (datawindow as_dw);Long 		ll_I, ll_J, ll_Row, ll_Row2
Long 		ll_RootObject,ll_ChildObject, ll_ChildArray, ll_ChildArray2, ll_ChildArray3, ll_ChildArray4
Long 		ll_ChildObject2,ll_ChildObject3, ll_ChildObject4, ll_ChildObject5
String 	ls_Option, ls_Type
Double 	ldb_Value
JsonGenerator ljson_Option


//title
//legend
//grid{left:130,right:'30%',height:'40%',bottom:110}
//tooltip
//toolbox
//dataZoom
//visualMap
//xAxis:[{type:'category',...},{}]
//yAxis:[{...},{...}]
//series:[{type:'line',...},{...}]

ljson_Option = Create JsonGenerator
ll_RootObject = ljson_Option.CreateJsonObject()

//Title
ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "title")
ljson_Option.AddItemString(ll_ChildObject, "text",  "'" + wb_2.of_Gettitle() + "'")

/*
//Tooptip
ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "tooltip")

ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "visualMap")

ljson_Option.AddItemNumber(ll_ChildObject, "max", 20)

ll_ChildObject2 = ljson_Option.AddItemObject(ll_ChildObject, "inRange")
ll_ChildArray = ljson_Option.AddItemArray(ll_ChildObject2, "color")

ljson_Option.AddItemString(ll_ChildArray, "'#313695'")
ljson_Option.AddItemString(ll_ChildArray, "'#4575b4'")
ljson_Option.AddItemString(ll_ChildArray, "'#74add1'")
ljson_Option.AddItemString(ll_ChildArray, "'#abd9e9'")
ljson_Option.AddItemString(ll_ChildArray, "'#e0f3f8'")
ljson_Option.AddItemString(ll_ChildArray, "'#ffffbf'")
*/

//xAxis3D
ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "xAxis3D")

ljson_Option.AddItemString(ll_ChildObject, "type","'category'")
ll_ChildArray = ljson_Option.AddItemArray(ll_ChildObject, "data")

FOR ll_i = 1 TO as_dw.RowCount()
	ljson_Option.AddItemString(ll_ChildArray,"'"+ wf_GetItemString(as_dw,ll_i, 1)+"'")
NEXT


//yAxis3D
ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "yAxis3D")
ljson_Option.AddItemString(ll_ChildObject, "type","'category'")


//zAxis3D
ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "zAxis3D")

ljson_Option.AddItemString(ll_ChildObject, "type","'value'")

//grid3D
ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "grid3D")
ljson_Option.AddItemNumber(ll_ChildObject, "boxWidth", 200)
ljson_Option.AddItemNumber(ll_ChildObject, "boxDepth", 80)

ll_ChildObject2 = ljson_Option.AddItemObject(ll_ChildObject, "viewControl")
ljson_Option.AddItemNumber(ll_ChildObject2, "beta", 0)

ll_ChildObject2 = ljson_Option.AddItemObject(ll_ChildObject, "light")


ll_ChildObject3 = ljson_Option.AddItemObject(ll_ChildObject2, "main")


ljson_Option.AddItemNumber(ll_ChildObject3, "intensity", 1.2)
ljson_Option.AddItemBoolean(ll_ChildObject3, "shadow", true)

ll_ChildObject3 = ljson_Option.AddItemObject(ll_ChildObject2, "ambient")
ljson_Option.AddItemNumber(ll_ChildObject3, "intensity", 0.3)


//Series
ll_ChildArray = ljson_Option.AddItemArray(ll_RootObject, "series")
ll_ChildObject2 = ljson_Option.AddItemObject(ll_ChildArray)

ljson_Option.AddItemString(ll_ChildObject2, "type", "'bar3D'")
ll_ChildArray2 = ljson_Option.AddItemArray(ll_ChildObject2, "data")
FOR ll_i = 1 TO  as_dw.RowCount()
	ll_ChildArray3 = ljson_Option.AddItemArray(ll_ChildArray2)
	ljson_Option.AddItemNumber(ll_ChildArray3, ll_i - 1)
	ljson_Option.AddItemNumber(ll_ChildArray3, 1)
	ljson_Option.AddItemNumber(ll_ChildArray3, as_dw.GetItemNumber(ll_i,2))
NEXT

ljson_Option.AddItemString(ll_ChildObject2, "shading", "'lambert'")

ll_ChildObject3 = ljson_Option.AddItemObject(ll_ChildObject2, "label")


ll_ChildObject4 = ljson_Option.AddItemObject(ll_ChildObject3, "textStyle")

ljson_Option.AddItemNumber(ll_ChildObject4, "fontSize", 16)
ljson_Option.AddItemNumber(ll_ChildObject4, "borderWidth", 1)

ll_ChildObject3 = ljson_Option.AddItemObject(ll_ChildObject2, "emphasis")
ll_ChildObject4 = ljson_Option.AddItemObject(ll_ChildObject3, "label")
ll_ChildObject5 = ljson_Option.AddItemObject(ll_ChildObject4, "textStyle")
ljson_Option.AddItemNumber(ll_ChildObject5, "fontSize", 20)
ljson_Option.AddItemString(ll_ChildObject5, "color", "'#900'")


ll_ChildObject4 = ljson_Option.AddItemObject(ll_ChildObject3, "itemStyle")
ljson_Option.AddItemString(ll_ChildObject4, "color", "'#900'")

ls_Option = ljson_Option.GetJsonString()

Return ls_Option

end function

on w_bar.create
int iCurrent
call super::create
this.dw_1=create dw_1
this.dw_series1=create dw_series1
this.dw_2=create dw_2
this.wb_2=create wb_2
this.st_3=create st_3
this.dw_3=create dw_3
this.st_2=create st_2
this.st_5=create st_5
this.st_1=create st_1
this.st_7=create st_7
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_1
this.Control[iCurrent+2]=this.dw_series1
this.Control[iCurrent+3]=this.dw_2
this.Control[iCurrent+4]=this.wb_2
this.Control[iCurrent+5]=this.st_3
this.Control[iCurrent+6]=this.dw_3
this.Control[iCurrent+7]=this.st_2
this.Control[iCurrent+8]=this.st_5
this.Control[iCurrent+9]=this.st_1
this.Control[iCurrent+10]=this.st_7
end on

on w_bar.destroy
call super::destroy
destroy(this.dw_1)
destroy(this.dw_series1)
destroy(this.dw_2)
destroy(this.wb_2)
destroy(this.st_3)
destroy(this.dw_3)
destroy(this.st_2)
destroy(this.st_5)
destroy(this.st_1)
destroy(this.st_7)
end on

event open;call super::open;/*Initialize and show dw_1and dw_series1(disvisable) */
Long 		ll_SeriesCount, ll_i, ll_DataCount, ll_Row
Integer	li_category
Double 	ldb_Value
String 	ls_SeriesName, ls_Category,ls_value, ls_dept, ls_grgraphname

st_2.y = st_5.y
dw_1.y = wb_1.y
dw_1.height = wb_1.height
dw_2.y = wb_2.y
dw_2.height = wb_2.height

dw_1.SetTransObject (SQLCA)
dw_1.Retrieve()


ib_flag = True
ll_SeriesCount = dw_1.SeriesCount( "gr_1")
If ll_SeriesCount = 1 Then
	//Series
	 ls_SeriesName = dw_1.SeriesName( "gr_1", 1)
	 ll_DataCount = dw_1.DataCount( "gr_1",ls_SeriesName)
	 For ll_i = 1 To ll_DataCount
		  //Category
		  ls_Category = dw_1.CategoryName( "gr_1", ll_i)
		  //Data
		  ldb_Value = dw_1.GetData( "gr_1", 1, ll_i)
		  
		  ll_Row = dw_series1.InsertRow(0)
		  dw_series1.SetItem(ll_Row, 1, ls_Category )
		  dw_series1.SetItem(ll_Row, 2, ldb_Value )
	 Next
Else
	MessageBox( "Tips", "Series is not one!" )
End If

ls_dept = dw_1.CategoryName ("gr_1", 1)

dw_2.Modify (ls_grgraphname + ".title=" + &
"'Employees in " + ls_dept + " Department ' ")
dw_2.SetTransObject(sqlca)
end event

type wb_1 from w_chart_base`wb_1 within w_bar
event ue_click ( string as_arg )
integer x = 1696
integer y = 232
integer width = 2245
integer height = 1000
end type

event wb_1::ue_click(string as_arg);/*when click wb_1 then paser th string as_arg then initialize and show dw_2 and wb_2*/

String	  ls_dept[5], ls_grgraphname="gr_1" 
String ls_Title, ls_Option, ls_Json, ls_key, ls_CategoryName, ls_test
Long ll_RootObject, ll_Name
JsonParser lnv_JsonParser

lnv_JsonParser = Create JsonParser

ls_Json = as_arg

lnv_JsonParser.LoadString( ls_Json)
ll_RootObject = lnv_JsonParser.GetRootItem()

ls_key = lnv_JsonParser.GetChildKey(ll_RootObject, 1)
ll_Name = Long( lnv_JsonParser.GetItemString(ll_RootObject, ls_key))

ls_CategoryName = dw_1.CategoryName("gr_1", ll_Name + 1)

dw_3.Modify (ls_grgraphname + ".title=" + &
"'Employees in " + ls_CategoryName + " Department ' ")

dw_3.SetTransObject(sqlca)
dw_3.Retrieve(ls_CategoryName)

ls_test = ls_CategoryName

of_replace(ls_test, " & ", " && ")

st_3.Text = "Click a bar to check the" + " "+ ls_test + "'s details" + " of salary and personal information of an employee. "

/*wb_2 generate echart*/
//Title
ls_Title = 'Employees in ' + ls_CategoryName + ' Department '
wb_2.of_SetTitle(ls_Title)
//Theme
wb_2.of_SetTheme(gs_EChartsTheme)
//Style
wb_2.of_SetStyle("bar")
//Width
wb_2.of_SetWidth(800)
//Height
wb_2.of_SetHeight(250)
//ToolBox
wb_2.of_SetToolBox(True)
//DataZoom
wb_2.of_Setdatazoom(False)
//SeriesName
wb_2.of_SetSeriesName ( ls_CategoryName )
//CreateOption
ls_Option = wf_CreateOption_bar(dw_3)
//SetOption
wb_2.of_SetOption(ls_Option)
//Apply
wb_2.of_Apply()


/*After wb_2 showing then register event:dbclicked*/
string ls_JS

ls_JS = "myChart.on('click',function(params){window.webBrowser.ue_click('{~"name~":~"' + params.value[0] + '~",~"value~":~"' + params.value[2] + '~"}');});~r~n"
wb_2.Evaluatejavascriptsync( ls_JS )
wb_2.RegisterEvent("ue_click")




end event

event wb_1::ue_clicked;//
end event

event wb_1::navigationprogressindex;call super::navigationprogressindex;String ls_JS

IF progressindex =100 THEN 
	IF ib_flag THEN
		ib_flag = False
		wf_apply(dw_series1)
		ls_JS = "myChart.on('click',function(params){window.webBrowser.ue_click('{~"name~":~"' + params.value[0] + '~",~"value~":~"' + params.value[2] + '~"}');});~r~n"
		wb_1.Evaluatejavascriptsync( ls_JS )
		wb_1.RegisterEvent("ue_click")
		
	END IF
END IF

end event

type dw_1 from datawindow within w_bar
integer x = 41
integer y = 232
integer width = 1609
integer height = 1000
integer taborder = 10
boolean bringtotop = true
string title = "none"
string dataobject = "d_bar_headcount"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;
// Clicked script for dw_headcount
// This will cause the employee datawindow to populate based
// on which bar column you clicked on.

grObjectType	ClickedObject
string			ls_dept, ls_grgraphname="gr_1" 
int				li_series, li_category




/************************************************************
	Find out where the user clicked in the graph
 ***********************************************************/
ClickedObject =this.ObjectAtPointer (ls_grgraphname, li_series, &
						li_category)

/************************************************************
	If user clicked on data or category, find out which one
 ***********************************************************/
If ClickedObject = TypeData!  or &
	ClickedObject = TypeCategory!  then
		ls_dept = this.CategoryName (ls_grgraphname, li_category)
		dw_2.Modify (ls_grgraphname + ".title=" + &
				"'Employees in " + ls_dept + " Department ' ")
		dw_2.SetTransObject(sqlca)
		dw_2.Retrieve (ls_dept)
		
End If

end event

type dw_series1 from datawindow within w_bar
boolean visible = false
integer x = 1778
integer y = 276
integer width = 1655
integer height = 400
integer taborder = 20
boolean bringtotop = true
boolean enabled = false
string title = "none"
string dataobject = "d_category1"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_2 from datawindow within w_bar
integer x = 41
integer y = 1372
integer width = 1609
integer height = 956
integer taborder = 30
boolean bringtotop = true
string title = "none"
string dataobject = "d_bar_employees"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;// Clicked script for dw_headcount
//This will open up a responce window containing the detail of the employee that
//was double clicked on


grObjectType	ClickedObject
string			ls_empl , ls_grgraphname="gr_1"
Long			ll_id
int				li_series, li_category,li_pos

/************************************************************
	Find out where the user clicked in the graph
 ***********************************************************/

SetPointer (Hourglass!)

ClickedObject = this.ObjectAtPointer (ls_grgraphname, li_series, &
						li_category)

/************************************************************
	If user clicked on data or category, find out which one
 ***********************************************************/
If ClickedObject = TypeData!  or &
	ClickedObject = TypeCategory!  then
		ls_empl = this.CategoryName (ls_grgraphname, li_category)
//get the employee #
		ll_id= integer( ls_empl )
		openwithparm(w_empl_detail, ll_id)
End If

end event

type wb_2 from n_webbrowser within w_bar
event ue_click ( string as_arg )
integer x = 1691
integer y = 1372
integer width = 2245
integer height = 956
boolean bringtotop = true
borderstyle borderstyle = stylebox!
end type

event ue_click(string as_arg);/*when double click on wb_2 then parser string:as_arg then show employee details*/

Long ll_RootObject, ll_id, ll_CategoryName
String ls_Json, ls_key
JsonParser lnv_JsonParser
lnv_JsonParser = Create JsonParser

ls_Json = as_arg

// Loads a JSON string
lnv_JsonParser.LoadString(ls_Json)
ll_RootObject = lnv_JsonParser.GetRootItem()

// Gets the key of the child item
ls_key = lnv_JsonParser.GetChildKey(ll_RootObject, 1)
ll_id = long(lnv_JsonParser.GetItemString(ll_RootObject, ls_key)) 

ll_CategoryName = Long( dw_3.CategoryName("gr_1", ll_id + 1))

OpenWithParm(w_empl_detail, ll_CategoryName)


end event

event ue_clicked;//
end event

type st_3 from statictext within w_bar
integer x = 1691
integer y = 1276
integer width = 1989
integer height = 64
boolean bringtotop = true
integer textsize = -9
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
long textcolor = 33554432
long backcolor = 67108864
string text = "Click a bar to check the details of salary and personal information of an employee. "
boolean focusrectangle = false
end type

type dw_3 from datawindow within w_bar
boolean visible = false
integer y = 252
integer width = 1467
integer height = 1024
integer taborder = 40
boolean bringtotop = true
boolean enabled = false
string title = "none"
string dataobject = "d_bar_employees"
borderstyle borderstyle = stylelowered!
end type

type st_2 from statictext within w_bar
integer x = 46
integer y = 40
integer width = 1760
integer height = 76
boolean bringtotop = true
integer textsize = -9
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
long textcolor = 33554432
long backcolor = 67108864
string text = "Select a department to check the salary of employees of the department."
boolean focusrectangle = false
end type

type st_5 from statictext within w_bar
integer x = 1701
integer y = 40
integer width = 1806
integer height = 76
boolean bringtotop = true
integer textsize = -9
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
long textcolor = 33554432
long backcolor = 67108864
string text = "Select a department to check the salary of employees of the department."
boolean focusrectangle = false
end type

type st_1 from statictext within w_bar
integer x = 590
integer y = 132
integer width = 617
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
string text = "Graph DataWindow"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_7 from statictext within w_bar
integer x = 2693
integer y = 132
integer width = 393
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


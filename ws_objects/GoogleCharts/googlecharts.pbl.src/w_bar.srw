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
type st_4 from statictext within w_bar
end type
type st_5 from statictext within w_bar
end type
type st_1 from statictext within w_bar
end type
end forward

global type w_bar from w_chart_base
string tag = "bar"
integer width = 3977
integer height = 2388
boolean border = false
dw_1 dw_1
dw_series1 dw_series1
dw_2 dw_2
wb_2 wb_2
st_3 st_3
dw_3 dw_3
st_2 st_2
st_4 st_4
st_5 st_5
st_1 st_1
end type
global w_bar w_bar

type variables
Boolean ib_flag = True

end variables

forward prototypes
public subroutine wf_apply (datawindow as_dw)
end prototypes

public subroutine wf_apply (datawindow as_dw);/*wb_1 generate echart*/
String ls_Title, ls_Option, ls_data

//Title
ls_Title = dw_1.Describe("gr_1.title")
wb_1.of_SetTitle(ls_Title)
//Theme
wb_1.of_SetTheme(gs_EChartsTheme)
//Style
wb_1.of_SetStyle("column")
//Width
wb_1.of_SetWidth(800)
//Height
wb_1.of_SetHeight(230)
////ToolBox
//wb_1.of_SetToolBox(True)
//Is3D
wb_1.of_SetIs3D(True)
//SeriesName
wb_1.of_SetSeriesName ( "Employees" )
//CrateData
ls_data = wb_1.of_CreateData(as_dw)
wb_1.of_SetData(ls_data)
//CreateOption
ls_Option = wb_1.of_CreateOption()
//SetOption
wb_1.of_SetOption(ls_Option)
//Apply
wb_1.of_Apply()
end subroutine

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
this.st_4=create st_4
this.st_5=create st_5
this.st_1=create st_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_1
this.Control[iCurrent+2]=this.dw_series1
this.Control[iCurrent+3]=this.dw_2
this.Control[iCurrent+4]=this.wb_2
this.Control[iCurrent+5]=this.st_3
this.Control[iCurrent+6]=this.dw_3
this.Control[iCurrent+7]=this.st_2
this.Control[iCurrent+8]=this.st_4
this.Control[iCurrent+9]=this.st_5
this.Control[iCurrent+10]=this.st_1
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
destroy(this.st_4)
destroy(this.st_5)
destroy(this.st_1)
end on

event open;call super::open;/*Initialize and show dw_1and dw_series1(disvisable) */
Long 		ll_SeriesCount, ll_i, ll_DataCount, ll_Row
Integer	li_category
Double 	ldb_Value
String 	ls_SeriesName, ls_Category,ls_value, ls_dept, ls_grgraphname

st_2.y = st_1.y
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
integer x = 1696
integer y = 240
integer width = 2245
integer height = 1000
string defaulturl = "file:///charts3D.html"
end type

event wb_1::ue_clicked;/*when click wb_1 then paser th string as_arg then initialize and show dw_2 and wb_2*/

String	  ls_dept[5], ls_grgraphname="gr_1" 
String ls_Title, ls_Option, ls_Json, ls_key, ls_Name, ls_data, ls_CategoryName
Long ll_RootObject
JsonParser lnv_JsonParser

lnv_JsonParser = Create JsonParser

ls_Json = as_arg

lnv_JsonParser.LoadString( ls_Json)
ll_RootObject = lnv_JsonParser.GetRootItem()

ls_key = lnv_JsonParser.GetChildKey(ll_RootObject, 2)
ls_Name = lnv_JsonParser.GetItemString(ll_RootObject, ls_key)


dw_3.Modify (ls_grgraphname + ".title=" + &
"'Employees in " + ls_Name + " Department ' ")

dw_3.SetTransObject(sqlca)
dw_3.Retrieve(ls_Name)


ls_CategoryName = ls_Name

of_replace(ls_CategoryName, " & ", " && ")

st_3.Text = "Double click a bar to check the "+ls_CategoryName+"'s details of salary and personal information of an employee. "


/*wb_2 generate echart*/
//Title
ls_Title = 'Employees in ' + ls_Name + ' Department '
wb_2.of_SetTitle(ls_Title)
//Theme
wb_2.of_SetTheme(gs_EChartsTheme)
//Style
wb_2.of_SetStyle("column")
//Width
wb_2.of_SetWidth(800)
//Height
wb_2.of_SetHeight(250)
//ToolBox
wb_2.of_SetToolBox(True)
//Is3D
wb_2.of_SetIs3D(True)
//CrateData
ls_data = wb_2.of_CreateData(dw_3)
wb_2.of_SetData(ls_data)
//SeriesName
wb_2.of_SetSeriesName ( ls_Name )
//CreateOption
ls_Option = wb_2.of_CreateOption()
//SetOption
wb_2.of_SetOption(ls_Option)
//Apply
wb_2.of_Apply()


///*After wb_2 showing then register event:dbclicked*/
//string ls_JS
//
//ls_JS = "google.visualization.events.addListener(myChart,'dblclick',dblclickHandler);"
//wb_2.EvaluateJavaScriptSync( ls_JS)
//
//wb_2.RegisterEvent("ue_dbclicked")




end event

event wb_1::navigationprogressindex;call super::navigationprogressindex;
IF progressindex =100 THEN 
	IF ib_flag THEN
		ib_flag = False
		wf_apply(dw_series1)
	END IF
END IF
end event

type dw_1 from datawindow within w_bar
integer x = 41
integer y = 240
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
integer y = 424
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
integer y = 1392
integer width = 1609
integer height = 956
integer taborder = 30
boolean bringtotop = true
string title = "none"
string dataobject = "d_bar_employees"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type wb_2 from n_webbrowser within w_bar
event ue_dbclicked ( string as_arg )
integer x = 1691
integer y = 1392
integer width = 2245
integer height = 956
boolean bringtotop = true
string defaulturl = "file:///charts3D.html"
borderstyle borderstyle = stylebox!
end type

event ue_dbclicked(string as_arg);///*when double click on wb_2 then parser string:as_arg then show employee details*/
//
//Long ll_RootObject, ll_id
//String ls_Json, ls_key
//JsonParser lnv_JsonParser
//lnv_JsonParser = Create JsonParser
//
//ls_Json = as_arg
//
//// Loads a JSON string
//lnv_JsonParser.LoadString(ls_Json)
//ll_RootObject = lnv_JsonParser.GetRootItem()
//
//// Gets the key of the child item
//ls_key = lnv_JsonParser.GetChildKey(ll_RootObject, 2)
//ll_id = long(lnv_JsonParser.GetItemString(ll_RootObject, ls_key)) 
//
//OpenWithParm(w_empl_detail, ll_id)
//

end event

event ue_clicked;call super::ue_clicked;/*when double click on wb_2 then parser string:as_arg then show employee details*/

Long ll_RootObject, ll_id
String ls_Json, ls_key
JsonParser lnv_JsonParser
lnv_JsonParser = Create JsonParser

ls_Json = as_arg

// Loads a JSON string
lnv_JsonParser.LoadString(ls_Json)
ll_RootObject = lnv_JsonParser.GetRootItem()

// Gets the key of the child item
ls_key = lnv_JsonParser.GetChildKey(ll_RootObject, 2)
ll_id = long(lnv_JsonParser.GetItemString(ll_RootObject, ls_key)) 

OpenWithParm(w_empl_detail, ll_id)


end event

type st_3 from statictext within w_bar
integer x = 1696
integer y = 1292
integer width = 2002
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
integer x = 1801
integer y = 684
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
integer y = 32
integer width = 1774
integer height = 84
boolean bringtotop = true
integer textsize = -9
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
long textcolor = 33554432
long backcolor = 67108864
string text = "Select a department to check the salary of employees of the department. "
boolean focusrectangle = false
end type

type st_4 from statictext within w_bar
integer x = 567
integer y = 144
integer width = 603
integer height = 80
boolean bringtotop = true
integer textsize = -11
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

type st_5 from statictext within w_bar
integer x = 2624
integer y = 144
integer width = 503
integer height = 80
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

type st_1 from statictext within w_bar
integer x = 1696
integer y = 32
integer width = 1774
integer height = 84
boolean bringtotop = true
integer textsize = -9
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
long textcolor = 33554432
long backcolor = 67108864
string text = "Select a department to check the salary of employees of the department. "
boolean focusrectangle = false
end type


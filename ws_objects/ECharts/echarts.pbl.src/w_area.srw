$PBExportHeader$w_area.srw
forward
global type w_area from w_chart_base
end type
type dw_2 from datawindow within w_area
end type
type dw_series from datawindow within w_area
end type
type dw_1 from datawindow within w_area
end type
type st_1 from statictext within w_area
end type
type ddlb_1 from dropdownlistbox within w_area
end type
type st_2 from statictext within w_area
end type
type st_3 from statictext within w_area
end type
type st_6 from statictext within w_area
end type
type st_4 from statictext within w_area
end type
type st_5 from statictext within w_area
end type
end forward

global type w_area from w_chart_base
string tag = "area"
integer width = 4658
integer height = 1948
boolean border = false
dw_2 dw_2
dw_series dw_series
dw_1 dw_1
st_1 st_1
ddlb_1 ddlb_1
st_2 st_2
st_3 st_3
st_6 st_6
st_4 st_4
st_5 st_5
end type
global w_area w_area

type variables
Boolean ib_flag = True
end variables

forward prototypes
public subroutine wf_apply ()
end prototypes

public subroutine wf_apply ();/*wb_1 use string json: ls_Option to generate echarts*/
String ls_Title, ls_Option

//Title
ls_Title = dw_1.Describe("gr_1.title")
wb_1.of_SetTitle(ls_Title)
//Theme
wb_1.of_SetTheme(gs_EChartsTheme)
//Style
wb_1.of_SetStyle("area")
//Width
wb_1.of_SetWidth(750)
//Height
wb_1.of_SetHeight(400)
//ToolBox
wb_1.of_SetToolBox(True)
//CreateOption
ls_Option = wb_1.of_createoption(dw_series, dw_2)
//SetOption
wb_1.of_SetOption(ls_Option)
//Apply
wb_1.of_Apply()
end subroutine

on w_area.create
int iCurrent
call super::create
this.dw_2=create dw_2
this.dw_series=create dw_series
this.dw_1=create dw_1
this.st_1=create st_1
this.ddlb_1=create ddlb_1
this.st_2=create st_2
this.st_3=create st_3
this.st_6=create st_6
this.st_4=create st_4
this.st_5=create st_5
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_2
this.Control[iCurrent+2]=this.dw_series
this.Control[iCurrent+3]=this.dw_1
this.Control[iCurrent+4]=this.st_1
this.Control[iCurrent+5]=this.ddlb_1
this.Control[iCurrent+6]=this.st_2
this.Control[iCurrent+7]=this.st_3
this.Control[iCurrent+8]=this.st_6
this.Control[iCurrent+9]=this.st_4
this.Control[iCurrent+10]=this.st_5
end on

on w_area.destroy
call super::destroy
destroy(this.dw_2)
destroy(this.dw_series)
destroy(this.dw_1)
destroy(this.st_1)
destroy(this.ddlb_1)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.st_6)
destroy(this.st_4)
destroy(this.st_5)
end on

event open;call super::open;/*Initialize dw_1、dw_2*/
String ls_SeriesName, ls_SeriesName2, ls_Category
Long ll_SeriesCount, ll_DataCount, ll_Row, ll_Row2, ll_i, ll_j
Double ldb_Value

dw_1.y = wb_1.y
dw_2.height = wb_1.height/2
dw_1.SetTransObject(SQLCA)
dw_1.Retrieve()

ib_flag = true

ll_SeriesCount = dw_1.Seriescount( "gr_1")

FOR ll_i = 1 TO ll_SeriesCount
	ls_SeriesName = dw_1.SeriesName("gr_1", ll_i)
	ls_SeriesName2 = ls_SeriesName
	IF ls_SeriesName2="" OR IsNull(ls_SeriesName2) THEN
		ls_SeriesName2 = "Series" + String(ll_i)
	END IF
	ddlb_1.AddItem(ls_SeriesName2)
	ll_Row = dw_series.InsertRow(0)
	dw_series.SetItem( ll_Row, 1, ls_SeriesName2)
	
	ll_DataCount = dw_1.Datacount( "gr_1", ls_SeriesName)
	FOR ll_j = 1 TO ll_DataCount
		ls_Category = dw_1.CategoryName( "gr_1", ll_j)
		ldb_Value = dw_1.GetData( "gr_1", ll_i, ll_j )
		ll_Row2 = dw_2.InsertRow(0)
		dw_2.SetItem(ll_Row2, "series", ls_SeriesName2)
		dw_2.SetItem(ll_Row2, "name", ls_Category)
		dw_2.SetItem(ll_Row2, "values", ldb_Value)
	NEXT
NEXT

ddlb_1.post SelectItem( ddlb_1.totalitems( ) )
ddlb_1.post Event selectionchanged( ddlb_1.totalitems( ) )
end event

type wb_1 from w_chart_base`wb_1 within w_area
integer x = 1669
integer y = 360
integer width = 2949
integer height = 1504
end type

event wb_1::navigationprogressindex;call super::navigationprogressindex;/*dynamic load echarts.html and generate echarts*/
IF progressindex  = 100 THEN
	IF ib_flag THEN
		ib_flag = false
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

ll_Find = dw_2.Find( "name = '" + ls_Name + "'", 1, dw_2.RowCount()  )
If ll_Find > 0 Then
	dw_2.SetRedraw(False)
	dw_2.ScrollToRow(dw_1.RowCount())
	dw_2.ScrollToRow(ll_Find)
	dw_2.selectrow( 0, False )
	dw_2.selectrow( ll_Find, True )
	dw_2.SetRedraw(True)
End If

If IsValid ( lnv_JsonParser ) Then Destroy ( lnv_JsonParser )
end event

type dw_2 from datawindow within w_area
integer x = 41
integer y = 1232
integer width = 1582
integer height = 636
integer taborder = 20
boolean bringtotop = true
string title = "none"
string dataobject = "d_category2"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;/*When after modifing the columns by yourself then generate a new chart again*/

dw_2.accepttext( )

wf_apply()
end event

type dw_series from datawindow within w_area
boolean visible = false
integer x = 3566
integer y = 516
integer width = 375
integer height = 536
integer taborder = 30
boolean bringtotop = true
boolean enabled = false
string title = "none"
string dataobject = "d_series"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_1 from datawindow within w_area
integer x = 41
integer y = 360
integer width = 1582
integer height = 720
integer taborder = 10
boolean bringtotop = true
string title = "none"
string dataobject = "d_area"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type st_1 from statictext within w_area
integer x = 46
integer y = 1132
integer width = 325
integer height = 64
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
long textcolor = 33554432
long backcolor = 67108864
string text = "Series Name:"
boolean focusrectangle = false
end type

type ddlb_1 from dropdownlistbox within w_area
integer x = 370
integer y = 1120
integer width = 901
integer height = 324
integer taborder = 40
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;String ls_SeriesName

ls_SeriesName = ddlb_1.Text(index)

dw_2.SetReDraw(FALSE)
dw_2.SetFilter( "#1 = '" + ls_SeriesName + "'" )
dw_2.Filter()
dw_2.SetReDraw(TRUE)

end event

type st_2 from statictext within w_area
integer x = 50
integer y = 92
integer width = 2085
integer height = 88
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
long textcolor = 33554432
long backcolor = 67108864
string text = "The tool can read your chart imported from DataWindow without providing raw data. "
boolean focusrectangle = false
end type

type st_3 from statictext within w_area
integer x = 50
integer y = 168
integer width = 2770
integer height = 84
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
long textcolor = 33554432
long backcolor = 67108864
string text = "In the generated data table, you can edit the data contents, and create new corresponding chart by pressing Enter."
boolean focusrectangle = false
end type

type st_6 from statictext within w_area
integer x = 50
integer y = 16
integer width = 375
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
long textcolor = 33554432
long backcolor = 67108864
string text = "Introduction"
boolean focusrectangle = false
end type

type st_4 from statictext within w_area
integer x = 530
integer y = 260
integer width = 640
integer height = 76
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
long textcolor = 33554432
long backcolor = 67108864
string text = "Graph DataWindow"
boolean focusrectangle = false
end type

type st_5 from statictext within w_area
integer x = 2985
integer y = 260
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
boolean focusrectangle = false
end type


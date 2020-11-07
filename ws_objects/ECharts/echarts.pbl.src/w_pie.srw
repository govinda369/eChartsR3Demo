$PBExportHeader$w_pie.srw
forward
global type w_pie from w_chart_base
end type
type dw_1 from datawindow within w_pie
end type
type dw_series from datawindow within w_pie
end type
type dw_2 from datawindow within w_pie
end type
type st_1 from statictext within w_pie
end type
type st_2 from statictext within w_pie
end type
type ddlb_1 from dropdownlistbox within w_pie
end type
type rb_1 from radiobutton within w_pie
end type
type rb_2 from radiobutton within w_pie
end type
type rb_3 from radiobutton within w_pie
end type
type st_9 from statictext within w_pie
end type
type st_10 from statictext within w_pie
end type
type st_11 from statictext within w_pie
end type
type st_3 from statictext within w_pie
end type
type st_4 from statictext within w_pie
end type
end forward

global type w_pie from w_chart_base
string tag = "pie"
integer width = 4658
integer height = 1992
boolean border = false
dw_1 dw_1
dw_series dw_series
dw_2 dw_2
st_1 st_1
st_2 st_2
ddlb_1 ddlb_1
rb_1 rb_1
rb_2 rb_2
rb_3 rb_3
st_9 st_9
st_10 st_10
st_11 st_11
st_3 st_3
st_4 st_4
end type
global w_pie w_pie

type variables
Boolean ib_flag = TRUE
Boolean ib_rotate = TRUE

end variables

forward prototypes
public subroutine wf_apply ()
end prototypes

public subroutine wf_apply ();String ls_Title, ls_Option

//Title
ls_Title = dw_1.Describe("gr_1.title")
wb_1.of_SetTitle(ls_Title)
//Theme
wb_1.of_SetTheme(gs_EChartsTheme)
//Style
wb_1.of_SetStyle("pie")
//Width
wb_1.of_SetWidth(800)
//Height
wb_1.of_SetHeight(400)
//ToolBox
wb_1.of_SetToolBox(True)
//RoseType
If rb_1.Checked Then
	wb_1.of_SetRoseType("")
End If
If rb_2.Checked Then
	wb_1.of_SetRoseType("radius")
End If
If rb_3.Checked Then
	wb_1.of_SetRoseType("area")
End If
//CreateOption
ls_Option = wb_1.of_CreateOption(dw_series, dw_2)
//SetOption
wb_1.of_SetOption(ls_Option)
//Apply
wb_1.of_Apply()



end subroutine

on w_pie.create
int iCurrent
call super::create
this.dw_1=create dw_1
this.dw_series=create dw_series
this.dw_2=create dw_2
this.st_1=create st_1
this.st_2=create st_2
this.ddlb_1=create ddlb_1
this.rb_1=create rb_1
this.rb_2=create rb_2
this.rb_3=create rb_3
this.st_9=create st_9
this.st_10=create st_10
this.st_11=create st_11
this.st_3=create st_3
this.st_4=create st_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_1
this.Control[iCurrent+2]=this.dw_series
this.Control[iCurrent+3]=this.dw_2
this.Control[iCurrent+4]=this.st_1
this.Control[iCurrent+5]=this.st_2
this.Control[iCurrent+6]=this.ddlb_1
this.Control[iCurrent+7]=this.rb_1
this.Control[iCurrent+8]=this.rb_2
this.Control[iCurrent+9]=this.rb_3
this.Control[iCurrent+10]=this.st_9
this.Control[iCurrent+11]=this.st_10
this.Control[iCurrent+12]=this.st_11
this.Control[iCurrent+13]=this.st_3
this.Control[iCurrent+14]=this.st_4
end on

on w_pie.destroy
call super::destroy
destroy(this.dw_1)
destroy(this.dw_series)
destroy(this.dw_2)
destroy(this.st_1)
destroy(this.st_2)
destroy(this.ddlb_1)
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.rb_3)
destroy(this.st_9)
destroy(this.st_10)
destroy(this.st_11)
destroy(this.st_3)
destroy(this.st_4)
end on

event open;call super::open;String ls_Category, ls_SeriesName, ls_SeriesName2
Long ll_SeriesCount, ll_Row, ll_Row2, ll_i, ll_j, ll_DataCount, ldb_Value


dw_1.SetTransObject(SQLCA)
dw_1.Retrieve()


ib_flag = TRUE
ll_SeriesCount = dw_1.SeriesCount("gr_1")

FOR ll_i = 1 TO ll_SeriesCount
	ls_SeriesName = dw_1.SeriesName( "gr_1", ll_i)
	ls_SeriesName2 = ls_SeriesName
	IF IsNull(ls_SeriesName2) OR ls_SeriesName2 = "" THEN
		ls_SeriesName2 = "Series" + String(ll_i)
	END IF
	
	ddlb_1.AddItem(ls_SeriesName2)
	
	ll_Row = dw_series.InsertRow(0)
	dw_series.SetItem(ll_Row, 1, ls_SeriesName2)
	
	ll_DataCount = dw_1.DataCount( "gr_1", ls_SeriesName)
	FOR ll_j = 1 TO ll_DataCount
		ls_Category = dw_1.CategoryName( "gr_1", ll_j)
		ldb_Value = dw_1.GetData( "gr_1", ll_i, ll_j)
		ll_Row2 = dw_2.InsertRow(0)
		dw_2.SetItem(ll_Row2, "series", ls_SeriesName2)
		dw_2.SetItem(ll_Row2, "name", ls_Category)
		dw_2.SetItem(ll_Row2, "values", ldb_Value)
	NEXT
NEXT

ddlb_1.post SelectItem( ddlb_1.totalitems( ) )
ddlb_1.post Event selectionchanged( ddlb_1.totalitems( ) )
	
end event

type wb_1 from w_chart_base`wb_1 within w_pie
integer x = 1669
integer y = 356
integer width = 2949
integer height = 1504
end type

event wb_1::navigationprogressindex;call super::navigationprogressindex;IF progressindex = 100 THEN
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

type dw_1 from datawindow within w_pie
integer x = 41
integer y = 356
integer width = 1582
integer height = 720
integer taborder = 10
boolean bringtotop = true
string title = "none"
string dataobject = "d_dept_empidcount_pie"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_series from datawindow within w_pie
boolean visible = false
integer x = 2263
integer y = 792
integer width = 530
integer height = 852
integer taborder = 20
boolean bringtotop = true
boolean enabled = false
string title = "none"
string dataobject = "d_series"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_2 from datawindow within w_pie
integer x = 41
integer y = 1336
integer width = 1582
integer height = 520
integer taborder = 30
boolean bringtotop = true
string title = "none"
string dataobject = "d_category2"
boolean hscrollbar = true
boolean livescroll = true
end type

event itemchanged;
dw_2.AcceptText( )

wf_apply()
end event

type st_1 from statictext within w_pie
integer x = 46
integer y = 1116
integer width = 293
integer height = 68
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
long textcolor = 33554432
long backcolor = 67108864
string text = "Rose Type:"
boolean focusrectangle = false
end type

type st_2 from statictext within w_pie
integer x = 46
integer y = 1232
integer width = 343
integer height = 68
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
long textcolor = 33554432
long backcolor = 67108864
string text = "Series Name :"
boolean focusrectangle = false
end type

type ddlb_1 from dropdownlistbox within w_pie
integer x = 389
integer y = 1224
integer width = 901
integer height = 352
integer taborder = 30
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
long textcolor = 33554432
boolean sorted = false
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;String ls_SeriesName

ls_SeriesName = ddlb_1.Text(index)

dw_2.SetReDraw(FALSE)
dw_2.SetFilter( "#1 = '" + ls_SeriesName + "'" )
dw_2.Filter()
dw_2.SetReDraw(TRUE)

end event

type rb_1 from radiobutton within w_pie
integer x = 480
integer y = 1112
integer width = 224
integer height = 76
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
long textcolor = 33554432
long backcolor = 67108864
string text = "None"
boolean checked = true
end type

event clicked;//
wf_apply()
end event

type rb_2 from radiobutton within w_pie
integer x = 750
integer y = 1112
integer width = 256
integer height = 76
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
long textcolor = 33554432
long backcolor = 67108864
string text = "Radius"
end type

event clicked;//
wf_apply()
end event

type rb_3 from radiobutton within w_pie
integer x = 1051
integer y = 1112
integer width = 201
integer height = 76
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
long textcolor = 33554432
long backcolor = 67108864
string text = "Area"
end type

event clicked;//
wf_apply()
end event

type st_9 from statictext within w_pie
integer x = 46
integer y = 24
integer width = 361
integer height = 72
boolean bringtotop = true
integer textsize = -9
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

type st_10 from statictext within w_pie
integer x = 46
integer y = 100
integer width = 2089
integer height = 80
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

type st_11 from statictext within w_pie
integer x = 46
integer y = 176
integer width = 2747
integer height = 72
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

type st_3 from statictext within w_pie
integer x = 562
integer y = 256
integer width = 603
integer height = 88
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

type st_4 from statictext within w_pie
integer x = 2962
integer y = 248
integer width = 498
integer height = 96
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


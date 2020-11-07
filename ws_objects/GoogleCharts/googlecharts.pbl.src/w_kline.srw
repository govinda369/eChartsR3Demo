$PBExportHeader$w_kline.srw
forward
global type w_kline from w_chart_base
end type
type dw_1 from datawindow within w_kline
end type
type st_1 from statictext within w_kline
end type
type st_2 from statictext within w_kline
end type
end forward

global type w_kline from w_chart_base
string tag = "k-line"
integer width = 4658
integer height = 1888
boolean border = false
boolean righttoleft = true
dw_1 dw_1
st_1 st_1
st_2 st_2
end type
global w_kline w_kline

type variables
Boolean ib_flag = TRUE
end variables

forward prototypes
public subroutine wf_apply ()
end prototypes

public subroutine wf_apply ();/*wb_1 use string json: ls_Option to generate echarts*/
String ls_Title, ls_Option, ls_data

//Title
wb_1.of_SetTitle("Stock Markets")
//Theme
wb_1.of_SetTheme(gs_EChartsTheme)
//Style
wb_1.of_SetStyle("candlesitick")
//Width
wb_1.of_SetWidth(750)
//Height
wb_1.of_SetHeight(400)
////ToolBox
//wb_1.of_SetToolBox(True)
//CrateData
ls_data = wb_1.of_createdata_Candlestick(dw_1, "low", "open", "close", "high")
wb_1.of_SetData(ls_data)
//CreateOption
ls_Option = wb_1.of_createoption()
//SetOption
wb_1.of_SetOption(ls_Option)
//Apply
wb_1.of_Apply()

end subroutine

on w_kline.create
int iCurrent
call super::create
this.dw_1=create dw_1
this.st_1=create st_1
this.st_2=create st_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_1
this.Control[iCurrent+2]=this.st_1
this.Control[iCurrent+3]=this.st_2
end on

on w_kline.destroy
call super::destroy
destroy(this.dw_1)
destroy(this.st_1)
destroy(this.st_2)
end on

event open;call super::open;
dw_1.SetTransObject(sqlca)
dw_1.Retrieve()





	
end event

type wb_1 from w_chart_base`wb_1 within w_kline
integer x = 1490
integer y = 164
integer width = 3122
integer height = 1572
end type

event wb_1::navigationprogressindex;call super::navigationprogressindex;IF progressindex = 100 THEN
	IF ib_flag THEN
		ib_flag = False
		wf_apply()
	END IF
END IF
end event

event wb_1::ue_clicked;
//{"seriesName":"dayK","name":"2010/04/19","value":"544,21.55,20.08,19.99,21.58"}
JsonParser lnv_JsonParser
Long 		ll_RootObject, ll_Find, ll_I
String 	ls_SeriesName, ls_Name, ls_Value

lnv_JsonParser = Create JsonParser

lnv_JsonParser.LoadString(as_arg)
ll_RootObject = lnv_JsonParser.GetRootItem()
ls_SeriesName = lnv_JsonParser.GetItemString( ll_RootObject, "seriesName" )
ls_Name = lnv_JsonParser.GetItemString( ll_RootObject, "name" )
ls_Value = lnv_JsonParser.GetItemString( ll_RootObject, "value" )

ll_Find = dw_1.Find( "day = '" + ls_Name + "'", 1, dw_1.RowCount()  )
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

type dw_1 from datawindow within w_kline
integer x = 41
integer y = 164
integer width = 1408
integer height = 1572
integer taborder = 10
boolean bringtotop = true
string title = "none"
string dataobject = "d_kline"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type st_1 from statictext within w_kline
integer x = 398
integer y = 52
integer width = 667
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

type st_2 from statictext within w_kline
integer x = 2885
integer y = 52
integer width = 466
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


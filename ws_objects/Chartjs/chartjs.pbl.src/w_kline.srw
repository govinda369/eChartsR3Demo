$PBExportHeader$w_kline.srw
forward
global type w_kline from w_chart_base
end type
type dw_1 from datawindow within w_kline
end type
type st_17 from statictext within w_kline
end type
type st_18 from statictext within w_kline
end type
type st_19 from statictext within w_kline
end type
type st_21 from statictext within w_kline
end type
end forward

global type w_kline from w_chart_base
string tag = "k-line"
integer width = 4658
integer height = 2080
boolean border = false
boolean righttoleft = true
dw_1 dw_1
st_17 st_17
st_18 st_18
st_19 st_19
st_21 st_21
end type
global w_kline w_kline

type variables
Boolean ib_flag = TRUE
end variables

forward prototypes
public subroutine wf_apply ()
public function string wf_createoption ()
end prototypes

public subroutine wf_apply (); String  ls_Option, ls_Shares, ls_JS, ls_datetime
integer li_Return
decimal{3} ldc_open, ldc_close, ldc_highest, ldc_lowest
Long ll_RowCount, ll_colcount, ll_i, ll_j
Long ll_RootArray, ll_ChildArray
JsonGenerator lnv_JsonGenerator

//Title
wb_1.of_SetTitle("Stock Markets")
//Theme
wb_1.of_SetTheme(gs_EChartsTheme)
//Style
wb_1.of_SetStyle("candlestick")
//Width
wb_1.of_SetWidth(800)
//Height
wb_1.of_SetHeight(450)
//ToolBox
wb_1.of_SetToolBox(True)
//data0
ll_RowCount = dw_1.Rowcount()

lnv_JsonGenerator = Create JsonGenerator

/*Create an array root item*/
ll_RootArray = lnv_JsonGenerator.CreateJsonArray()
FOR ll_i = 1 TO ll_RowCount
	ll_ChildArray = lnv_JsonGenerator.AddItemArray(ll_RootArray)
	ls_datetime =dw_1.GetItemString( ll_i, 1)
	lnv_JsonGenerator.AddItemString(ll_ChildArray, ls_datetime)
	ldc_open = dw_1.GetItemNumber(ll_i, 2)
	lnv_JsonGenerator.AddItemNumber(ll_ChildArray, ldc_open)
	ldc_close = dw_1.GetItemNumber(ll_i, 5)
	lnv_JsonGenerator.AddItemNumber(ll_ChildArray, ldc_close)
	ldc_highest = dw_1.GetItemNumber(ll_i, 4)
	lnv_JsonGenerator.AddItemNumber(ll_ChildArray, ldc_highest)
	ldc_lowest = dw_1.GetItemNumber(ll_i, 3)
	lnv_JsonGenerator.AddItemNumber(ll_ChildArray, ldc_lowest)
NEXT

ls_Shares =  lnv_JsonGenerator.GetJsonString()

IF IsValid(  lnv_JsonGenerator ) THEN Destroy ( lnv_JsonGenerator)


//function splitData
ls_JS = "function splitData(rawData){var categoryData = [];var values = []; for(var i = 0; i < rawData.length; i++){categoryData.push(rawData[i].splice(0,1)[0]);values.push(rawData[i])} return{categoryData: categoryData, values: values};}"
wb_1.Evaluatejavascriptsync(ls_JS)

//data0
wb_1.of_replace(ls_Shares, '"', "'")
ls_JS = "var data0 = splitData("+ls_Shares+");"
li_Return = wb_1.Evaluatejavascriptsync(ls_JS)

//function calculateMA
ls_JS = "function calculateMA(dayCount){var result = []; for(var i =0, len = data0.values.length; i < len; i++){if(i < dayCount){result.push('-'); continue;} var sum = 0; for(var j = 0; j < dayCount; j++){sum += data0.values[i - j][1];} result.push(+(sum / dayCount).toFixed(3));} return result;}"
wb_1.Evaluatejavascriptsync(ls_JS)

//CreateOption
ls_Option = wf_CreateOption()
//SetOption
wb_1.of_SetOption(ls_Option)
//Apply
wb_1.of_Apply()


end subroutine

public function string wf_createoption ();String ls_datetime, ls_Option, ls_JS, ls_Shares
decimal{3} ldc_open, ldc_close, ldc_highest, ldc_lowest
Long ll_RowCount, ll_colcount, ll_i, ll_j
Long ll_RootObject, ll_ChildObject, ll_ChildObject2, ll_ChildObject3, ll_ChildObject4, ll_ChildArray, ll_ChildArray2, ll_ChildArray3
Long ll_RootArray
JsonGenerator lnv_JsonGenerator

JsonGenerator ljson_Option
ljson_Option = Create JsonGenerator
ll_RootObject = ljson_Option.CreateJsonObject()

If wb_1.of_GetTheme() = "dark" Then
	ljson_Option.AddItemString(ll_RootObject, "backgroundColor","'#333333'")
End If

//Title
ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "title")
ljson_Option.AddItemString(ll_ChildObject, "text", "'" + wb_1.of_Gettitle() + "'")


//ToolTip
ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "tooltip") 
ljson_Option.AddItemString( ll_ChildObject, "trigger", "'axis'")
ll_ChildObject2 = ljson_Option.AddItemObject( ll_ChildObject, "axisPointer")
 ljson_Option.AddItemString(ll_ChildObject2, "type", "'cross'") 

//Legend
ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "legend")
ll_ChildArray = ljson_Option.AddItemArray(ll_ChildObject, "data")
ljson_Option.AddItemString( ll_ChildArray, "'dayK'")
ljson_Option.AddItemString( ll_ChildArray, "'MA5'")

//grid
ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "grid")
ljson_Option.AddItemString( ll_ChildObject, "left", "'10%'")
ljson_Option.AddItemString( ll_ChildObject, "right", "'10%'")
ljson_Option.AddItemString( ll_ChildObject, "bottom", "'15%'")

  
//xaxis
ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "xAxis")
ljson_Option.AddItemString( ll_ChildObject, "type", "'category'")
ljson_Option.AddItemString(ll_ChildObject,"data", "data0.categoryData")


ljson_Option.AddItemBoolean( ll_ChildObject, "scale", true)
ljson_Option.AddItemBoolean( ll_ChildObject, "boundaryGap", false)
  
ll_ChildObject2 = ljson_Option.AddItemObject( ll_ChildObject, "axisLine")
ljson_Option.AddItemBoolean( ll_ChildObject2, "onZero", false)

ll_ChildObject2 = ljson_Option.AddItemObject( ll_ChildObject, "splitLine")
ljson_Option.AddItemBoolean( ll_ChildObject2, "show", false)


ljson_Option.AddItemNumber( ll_ChildObject, "splitNumber", 20)
ljson_Option.AddItemString( ll_ChildObject, "min", "'dataMin'")
ljson_Option.AddItemString( ll_ChildObject, "max", "'dataMax'")


//yaxis
ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "yAxis")
ljson_Option.AddItemBoolean( ll_ChildObject, "scale", true)

ll_ChildObject2 = ljson_Option.AddItemObject( ll_ChildObject, "splitArea")
ljson_Option.AddItemBoolean( ll_ChildObject2, "show", false)
 

//datazoom
ll_ChildArray = ljson_Option.AddItemArray(ll_RootObject, "dataZoom")
ll_ChildObject = ljson_Option.AddItemObject(ll_ChildArray)
ljson_Option.AddItemString(ll_ChildObject,"type", "'inside'")
ljson_Option.AddItemNumber(ll_ChildObject,"start", 87)
ljson_Option.AddItemNumber(ll_ChildObject,"end", 100)

ll_ChildObject = ljson_Option.AddItemObject(ll_ChildArray)
ljson_Option.AddItemBoolean(ll_ChildObject,"show", true)
ljson_Option.AddItemString(ll_ChildObject,"type", "'slider'")
ljson_Option.AddItemString(ll_ChildObject,"top", "'90%'")
ljson_Option.AddItemNumber(ll_ChildObject,"start", 87)
ljson_Option.AddItemNumber(ll_ChildObject,"end", 100)


//series
ll_ChildArray = ljson_Option.AddItemArray(ll_RootObject, "series")
ll_ChildObject2 = ljson_Option.AddItemObject(ll_ChildArray)

ljson_Option.AddItemString( ll_ChildObject2, "type","'candlestick'")
ljson_Option.AddItemString( ll_ChildObject2, "name","'dayK'")
ljson_Option.AddItemString(ll_ChildObject2, "data","data0.values")

ll_ChildObject3 = ljson_Option.AddItemObject( ll_ChildObject2, "itemStyle")
ljson_Option.AddItemString( ll_ChildObject3, "color","'#ec0000'")
ljson_Option.AddItemString( ll_ChildObject3, "color0","'#00da3c'")
ljson_Option.AddItemString( ll_ChildObject3, "borderColor","'#8A0000'")
ljson_Option.AddItemString( ll_ChildObject3, "borderColor0","'#008F28'")


ll_ChildObject2 = ljson_Option.AddItemObject(ll_ChildArray)
ljson_Option.AddItemString( ll_ChildObject2, "name","'MA5'")
ljson_Option.AddItemString( ll_ChildObject2, "type","'line'")
ljson_Option.AddItemString(ll_ChildObject2, "data", "calculateMA(5)")

ljson_Option.AddItemBoolean( ll_ChildObject2, "smooth", true)
ll_ChildObject3 = ljson_Option.AddItemObject( ll_ChildObject2, "lineStyle")

ljson_Option.AddItemNumber(ll_ChildObject3, "opacity", 0.5)

ls_Option = ljson_Option.GetJsonString()

If IsValid ( ljson_Option ) Then Destroy ( ljson_Option )

Return ls_Option

end function

on w_kline.create
int iCurrent
call super::create
this.dw_1=create dw_1
this.st_17=create st_17
this.st_18=create st_18
this.st_19=create st_19
this.st_21=create st_21
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_1
this.Control[iCurrent+2]=this.st_17
this.Control[iCurrent+3]=this.st_18
this.Control[iCurrent+4]=this.st_19
this.Control[iCurrent+5]=this.st_21
end on

on w_kline.destroy
call super::destroy
destroy(this.dw_1)
destroy(this.st_17)
destroy(this.st_18)
destroy(this.st_19)
destroy(this.st_21)
end on

event open;call super::open;
dw_1.SetTransObject(sqlca)
dw_1.Retrieve()





	
end event

type wb_1 from w_chart_base`wb_1 within w_kline
integer x = 1490
integer y = 352
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
integer y = 352
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

type st_17 from statictext within w_kline
integer x = 55
integer y = 28
integer width = 352
integer height = 64
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

type st_18 from statictext within w_kline
integer x = 50
integer y = 104
integer width = 2235
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
string text = "The tool can read your chart imported from DataWindow without providing raw data. Please "
boolean focusrectangle = false
end type

type st_19 from statictext within w_kline
integer x = 55
integer y = 176
integer width = 1454
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
string text = "note that the generated data table in this case is uneditable. "
boolean focusrectangle = false
end type

type st_21 from statictext within w_kline
integer x = 133
integer y = 256
integer width = 2501
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
string text = "●    For viewing different time period in the chart, you can adjust the Smart Scaling bar below the chart. "
boolean focusrectangle = false
end type


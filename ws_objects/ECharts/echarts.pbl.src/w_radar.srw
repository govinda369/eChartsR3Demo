$PBExportHeader$w_radar.srw
forward
global type w_radar from w_chart_base
end type
type dw_1 from datawindow within w_radar
end type
type st_1 from statictext within w_radar
end type
type st_2 from statictext within w_radar
end type
end forward

global type w_radar from w_chart_base
string tag = "radar"
integer width = 4658
integer height = 2088
boolean border = false
dw_1 dw_1
st_1 st_1
st_2 st_2
end type
global w_radar w_radar

type variables
Boolean  ib_flag = TRUE
end variables

forward prototypes
public function string wf_createoption ()
public subroutine wf_apply ()
end prototypes

public function string wf_createoption ();Long ll_RowCount, ll_RootObject, ll_ChildObject, ll_ChildObject2, ll_ChildObject3, ll_ChildArray, ll_ChildArray2, ll_ChildArray3, ll_i
String ls_Option
JsonGenerator ljson_Option

ljson_Option = Create JsonGenerator
ll_RootObject = ljson_Option.CreateJsonObject()

//Title
ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "title")
ljson_Option.AddItemString(ll_ChildObject, "text", "'" + wb_1.of_Gettitle() + "'")
ljson_Option.AddItemString(ll_ChildObject, "left", "'center'")

//legend
ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "legend")
ll_ChildObject2 = ljson_Option.AddItemString(ll_ChildObject, "orient", "'vertical'")
ll_ChildObject2 = ljson_Option.AddItemString(ll_ChildObject, "left", "'left'")
ll_ChildArray = ljson_Option.AddItemArray(ll_ChildObject, "data")
ljson_Option.AddItemString(ll_ChildArray, "'Allocated Budget'") //series1
ljson_Option.AddItemString(ll_ChildArray, "'Actual Spending'") //series2

//ToolTip
ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "tooltip")

//ToolBox
If wb_1.of_GetToolBox() Then
	ll_ChildObject2 = ljson_Option.AddItemObject(ll_RootObject, "toolbox")
	ll_ChildObject3 = ljson_Option.AddItemObject(ll_ChildObject2, "feature")
	ljson_Option.AddItemObject(ll_ChildObject3, "saveAsImage")
	ljson_Option.AddItemObject(ll_ChildObject3, "dataView")
End If

//radar
ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "radar")
ll_ChildObject2 = ljson_Option.AddItemObject(ll_ChildObject, "name")
ll_ChildObject3 = ljson_Option.AddItemObject(ll_ChildObject2, "textStyle")
ljson_Option.AddItemString(ll_ChildObject3, "color","'#fff'")
ljson_Option.AddItemString(ll_ChildObject3, "backgroudColor","'#999'")
ljson_Option.AddItemNumber(ll_ChildObject3, "borderRadius",3)
ljson_Option.AddItemString(ll_ChildObject3, "padding","[3,5]")

ll_ChildArray = ljson_Option.AddItemArray(ll_ChildObject, "indicator")
ll_ChildObject2 = ljson_Option.AddItemObject(ll_ChildArray)


ljson_Option.AddItemString(ll_ChildObject2, "name","'Sales'")
ljson_Option.AddItemNumber(ll_ChildObject2, "max",6500)

ll_ChildObject2 = ljson_Option.AddItemObject(ll_ChildArray)
ljson_Option.AddItemString(ll_ChildObject2, "name","'Administration'")
ljson_Option.AddItemNumber(ll_ChildObject2, "max",16000)

ll_ChildObject2 = ljson_Option.AddItemObject(ll_ChildArray)
ljson_Option.AddItemString(ll_ChildObject2, "name","'Information Techology'")
ljson_Option.AddItemNumber(ll_ChildObject2, "max",30000)

ll_ChildObject2 = ljson_Option.AddItemObject(ll_ChildArray)
ljson_Option.AddItemString(ll_ChildObject2, "name","'Customer Support'")
ljson_Option.AddItemNumber(ll_ChildObject2, "max",38000)

ll_ChildObject2 = ljson_Option.AddItemObject(ll_ChildArray)
ljson_Option.AddItemString(ll_ChildObject2, "name","'Development'")
ljson_Option.AddItemNumber(ll_ChildObject2, "max",52000)

ll_ChildObject2 = ljson_Option.AddItemObject(ll_ChildArray)
ljson_Option.AddItemString(ll_ChildObject2, "name","'Marketing'")
ljson_Option.AddItemNumber(ll_ChildObject2, "max",25000)


//series
ll_ChildArray = ljson_Option.AddItemArray(ll_RootObject, "series")

//series1
ll_ChildObject2 = ljson_Option.AddItemObject(ll_ChildArray)
ljson_Option.AddItemString(ll_ChildObject2, "type","'radar'")
ljson_Option.AddItemString(ll_ChildObject2, "name","'Budget vs spending'")
ll_ChildArray2 = ljson_Option.AddItemArray(ll_ChildObject2, "data")

ll_ChildObject3 = ljson_Option.AddItemObject(ll_ChildArray2)
ljson_Option.AddItemString(ll_ChildObject3, "name","'Allocated Budget'")
ll_ChildArray3 = ljson_Option.AddItemArray(ll_ChildObject3, "value")
For ll_I = 1 To dw_1.RowCount()
	ljson_Option.AddItemNumber(ll_ChildArray3, dw_1.GetItemNumber(ll_I, 2))
Next

ll_ChildObject3 = ljson_Option.AddItemObject(ll_ChildArray2)
ljson_Option.AddItemString(ll_ChildObject3, "name","'Actual Spending'")
ll_ChildArray3 = ljson_Option.AddItemArray(ll_ChildObject3, "value")
For ll_I = 1 To dw_1.RowCount()
	ljson_Option.AddItemNumber(ll_ChildArray3, dw_1.GetItemNumber(ll_I, 3))
Next

ls_Option = ljson_Option.GetJsonString()

If IsValid ( ljson_Option ) Then DesTroy ( ljson_Option )

Return ls_Option
end function

public subroutine wf_apply ();String ls_Option

//Title
wb_1.of_SetTitle("Comparison of budget and actual expenditure")
//Theme
wb_1.of_SetTheme(gs_EChartsTheme)
//Style
wb_1.of_SetStyle("radar")
//Width
wb_1.of_SetWidth(800)
//Height
wb_1.of_SetHeight(500)
//ToolBox
wb_1.of_SetToolBox(True)
//CreateOption
ls_Option = wf_CreateOption( )
//SetOption
wb_1.of_SetOption(ls_Option)
//Apply
wb_1.of_Apply()

end subroutine

event open;call super::open;dw_1.SetTransObject(sqlca)
dw_1.Retrieve( )

//Retrieve之后获取到的数据，开始读取文件file:///echarts.html
//然后初始化wb_1，初始完毕后执行wb_1事件navigationchanged()

ib_flag = TRUE
end event

on w_radar.create
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

on w_radar.destroy
call super::destroy
destroy(this.dw_1)
destroy(this.st_1)
destroy(this.st_2)
end on

type wb_1 from w_chart_base`wb_1 within w_radar
integer x = 1605
integer y = 116
integer width = 3008
integer height = 1900
end type

event wb_1::navigationprogressindex;call super::navigationprogressindex;IF progressindex = 100 THEN
	IF ib_flag THEN
		ib_flag = FALSE
		wf_apply()
	END IF 
END IF
end event

type dw_1 from datawindow within w_radar
integer x = 41
integer y = 116
integer width = 1522
integer height = 1900
integer taborder = 10
boolean bringtotop = true
string title = "none"
string dataobject = "d_radar"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;dw_1.AcceptText()

wf_apply()
end event

type st_1 from statictext within w_radar
integer x = 503
integer y = 24
integer width = 581
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
alignment alignment = center!
boolean focusrectangle = false
end type

type st_2 from statictext within w_radar
integer x = 2971
integer y = 24
integer width = 535
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


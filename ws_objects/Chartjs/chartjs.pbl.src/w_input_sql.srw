$PBExportHeader$w_input_sql.srw
forward
global type w_input_sql from w_response_base
end type
type sle_value from singlelineedit within w_input_sql
end type
type sle_category from singlelineedit within w_input_sql
end type
type cbx_series from checkbox within w_input_sql
end type
type st_3 from statictext within w_input_sql
end type
type st_2 from statictext within w_input_sql
end type
type st_1 from statictext within w_input_sql
end type
type cb_3 from commandbutton within w_input_sql
end type
type mle_1 from multilineedit within w_input_sql
end type
type cb_2 from commandbutton within w_input_sql
end type
type cb_1 from commandbutton within w_input_sql
end type
type sle_series from singlelineedit within w_input_sql
end type
end forward

global type w_input_sql from w_response_base
integer width = 2057
integer height = 1616
string title = " SQL Syntax"
sle_value sle_value
sle_category sle_category
cbx_series cbx_series
st_3 st_3
st_2 st_2
st_1 st_1
cb_3 cb_3
mle_1 mle_1
cb_2 cb_2
cb_1 cb_1
sle_series sle_series
end type
global w_input_sql w_input_sql

type variables

end variables

on w_input_sql.create
int iCurrent
call super::create
this.sle_value=create sle_value
this.sle_category=create sle_category
this.cbx_series=create cbx_series
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.cb_3=create cb_3
this.mle_1=create mle_1
this.cb_2=create cb_2
this.cb_1=create cb_1
this.sle_series=create sle_series
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.sle_value
this.Control[iCurrent+2]=this.sle_category
this.Control[iCurrent+3]=this.cbx_series
this.Control[iCurrent+4]=this.st_3
this.Control[iCurrent+5]=this.st_2
this.Control[iCurrent+6]=this.st_1
this.Control[iCurrent+7]=this.cb_3
this.Control[iCurrent+8]=this.mle_1
this.Control[iCurrent+9]=this.cb_2
this.Control[iCurrent+10]=this.cb_1
this.Control[iCurrent+11]=this.sle_series
end on

on w_input_sql.destroy
call super::destroy
destroy(this.sle_value)
destroy(this.sle_category)
destroy(this.cbx_series)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.cb_3)
destroy(this.mle_1)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.sle_series)
end on

event open;call super::open;
String 	ls_Json
String 	ls_SQL, ls_Category, ls_Value, ls_Series
Long 	ll_RootObject
JsonParser lnv_JsonParser

ls_Json = Message.StringParm

IF Len(ls_Json) >0 THEN
	lnv_JsonParser = Create JsonParser
	lnv_JsonParser.LoadString(ls_Json)
	ll_RootObject = lnv_JsonParser.GetRootItem()
	//SQL
	ls_SQL =  lnv_JsonParser.GetItemString(ll_RootObject, "SQL")
	mle_1.Text = ls_SQL
	//Category
	ls_Category = lnv_JsonParser.GetItemString(ll_RootObject, "Category")
	sle_category.Text = ls_Category
	//Value
	ls_Value = lnv_JsonParser.GetItemString(ll_RootObject, "Value")
	sle_value.Text = ls_Value
	//Series
	ls_Series = lnv_JsonParser.GetItemString(ll_RootObject, "Series")
	If Len ( ls_Series ) > 0 Then
		cbx_series.Checked = True
		sle_Series.enabled = TRUE
		sle_series.Text = ls_Series
	End If
END IF
end event

event ue_setflag;call super::ue_setflag;//

ieon_resize.of_setflag(cb_1,"2200")
ieon_resize.of_setflag(cb_2,"2200")
ieon_resize.of_setflag(cb_3,"0200")
ieon_resize.of_setflag(cbx_series,"0200")
ieon_resize.of_setflag(st_1,"0000")
ieon_resize.of_setflag(st_2,"0200")
ieon_resize.of_setflag(st_3,"0200")
ieon_resize.of_setflag(sle_category,"0220")
ieon_resize.of_setflag(sle_value,"0220")
ieon_resize.of_setflag(sle_series,"0220")
ieon_resize.of_setflag(mle_1,"0022")
end event

type sle_value from singlelineedit within w_input_sql
integer x = 443
integer y = 808
integer width = 1298
integer height = 100
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
long textcolor = 33554432
string text = "amount"
borderstyle borderstyle = stylelowered!
end type

type sle_category from singlelineedit within w_input_sql
integer x = 443
integer y = 636
integer width = 1298
integer height = 104
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
long textcolor = 33554432
string text = "year"
borderstyle borderstyle = stylelowered!
end type

type cbx_series from checkbox within w_input_sql
integer x = 105
integer y = 988
integer width = 256
integer height = 92
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
long textcolor = 33554432
long backcolor = 67108864
string text = "Series:"
end type

event clicked;IF cbx_series.checked THEN
	sle_series.enabled = TRUE
ELSE
	sle_series.enabled = FALSE
END IF
end event

type st_3 from statictext within w_input_sql
integer x = 105
integer y = 820
integer width = 201
integer height = 92
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
long textcolor = 33554432
long backcolor = 67108864
string text = "Value:"
boolean focusrectangle = false
end type

type st_2 from statictext within w_input_sql
integer x = 105
integer y = 640
integer width = 242
integer height = 92
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
long textcolor = 33554432
long backcolor = 67108864
string text = "Category:"
boolean focusrectangle = false
end type

type st_1 from statictext within w_input_sql
integer x = 110
integer y = 48
integer width = 727
integer height = 64
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
long textcolor = 33554432
long backcolor = 67108864
string text = "Input SQL syntax manually:"
boolean focusrectangle = false
end type

type cb_3 from commandbutton within w_input_sql
integer x = 105
integer y = 1316
integer width = 448
integer height = 112
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
string text = "Preview Data"
end type

event clicked;String		ls_SQL, ls_Category, ls_Value, ls_Table

ls_Category = sle_category.text
ls_Value = sle_value.text

ls_SQL = Trim(mle_1.text)
OpenWithParm(w_predata, ls_SQL)
end event

type mle_1 from multilineedit within w_input_sql
integer x = 105
integer y = 132
integer width = 1838
integer height = 368
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
long textcolor = 33554432
string text = "SELECT year, quarter,  code,   amount   FROM fin_data"
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event modified;//String		ls_SQL, ls_DWSyntax, ls_Error, ls_Category
//Long		ll_col_count, ll_i
//DataStore lds_data
//
//ls_SQL = Trim(mle_1.text)
//
//IF Len(ls_SQL) > 0 THEN
//	lds_data = Create DataStore
//	ls_DWSyntax = SQLCA.SyntaxFromSQL(ls_SQL, 'style(type=grid)', ls_Error)
//	IF Len(ls_Error) >0 THEN
//		Messagebox("Caution", "SyntaxFromSQL caused these errors: " + ls_Error )
//		RETURN
//	END IF
//	
//	lds_data.Create(ls_DWSyntax, ls_Error)
//	IF Len(ls_Error) >0 THEN
//		Messagebox("Caution", "SyntaxFromSQL caused these errors: " + ls_Error)
//		RETURN
//	END IF
//	lds_data.SetTransObject(SQLCA)
//	lds_data.Retrieve()
//	
//	ll_col_count = Long(lds_data.Describe("DataWindow.Column.Count"))
//	
//	FOR ll_i = 1 TO ll_col_count
//		ls_Category = lds_data.Describe("#"+String(ll_i)+".Name")
//		messagebox("cate", ls_Category)
//	NEXT
//END IF
end event

type cb_2 from commandbutton within w_input_sql
integer x = 1541
integer y = 1316
integer width = 402
integer height = 112
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
string text = "Cancel"
end type

event clicked;Close( Parent )
end event

type cb_1 from commandbutton within w_input_sql
integer x = 1102
integer y = 1316
integer width = 402
integer height = 112
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
string text = "OK"
boolean default = true
end type

event clicked;String		ls_SQL, ls_Category, ls_Value, ls_Json, ls_Series
JsonGenerator lnv_JsonGenerator 
Long ll_RootObject

ls_SQL = mle_1.text
If Len ( ls_SQL ) <= 0 Then
	MessageBox( "Tips", "Please input SQL Syntax!" )
	Return
End If
ls_Category = sle_category.text
If Len ( ls_Category ) <= 0 Then
	MessageBox( "Tips", "Please input Category!" )
	Return
End If
ls_Value =sle_value.text
If Len ( ls_Value ) <= 0 Then
	MessageBox( "Tips", "Please input Value!" )
	Return
End If

If cbx_series.Checked Then
	ls_Series = sle_series.Text	
	If Len ( ls_Series ) <= 0 Then
		MessageBox( "Tips", "Please input Series!" )
		Return
	End If
End If

lnv_JsonGenerator = Create JsonGenerator

ll_RootObject = lnv_JsonGenerator.CreateJsonObject ()
lnv_JsonGenerator.AddItemString(ll_RootObject, "SQL", ls_SQL)
lnv_JsonGenerator.AddItemString(ll_RootObject, "Category", ls_Category)
lnv_JsonGenerator.AddItemString(ll_RootObject, "Value", ls_Value)
lnv_JsonGenerator.AddItemString(ll_RootObject, "Series", ls_Series)

ls_Json = lnv_JsonGenerator.GetJsonString()
IF IsValid(  lnv_JsonGenerator ) THEN Destroy ( lnv_JsonGenerator)


CloseWithReturn(parent, ls_Json)
end event

type sle_series from singlelineedit within w_input_sql
integer x = 443
integer y = 980
integer width = 1298
integer height = 104
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
long textcolor = 33554432
boolean enabled = false
string text = "quarter"
borderstyle borderstyle = stylelowered!
end type


$PBExportHeader$w_select_table.srw
forward
global type w_select_table from w_response_base
end type
type cbx_series from checkbox within w_select_table
end type
type st_5 from statictext within w_select_table
end type
type mle_1 from multilineedit within w_select_table
end type
type ddlb_3 from dropdownlistbox within w_select_table
end type
type ddlb_2 from dropdownlistbox within w_select_table
end type
type st_values from statictext within w_select_table
end type
type ddlb_1 from dropdownlistbox within w_select_table
end type
type st_category from statictext within w_select_table
end type
type cb_1 from commandbutton within w_select_table
end type
type cb_2 from commandbutton within w_select_table
end type
type cb_3 from commandbutton within w_select_table
end type
type st_1 from statictext within w_select_table
end type
type st_2 from statictext within w_select_table
end type
type dw_tables from datawindow within w_select_table
end type
type dw_columns from datawindow within w_select_table
end type
end forward

global type w_select_table from w_response_base
integer width = 2473
integer height = 2216
string title = "Select Table"
boolean clientedge = true
cbx_series cbx_series
st_5 st_5
mle_1 mle_1
ddlb_3 ddlb_3
ddlb_2 ddlb_2
st_values st_values
ddlb_1 ddlb_1
st_category st_category
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
st_1 st_1
st_2 st_2
dw_tables dw_tables
dw_columns dw_columns
end type
global w_select_table w_select_table

type variables
String is_Table, is_Columns
Boolean ib_AutoCommit
end variables

forward prototypes
public subroutine wf_replace (ref string as_string, string as_str1, string as_str2)
public subroutine wf_split (string as_string, string as_str1, ref string as_result[])
end prototypes

public subroutine wf_replace (ref string as_string, string as_str1, string as_str2);//wf_replace(as_string,as_str1,as_str2)
Long 	start_pos

If as_str1 = as_str2 Then Return

start_pos = Pos(as_string, as_str1)
DO WHILE start_pos > 0		
	 as_string = Replace(as_string, start_pos, Len(as_str1), as_str2)
	start_pos = Pos(as_string, as_str1, start_pos)						
LOOP
end subroutine

public subroutine wf_split (string as_string, string as_str1, ref string as_result[]);String ls_temp[]
Long 	start_pos, ll_Count

If Not Len ( as_str1 ) > 0 Then Return 

start_pos = Pos(as_string, as_str1)

DO WHILE start_pos > 1	
	ll_Count ++
	If start_pos = 1 Then		
		ls_temp[ll_Count] = ""
		as_string = Mid ( as_string, 2 )
		start_pos = Pos(as_string, as_str1)
	Else
		ls_temp[ll_Count] = Mid ( as_string, 1, start_pos -1 )
		as_string = Mid ( as_string, start_pos + 1 )
		start_pos = Pos(as_string, as_str1)
	End If				
LOOP

If Len ( as_string ) > 0 Then
	ll_Count ++
	ls_temp[ll_Count] = as_string
End If

as_result = ls_temp

end subroutine

on w_select_table.create
int iCurrent
call super::create
this.cbx_series=create cbx_series
this.st_5=create st_5
this.mle_1=create mle_1
this.ddlb_3=create ddlb_3
this.ddlb_2=create ddlb_2
this.st_values=create st_values
this.ddlb_1=create ddlb_1
this.st_category=create st_category
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.st_1=create st_1
this.st_2=create st_2
this.dw_tables=create dw_tables
this.dw_columns=create dw_columns
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cbx_series
this.Control[iCurrent+2]=this.st_5
this.Control[iCurrent+3]=this.mle_1
this.Control[iCurrent+4]=this.ddlb_3
this.Control[iCurrent+5]=this.ddlb_2
this.Control[iCurrent+6]=this.st_values
this.Control[iCurrent+7]=this.ddlb_1
this.Control[iCurrent+8]=this.st_category
this.Control[iCurrent+9]=this.cb_1
this.Control[iCurrent+10]=this.cb_2
this.Control[iCurrent+11]=this.cb_3
this.Control[iCurrent+12]=this.st_1
this.Control[iCurrent+13]=this.st_2
this.Control[iCurrent+14]=this.dw_tables
this.Control[iCurrent+15]=this.dw_columns
end on

on w_select_table.destroy
call super::destroy
destroy(this.cbx_series)
destroy(this.st_5)
destroy(this.mle_1)
destroy(this.ddlb_3)
destroy(this.ddlb_2)
destroy(this.st_values)
destroy(this.ddlb_1)
destroy(this.st_category)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.st_1)
destroy(this.st_2)
destroy(this.dw_tables)
destroy(this.dw_columns)
end on

event open;call super::open;Long		ll_ret, ll_tab_RowCount, ll_col_RowCount
String 	ls_Json,ls_SQL, ls_Category, ls_Value, ls_Series, ls_Table, ls_Columns, ls_Column
Long 		ll_RootObject, ll_Find, ll_I, ll_ScrollToRow
String 	ls_cols[]
JsonParser lnv_JsonParser

ls_Json = Message.StringParm


//Open
ib_AutoCommit = SQLCA.AutoCommit
If Not ib_AutoCommit Then
	SQLCA.AutoCommit = TRUE
End If

dw_tables.SetTransObject(sqlca)
dw_columns.SetTransObject(sqlca)

IF f_set_table_select(dw_tables) <0 THEN
	Messagebox("Error", &
					"Unable to set SQL select statement for tables list", &
					StopSign!)
	this.Triggerevent( Close! )
END IF

ll_ret  = dw_tables.Retrieve( )
IF ll_ret < 1 THEN
	Messagebox("Retrieve renturn code is:", ll_ret)
END IF

IF Len(ls_Json) >0 THEN
	lnv_JsonParser = Create JsonParser
	lnv_JsonParser.LoadString(ls_Json)
	ll_RootObject = lnv_JsonParser.GetRootItem()
	
	//Table
	ls_Table = lnv_JsonParser.GetItemString(ll_RootObject, "Table")
	ll_Find = dw_Tables.Find("tname='" + ls_Table + "'", 1, dw_Tables.RowCount())
	If ll_Find > 0 Then
		ll_ScrollToRow = ll_Find
		dw_tables.event clicked(0, 0, ll_Find, dw_tables.object.tname)
	End If
	//Column
	ls_Columns = lnv_JsonParser.GetItemString(ll_RootObject, "Columns")
	If Pos ( ls_Columns, "," ) > 0 Then
		wf_split(ls_Columns,",", ls_cols)
		For ll_I = 1 To UpperBound( ls_cols )
			ls_Column = ls_Cols[ll_I]
			ll_Find = dw_columns.Find("cname='" + ls_Column + "'", 1, dw_columns.RowCount())
			If ll_Find > 0 Then
				dw_columns.event clicked(0, 0, ll_Find, dw_columns.object.cname)
			End If
		Next
	Else
		ls_Column = ls_Columns
		ll_Find = dw_columns.Find("cname='" + ls_Column + "'", 1, dw_columns.RowCount())
		If ll_Find > 0 Then
			dw_columns.event clicked(0, 0, ll_Find, dw_columns.object.cname)
		End If
	End If
	//Category
	ls_Category = lnv_JsonParser.GetItemString(ll_RootObject, "Category")
	ddlb_1.Text = ls_Category
	//Values
	ls_Value = lnv_JsonParser.GetItemString(ll_RootObject, "Value")
	ddlb_2.Text = ls_Value
	//Series
	ls_Series = lnv_JsonParser.GetItemString(ll_RootObject, "Series")
	If Len ( ls_Series ) > 0 Then
		cbx_series.Checked = True
		ddlb_3.Enabled = True
		ddlb_3.Text = ls_Series
	End If
Else
	/*default select*/
	//Table
	ls_Table = "fin_data"
	ll_Find = dw_Tables.Find("tname='" + ls_Table + "'", 1, dw_Tables.RowCount())
	If ll_Find > 0 Then
		ll_ScrollToRow = ll_Find
		dw_tables.event clicked(0, 0, ll_Find, dw_tables.object.tname)
	End If
	//Column
	ls_Columns = "year,quarter,amount"
	If Pos ( ls_Columns, "," ) > 0 Then
		wf_split(ls_Columns,",", ls_cols)
		For ll_I = 1 To UpperBound( ls_cols )
			ls_Column = ls_Cols[ll_I]
			ll_Find = dw_columns.Find("cname='" + ls_Column + "'", 1, dw_columns.RowCount())
			If ll_Find > 0 Then
				dw_columns.event clicked(0, 0, ll_Find, dw_columns.object.cname)
			End If
		Next
	End If
	//Category
	ls_Category = "year"
	ddlb_1.Text = ls_Category
	//Values
	ls_Value = "amount"
	ddlb_2.Text = ls_Value
	//Series
	ls_Series = "quarter"
	ddlb_3.Text = ls_Series	
END IF

dw_Tables.post ScrollToRow( ll_ScrollToRow )





end event

event close;call super::close;//
If Not ib_AutoCommit Then
	SQLCA.AutoCommit = ib_AutoCommit
End If
end event

type cbx_series from checkbox within w_select_table
integer x = 78
integer y = 1748
integer width = 256
integer height = 92
integer textsize = -10
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
	ddlb_3.enabled = TRUE
ELSE
	ddlb_3.enabled = FALSE
END IF
end event

type st_5 from statictext within w_select_table
integer x = 73
integer y = 964
integer width = 864
integer height = 92
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
long textcolor = 33554432
long backcolor = 67108864
string text = "Generate SQL Syntax :"
boolean focusrectangle = false
end type

type mle_1 from multilineedit within w_select_table
integer x = 73
integer y = 1056
integer width = 2281
integer height = 324
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean autovscroll = true
borderstyle borderstyle = stylelowered!
end type

type ddlb_3 from dropdownlistbox within w_select_table
integer x = 389
integer y = 1744
integer width = 1499
integer height = 424
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
long textcolor = 33554432
boolean enabled = false
boolean sorted = false
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type ddlb_2 from dropdownlistbox within w_select_table
integer x = 389
integer y = 1580
integer width = 1499
integer height = 424
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
long textcolor = 33554432
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type st_values from statictext within w_select_table
integer x = 73
integer y = 1584
integer width = 206
integer height = 92
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
long textcolor = 33554432
long backcolor = 67108864
string text = "Values:"
alignment alignment = center!
boolean focusrectangle = false
end type

type ddlb_1 from dropdownlistbox within w_select_table
integer x = 389
integer y = 1416
integer width = 1499
integer height = 424
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type st_category from statictext within w_select_table
integer x = 73
integer y = 1420
integer width = 265
integer height = 92
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
long textcolor = 33554432
long backcolor = 67108864
string text = "Category:"
alignment alignment = center!
boolean focusrectangle = false
end type

type cb_1 from commandbutton within w_select_table
integer x = 1531
integer y = 1952
integer width = 402
integer height = 112
integer taborder = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
string text = "OK"
boolean default = true
end type

event clicked;String 	ls_SQL, ls_Category, ls_Values, ls_Series, ls_Json
Long 		ll_RootObject
JsonGenerator lnv_JsonGenerator


ls_SQL=Trim(mle_1.text)
IF IsNull(ls_SQL) Or ls_SQL = "" THEN
	Messagebox("Tips","SQL syntax is empty!")
	Return
END IF

ls_Category = ddlb_1.Text
IF IsNull(ls_Category) Or ls_Category = "" THEN
	Messagebox("Tips","Category is empty!")
	Return
END IF

ls_Values = ddlb_2.Text
IF IsNull(ls_Values) Or ls_Values = "" THEN
	Messagebox("Tips","Values is empty!")
	Return
END IF

If cbx_Series.Checked Then
	ls_Series = ddlb_3.Text
	IF IsNull(ls_Series) Or ls_Series = "" THEN
		Messagebox("Tips","Series is empty!")
		Return
	END IF
End If

lnv_JsonGenerator = Create JsonGenerator

ll_RootObject = lnv_JsonGenerator.CreateJsonObject ()
lnv_JsonGenerator.AddItemString(ll_RootObject, "SQL", ls_SQL)
lnv_JsonGenerator.AddItemString(ll_RootObject, "Category", ls_Category)
lnv_JsonGenerator.AddItemString(ll_RootObject, "Value", ls_Values)
lnv_JsonGenerator.AddItemString(ll_RootObject, "Series", ls_Series)
lnv_JsonGenerator.AddItemString(ll_RootObject, "Table", is_Table)
lnv_JsonGenerator.AddItemString(ll_RootObject, "Columns", is_Columns)

ls_Json = lnv_JsonGenerator.GetJsonString()
IF IsValid(  lnv_JsonGenerator ) THEN Destroy ( lnv_JsonGenerator)

//Return the SQL statement to w_table
CloseWithReturn(w_select_table, ls_Json)


end event

type cb_2 from commandbutton within w_select_table
integer x = 1970
integer y = 1952
integer width = 402
integer height = 112
integer taborder = 90
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
string text = "Cancel"
end type

event clicked;Close( Parent )
end event

type cb_3 from commandbutton within w_select_table
integer x = 96
integer y = 1952
integer width = 448
integer height = 112
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
string text = "Preview Data"
end type

event clicked;String 	ls_SQL

ls_SQL = Trim( mle_1.Text)

OpenWithparm(w_predata, ls_SQL)

end event

type st_1 from statictext within w_select_table
integer x = 73
integer y = 44
integer width = 498
integer height = 68
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
long textcolor = 41943040
long backcolor = 74481808
string text = "&Tables:"
end type

type st_2 from statictext within w_select_table
integer x = 1266
integer y = 48
integer width = 553
integer height = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
long textcolor = 41943040
long backcolor = 74481808
string text = "&Columns:"
end type

type dw_tables from datawindow within w_select_table
integer x = 73
integer y = 128
integer width = 1102
integer height = 800
integer taborder = 10
string dataobject = "d_table_list"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;///////////////////////////////////////////////////////////////////////////////////////////////////////
//Clicked script for dw_tables
///////////////////////////////////////////////////////////////////////////////////////////////////////

// if user clicks on no row do not continue processing
If row = 0 Then Return	

// Select the clicked row
dw_tables.SelectRow(0, False)
dw_tables.SelectRow(row, True)

// f_set_column_select is a user function to modify the select used by
// the column selection data window, based on which DBMS we're connected
// to; This function adjusts to the differences in catalog structures
// between the DBMS's

//is_Table = dw_tables.Object.data[row, 1]
is_Table = dw_tables.GetItemString(row, 1)

If f_set_column_select(dw_columns,is_table) < 0 Then
	MessageBox("Error", &
					"Unable to Set SQL Select statement For Columns list", &
					StopSign!)
	Return
End If

/*When switching the table, the drop-down box and SQL statement must be cleared*/
ddlb_1.Reset( )
ddlb_2.Reset( )
ddlb_3.Reset( )
mle_1.text =""
is_Columns = ""

dw_columns.Retrieve( )	  /* Note:  No Retrieve argument is used, 
									  since F_SET_COLUMN_SELECT inserts
									  the proper table name */

end event

type dw_columns from datawindow within w_select_table
integer x = 1266
integer y = 132
integer width = 1102
integer height = 800
integer taborder = 20
string dataobject = "d_column_list"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;//////////////////////////////////////////////////////////////////////////////////////////////////////////
//Clicked script for dw_columns
//////////////////////////////////////////////////////////////////////////////////////////////////////////
String  ls_string, ls_column, ls_syntax
Long  ll_index, ll_type
Boolean lb_select, lb_number



// If user clicks on no row do not continue processing
If row = 0 Then Return	

ls_column = dw_columns.GetItemString(row,1)

// As a column is selected, add it to the list in the select
//If already selected, turn off selection
If dw_columns.IsSelected(row) then
	dw_columns.SelectRow(row, False)
	//is_Columns
	If (Pos(is_Columns,"," + ls_column ) > 0 ) Then
		wf_Replace( is_Columns, "," + ls_column, "" )	
	End If
	If (Pos(is_Columns,ls_column + "," ) > 0 ) Then
		wf_Replace( is_Columns, ls_column + ",", "" )	
	End If
	If is_Columns = ls_column Then
		is_Columns = ""
	End If	
Else
	dw_columns.SelectRow(row, True)
	//is_Columns
	If Len(is_Columns) > 0 Then
		is_Columns += "," + ls_column
	Else
		is_Columns = ls_column
	End If
	lb_select = true  //add column
End If

IF is_Columns <> "" THEN
	ls_syntax = "Select " + is_columns +" from " + is_Table
	mle_1.Text =  ls_syntax
ELSE
	mle_1.Text =  ""
END IF

/*Get field*/
SELECT "dbo"."syscolumns"."type"  
 INTO :ll_type
 FROM "dbo"."syscolumns",   
			"dbo"."sysobjects",   
			"dbo"."systypes"  
WHERE ( "dbo"."syscolumns"."id" = "dbo"."sysobjects"."id" ) and
		( ( "dbo"."sysobjects"."type" = 'U' ) AND  
		("dbo"."sysobjects"."name" = :is_table) AND
		("dbo"."syscolumns"."name" = :ls_column ));


CHOOSE CASE ll_type
	CASE 45, 37, 48, 52, 56, 62, 63, 38, &
			109, 59, 55, 106, 108, 122, 58
		lb_number = true
END CHOOSE


/*Category (x axis) drop-down options*/
IF lb_select THEN
	ddlb_1.Additem(ls_column)
ELSE
	ll_index = ddlb_1.FindItem(ls_column, 0)
	IF ll_index > 0 THEN
		ddlb_1.Deleteitem( ll_index)
		IF ddlb_1.text = ls_column Then
			ddlb_1.text =""
		End If
	END IF
END IF
	

/*Values (y-axis) drop-down options*/
IF lb_select THEN
	IF lb_number THEN
		ddlb_2.AddItem(ls_column)
		ls_string = "Sum(" + ls_column + ")"
		ddlb_2.AddItem(ls_string)
	ELSE
		ls_string = "Count("+ ls_column +")"
		ddlb_2.Additem( ls_string )
	END IF
ELSE        //Select when there is no click (highlighted)
	IF lb_number THEN
		ll_index = ddlb_2.Finditem(ls_column, 0)
		IF ll_index > 0 THEN
			ddlb_2.Deleteitem( ll_index)
			IF ddlb_2.text = ls_column Then
				ddlb_2.text =""
			End If
		END IF
		ll_index = ddlb_2.Finditem("Sum(" + ls_column + ")", 0)
		IF ll_index > 0 THEN
			ddlb_2.Deleteitem( ll_index)
			IF ddlb_2.text = "Sum(" + ls_column + ")" Then
				ddlb_2.text =""
			End If
		END IF
	ELSE
		ll_index = ddlb_2.Finditem("Count(" + ls_column + ")", 0)
		IF ll_index > 0 THEN
			ddlb_2.Deleteitem( ll_index)
			IF ddlb_2.text = "Count(" + ls_column + ")" Then
				ddlb_2.text =""
			End If
		END IF
	END IF
END IF
		

/*Series drop-down options*/
IF lb_select THEN
	ddlb_3.Additem(ls_column)
ELSE
	ll_index = ddlb_3.FindItem(ls_column, 0)
	IF ll_index > 0 THEN
		ddlb_3.Deleteitem( ll_index)
		IF ddlb_3.text = ls_column Then
			ddlb_3.text =""
		End If
	END IF
END IF



end event


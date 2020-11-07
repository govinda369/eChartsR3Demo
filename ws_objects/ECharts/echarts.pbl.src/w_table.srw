$PBExportHeader$w_table.srw
forward
global type w_table from w_chart_base
end type
end forward

global type w_table from w_chart_base
string tag = "table"
integer width = 4658
integer height = 2088
boolean border = false
event ue_select_table ( )
end type
global w_table w_table

type variables
String is_Json, is_Style
end variables

forward prototypes
public subroutine wf_sql_datastore ()
public subroutine wf_sql_datastore (string as_sql, string as_style)
public subroutine wf_selecttable ()
end prototypes

event ue_select_table();
wf_SelectTable( )
end event

public subroutine wf_sql_datastore ();
end subroutine

public subroutine wf_sql_datastore (string as_sql, string as_style);
String ls_Option, ls_Json,  ls_Title, ls_Graphtype, ls_Theme,  ls_Category, ls_Value, ls_SQL, ls_Series 
Long 	ll_RootObject
Boolean lb_ToolBox

JsonParser lnv_JsonParser

lnv_JsonParser = Create JsonParser

ls_Json = as_style
lnv_JsonParser.LoadString(ls_Json)
ll_RootObject = lnv_JsonParser.GetRootItem()

//title
ls_Title = lnv_JsonParser.GetItemString(ll_RootObject, "Title")
//graphtype
ls_GraphType = lnv_JsonParser.GetItemString(ll_RootObject, "GraphType")
//theme
ls_Theme = lnv_JsonParser.GetItemString(ll_RootObject, "Theme")
//toolbox
lb_ToolBox = lnv_JsonParser.GetItemBoolean(ll_RootObject, "ToolBox")

lnv_JsonParser = Create JsonParser
ls_Json = as_sql
lnv_JsonParser.LoadString(ls_Json)
ll_RootObject = lnv_JsonParser.GetRootItem()
//SQL
ls_SQL =  lnv_JsonParser.GetItemString(ll_RootObject, "SQL")
//Category
ls_Category = lnv_JsonParser.GetItemString(ll_RootObject, "Category")
//Value
ls_Value = lnv_JsonParser.GetItemString(ll_RootObject, "Value")
//Series
ls_Series = lnv_JsonParser.GetItemString(ll_RootObject, "Series")
//Title
IF ls_Title <> "" THEN
	wb_1.of_SetTitle(ls_Title)
END IF
//Theme 
IF ls_Theme <> "" THEN
	wb_1.of_SetTheme(ls_Theme)
END IF
//GraphType
IF ls_GraphType <>"" THEN
	wb_1.of_SetStyle(lower(ls_GraphType))
END IF
//ToolBox
wb_1.of_SetToolBox(lb_ToolBox)
//CreateOption
If Len(ls_Series) > 0 Then
	ls_Option = wb_1.of_createoption_series( ls_SQL, ls_Category, ls_Value, ls_Series )
Else
	ls_Option = wb_1.of_CreateOption( ls_SQL, ls_Category, ls_Value )
End If
//SetOption
wb_1.of_SetOption(ls_Option)
//Apply
SetReDraw( False )
wb_1.of_Apply()
SetReDraw( True )

end subroutine

public subroutine wf_selecttable ();String ls_Json

OpenWithParm(w_select_table, is_Json)
ls_Json = Message.StringParm

IF Len(ls_Json) > 0 THEN
	is_Json = ls_Json
	wf_sql_datastore(is_Json, is_Style)
END IF
end subroutine

on w_table.create
call super::create
end on

on w_table.destroy
call super::destroy
end on

event open;call super::open;/*set default graph type and generate json string*/
String ls_Title, ls_GraphType, ls_Theme
Long ll_Height, ll_Width
Boolean lb_ToolBox, lb_DataZoom
Long ll_RootObject
JsonGenerator ljson_str

ljson_str = Create JsonGenerator
ll_RootObject = ljson_str.CreateJsonObject()

ls_Title = "Default title"
ls_GraphType = gs_GraphType
ls_Theme = gs_EChartsTheme
ll_Height = 500
ll_Width = 800
lb_ToolBox = True
lb_DataZoom = True

ljson_str.AddItemString(ll_RootObject, "Title", ls_Title)
ljson_str.AddItemString(ll_RootObject, "GraphType", ls_GraphType)
ljson_str.AddItemString(ll_RootObject, "Theme", ls_Theme)
ljson_str.AddItemNumber(ll_RootObject, "Height", ll_Height)
ljson_str.AddItemNumber(ll_RootObject, "Width", ll_Width)
ljson_str.AddItemBoolean(ll_RootObject, "ToolBox", lb_Toolbox)
ljson_str.AddItemBoolean(ll_RootObject, "DataZoom", lb_Datazoom)

is_Style = ljson_str.GetJsonString()

IF IsValid( ljson_str ) THEN Destroy (ljson_str)

wf_SelectTable( )
end event

event ue_setoption;IF Len (as_arg) > 0 Then
	is_Style = as_arg
	wf_sql_datastore(is_Json, is_Style)
End If
end event

event activate;
parentwindow().dynamic post event ue_refresh_visible(is_Style) 
end event

type wb_1 from w_chart_base`wb_1 within w_table
integer x = 9
integer y = 8
integer width = 4645
integer height = 1976
end type


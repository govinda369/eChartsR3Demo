$PBExportHeader$w_datawindow.srw
forward
global type w_datawindow from w_chart_base
end type
end forward

global type w_datawindow from w_chart_base
string tag = "datawindow"
integer width = 4658
integer height = 2088
boolean border = false
event ue_select_dataobject ( )
end type
global w_datawindow w_datawindow

type variables
String is_Object, is_Style

end variables

forward prototypes
public subroutine wf_sql_datastore (string as_object, string as_style)
public subroutine wf_selectdataobject ()
end prototypes

event ue_select_dataobject();wf_SelectDataObject ( )
end event

public subroutine wf_sql_datastore (string as_object, string as_style);String ls_Option, ls_Json, ls_key, ls_Title, ls_Graphtype, ls_Theme, ls_style, ls_DWSyntax, ls_Error
Long 	ll_RootObject,ll_ChildObject, ll_ChildArray, ll_ChildArray2,ll_ChildObject2,ll_ChildObject3, ll_ChildArray3, ll_ChildObject4, ll_i, ll_j
Boolean lb_is3D
JsonGenerator ljson_Option
JsonParser lnv_JsonParser
String ls_Data

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
//is3D
lb_is3D = lnv_JsonParser.GetItemBoolean(ll_RootObject, "is3D")

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
//is3D
wb_1.of_Setis3D(lb_is3D)
//CrateData
ls_data = wb_1.of_CreateData_DataObject(as_object)
wb_1.of_SetData(ls_data)
//CreateOption
ls_Option = wb_1.of_CreateOption( )
//SetOption
wb_1.of_SetOption(ls_Option)
//Apply
wb_1.of_Apply()	

end subroutine

public subroutine wf_selectdataobject ();/*Get ls_Object to generate chart*/
String ls_Object
Open(w_select_dataobject)

//Through Message.StringParm and CloseWithReturn
//Realize parent window and child window pass value

ls_Object = Message.StringParm

IF Len(ls_Object) > 0 THEN
	is_Object = ls_Object
	wf_sql_datastore(is_Object, is_Style)
END IF
end subroutine

on w_datawindow.create
call super::create
end on

on w_datawindow.destroy
call super::destroy
end on

event open;call super::open;String ls_Title, ls_GraphType, ls_Theme
Long ls_Height, ls_Width
Boolean ls_is3D, ls_DataZoom
DataStore lds_Data

Long ll_RootObject
JsonGenerator ljson_str
ljson_str = Create JsonGenerator
ll_RootObject = ljson_str.CreateJsonObject()

ls_Title = "Default title"
ls_GraphType = gs_GraphType
ls_Theme = gs_EChartsTheme
ls_Height = 500
ls_Width = 800
ls_is3D = gb_is3D
ls_DataZoom = True

ljson_str.AddItemString(ll_RootObject, "Title", ls_Title)
ljson_str.AddItemString(ll_RootObject, "GraphType", ls_GraphType)
ljson_str.AddItemString(ll_RootObject, "Theme", ls_Theme)
ljson_str.AddItemNumber(ll_RootObject, "Height", ls_Height)
ljson_str.AddItemNumber(ll_RootObject, "Width", ls_Width)
ljson_str.AddItemBoolean(ll_RootObject, "is3D", ls_is3D)
ljson_str.AddItemBoolean(ll_RootObject, "DataZoom", ls_Datazoom)


is_Style = ljson_str.GetJsonString()

IF IsValid( ljson_str ) THEN Destroy (ljson_str)

wf_SelectDataObject ( )
end event

event ue_setoption;
IF Len (as_arg) > 0 THEN
	is_Style = as_arg
	wf_sql_datastore(is_Object, is_Style)
END IF


end event

event activate;parentwindow().dynamic post event ue_refresh_visible(is_Style) 
end event

type wb_1 from w_chart_base`wb_1 within w_datawindow
integer x = 9
integer y = 8
integer width = 4645
integer height = 1976
string defaulturl = "file:///charts3D.html"
end type


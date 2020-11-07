$PBExportHeader$w_mdi.srw
forward
global type w_mdi from window
end type
type mdi_1 from mdiclient within w_mdi
end type
type rbb_1 from ribbonbar within w_mdi
end type
end forward

global type w_mdi from window
string tag = "mdiapp.xml"
integer width = 3666
integer height = 2244
boolean titlebar = true
string title = "Google Charts Demo"
string menuname = "m_menu"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
windowtype windowtype = mdihelp!
windowstate windowstate = maximized!
long backcolor = 67108864
string icon = "png\echarts.ico"
boolean center = true
event ue_select_syntax ( )
event ue_select_table ( )
event ue_select_dataobject ( )
event ue_refresh_visible ( string as_arg )
event ue_setoption ( string as_option )
event ue_print ( )
event ue_viewurl ( )
event ue_viewsource ( )
event ue_viewoption ( )
event ue_viewdata ( )
mdi_1 mdi_1
rbb_1 rbb_1
end type
global w_mdi w_mdi

type variables

end variables

forward prototypes
public subroutine wf_add_ribbonbar_history (string as_name, string as_picturename, string as_tag)
public subroutine wf_add_ribbonbar_window (string as_name, string as_picturename, string as_tag)
public subroutine wf_del_ribbonbar_window (string as_name, string as_flag)
public subroutine wf_refresh_ribbonbar_window (string as_name, string as_tag)
public subroutine wf_visible_ribbonbar (string as_tag, string as_option, boolean ab_w)
public function string wf_getoption ()
public function integer wf_setvisible (string as_type, string as_tag, boolean ab_visible)
public function string wf_getvalue (string as_type, string as_tag)
public function integer wf_setchecked (string as_tag)
public function long wf_setvalue (string as_type, string as_tag, string as_value)
end prototypes

event ue_select_syntax();//call ue_select_syntax
window w
w = getfirstsheet()

If IsValid(w) Then
	w.TriggerEvent ("ue_select_syntax")
End If
end event

event ue_select_table();//call ue_select_table
window w
w = getfirstsheet()

If IsValid(w) Then
	w.TriggerEvent ("ue_select_table")
End If

end event

event ue_select_dataobject();//call ue_select_dataobject
window w
w = getfirstsheet()

If IsValid(w) Then
	w.TriggerEvent ("ue_select_dataobject")
End If
end event

event ue_refresh_visible(string as_arg);//call ue_refresh_visible
window w
w = getfirstsheet()

If IsValid(w) Then
	wf_refresh_ribbonbar_window(w.tag, w.tag)
	post wf_Visible_RibbonBar(w.tag, as_arg, true)
Else
	wf_Visible_RibbonBar("", "", false)
End If




end event

event ue_setoption(string as_option);//call ue_setoption
JsonParser lnv_JsonParser
Long ll_RootObject, ll_Height, ll_Width
String ls_Json, ls_key, ls_Title, ls_GraphType, ls_Theme
Boolean ls_Toolbox

w_chart_base w
w = getfirstsheet()

//Pass parameters:as_option to the child window
If IsValid(w) Then	 	
	w.Event ue_setoption(as_option)
End If
end event

event ue_print();//call ue_print
window w
w = getfirstsheet()

If IsValid(w) Then
	w.TriggerEvent ("ue_print")
End If
end event

event ue_viewurl();//call ue_viewurl
window w
w = getfirstsheet()

If IsValid(w) Then
	w.TriggerEvent ("ue_viewurl")
End If
end event

event ue_viewsource();//call ue_viewsource
window w
w = getfirstsheet()

If IsValid(w) Then
	w.TriggerEvent ("ue_viewsource")
End If
end event

event ue_viewoption();//call ue_viewoption
window w
w = getfirstsheet()

If IsValid(w) Then
	w.TriggerEvent ("ue_viewoption")
End If
end event

event ue_viewdata();//call ue_viewoption
window w
w = getfirstsheet()

If IsValid(w) Then
	w.TriggerEvent ("ue_viewdata")
End If
end event

public subroutine wf_add_ribbonbar_history (string as_name, string as_picturename, string as_tag);
RibbonLargeButtonItem 	lr_LargeButton
RibbonMenu 				lr_Menu
RibbonMenuItem 			lr_MenuItem, lr_MenuItemNew, lr_MenuRecentItem
RibbonApplicationButtonItem 	lr_AppButton
RibbonApplicationMenu 	lr_AppMenu

Integer 	li_return
Long 		ll_Count, ll_I, ll_Handle
String 	ls_PictureName

ls_PictureName = as_picturename

If rbb_1.GetItemByTag( "History", lr_LargeButton ) = 1 Then
	If rbb_1.GetMenubybuttonhandle( lr_LargeButton.itemhandle, lr_Menu ) = 1 Then
		ll_Count = lr_Menu.GetItemCount( )
		//Find & Delete
		For ll_I = ll_Count to 1 Step -1
			li_return = lr_Menu.Getitem( ll_I , lr_MenuItem)
			If lr_MenuItem.text = as_name Then
				If Len(as_picturename) <=0 And Len(lr_MenuItem.Picturename) > 0 Then
					//GetPicturename
					ls_PictureName = lr_MenuItem.Picturename
				End If
				lr_Menu.deleteitem( ll_I )
				Exit
			End If
		Next
	End If
	//Insert First
	lr_MenuItemNew.Text = as_name
	lr_MenuItemNew.Tag = as_tag
	lr_MenuItemNew.Clicked = "ue_MenuHistoryClicked"
	lr_MenuItemNew.picturename =  ls_PictureName
	lr_Menu.InsertItemFirst( lr_MenuItemNew)
	lr_LargeButton.SetMenu(lr_Menu)
	rbb_1.SetLargeButton(lr_LargeButton.ItemHandle, lr_LargeButton)
End If	

//Insert Recent

If Rbb_1.GetApplicationButton( lr_AppButton ) = 1 Then
	If lr_AppButton.GetMenu( lr_AppMenu ) = 1 Then
		//delete >= 9  --Only 9 items can visible
		If lr_AppMenu.GetRecentItemCount() >= 9 Then
			lr_AppMenu.DeleteRecentItem(9)
		End If
		
		ll_Handle = lr_AppMenu.InsertRecentItemFirst( as_name, "ue_AppMenuRencentClicked" )
		lr_AppMenu.GetRecentitem( ll_Handle , lr_MenuItem)
		lr_MenuItem.Tag = as_tag
		lr_MenuItem.PictureName =  ls_PictureName		
		li_return = lr_AppMenu.SetRecentItem(ll_Handle , lr_MenuItem )
		lr_AppButton.SetMenu(lr_AppMenu)
		rbb_1.SetApplicationbutton( lr_AppButton)
	End If
End If

wf_add_ribbonbar_window(as_name, as_PictureName, as_tag)

Event ue_Refresh_Visible("")

end subroutine

public subroutine wf_add_ribbonbar_window (string as_name, string as_picturename, string as_tag);
RibbonLargeButtonItem 	lr_LargeButton
RibbonMenu 				lr_Menu
RibbonMenuItem 			lr_MenuItem, lr_MenuItemNew
Integer 	li_return
Long 		ll_Count, ll_I, ll_Handle
String 	ls_PictureName
Boolean 	lb_Find

If rbb_1.GetItemByTag("Window",lr_LargeButton) = 1 Then
	If rbb_1.GetMenubyButtonHandle( lr_LargeButton.itemhandle, lr_Menu ) = 1 Then
		ll_Count = lr_Menu.GetItemCount( )
		If ll_Count > 0 Then
			//Find
			For ll_I = 1 To ll_Count
				li_return = lr_Menu.Getitem( ll_I , lr_MenuItem)
				If Lower(lr_MenuItem.text) = Lower(as_name) OR Lower(lr_MenuItem.tag) = Lower(as_tag) Then
					If lr_MenuItem.Checked = False Then
						lr_MenuItem.Checked = true
						lr_Menu.SetItem(ll_I, lr_MenuItem)
					End If
					lb_Find = True
				Else
					If lr_MenuItem.Checked Then
						lr_MenuItem.checked = false
						lr_Menu.SetItem(ll_I, lr_MenuItem)
					End If
				End If
			Next
		End If
	End If
	If Not lb_Find Then
		//Insert Last
		lr_MenuItemNew.Text = as_name
		lr_MenuItemNew.Tag = as_tag
		lr_MenuItemNew.Checked = True
		lr_MenuItemNew.Clicked = "ue_MenuWindowClicked"
		lr_MenuItemNew.picturename =  as_picturename
		lr_Menu.InsertItemLast( lr_MenuItemNew)
	End If
	lr_LargeButton.SetMenu(lr_Menu)
	rbb_1.SetItem(lr_LargeButton)
End If



end subroutine

public subroutine wf_del_ribbonbar_window (string as_name, string as_flag);
RibbonLargeButtonItem 	lr_LargeButton
RibbonMenu 				lr_Menu
RibbonMenuItem 			lr_MenuItem
Integer 	li_return
Long 		ll_Count, ll_I

If rbb_1.GetItemByTag("Window",lr_LargeButton) = 1 Then
	If rbb_1.GetMenubyButtonHandle( lr_LargeButton.itemhandle, lr_Menu ) = 1 Then
		ll_Count = lr_Menu.GetItemCount( )
		If ll_Count <= 0 Then Return
		For ll_I = ll_Count To 1 Step -1
			li_return = lr_Menu.Getitem( ll_I , lr_MenuItem)
			If Lower(lr_MenuItem.text) = Lower(as_name) Or as_flag = "all" Then
				lr_Menu.DeleteItem(ll_I)
			End If
		Next
		lr_LargeButton.SetMenu(lr_Menu)
		rbb_1.SetItem(lr_LargeButton)
	End If
End If



end subroutine

public subroutine wf_refresh_ribbonbar_window (string as_name, string as_tag);
RibbonLargeButtonItem 	lr_LargeButton
RibbonMenu 				lr_Menu
RibbonMenuItem 			lr_MenuItem, lr_MenuItemNew
Integer 	li_return
Long 		ll_Count, ll_I, ll_Handle

If rbb_1.GetItemByTag("Window",lr_LargeButton) = 1 Then
	If rbb_1.GetMenubyButtonHandle( lr_LargeButton.itemhandle, lr_Menu ) = 1 Then
		ll_Count = lr_Menu.GetItemCount( )
		If ll_Count > 0 Then
			//Find
			For ll_I = 1 To ll_Count
				li_return = lr_Menu.Getitem( ll_I , lr_MenuItem)
				If Lower(lr_MenuItem.text) = Lower(as_name) Or Lower(lr_MenuItem.tag) = Lower(as_tag) Then
					If lr_MenuItem.checked = False Then
						lr_MenuItem.checked = True
						lr_Menu.SetItem(ll_I, lr_MenuItem)
					End If
				Else
					If lr_MenuItem.checked Then
						lr_MenuItem.checked = False
						lr_Menu.SetItem(ll_I, lr_MenuItem)
					End If
				End If
			Next
			lr_LargeButton.SetMenu(lr_Menu)
			rbb_1.SetItem(lr_LargeButton)
		End If
	End If
End If



end subroutine

public subroutine wf_visible_ribbonbar (string as_tag, string as_option, boolean ab_w);//wf_Visible_RibbonBar(string as_tag, string as_option)
Boolean lb_Syntax, lb_DataObject, lb_Table, lb_Type, lb_View
JsonParser 	ljson_Parser
String 	ls_Error, ls_Value
Long 		ll_RootItem

If as_Tag = "datawindow" Then
	lb_DataObject = True
	lb_Type = True
End If
If as_Tag = "table" Then
	lb_Table = True
	lb_Type = True
End If
If as_Tag = "sql"Then
	lb_Syntax = True
	lb_Type = True
End If

If ab_w And as_Tag <> "welcome" And as_Tag <> "webbrowser" Then
	lb_View = true
End If

//DataObject
wf_SetVisible("SmallButton", "Change DataObject", lb_DataObject)
//Table
wf_SetVisible("SmallButton", "Change Table", lb_Table)
//syntax
wf_SetVisible("SmallButton", "Change Syntax", lb_Syntax)

//Find TabButtonClose
wf_SetVisible("TabButton", "TabClose", ab_w)

//SmallButton Close
wf_SetVisible("SmallButton", "Close", ab_w)

//SmallButton Close All
wf_SetVisible("SmallButton", "Close All", ab_w)

//LargeButton Window
wf_SetVisible("LargeButton", "Window", ab_w)

//URL
wf_SetVisible("SmallButton", "URL", ab_w)

//Source
wf_SetVisible("SmallButton", "Source", ab_w)

//Option
wf_SetVisible("SmallButton", "Option", lb_View)

//Data
wf_SetVisible("SmallButton", "Data", lb_View)

//Print
wf_SetVisible("LargeButton", "Print", ab_w)

//Setup
wf_SetVisible("LargeButton", "Setup", ab_w)

//Setting & Graph Type
//Title
wf_SetVisible("ComboBox", "Title", lb_Type)
//Theme
wf_SetVisible("ComboBox", "Theme", lb_Type)
//GraphType
wf_SetVisible("ComboBox", "Graph Type", lb_Type)
//is3D
wf_SetVisible("ComboBox", "is3D", lb_Type)

//Option
If Len( as_Option ) > 0 Then
	ljson_Parser = Create JsonParser
	//{"Title":"default title","GraphType":"Line","Theme":"default","Height":500,"Width":800,"is3D":false}
	ls_Error = ljson_Parser.LoadString( as_option )
	If Len ( ls_Error ) = 0 Then
		ll_RootItem = ljson_Parser.GetRootItem()
		//Style
		ls_Value = ljson_Parser.GetItemString( ll_RootItem, "GraphType" )
		wf_SetValue("ComboBox", "Graph Type", ls_Value )
		//Title
		ls_Value = ljson_Parser.GetItemString( ll_RootItem, "Title" )
		wf_SetValue("ComboBox", "Title", ls_Value )
		//Theme
		ls_Value = ljson_Parser.GetItemString( ll_RootItem, "Theme" )
		wf_SetValue("ComboBox", "Theme", ls_Value )
		//is3D
		ls_Value = String(ljson_Parser.GetItemBoolean( ll_RootItem, "is3D" ) )
		wf_SetValue("ComboBox", "is3D", ls_Value )		
	End If
	If IsValid ( ljson_Parser ) Then Destroy ( ljson_Parser )
End If
end subroutine

public function string wf_getoption ();//string wf_getoption()
String 	ls_Title, ls_Theme, ls_is3D, ls_GraphType, ls_Option
Long 		ll_RootObject
Boolean 	lb_is3D
JsonGenerator ljson_str

//Title
ls_Title = wf_GetValue("ComboBox", "Title")
//Theme
ls_Theme = Lower(wf_GetValue("ComboBox", "Theme"))
//is3D
ls_is3D = wf_GetValue("ComboBox", "is3D")

//is_GraphType
ls_GraphType = wf_GetValue("ComboBox", "Graph Type")

//gs_GraphType
If Lower( gs_GraphType ) <> Lower (ls_GraphType) Then
	gs_GraphType = ls_GraphType
End If

ljson_str = Create JsonGenerator
ll_RootObject = ljson_str.CreateJsonObject()

ljson_str.AddItemString(ll_RootObject, "Title", ls_Title)
ljson_str.AddItemString(ll_RootObject, "GraphType", ls_GraphType)
ljson_str.AddItemString(ll_RootObject, "Theme", ls_Theme)
If Upper(ls_is3D) = "TRUE" Then
	lb_is3D = True
End If
If gb_is3d <> lb_is3D Then
	gb_is3d = lb_is3D
End If

ljson_str.AddItemBoolean(ll_RootObject, "is3D", lb_is3D)
//datazoom to false
ljson_str.AddItemBoolean(ll_RootObject, "datazoom", false)

ls_Option = ljson_str.GetJsonString()

IF IsValid( ljson_str ) THEN Destroy (ljson_str)

Return ls_Option
end function

public function integer wf_setvisible (string as_type, string as_tag, boolean ab_visible);//wf_setvisible(string as_type, string as_tag, boolean ab_visible)
RibbonLargeButtonItem 	lr_LargeButton
RibbonTabButtonItem 	lr_TabButton
RibbonSmallButtonItem 	lr_SmallButton
RibbonComboBoxItem 	lr_ComboBox
RibbonCheckBoxItem 		lr_CheckBox

Choose Case lower(as_Type)
	Case "largebutton"
		If rbb_1.GetItemByTag( as_Tag, lr_LargeButton) = 1 Then
			If lr_LargeButton.Enabled <> ab_Visible Then
				lr_LargeButton.Enabled = ab_Visible
				rbb_1.SetItem(lr_LargeButton)
			End If
		Else
			Return -1
		End If
	Case "smallbutton"
		If rbb_1.GetItemByTag( as_Tag, lr_SmallButton) = 1 Then
			If lr_SmallButton.Enabled <> ab_Visible Then
				lr_SmallButton.Enabled = ab_Visible
				rbb_1.SetItem(lr_SmallButton)
			End If
		Else
			Return -1
		End If
	Case "tabbutton"
		If rbb_1.GetItemByTag( as_Tag, lr_TabButton) = 1 Then
			If lr_TabButton.Enabled <> ab_Visible Then
				lr_TabButton.Enabled = ab_Visible
				rbb_1.SetItem(lr_TabButton)
			End If
		Else
			Return -1
		End If
	Case "combobox"
		If rbb_1.GetItemByTag( as_Tag, lr_ComboBox) = 1 Then
			If lr_ComboBox.Enabled <> ab_Visible Then
				lr_ComboBox.Enabled = ab_Visible
				rbb_1.SetItem(lr_ComboBox)
			End If
		Else
			Return -1
		End If
	Case "checkbox"
		If rbb_1.GetItemByTag( as_Tag, lr_CheckBox) = 1 Then
			If lr_CheckBox.Enabled <> ab_Visible Then
				lr_CheckBox.Enabled = ab_Visible
				rbb_1.SetItem(lr_CheckBox)
			End If
		Else
			Return -1
		End If
	Case Else
		Return -1
End Choose

Return 1

end function

public function string wf_getvalue (string as_type, string as_tag);//wf_GetValue(string as_type, string as_tag)
RibbonLargeButtonItem 	lr_LargeButton
RibbonTabButtonItem 	lr_TabButton
RibbonSmallButtonItem 	lr_SmallButton
RibbonComboBoxItem 	lr_ComboBox
RibbonCheckBoxItem 		lr_CheckBox
String 	ls_Value

Choose Case lower(as_Type)
	Case "largebutton"
		If rbb_1.GetItemByTag( as_Tag, lr_LargeButton) = 1 Then
			ls_Value = lr_LargeButton.text
		End If
	Case "smallbutton"
		If rbb_1.GetItemByTag( as_Tag, lr_SmallButton) = 1 Then
			ls_Value = lr_SmallButton.text
		End If
	Case "tabbutton"
		If rbb_1.GetItemByTag( as_Tag, lr_TabButton) = 1 Then
			ls_Value = lr_TabButton.text
		End If
	Case "combobox"
		If rbb_1.GetItemByTag( as_Tag, lr_ComboBox) = 1 Then
			ls_Value = lr_ComboBox.text
		End If
	Case "checkbox"
		If rbb_1.GetItemByTag( as_Tag, lr_CheckBox) = 1 Then
			ls_Value = String ( lr_CheckBox.checked )
		End If
End Choose

Return ls_Value

end function

public function integer wf_setchecked (string as_tag);//wf_setchecked(string as_tag)
RibbonSmallButtonItem 		lr_SmallButton

//line
If rbb_1.GetItemByTag( "line", lr_SmallButton) = 1 Then
	If lr_SmallButton.Checked Then
		lr_SmallButton.Checked = False
		rbb_1.SetItem(lr_SmallButton)
	End If
End If
//area
If rbb_1.GetItemByTag( "area", lr_SmallButton) = 1 Then
	If lr_SmallButton.Checked Then
		lr_SmallButton.Checked = False
		rbb_1.SetItem(lr_SmallButton)
	End If
End If
//bar
If rbb_1.GetItemByTag( "bar", lr_SmallButton) = 1 Then
	If lr_SmallButton.Checked Then
		lr_SmallButton.Checked = False
		rbb_1.SetItem(lr_SmallButton)
	End If
End If
//pie
If rbb_1.GetItemByTag( "pie", lr_SmallButton) = 1 Then
	If lr_SmallButton.Checked Then
		lr_SmallButton.Checked = False
		rbb_1.SetItem(lr_SmallButton)
	End If
End If
//funnel
If rbb_1.GetItemByTag( "funnel", lr_SmallButton) = 1 Then
	If lr_SmallButton.Checked Then
		lr_SmallButton.Checked = False
		rbb_1.SetItem(lr_SmallButton)
	End If
End If


If rbb_1.GetItemByTag( as_Tag, lr_SmallButton) = 1 Then
	lr_SmallButton.Checked = True
	rbb_1.SetItem(lr_SmallButton)
Else
	Return -1
End If
	
Return 1

end function

public function long wf_setvalue (string as_type, string as_tag, string as_value);//wf_GetValue(string as_type, string as_tag)
RibbonLargeButtonItem 	lr_LargeButton
RibbonTabButtonItem 	lr_TabButton
RibbonSmallButtonItem 	lr_SmallButton
RibbonComboBoxItem 	lr_ComboBox
RibbonCheckBoxItem 		lr_CheckBox
String 	ls_Value

ls_Value = as_value

Choose Case lower(as_Type)
	Case "largebutton"
		If rbb_1.GetItemByTag( as_Tag, lr_LargeButton) = 1 Then
			lr_LargeButton.text = ls_Value
			rbb_1.SetItem( lr_LargeButton )
		End If
	Case "smallbutton"
		If rbb_1.GetItemByTag( as_Tag, lr_SmallButton) = 1 Then
			 lr_SmallButton.text = ls_Value
			 rbb_1.SetItem( lr_SmallButton )
		End If
	Case "tabbutton"
		If rbb_1.GetItemByTag( as_Tag, lr_TabButton) = 1 Then
			lr_TabButton.text = ls_Value
			rbb_1.SetItem( lr_TabButton )
		End If
	Case "combobox"
		If rbb_1.GetItemByTag( as_Tag, lr_ComboBox) = 1 Then
			lr_ComboBox.text = ls_Value
			rbb_1.SetItem( lr_ComboBox )
		End If
	Case "checkbox"
		If rbb_1.GetItemByTag( as_Tag, lr_CheckBox) = 1 Then
			If Upper ( ls_Value ) = "TRUE" Then
				lr_CheckBox.checked = true
			Else
				lr_CheckBox.checked = false
			End If
			rbb_1.SetItem( lr_CheckBox )
		End If
End Choose

Return 1

end function

on w_mdi.create
if this.MenuName = "m_menu" then this.MenuID = create m_menu
this.mdi_1=create mdi_1
this.rbb_1=create rbb_1
this.Control[]={this.mdi_1,&
this.rbb_1}
end on

on w_mdi.destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.mdi_1)
destroy(this.rbb_1)
end on

event open;environment lenv
decimal  ldec_font

getenvironment(lenv)

ldec_font = round(lenv.screenheight/900,2)

rbb_1.ImportFromXMLFile( this.Tag )

rbb_1.textsize = (-1)*ldec_font*8

Opensheet (w_welcome, This, 1, Layered! )

end event

event resize;rbb_1.width = this.workspaceWidth()

mdi_1.x = rbb_1.x
mdi_1.y = rbb_1.height + 8
mdi_1.move(mdi_1.x, mdi_1.y)
mdi_1.resize(this.workspaceWidth() - 8 ,this.workspaceHeight() - rbb_1.height - 20 -60 )

SetReDraw(False)
This.arrangesheets( Layer! )
SetReDraw(True)


end event

type mdi_1 from mdiclient within w_mdi
long BackColor=268435456
end type

type rbb_1 from ribbonbar within w_mdi
event ue_setmini ( long index )
event ue_buttonclicked ( long itemhandle )
event ue_close ( long index )
event ue_closeall ( long index )
event ue_appmenurencentclicked ( long itemhandle,  long index )
event ue_menuclicked ( long itemhandle,  long index,  long subindex )
event ue_menuhistoryclicked ( long itemhandle,  long index,  long subindex )
event ue_tabbuttonhelpclicked ( long itemhandle )
event ue_menuwindowclicked ( long itemhandle,  long index,  long subindex )
event type long ue_comboboxmodified ( integer itemhandle )
event type long ue_checkboxclicked ( integer itemhandle )
integer x = 5
integer y = 4
integer width = 3913
integer height = 456
long backcolor = 15132390
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
end type

event ue_setmini(long index);String 	ls_path
Long 		ll_TabCount, ll_I
integer 	li_return
RibbonTabButtonItem 	lr_Tab

If rbb_1.isminimized( ) Then
	rbb_1.setminimized( false)
	ls_path = "ArrowUpSmall!"
Else
	rbb_1.setminimized( true)
	ls_path = "ArrowDownSmall!"
End If


ll_TabCount = Rbb_1.GetTabbuttoncount( )
For ll_I = 1 To ll_TabCount
	If rbb_1.Gettabbuttonbyindex( ll_I, lr_Tab) = 1 Then
		If lr_Tab.text = "Minimize" Then
			lr_Tab.picturename = ls_path
			li_return = rbb_1.SetTabButton(lr_Tab.itemhandle, lr_Tab)
		End If
	End If
Next

Parent.SetReDraw(False)
Parent.event Resize(0,Parent.Width ,Parent.height)
Parent.arrangesheets( Layer! )
Parent.SetReDraw(True)

end event

event ue_buttonclicked(long itemhandle);
RibbonLargeButtonItem lr_LargeButton
RibbonSmallButtonITem lr_SmallButton
window w
String ls_URL
If rbb_1.GetItem( ItemHandle, lr_LargeButton ) = 1 Then
	Choose Case Lower(lr_LargeButton.Tag)
		Case "line"
			OpenSheet(w_line, Parent, 1, Layered!)
		Case "bar"
			OpenSheet(w_bar, Parent, 1, Layered!)
		Case "area"
			OpenSheet(w_area, Parent, 1, Layered!)
		Case "pie"
			OpenSheet(w_pie, Parent, 1, Layered!)		
		Case "scatter"
			OpenSheet(w_scatter, Parent, 1, Layered!)
		Case "k-line"
			OpenSheet(w_kline, Parent, 1, Layered!)
		Case "print"
			Parent.TriggerEvent ("ue_print")
			Return
		Case "setup"
			PrintSetUp()
			Return
		Case "url"
			Parent.TriggerEvent ("ue_viewurl")
			Return
		Case "source"
			Parent.TriggerEvent ("ue_viewsource")
			Return
		Case "option"
			Parent.TriggerEvent ("ue_viewoption")
			Return
		Case "examples"
			ls_URL = "https://developers.google.com/chart/interactive/docs/examples"
			OpenSheet(w_webbrowser, Parent, 1, Layered!)
			w_webbrowser.Event ue_NavigateURL( ls_URL )
			Return
		Case "tutorial"
			ls_URL = "https://developers.google.com/chart/interactive/docs/quick_start"
			OpenSheet(w_webbrowser, Parent, 1, Layered!)
			w_webbrowser.Event ue_NavigateURL( ls_URL )	
			Return
		Case "website"
			ls_URL = "https://developers.google.com/chart"
			OpenSheet(w_webbrowser, Parent, 1, Layered!)
			w_webbrowser.Event ue_NavigateURL( ls_URL )
			Return
		Case "datawindow"
			w = getfirstsheet()
			If IsValid(w) Then
				If Classname( w ) = "w_datawindow"Then
					w.TriggerEvent ("ue_select_dataobject")
					Return
				End If
			End If
			OpenSheet(w_datawindow, Parent, 1, Layered!)
			
		Case "sql"
			w = getfirstsheet()
			If IsValid(w) Then
				If Classname( w ) = "w_dynamic_sql"Then
					w.TriggerEvent ("ue_select_syntax")
					Return
				End If
			End If
			OpenSheet(w_dynamic_sql, Parent, 1, Layered!)
			
		Case "table"
			w = getfirstsheet()
			If IsValid(w) Then
				If Classname( w ) = "w_table"Then
					w.TriggerEvent ("ue_select_table")
					Return
				End If
			End If
			OpenSheet(w_table, Parent, 1, Layered!)
		Case Else
			Return
	End Choose
	wf_add_ribbonbar_history(lr_LargeButton.Text,lr_LargeButton.PictureName,lr_LargeButton.tag )
Else
	If rbb_1.GetItem( ItemHandle, lr_SmallButton ) = 1 Then
		Choose Case Lower(lr_SmallButton.Tag)
			Case "change dataobject"
				Parent.TriggerEvent ("ue_select_dataobject")
				Return
			Case "change table"
				Parent.TriggerEvent ("ue_select_table")
				Return
			Case "change syntax"
				Parent.TriggerEvent ("ue_select_syntax")
				Return
			Case "url"
				Parent.TriggerEvent ("ue_viewurl")
				Return
			Case "source"
				Parent.TriggerEvent ("ue_viewsource")
				Return
			Case "option"
				Parent.TriggerEvent ("ue_viewoption")
				Return
			Case "data"
				Parent.TriggerEvent ("ue_viewdata")
				Return
			Case Else
				Return
		End Choose
		wf_add_ribbonbar_history(lr_SmallButton.Text,lr_SmallButton.PictureName,lr_SmallButton.tag )
	Else
		return
	End If
End If




end event

event ue_close(long index);
window w
w = parent.getfirstsheet()

If IsValid(w) Then
	wf_del_ribbonbar_window(w.tag ,"")
	Close(w)
End If

w = parent.getfirstsheet()
If Not IsValid(w) Then
	Event ue_Refresh_Visible("")
End If

end event

event ue_closeall(long index);window lw_child
lw_child = parent.getfirstsheet()

do while IsValid(lw_child)
	Close(lw_child)
	lw_child = parent.getfirstsheet()
Loop

wf_del_ribbonbar_window("" ,"all")

Event ue_Refresh_Visible("")
end event

event ue_appmenurencentclicked(long itemhandle, long index);RibbonApplicationButtonItem lr_AppButton
RibbonApplicationMenu lr_AppMenu
RibbonMenuItem lr_MenuItem

rbb_1.GetApplicationButton(lr_AppButton)
If lr_AppButton.ItemHandle = ItemHandle Then
	If rbb_1.GetMenuByButtonHandle( ItemHandle, lr_AppMenu ) = 1 Then
		If ( lr_AppMenu.GetRecentItem(Index,lr_MenuItem) ) = 1 Then
			Choose Case Lower(lr_MenuItem.text)
				Case "line"
					Opensheet (w_line, Parent, 1, Layered! )
				Case "k-line"
					Opensheet (w_kline, Parent, 1, Layered! )
				Case "bar"
					OpenSheet(w_bar, Parent, 1, Layered!)
				Case "area"
					OpenSheet(w_area, Parent, 1, Layered!)
				Case "pie"
					OpenSheet(w_pie, Parent, 1, Layered!)
				Case "scatter"
					OpenSheet(w_scatter, Parent, 1, Layered!)
				Case "welcome"
					Opensheet (w_welcome, Parent, 1, Layered! )
				Case "sql"
					OpenSheet(w_dynamic_sql,Parent, 1, Layered!)
				Case "table"
					OpenSheet(w_table,Parent, 1, Layered!)
				Case "datawindow"
					OpenSheet(w_datawindow,Parent, 1, Layered!)
				End Choose
			wf_add_ribbonbar_history(lr_MenuItem.Text,lr_MenuItem.PictureName,lr_MenuItem.tag )
		End If
	End If
End If

end event

event ue_menuclicked(long itemhandle, long index, long subindex);RibbonApplicationButtonItem lr_AppButton
RibbonApplicationMenu lr_AppMenu
RibbonMenuItem lr_MenuItem
RibbonMenu lr_Menu

rbb_1.GetApplicationButton(lr_AppButton)
If lr_AppButton.ItemHandle = ItemHandle Then
	If rbb_1.GetMenuByButtonHandle( ItemHandle, lr_AppMenu ) = 1 Then
		If SubIndex = 0  Then
			If lr_AppMenu.GetMasterItem(Index,lr_MenuItem) = 1 Then
				Choose Case Lower(lr_MenuItem.Tag)
					Case "close"
						Post Close(Parent)
					
				End Choose
			End If
		Else
			
		End If

	End If
End If


If rbb_1.GetMenuByButtonHandle( ItemHandle, lr_Menu ) = 1 Then
	If SubIndex = 0 Then
		lr_Menu.GetItem(Index,lr_MenuItem)
	Else
		lr_Menu.GetItem(Index,SubIndex,lr_MenuItem)
	End If
End If
	
end event

event ue_menuhistoryclicked(long itemhandle, long index, long subindex);RibbonMenu 				lr_Menu
RibbonMenuItem 			lr_MenuItem
Integer 	li_return

li_return = GetMenubybuttonhandle( itemhandle, lr_Menu )
If li_return = 1 Then
	If lr_Menu.Getitem( index , lr_MenuItem) = 1 Then
		Choose Case Lower(lr_MenuItem.Tag)
			Case "line"
				Opensheet (w_line, Parent, 1, Layered! )
			Case "k-line"
				Opensheet (w_kline, Parent, 1, Layered! )
			Case "bar"
				OpenSheet(w_bar, Parent, 1, Layered!)
			Case "area"
				OpenSheet(w_area, Parent, 1, Layered!)
			Case "pie"
				OpenSheet(w_pie, Parent, 1, Layered!)
			
			Case "scatter"
				OpenSheet(w_scatter, Parent, 1, Layered!)
			Case "table"
				OpenSheet(w_table,Parent, 1, Layered!)
			Case "sql"
				OpenSheet(w_dynamic_sql,Parent, 1, Layered!)
			Case "datawindow"
				OpenSheet(w_datawindow,Parent, 1, Layered!)
			Case "welcome"
				OpenSheet ( w_welcome, Parent, 1, Layered! )
		End Choose
		wf_add_ribbonbar_history(lr_MenuItem.Text,lr_MenuItem.PictureName,lr_MenuItem.tag )
	End If
End If


end event

event ue_tabbuttonhelpclicked(long itemhandle);
//Open(w_help)
end event

event ue_menuwindowclicked(long itemhandle, long index, long subindex);
RibbonMenu 				lr_Menu
RibbonMenuItem 			lr_MenuItem
Integer 	li_return

li_return = GetMenubybuttonhandle( itemhandle, lr_Menu )
If li_return = 1 Then
	If lr_Menu.Getitem( index , lr_MenuItem) = 1 Then
		Choose Case Lower(lr_MenuItem.Tag)
			Case "line"
				w_line.BringtoTop = true
			Case "k-line"
				w_kline.BringtoTop = true
			Case "bar"
				w_bar.BringtoTop = true
			Case "area"
				w_area.BringtoTop = true
			Case "pie"
				w_pie.BringtoTop = true
			Case "scatter"
				w_scatter.BringtoTop = true
			Case "table"
				w_table.BringtoTop = true
			Case "sql"
				w_dynamic_sql.BringtoTop = true
			Case "datawindow"
				w_datawindow.BringtoTop = true
			Case "welcome"
				w_welcome.BringtoTop = true
		End Choose
		wf_refresh_ribbonbar_window(lr_MenuItem.Text, lr_MenuItem.tag)
	End If
End If


end event

event type long ue_comboboxmodified(integer itemhandle);RibbonComboBoxItem lr_ComboBox

If rbb_1.GetComboBox(ItemHandle,lr_ComboBox) = 1 Then
	Choose Case lower(lr_comboBox.Tag)
		Case "title", "is3d", "graph type"
			Parent.Post Event ue_SetOption(wf_GetOption() )
	End Choose
End If

return 1

end event

event type long ue_checkboxclicked(integer itemhandle);RibbonCheckBoxItem lr_CheckBox

If rbb_1.GetCheckBox(ItemHandle,lr_CheckBox) = 1 Then
	Choose Case lower(lr_CheckBox.Tag)
		Case "toolbox"
			Parent.Post Event ue_SetOption(wf_GetOption() )
	End Choose
End If

return 1
end event


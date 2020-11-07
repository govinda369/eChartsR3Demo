$PBExportHeader$n_webbrowser.sru
forward
global type n_webbrowser from webbrowser
end type
end forward

global type n_webbrowser from webbrowser
integer width = 2341
integer height = 1180
string defaulturl = "file:///charts.html"
event ue_clicked ( string as_arg )
end type
global n_webbrowser n_webbrowser

type variables
Private:
String is_FileName = "charts.html"
String is_Title = "Default title"
//Theme:default,light,dark
String is_Theme = "default"
//Style:line,bar,pei,scatter,radar,funnel...
String is_Style = "line"
String is_Option = ""
Long il_Width = 800
Long il_Height = 600
Boolean ib_ToolBox = True
Boolean ib_dataZoom
String is_SeriesName = "Series1"
//roseType:radius,area
String is_roseType
String is_colors
String is_Data = ""
Boolean ib_is3D
end variables

forward prototypes
public subroutine of_replace (ref string as_string, string as_str1, string as_str2)
public subroutine of_setheight (long al_arg)
public subroutine of_setstyle (string as_arg)
public subroutine of_settheme (string as_arg)
public subroutine of_settitle (string as_arg)
public subroutine of_settoolbox (boolean ab_arg)
public subroutine of_setwidth (long al_arg)
public function boolean of_getdatazoom ()
public function long of_getheight ()
public function string of_gettitle ()
public function string of_gettheme ()
public function string of_getstyle ()
public function long of_getwidth ()
public function boolean of_gettoolbox ()
public function integer of_apply ()
public subroutine of_setoption (string as_option)
public function string of_getoption ()
public subroutine of_setfilename (string as_arg)
public function string of_getfilename ()
public subroutine of_setdatazoom (boolean ab_arg)
public function integer of_apply_async ()
public function string of_getitemstring (ref datawindow adw_1, integer ai_row, integer ai_column)
public function string of_getitemstring (ref datastore ads_1, integer ai_row, integer ai_column)
public subroutine of_setseriesname (string as_arg)
public function string of_getseriesname ()
public function string of_getresultvalue (string as_json)
public function string of_getweburl ()
public function string of_getwebsource ()
public function string of_getitemstring (ref datastore ads_1, integer ai_row, string as_column)
public function string of_getitemstring (ref datawindow adw_1, integer ai_row, string as_column)
public function string of_getrosetype ()
public subroutine of_setrosetype (string as_arg)
public function string of_getcolors ()
public subroutine of_setcolors (string as_arg)
public subroutine of_setdata (string as_data)
public function string of_getdata ()
public function string of_createdata (datastore ads_data)
public function string of_createdata (datawindow adw_data)
public function string of_createdata (datawindow adw_series, datawindow adw_category)
public function string of_createdata (datastore ads_series, datastore ads_category)
public function string of_createdata (datastore ads_data, string as_categorycol, string as_valuecol)
public function string of_createdata (datawindow adw_data, string as_categorycol, string as_valuecol)
public function string of_createdata (string as_sql)
public function string of_createdata (string as_sql, string as_categorycol, string as_valuecol)
public function string of_createdata_series (string as_sql, string as_categorycol, string as_valuecol, string as_series)
public function string of_createdata_dataobject (string as_dataobject)
public function string of_createdata_graph (datastore ads_data)
public function string of_createoption ()
public subroutine of_setis3d (boolean ab_arg)
public function boolean of_getis3d ()
public function string of_createdata_candlestick (datawindow adw_data, string as_low, string as_open, string as_close, string as_high)
public function string of_createdata_candlestick (datastore ads_data, string as_low, string as_open, string as_close, string as_high)
end prototypes

event ue_clicked(string as_arg);//ue_clicked(string as_arg)
//MessageBox( "Tips", as_arg )
end event

public subroutine of_replace (ref string as_string, string as_str1, string as_str2);//of_replace(as_string,as_str1,as_str2)
Long 	start_pos

If as_str1 = as_str2 Then Return

start_pos = Pos(as_string, as_str1)
DO WHILE start_pos > 0		
	 as_string = Replace(as_string, start_pos, Len(as_str1), as_str2)
	start_pos = Pos(as_string, as_str1, start_pos)						
LOOP
end subroutine

public subroutine of_setheight (long al_arg);//SetHeight
this.il_Height = al_arg
end subroutine

public subroutine of_setstyle (string as_arg);//SetStyle
this.is_Style = as_arg
end subroutine

public subroutine of_settheme (string as_arg);//Set Theme
this.is_Theme = as_arg
end subroutine

public subroutine of_settitle (string as_arg);//SetTitle
this.is_Title = as_arg
end subroutine

public subroutine of_settoolbox (boolean ab_arg);//SetToolBox
this.ib_ToolBox = ab_arg
end subroutine

public subroutine of_setwidth (long al_arg);//SetWidth
this.il_Width = al_arg
end subroutine

public function boolean of_getdatazoom ();//GetToolBox
Return this.ib_dataZoom
end function

public function long of_getheight ();//GetHeight
Return this.il_Height
end function

public function string of_gettitle ();//GetTitle
of_replace(this.is_Title,"'","^")
Return this.is_Title
end function

public function string of_gettheme ();//GetTheme
Return this.is_Theme
end function

public function string of_getstyle ();//GetStyle
Return this.is_Style
end function

public function long of_getwidth ();//GetWidth
Return this.il_Width
end function

public function boolean of_gettoolbox ();//GetToolBox
Return this.ib_ToolBox
end function

public function integer of_apply ();//Apply
String ls_Url, ls_Html, ls_Options, ls_Shares, ls_JS, ls_FileName, ls_Data, ls_MyChart
Long 	ll_FileOpen
Integer li_return

//Data
ls_Data = is_Data
If Len(ls_Data) <=0 Then
	MessageBox ("Error", "Data is Null!")
	Return -1
End If
//Options
ls_Options = is_Option
If Len(ls_Options) <=0 Then
	MessageBox ("Error", "Option is Null!")
	Return -1
End If

//Replace "
This.of_replace(ls_Data,'"',"")
This.of_replace(ls_Options,'"',"")

//myChart
Choose Case Lower(This.of_GetStyle())
	Case "line"
		ls_MyChart = "var myChart = new google.visualization.LineChart(document.getElementById('main'))"
	Case "area"
		ls_MyChart = "var myChart = new google.visualization.AreaChart(document.getElementById('main'))"
	Case "bar"
		ls_MyChart = "var myChart = new google.visualization.BarChart(document.getElementById('main'))"
	Case "pie"
		ls_MyChart = "var myChart = new google.visualization.PieChart(document.getElementById('main'))"
	Case "scatter"
		ls_MyChart = "var myChart = new google.visualization.ScatterChart(document.getElementById('main'))"
	Case "candlesitick"
		ls_MyChart = "var myChart = new google.visualization.CandlestickChart(document.getElementById('main'))"
		ls_Data += ",true"
	Case "column"
		ls_MyChart = "var myChart = new google.visualization.ColumnChart(document.getElementById('main'))"
	Case "donut"
		ls_MyChart = "var myChart = new google.visualization.PieChart(document.getElementById('main'))"	
	Case Else
		ls_MyChart = "var myChart = new google.visualization.LineChart(document.getElementById('main'))"
End Choose	

//File
ls_FileName = is_FileName
//This.SetReDraw( False )
If Not FileExists(ls_FileName) Then
	//HTML
	ls_Html = "<!DOCTYPE html>~r~n" +&
		"<html>~r~n" +&
		"<head>~r~n" +&
		"    <meta charset=~"utf-8~">~r~n" +&
		"    <title>Charts</title>~r~n" +&
		"    <script charset=~"UTF-8~" src=~"./dist/loader.js~"></script>~r~n" +&
		"	<link id=~"load-css-0~" rel=~"stylesheet~" type=~"text/css~" href=~"./dist/tooltip.css~">~r~n" +&
		"	<link id=~"load-css-1~" rel=~"stylesheet~" type=~"text/css~" href=~"./dist/util.css~">~r~n" +&
		"	<script charset=~"UTF-8~" src=~"./dist/jsapi_compiled_default_module.js~"></script>~r~n" +&
		"	<script charset=~"UTF-8~" src=~"./dist/jsapi_compiled_graphics_module.js~"></script>~r~n" +&
		"	<script charset=~"UTF-8~" src=~"./dist/jsapi_compiled_ui_module.js~"></script>~r~n" +&
		"	<script charset=~"UTF-8~" src=~"./dist/jsapi_compiled_corechart_module.js~"></script>	~r~n" +&
		"</head>~r~n" +&
		"<body>~r~n" +&
		"    <div id=~"main~" style=~"width:" + String( il_Width ) + "px;height:" + String( il_Height ) + "px;~"></div>	~r~n" +&
		"    <script type=~"text/javascript~">~r~n" +&
		"        var data = new google.visualization.arrayToDataTable("+ ls_Data +");~r~n" +&		
		"        var options = " + ls_Options + ";~r~n" +&
		"        " + ls_MyChart + "~r~n" +&
		"        myChart.draw(data, options);~r~n" +&
		"		function resizeEnd(){~r~n" +&
		"			options.width=window.innerWidth-20;~r~n" +&
		"			options.height=window.innerHeight-20;~r~n" +&
		"			myChart.draw(data,options);~r~n" +&
		"		}~r~n" +&
		"		window.addEventListener(~"resize~",resizeEnd,false);~r~n" +&
		"		google.visualization.events.addListener(myChart,~'select~',selectHandler);		~r~n" +&
		"		function selectHandler(e){~r~n" +&
		"			var selection = myChart.getSelection();~r~n" +&
		"			if (selection.length > 0 && selection[0].row != null){~r~n" +&
		"				window.webBrowser.ue_clicked(~'{~"seriesName~":~"~' + ~"series0~" + ~'~",~"name~":~"~' +~r~n" +&
		"				data.getValue(selection[0].row,0) + ~'~",~"value~":~"~' + data.getValue(selection[0].row,1) + ~'~"}~');				~r~n" +&
		"			}~r~n" +&
		"		}~r~n" +&
		"    </script>~r~n" +&
		"</body>~r~n" +&
		"</html>~r~n"
	//Create File
	ll_FileOpen = FileOpen(ls_FileName,TextMode!,Write!,Shared!,Replace!,EncodingUTF8!)
	FileWriteEx(ll_FileOpen,ls_Html)
	FileClose(ll_FileOpen)
	ls_Url ='file:///' + ls_FileName
	This.Navigate( ls_Url )
Else
	String ls_Result, ls_Error
	//JavaScript EvaluateJavaScriptSync
	//1.width height
	ls_JS = "document.getElementById('main').style.width = '" + String( il_Width ) + "px'"
	This.EvaluateJavaScriptSync( ls_JS)
	ls_JS = "document.getElementById('main').style.height = '" + String( il_Height ) + "px'"
	This.EvaluateJavaScriptSync( ls_JS)
	//2.Create the data table.
	ls_JS = "var data = new google.visualization.arrayToDataTable(" + ls_Data + ")"
	This.EvaluateJavaScriptSync( ls_JS )	
	//3.Set option.
	ls_JS = "var options=" + ls_Options
	This.EvaluateJavaScriptSync( ls_JS, ls_Result, ls_Error)	
	//4.Create myChart.
	ls_JS = ls_MyChart
	This.EvaluateJavaScriptSync( ls_JS )	
	//5.myChart.draw(data,option)
	ls_JS = "myChart.draw(data, options)"
	This.EvaluateJavaScriptSync( ls_JS )	
	//6. addListener(myChart,'select',selectHandler)
	ls_JS = "google.visualization.events.addListener(myChart,'select',selectHandler);"
	This.EvaluateJavaScriptSync( ls_JS )
	//7.Resize
	ls_JS = "resizeEnd()"
	This.EvaluateJavaScriptSync( ls_JS )

End If
//This.SetReDraw( True )
This.RegisterEvent("ue_clicked")
Return 1





end function

public subroutine of_setoption (string as_option);//SetOption
String ls_Option

ls_Option = as_option
//Replace "
This.of_replace(ls_Option,'"',"")

this.is_Option = ls_Option




end subroutine

public function string of_getoption ();//GetOption
Return this.is_Option
end function

public subroutine of_setfilename (string as_arg);//SetFileName
this.is_FileName = as_arg
//Navigate
This.Navigate("file:///" + is_FileName )

end subroutine

public function string of_getfilename ();//GetFileName
Return this.is_FileName
end function

public subroutine of_setdatazoom (boolean ab_arg);//SetToolBox
this.ib_dataZoom = ab_arg
end subroutine

public function integer of_apply_async ();//Apply Async
String ls_Url, ls_Html, ls_Options, ls_Shares, ls_JS, ls_FileName, ls_MyChart, ls_Data
Long 	ll_FileOpen
Integer li_return

//Data
ls_Data = is_Data
If Len(ls_Data) <=0 Then
	MessageBox ("Error", "Data is Null!")
	Return -1
End If
//Options
ls_Options = is_Option
If Len(ls_Options) <=0 Then
	MessageBox ("Error", "Option is Null!")
	Return -1
End If

//Replace "
This.of_replace(ls_Data,'"',"")
This.of_replace(ls_Options,'"',"")

//myChart
Choose Case Lower(This.of_GetStyle())
	Case "line"
		ls_MyChart = "var myChart = new google.visualization.LineChart(document.getElementById('main'))"
	Case "area"
		ls_MyChart = "var myChart = new google.visualization.AreaChart(document.getElementById('main'))"
	Case "bar"
		ls_MyChart = "var myChart = new google.visualization.BarChart(document.getElementById('main'))"
	Case "pie"
		ls_MyChart = "var myChart = new google.visualization.PieChart(document.getElementById('main'))"
	Case "scatter"
		ls_MyChart = "var myChart = new google.visualization.ScatterChart(document.getElementById('main'))"
	Case "candlesitick"
		ls_MyChart = "var myChart = new google.visualization.CandlestickChart(document.getElementById('main'))"
	Case "column"
		ls_MyChart = "var myChart = new google.visualization.ColumnChart(document.getElementById('main'))"
	Case "donut"
		ls_MyChart = "var myChart = new google.visualization.PieChart(document.getElementById('main'))"	
	Case Else
		ls_MyChart = "var myChart = new google.visualization.LineChart(document.getElementById('main'))"
End Choose	

//File
ls_FileName = is_FileName
//This.SetReDraw( False )
If Not FileExists(ls_FileName) Then
	//HTML
	ls_Html = "<!DOCTYPE html>~r~n" +&
		"<html>~r~n" +&
		"<head>~r~n" +&
		"    <meta charset=~"utf-8~">~r~n" +&
		"    <title>Charts</title>~r~n" +&
		"    <script charset=~"UTF-8~" src=~"./dist/loader.js~"></script>~r~n" +&
		"	<link id=~"load-css-0~" rel=~"stylesheet~" type=~"text/css~" href=~"./dist/tooltip.css~">~r~n" +&
		"	<link id=~"load-css-1~" rel=~"stylesheet~" type=~"text/css~" href=~"./dist/util.css~">~r~n" +&
		"	<script charset=~"UTF-8~" src=~"./dist/jsapi_compiled_default_module.js~"></script>~r~n" +&
		"	<script charset=~"UTF-8~" src=~"./dist/jsapi_compiled_graphics_module.js~"></script>~r~n" +&
		"	<script charset=~"UTF-8~" src=~"./dist/jsapi_compiled_ui_module.js~"></script>~r~n" +&
		"	<script charset=~"UTF-8~" src=~"./dist/jsapi_compiled_corechart_module.js~"></script>	~r~n" +&
		"</head>~r~n" +&
		"<body>~r~n" +&
		"    <div id=~"main~" style=~"width:" + String( il_Width ) + "px;height:" + String( il_Height ) + "px;~"></div>	~r~n" +&
		"    <script type=~"text/javascript~">~r~n" +&
		"        var data = new google.visualization.arrayToDataTable(" + ls_Data + ");~r~n" +&
		"        var options = " + ls_Options + ";~r~n" +&
		"        " + ls_MyChart + "~r~n" +&
		"        myChart.draw(data, options);~r~n" +&
		"		function resizeEnd(){~r~n" +&
		"			options.width=window.innerWidth-20;~r~n" +&
		"			options.height=window.innerHeight-20;~r~n" +&
		"			myChart.draw(data,options);~r~n" +&
		"		}~r~n" +&
		"		window.addEventListener(~"resize~",resizeEnd,false);~r~n" +&
		"		google.visualization.events.addListener(myChart,~'select~',selectHandler);		~r~n" +&
		"		function selectHandler(e){~r~n" +&
		"			var selection = myChart.getSelection();~r~n" +&
		"			if (selection.length > 0 && selection[0].row != null){~r~n" +&
		"				window.webBrowser.ue_clicked(~'{~"seriesName~":~"~' + ~"series0~" + ~'~",~"name~":~"~' +~r~n" +&
		"				data.getValue(selection[0].row,0) + ~'~",~"value~":~"~' + data.getValue(selection[0].row,1) + ~'~"}~');				~r~n" +&
		"			}~r~n" +&
		"		}~r~n" +&
		"    </script>~r~n" +&
		"</body>~r~n" +&
		"</html>~r~n"
	//Create File
	ll_FileOpen = FileOpen(ls_FileName,TextMode!,Write!,Shared!,Replace!,EncodingUTF8!)
	FileWriteEx(ll_FileOpen,ls_Html)
	FileClose(ll_FileOpen)
	ls_Url ='file:///' + ls_FileName
	This.Navigate( ls_Url )

Else
	String ls_Result, ls_Error
	//JavaScript EvaluateJavaScriptAsync
	//1.width height
	ls_JS = "document.getElementById('main').style.width = '" + String( il_Width ) + "px'"
	This.EvaluateJavaScriptAsync( ls_JS)
	ls_JS = "document.getElementById('main').style.height = '" + String( il_Height ) + "px'"
	This.EvaluateJavaScriptAsync( ls_JS)
	//2.Create the data table.
	ls_JS = "var data = new google.visualization.arrayToDataTable(" + ls_Data + ")"
	This.EvaluateJavaScriptAsync( ls_JS )
	//3.Set options.
	ls_JS = "options=" + ls_Options
	This.EvaluateJavaScriptAsync( ls_JS)
	//4.Create myChart.
	ls_JS = ls_MyChart
	This.EvaluateJavaScriptAsync( ls_JS )	
	//5.myChart.draw(data,option)
	ls_JS = "myChart.draw(data, options)"
	This.EvaluateJavaScriptAsync( ls_JS )	
	//6. addListener(myChart,'select',selectHandler)
	ls_JS = "google.visualization.events.addListener(myChart,'select',selectHandler);"
	This.EvaluateJavaScriptAsync( ls_JS )
	//7.Resize
	ls_JS = "resizeEnd()"
	This.EvaluateJavaScriptAsync( ls_JS )
End If

This.RegisterEvent("ue_clicked")
Return 1





end function

public function string of_getitemstring (ref datawindow adw_1, integer ai_row, integer ai_column);
If adw_1.RowCount() <= 0 Then Return ""
If adw_1.RowCount() < ai_row Then Return ""

String ls_String, ls_Type
ls_Type = adw_1.Describe("#" + String(ai_column) +".ColType")
Choose Case Upper(Left(ls_Type,3))
	Case "DAT"
		If Upper(ls_Type) = "DATE" Then
			ls_String = String(adw_1.GetItemDate(ai_row,ai_column))
		Else
			ls_String = String(adw_1.GetItemDateTime(ai_row,ai_column))
		End If
	Case "TIM"
		ls_String = String(adw_1.GetItemTime(ai_row,ai_column))
	Case "STR","CHA","VAR"
		ls_String = String(adw_1.GetItemString(ai_row,ai_column))
	Case "DEC"
		ls_String = String(adw_1.GetItemDecimal(ai_row,ai_column))
	Case "NUM","INT","LON","REA"
		ls_String = String(adw_1.GetItemNumber(ai_row,ai_column))
	Case "!","?"
		Return ""
	Case Else
		MessageBox ( "Tip", ls_Type + " is Not Match." ) 
End Choose

If IsNull ( ls_String) Then ls_String = "Null"

Return ls_String


end function

public function string of_getitemstring (ref datastore ads_1, integer ai_row, integer ai_column);
If ads_1.RowCount() <= 0 Then Return ""
If ads_1.RowCount() < ai_row Then Return ""

String ls_String, ls_Type
ls_Type = ads_1.Describe("#" + String(ai_column) +".ColType")
Choose Case Upper(Left(ls_Type,3))
	Case "DAT"
		If Upper(ls_Type) = "DATE" Then
			ls_String = String(ads_1.GetItemDate(ai_row,ai_column))
		Else
			ls_String = String(ads_1.GetItemDateTime(ai_row,ai_column))
		End If
	Case "TIM"
		ls_String = String(ads_1.GetItemTime(ai_row,ai_column))
	Case "STR","CHA","VAR"
		ls_String = String(ads_1.GetItemString(ai_row,ai_column))
	Case "DEC"
		ls_String = String(ads_1.GetItemDecimal(ai_row,ai_column))
	Case "NUM","INT","LON","REA"
		ls_String = String(ads_1.GetItemNumber(ai_row,ai_column))
	Case "!","?"
		Return ""
	Case Else
		MessageBox ( "Tip", ls_Type + " is Not Match." ) 
End Choose

If IsNull ( ls_String) Then ls_String = "Null"

Return ls_String


end function

public subroutine of_setseriesname (string as_arg);//SeriesName
this.is_SeriesName = as_arg
end subroutine

public function string of_getseriesname ();//SerieName
Return this.is_SeriesName
end function

public function string of_getresultvalue (string as_json);
//{"type":"string","value":"json"}
JsonParser lnv_JsonParser
Long 		ll_RootObject
String 	ls_Type, ls_Value

lnv_JsonParser = Create JsonParser

lnv_JsonParser.LoadString(as_json)
ll_RootObject = lnv_JsonParser.GetRootItem()
ls_Type = lnv_JsonParser.GetItemString( ll_RootObject, "type" )
Choose Case ls_Type
	Case "string","function", "object", "error"
		ls_Value = lnv_JsonParser.GetItemString( ll_RootObject, "value" )
	Case "double", "integer"
		ls_Value = String (lnv_JsonParser.GetItemNumber ( ll_RootObject, "value" ) )
	Case "datetime"
		ls_Value = String (lnv_JsonParser.GetItemDateTime ( ll_RootObject, "value" ) )
	Case "boolean"
		ls_Value = String (lnv_JsonParser.GetItemBoolean ( ll_RootObject, "value" ) )
	Case "array"
		ls_Value = "Result is array!"
End Choose

If IsValid ( lnv_JsonParser ) Then Destroy ( lnv_JsonParser )

Return ls_Value


end function

public function string of_getweburl ();
//GetWebURL
Integer 	li_Return
String 	ls_URL, ls_Result, ls_Error, ls_JS

//document.URL
//document.location.href
//window.location.href
//self.location.href

ls_JS = "document.URL"
li_Return = This.EvaluateJavaScriptSync( ls_JS, ls_Result, ls_Error )
If li_Return = 1 Then
	ls_URL = This.of_getResultValue( ls_Result )
Else
	MessageBox( "Error", ls_Error )
End If

Return ls_URL
end function

public function string of_getwebsource ();
//GetWebSource
Integer 	li_Return
String 	ls_Source, ls_Result, ls_Error, ls_JS

//document.documentElement.outerHTML
//document.getElementsByTagName("html")[0].outerHTML

ls_JS = 'document.documentElement.outerHTML'
li_Return = This.EvaluateJavaScriptSync( ls_JS, ls_Result, ls_Error )
If li_Return = 1 Then
	ls_Source = This.of_getResultValue( ls_Result )
Else
	MessageBox( "Error", ls_Error )
End If

Return ls_Source
end function

public function string of_getitemstring (ref datastore ads_1, integer ai_row, string as_column);
If ads_1.RowCount() <= 0 Then Return ""
If ads_1.RowCount() < ai_row Then Return ""

String ls_String, ls_Type
ls_Type = ads_1.Describe( as_column +".ColType")
Choose Case Upper(Left(ls_Type,3))
	Case "DAT"
		If Upper(ls_Type) = "DATE" Then
			ls_String = String(ads_1.GetItemDate(ai_row,as_column))
		Else
			ls_String = String(ads_1.GetItemDateTime(ai_row,as_column))
		End If
	Case "TIM"
		ls_String = String(ads_1.GetItemTime(ai_row,as_column))
	Case "STR","CHA","VAR"
		ls_String = String(ads_1.GetItemString(ai_row,as_column))
	Case "DEC"
		ls_String = String(ads_1.GetItemDecimal(ai_row,as_column))
	Case "NUM","INT","LON","REA"
		ls_String = String(ads_1.GetItemNumber(ai_row,as_column))
	Case "!","?"
		Return ""
	Case Else
		MessageBox ( "Tip", ls_Type + " is Not Match." ) 
End Choose

If IsNull ( ls_String) Then ls_String = "Null"

Return ls_String


end function

public function string of_getitemstring (ref datawindow adw_1, integer ai_row, string as_column);
If adw_1.RowCount() <= 0 Then Return ""
If adw_1.RowCount() < ai_row Then Return ""

String ls_String, ls_Type
ls_Type = adw_1.Describe(as_column +".ColType")
Choose Case Upper(Left(ls_Type,3))
	Case "DAT"
		If Upper(ls_Type) = "DATE" Then
			ls_String = String(adw_1.GetItemDate(ai_row,as_column))
		Else
			ls_String = String(adw_1.GetItemDateTime(ai_row,as_column))
		End If
	Case "TIM"
		ls_String = String(adw_1.GetItemTime(ai_row,as_column))
	Case "STR","CHA","VAR"
		ls_String = String(adw_1.GetItemString(ai_row,as_column))
	Case "DEC"
		ls_String = String(adw_1.GetItemDecimal(ai_row,as_column))
	Case "NUM","INT","LON","REA"
		ls_String = String(adw_1.GetItemNumber(ai_row,as_column))
	Case "!","?"
		Return ""
	Case Else
		MessageBox ( "Tip", ls_Type + " is Not Match." ) 
End Choose

If IsNull ( ls_String) Then ls_String = "Null"

Return ls_String


end function

public function string of_getrosetype ();//GetRoseType
Return This.is_roseType
end function

public subroutine of_setrosetype (string as_arg);//RoseType
this.is_roseType = as_arg
end subroutine

public function string of_getcolors ();//Colors
Return this.is_Colors
end function

public subroutine of_setcolors (string as_arg);//SetColors
this.is_Colors = as_arg
end subroutine

public subroutine of_setdata (string as_data);//SetData
String ls_Data
ls_Data = as_data
//Replace "
This.of_replace(ls_Data,'"',"")
this.is_Data = ls_Data




end subroutine

public function string of_getdata ();//GetData
Return this.is_Data
end function

public function string of_createdata (datastore ads_data);//
Long 		ll_I
Long 		ll_RootArray, ll_ChildArray
String 	ls_Data
JsonGenerator ljson_Option

ljson_Option = Create JsonGenerator
ll_RootArray = ljson_Option.CreateJsonArray()
Try
	//Column
	ll_ChildArray = ljson_Option.AddItemArray(ll_RootArray)
	ljson_Option.AddItemString(ll_ChildArray, "'Category'")
	ljson_Option.AddItemString(ll_ChildArray, "'Series1'")
	
	//Data
	FOR ll_i = 1 TO ads_data.RowCount()
		ll_ChildArray = ljson_Option.AddItemArray(ll_RootArray)
		ljson_Option.AddItemString(ll_ChildArray, "'" + This.of_GetItemString( ads_data,ll_i, 1) + "'")
		ljson_Option.AddItemNumber(ll_ChildArray, ads_data.GetItemNumber(ll_i, 2))
	NEXT
	ls_Data = ljson_Option.GetJsonString()
	
Catch(throwable ex)
	MessageBox( "Error", ex.getmessage() )
End Try

Return ls_Data
end function

public function string of_createdata (datawindow adw_data);//
Long 		ll_I
Long 		ll_RootArray, ll_ChildArray
String 	ls_Data
JsonGenerator ljson_Option

ljson_Option = Create JsonGenerator
ll_RootArray = ljson_Option.CreateJsonArray()
Try
	//Column
	ll_ChildArray = ljson_Option.AddItemArray(ll_RootArray)
	ljson_Option.AddItemString(ll_ChildArray, "'Category'")
	ljson_Option.AddItemString(ll_ChildArray, "'Series1'")
	//Data
	FOR ll_i = 1 TO adw_data.RowCount()
		ll_ChildArray = ljson_Option.AddItemArray(ll_RootArray)
		ljson_Option.AddItemString(ll_ChildArray, "'" + This.of_GetItemString( adw_data,ll_i, 1) + "'")
		ljson_Option.AddItemNumber(ll_ChildArray, adw_data.GetItemNumber(ll_i, 2))
	NEXT
	ls_Data = ljson_Option.GetJsonString()
	
Catch(throwable ex)
	MessageBox( "Error", ex.getmessage() )
End Try

Return ls_Data
end function

public function string of_createdata (datawindow adw_series, datawindow adw_category);//
Long 		ll_I, ll_J, ll_K, ll_Row, ll_Find
Long 		ll_RootArray, ll_ChildArray
String 	ls_Data, ls_SeriesName, ls_ColumnName
DataStore 	lds_Columns
JsonGenerator ljson_Option

lds_Columns = Create DataStore
lds_Columns.DataObject = "d_dw_columns"

ljson_Option = Create JsonGenerator
ll_RootArray = ljson_Option.CreateJsonArray()
Try
	//Header
	ll_ChildArray = ljson_Option.AddItemArray(ll_RootArray)
	ljson_Option.AddItemString(ll_ChildArray, "'Category'")
	FOR ll_i = 1 TO adw_Series.RowCount()
		ls_SeriesName = This.of_GetItemString( adw_Series,ll_i, 1)
		ljson_Option.AddItemString(ll_ChildArray, "'" + ls_SeriesName + "'")
		//Columns
		If ll_I = 1 Then
			adw_Category.SetFilter("#1='"+ls_SeriesName +"'")
			adw_Category.Filter()
			adw_Category.SetSort("#2")
			adw_Category.Sort()
			For ll_j = 1 To adw_Category.RowCount()
				ll_Row = lds_Columns.InsertRow(0)
				lds_Columns.SetItem( ll_Row, 1, This.of_GetItemString( adw_Category,ll_j, 2) )
			Next
		End If
	Next
	//Data
	adw_Category.SetFilter("")
	adw_Category.Filter()
	FOR ll_i = 1 TO lds_Columns.RowCount()
		ll_ChildArray = ljson_Option.AddItemArray(ll_RootArray)
		ls_ColumnName = lds_Columns.GetItemString( ll_i, 1 )
		ljson_Option.AddItemString(ll_ChildArray, "'" + ls_ColumnName + "'")		
		FOR ll_j = 1 TO adw_Series.RowCount()
			ls_SeriesName = This.of_GetItemString( adw_Series,ll_j, 1)
			ll_Find = adw_Category.Find( "#1='" + ls_SeriesName + "' and #2='" + ls_ColumnName + "'" , 1, adw_Category.RowCount() )
			If ll_Find > 0 Then
				ljson_Option.AddItemNumber(ll_ChildArray, adw_Category.GetItemNumber(ll_Find, 3))
			End If
		NEXT
	Next
	ls_Data = ljson_Option.GetJsonString()
	
Catch(throwable ex)
	MessageBox( "Error", ex.getmessage() )
End Try

Return ls_Data
end function

public function string of_createdata (datastore ads_series, datastore ads_category);//
Long 		ll_I, ll_J, ll_K, ll_Row, ll_Find
Long 		ll_RootArray, ll_ChildArray
String 	ls_Data, ls_SeriesName, ls_ColumnName
DataStore 	lds_Columns
JsonGenerator ljson_Option

lds_Columns = Create DataStore
lds_Columns.DataObject = "d_dw_columns"

ljson_Option = Create JsonGenerator
ll_RootArray = ljson_Option.CreateJsonArray()
Try
	//Header
	ll_ChildArray = ljson_Option.AddItemArray(ll_RootArray)
	ljson_Option.AddItemString(ll_ChildArray, "'Category'")
	FOR ll_i = 1 TO ads_series.RowCount()
		ls_SeriesName = This.of_GetItemString( ads_series,ll_i, 1)
		ljson_Option.AddItemString(ll_ChildArray, "'" + ls_SeriesName + "'")
		//Columns
		If ll_I = 1 Then
			ads_category.SetFilter("#1='"+ls_SeriesName +"'")
			ads_category.Filter()
			ads_category.SetSort("#2")
			ads_category.Sort()
			For ll_j = 1 To ads_category.RowCount()
				ll_Row = lds_Columns.InsertRow(0)
				lds_Columns.SetItem( ll_Row, 1, This.of_GetItemString( ads_category,ll_j, 2) )
			Next
		End If
	Next
	//Data
	ads_category.SetFilter("")
	ads_category.Filter()
	FOR ll_i = 1 TO lds_Columns.RowCount()
		ll_ChildArray = ljson_Option.AddItemArray(ll_RootArray)
		ls_ColumnName = lds_Columns.GetItemString( ll_i, 1 )
		ljson_Option.AddItemString(ll_ChildArray, "'" + ls_ColumnName + "'")		
		FOR ll_j = 1 TO ads_series.RowCount()
			ls_SeriesName = This.of_GetItemString( ads_series,ll_j, 1)
			ll_Find = ads_category.Find( "#1='" + ls_SeriesName + "' and #2='" + ls_ColumnName + "'" , 1, ads_category.RowCount() )
			If ll_Find > 0 Then
				ljson_Option.AddItemNumber(ll_ChildArray, ads_category.GetItemNumber(ll_Find, 3))
			End If
		NEXT
	Next
	ls_Data = ljson_Option.GetJsonString()
	
Catch(throwable ex)
	MessageBox( "Error", ex.getmessage() )
End Try

Return ls_Data
end function

public function string of_createdata (datastore ads_data, string as_categorycol, string as_valuecol);//
Long 		ll_I
Long 		ll_RootArray, ll_ChildArray
String 	ls_Data
JsonGenerator ljson_Option

ljson_Option = Create JsonGenerator
ll_RootArray = ljson_Option.CreateJsonArray()
Try
	//Column
	ll_ChildArray = ljson_Option.AddItemArray(ll_RootArray)
	ljson_Option.AddItemString(ll_ChildArray, "'Category'")
	ljson_Option.AddItemString(ll_ChildArray, "'Series1'")
	
	//Data
	FOR ll_i = 1 TO ads_data.RowCount()
		ll_ChildArray = ljson_Option.AddItemArray(ll_RootArray)
		ljson_Option.AddItemString(ll_ChildArray, "'" + This.of_GetItemString( ads_data,ll_i, as_categorycol ) + "'")
		ljson_Option.AddItemNumber(ll_ChildArray, ads_data.GetItemNumber(ll_i,  as_valuecol ))
	NEXT
	ls_Data = ljson_Option.GetJsonString()
	
Catch(throwable ex)
	MessageBox( "Error", ex.getmessage() )
End Try

Return ls_Data
end function

public function string of_createdata (datawindow adw_data, string as_categorycol, string as_valuecol);//
Long 		ll_I
Long 		ll_RootArray, ll_ChildArray
String 	ls_Data
JsonGenerator ljson_Option

ljson_Option = Create JsonGenerator
ll_RootArray = ljson_Option.CreateJsonArray()
Try
	//Column
	ll_ChildArray = ljson_Option.AddItemArray(ll_RootArray)
	ljson_Option.AddItemString(ll_ChildArray, "'Category'")
	ljson_Option.AddItemString(ll_ChildArray, "'Series1'")
	//Data
	FOR ll_i = 1 TO adw_data.RowCount()
		ll_ChildArray = ljson_Option.AddItemArray(ll_RootArray)
		ljson_Option.AddItemString(ll_ChildArray, "'" + This.of_GetItemString( adw_data,ll_i, as_categorycol ) + "'")
		ljson_Option.AddItemNumber(ll_ChildArray, adw_data.GetItemNumber(ll_i, as_valuecol ))
	NEXT
	ls_Data = ljson_Option.GetJsonString()
	
Catch(throwable ex)
	MessageBox( "Error", ex.getmessage() )
End Try

Return ls_Data
end function

public function string of_createdata (string as_sql);//
String 	ls_Style, ls_DWSyntax, ls_Error
DataStore 	lds_data

ls_style = 'style(type=grid )'
If Len (as_sql ) > 0 Then
	lds_data = Create DataStore
	ls_DWSyntax = SQLCA.SyntaxFromSQL( as_sql, ls_style, ls_Error )
	If Len ( ls_Error ) > 0 Then
		MessageBox ( "Caution", "SyntaxFromSQL caused these errors: " + ls_Error )
		Return ""
	End If
	lds_data.Create( ls_DWSyntax, ls_Error)
	If Len ( ls_Error ) > 0 Then
		MessageBox ( "Caution", "Create cause these errors: " + ls_Error )
		Return ""
	End If
	lds_data.SetTransObject ( SQLCA )
	lds_data.Retrieve()

	IF lds_data.RowCount() > 0 Then
		Return This.of_CreateData ( lds_data )
	End If
END IF
If IsValid ( lds_data ) Then Destroy ( lds_data )

Return ""
end function

public function string of_createdata (string as_sql, string as_categorycol, string as_valuecol);//
String 	ls_Style, ls_DWSyntax, ls_Error
DataStore 	lds_data

ls_style = 'style(type=grid )'
If Len (as_sql ) > 0 Then
	lds_data = Create DataStore
	ls_DWSyntax = SQLCA.SyntaxFromSQL( as_sql, ls_style, ls_Error )
	If Len ( ls_Error ) > 0 Then
		MessageBox ( "Caution", "SyntaxFromSQL caused these errors: " + ls_Error )
		Return ""
	End If
	lds_data.Create( ls_DWSyntax, ls_Error)
	If Len ( ls_Error ) > 0 Then
		MessageBox ( "Caution", "Create cause these errors:: " + ls_Error )
		Return ""
	End If
	lds_data.SetTransObject ( SQLCA )
	lds_data.Retrieve()

	IF lds_data.RowCount() > 0 Then
		Return This.of_CreateData ( lds_data, as_categorycol, as_valuecol )
	End If
END IF
If IsValid ( lds_data ) Then Destroy ( lds_data )

Return ""
end function

public function string of_createdata_series (string as_sql, string as_categorycol, string as_valuecol, string as_series);//
String 	ls_Style, ls_DWSyntax, ls_Error, ls_Value
String 	ls_SQL1, ls_SQL2, ls_SQL3
DataStore 	lds_data1, lds_data2, lds_data3
Long 		ll_I, ll_J, ll_Find
Long 		ll_RootArray, ll_ChildArray
String 	ls_Data, ls_SeriesName, ls_CategoryName, ls_ColumnName
JsonGenerator ljson_Option


ls_style = 'style(type=grid )'
If Len (as_sql ) > 0 Then
	//Category
	ls_SQL1 = "SELECT " + as_categorycol + " FROM ( " + as_sql + " )SERIES1 GROUP BY " + as_categorycol
	lds_data1 = Create DataStore
	ls_DWSyntax = SQLCA.SyntaxFromSQL( ls_SQL1, ls_style, ls_Error )
	If Len ( ls_Error ) > 0 Then
		MessageBox ( "Caution", "SyntaxFromSQL caused these errors: " + ls_Error )
		Return ""
	End If
	lds_data1.Create( ls_DWSyntax, ls_Error)
	If Len ( ls_Error ) > 0 Then
		MessageBox ( "Caution", "Create cause these errors:: " + ls_Error )
		Return ""
	End If
	lds_data1.SetTransObject ( SQLCA )
	lds_data1.Retrieve()

	//Series
	ls_SQL2 = "SELECT " + as_series + " FROM ( " + as_sql + " )SERIES1 GROUP BY " + as_series
	lds_data2 = Create DataStore
	ls_DWSyntax = SQLCA.SyntaxFromSQL( ls_SQL2, ls_style, ls_Error )
	If Len ( ls_Error ) > 0 Then
		MessageBox ( "Caution", "SyntaxFromSQL caused these errors: " + ls_Error )
		Return ""
	End If
	lds_data2.Create( ls_DWSyntax, ls_Error)
	If Len ( ls_Error ) > 0 Then
		MessageBox ( "Caution", "Create cause these errors:: " + ls_Error )
		Return ""
	End If
	lds_data2.SetTransObject ( SQLCA )
	lds_data2.Retrieve()
	
	//Data
	If Pos ( Upper(as_valuecol), "SUM(" ) > 0 Or Pos (  Upper(as_valuecol), "COUNT(" ) >0 Then
		ls_Value = "valuescolumn"
		ls_SQL3 = "SELECT " + as_categorycol + "," + as_series + "," + as_valuecol + " AS valuescolumn " + " FROM ( " + as_sql + " )SERIES1 GROUP BY " +as_categorycol + "," + as_series
	Else
		ls_Value = as_valuecol
		ls_SQL3 = "SELECT " + as_categorycol + "," + as_series + ", SUM(" + ls_value + ") AS " + ls_value + " FROM ( " + as_sql + " )SERIES1 GROUP BY " +as_categorycol + "," + as_series
	End If
	lds_data3 = Create DataStore
	ls_DWSyntax = SQLCA.SyntaxFromSQL( ls_SQL3, ls_style, ls_Error )
	If Len ( ls_Error ) > 0 Then
		MessageBox ( "Caution", "SyntaxFromSQL caused these errors: " + ls_Error )
		Return ""
	End If
	lds_data3.Create( ls_DWSyntax, ls_Error)
	If Len ( ls_Error ) > 0 Then
		MessageBox ( "Caution", "Create cause these errors:: " + ls_Error )
		Return ""
	End If
	lds_data3.SetTransObject ( SQLCA )
	lds_data3.Retrieve()
	
END IF

If ( lds_data1.RowCount() > 0 And lds_data2.RowCount() > 0 And lds_data3.RowCount() > 0 ) Then
	ljson_Option = Create JsonGenerator
	ll_RootArray = ljson_Option.CreateJsonArray()
	Try
		//Header
		ll_ChildArray = ljson_Option.AddItemArray(ll_RootArray)
		ljson_Option.AddItemString(ll_ChildArray, "'Category'")
		FOR ll_i = 1 TO lds_data2.RowCount()
			ls_SeriesName = This.of_GetItemString( lds_data2,ll_i, as_series )
			ljson_Option.AddItemString(ll_ChildArray, "'" + ls_SeriesName + "'")			
		Next
		//Data
		FOR ll_i = 1 TO lds_data1.RowCount()
			ll_ChildArray = ljson_Option.AddItemArray(ll_RootArray)
			ls_ColumnName = lds_data1.GetItemString( ll_i, 1 )
			ljson_Option.AddItemString(ll_ChildArray, "'" + ls_ColumnName + "'")		
			FOR ll_j = 1 TO lds_data2.RowCount()
				ls_SeriesName = This.of_GetItemString( lds_data2,ll_j, 1)
				ll_Find = lds_data3.Find( "#1='" + ls_ColumnName + "' and #2='" + ls_SeriesName + "'" , 1, lds_data3.RowCount() )
				If ll_Find > 0 Then
					ljson_Option.AddItemNumber(ll_ChildArray, lds_data3.GetItemNumber(ll_Find, 3))
				End If
			NEXT
		Next
		ls_Data = ljson_Option.GetJsonString()
		
	Catch(throwable ex)
		MessageBox( "Error", ex.getmessage() )
	End Try

End If

If IsValid ( lds_data1 ) Then Destroy ( lds_data1 )
If IsValid ( lds_data2 ) Then Destroy ( lds_data2 )
If IsValid ( lds_data3 ) Then Destroy ( lds_data3 )

Return ls_Data
end function

public function string of_createdata_dataobject (string as_dataobject);//
DataStore 	lds_Data

If IsNull ( as_dataobject ) Or Len ( as_dataobject ) <= 0 Then
	Return ""
End If

lds_Data = Create DataStore
lds_Data.DataObject = as_dataobject
lds_Data.SetTransObject ( SQLCA )
lds_Data.Retrieve()

If lds_Data.RowCount() <= 0 Then
	Return ""
End If

Return This.of_createdata_graph( lds_Data )
end function

public function string of_createdata_graph (datastore ads_data);//
DataStore 	lds_Series, lds_Category
Long 		ll_SeriesCount, ll_I, ll_J, ll_Row, ll_Row2, ll_DataCount
String 	ls_SeriesName, ls_SeriesName2, ls_Category, ls_Data
Double 	ldb_Value
JsonGenerator ljson_Option

//get series
lds_Series = Create DataStore
lds_Series.DataObject = "d_dw_series"

//Get x and y axis data
lds_Category = Create DataStore
lds_Category.DataObject = "d_dw_category"

ll_SeriesCount = ads_data.SeriesCount("gr_1")
FOR ll_i = 1 TO ll_SeriesCount
	ls_SeriesName = ads_data.SeriesName("gr_1",ll_i)
	ls_SeriesName2 = ls_SeriesName
	IF isNull(ls_SeriesName2) OR Trim(ls_SeriesName2) = "" THEN
		ls_SeriesName2 = "Series" + String(ll_i)
	END IF
	ll_Row = lds_Series.InsertRow(0)        //Require this column to be inserted into the current column
	lds_Series.SetItem(ll_Row, 1, ls_SeriesName2) //First column: seriesname
	
	ll_DataCount =ads_data.DataCount("gr_1", ls_SeriesName)
	FOR ll_j = 1 TO ll_DataCount
		//category name
		ls_Category = ads_data.CategoryName("gr_1",ll_j)
		//data
		ldb_Value = ads_data.GetData("gr_1",ll_i,ll_j)
		ll_Row2 = lds_Category.InsertRow(0)		
		lds_Category.SetItem(ll_Row2, 1, ls_SeriesName2)
		lds_Category.SetItem(ll_Row2, 2, ls_Category)
		lds_Category.SetItem(ll_Row2, 3, ldb_Value)
	NEXT
NEXT

ls_Data = This.of_CreateData(lds_Series, lds_Category )


If IsValid ( lds_Series ) Then Destroy ( lds_Series )
If IsValid ( lds_Category ) Then Destroy ( lds_Category )

Return ls_Data
end function

public function string of_createoption ();//
String 	ls_Option

ls_Option = "{'title':'" + This.of_GetTitle() + "'"

//3D
If This.of_getIs3d() Then
	ls_Option += ",'is3D':true"
End If
//donut
If This.of_getStyle() = "donut" Then
	ls_Option += ",'pieHole':0.4"
End If
//candlesitick
If This.of_getStyle() = "candlesitick" Then
	ls_Option += ",bar:{groupWidth:'100%'},candlestick:{fallingColor:{strokeWidth:0,fill:'#a52714'},risingColor:{strokeWidth:0,fill:'#0f9d58'}}"
End If

ls_Option += "}"

Return ls_Option
end function

public subroutine of_setis3d (boolean ab_arg);//SetIs3D
this.ib_is3D = ab_arg
end subroutine

public function boolean of_getis3d ();//GetIs3D
Return this.ib_is3D
end function

public function string of_createdata_candlestick (datawindow adw_data, string as_low, string as_open, string as_close, string as_high);//
Long 		ll_I
Long 		ll_RootArray, ll_ChildArray
String 	ls_Data
JsonGenerator ljson_Option

ljson_Option = Create JsonGenerator
ll_RootArray = ljson_Option.CreateJsonArray()
Try
	//Data
	FOR ll_i = 1 TO adw_data.RowCount()
		ll_ChildArray = ljson_Option.AddItemArray(ll_RootArray)
		ljson_Option.AddItemString(ll_ChildArray, "'" + This.of_GetItemString( adw_data,ll_i, 1) + "'")
		ljson_Option.AddItemNumber(ll_ChildArray, adw_data.GetItemNumber(ll_i, as_low ))
		ljson_Option.AddItemNumber(ll_ChildArray, adw_data.GetItemNumber(ll_i, as_open ))
		ljson_Option.AddItemNumber(ll_ChildArray, adw_data.GetItemNumber(ll_i, as_close ))
		ljson_Option.AddItemNumber(ll_ChildArray, adw_data.GetItemNumber(ll_i, as_high ))
		
	NEXT
	ls_Data = ljson_Option.GetJsonString()
	
Catch(throwable ex)
	MessageBox( "Error", ex.getmessage() )
End Try

Return ls_Data
end function

public function string of_createdata_candlestick (datastore ads_data, string as_low, string as_open, string as_close, string as_high);//
Long 		ll_I
Long 		ll_RootArray, ll_ChildArray
String 	ls_Data
JsonGenerator ljson_Option

ljson_Option = Create JsonGenerator
ll_RootArray = ljson_Option.CreateJsonArray()
Try
	//Data
	FOR ll_i = 1 TO ads_data.RowCount()
		ll_ChildArray = ljson_Option.AddItemArray(ll_RootArray)
		ljson_Option.AddItemString(ll_ChildArray, "'" + This.of_GetItemString( ads_data,ll_i, 1) + "'")
		ljson_Option.AddItemNumber(ll_ChildArray, ads_data.GetItemNumber(ll_i, as_low ))
		ljson_Option.AddItemNumber(ll_ChildArray, ads_data.GetItemNumber(ll_i, as_open ))
		ljson_Option.AddItemNumber(ll_ChildArray, ads_data.GetItemNumber(ll_i, as_close ))
		ljson_Option.AddItemNumber(ll_ChildArray, ads_data.GetItemNumber(ll_i, as_high ))
		
	NEXT
	ls_Data = ljson_Option.GetJsonString()
	
Catch(throwable ex)
	MessageBox( "Error", ex.getmessage() )
End Try

Return ls_Data
end function

on n_webbrowser.create
end on

on n_webbrowser.destroy
end on

event evaluatejavascriptfinished;If Len ( ErrorMessage ) > 0 Then
	MessageBox ( "EvaluateJavaScriptFinished Error", ErrorMessage )
End If
end event

event constructor;is_Theme = gs_EChartsTheme
end event


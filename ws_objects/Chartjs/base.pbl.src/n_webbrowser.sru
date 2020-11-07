$PBExportHeader$n_webbrowser.sru
forward
global type n_webbrowser from webbrowser
end type
end forward

global type n_webbrowser from webbrowser
integer width = 2341
integer height = 1180
string defaulturl = "file:///chartjs.html"
event ue_clicked ( string as_arg )
end type
global n_webbrowser n_webbrowser

type variables
Private:
String is_FileName = "chartjs.html"
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
public function string of_createoption (string as_sql, string as_type)
public function string of_createoption (string as_sql)
public function string of_createoption (datastore ads_data, string as_type)
public function string of_createoption (datastore ads_data)
public function string of_createoption_dataobject (string as_dataobject, string as_type)
public function string of_createoption_dataobject (string as_dataobject)
public function string of_getitemstring (ref datawindow adw_1, integer ai_row, integer ai_column)
public function string of_getitemstring (ref datastore ads_1, integer ai_row, integer ai_column)
public function string of_createoption_graph (datastore ads_data, string as_type)
public function string of_createoption_graph (datastore ads_data)
public subroutine of_setseriesname (string as_arg)
public function string of_getseriesname ()
public function string of_getresultvalue (string as_json)
public function string of_getweburl ()
public function string of_getwebsource ()
public function string of_createoption_graph (datawindow adw_data, string as_type)
public function string of_createoption_graph (datawindow adw_data)
public function string of_createoption (datastore ads_series, datastore ads_category, string as_type)
public function string of_createoption (datastore ads_series, datastore ads_category)
public function string of_createoption (string as_sql, string as_type, string as_categorycol, string as_valuecol)
public function string of_createoption (datastore ads_data, string as_type, string as_categorycol, string as_valuecol)
public function string of_getitemstring (ref datastore ads_1, integer ai_row, string as_column)
public function string of_getitemstring (ref datawindow adw_1, integer ai_row, string as_column)
public function string of_createoption (datastore ads_data, string as_categorycol, string as_valuecol)
public function string of_createoption (string as_sql, string as_categorycol, string as_valuecol)
public function string of_getrosetype ()
public subroutine of_setrosetype (string as_arg)
public function string of_createoption_series (string as_sql, string as_type, string as_categorycol, string as_valuecol, string as_series)
public function string of_createoption_series (string as_sql, string as_categorycol, string as_valuecol, string as_series)
public function string of_createoption (datawindow adw_data)
public function string of_createoption (datawindow adw_data, string as_categorycol, string as_valuecol)
public function string of_createoption (datawindow adw_data, string as_type)
public function string of_createoption (datawindow adw_data, string as_type, string as_categorycol, string as_valuecol)
public function string of_createoption (datawindow adw_series, datawindow adw_category)
public function string of_createoption (datawindow adw_series, datawindow adw_category, string as_type)
public function string of_getcolors ()
public subroutine of_setcolors (string as_arg)
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
String ls_Url, ls_Html, ls_Option, ls_Shares, ls_JS, ls_FileName, ls_ctx, ls_MyChart
Long 	ll_FileOpen
Integer li_return

//Option
ls_Option = is_Option
If Len(ls_Option) <=0 Then
	MessageBox ("Error", "Option is Null!")
	Return -1
End If

//Replace "
This.of_replace(ls_Option,'"',"")


//File
ls_FileName = is_FileName
//This.SetReDraw( False )
IF Not FileExists(ls_FileName) Then
	//HTML
	ls_Html = "<!DOCTYPE html>~r~n"
	ls_Html += "<html>~r~n"
	ls_Html += "<head>~r~n"
	ls_Html += "    <title>Charts</title>~r~n"
	ls_Html += "    <meta charset=~"UTF-8~">~r~n"
	ls_Html += '    <script src="./dist/Chart.min.js"></script>~r~n'
	ls_Html += '    <script src="./dist/utils.js"></script>~r~n'
	ls_Html += "    <style>canvas{-moz-user-select: none;-webkit-user-select: none;-ms-user-select: none;}</style>~r~n"
	ls_Html += "</head>~r~n"
	ls_Html += "<body>~r~n"
	ls_Html += '    <div id="container" style="width:' + String (100 ) + '%";>~r~n'
	ls_Html += '        <canvas id="canvas"></canvas>~r~n'
	ls_Html += '    </div>~r~n'
	ls_Html +="	<script>~r~n"
	ls_Html +=	"		var color = Chart.helpers.color;~r~n"
	ls_Html +=	"		var ctx = document.getElementById('canvas').getContext('2d');~r~n"
	ls_Html +=	"		var option = "+ls_Option+";~r~n"
	ls_Html +=	"		window.myChart = new Chart(ctx, option);~r~n"
	ls_Html +=	"		canvas.onclick = function(evt){~r~n"+&
					"			var activePoints = myChart.getElementsAtEvent(evt);~r~n"+&
					"			window.webBrowser.ue_clicked('{~"name~":~"' + activePoints[0]._index + '~"}');~r~n"+&
					"		}~r~n"
	ls_Html +=	"		myChart.destroy();~r~n"
	ls_Html += "  </script>~r~n"
	ls_Html +="</body>~r~n"	
	ls_Html +="</html>"
	ll_FileOpen = FileOpen(ls_FileName,TextMode!,Write!,Shared!,Replace!,EncodingUTF8!)
	FileWriteEx(ll_FileOpen,ls_Html)
	FileClose(ll_FileOpen)
	ls_Url ='file:///' + ls_FileName
	This.Navigate( ls_Url )

ELSE
	ls_JS = "ctx = document.getElementById('canvas').getContext('2d');~r~n" 
	This.EvaluateJavaScriptSync( ls_JS)
	
	ls_JS = "option =" + ls_Option
	This.EvaluateJavaScriptSync( ls_JS)
	
	ls_JS = "myChart.destroy();"
	This.EvaluateJavaScriptSync( ls_JS)
	
	ls_JS = "canvas.onclick = function(evt){var activePoints = myChart.getElementsAtEvent(evt);window.webBrowser.ue_clicked('{~"name~":~"' + activePoints[0]._index + '~"}');}"
	This.EvaluateJavaScriptSync( ls_JS)
	
	ls_JS = "window.myChart = new Chart(ctx, option);"
	This.EvaluateJavaScriptSync( ls_JS)

END IF

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
String ls_Url, ls_Html, ls_Option, ls_Shares, ls_JS, ls_FileName
Long 	ll_FileOpen
Integer li_return

//Option
ls_Option = is_Option
If Len(ls_Option) <=0 Then
	MessageBox ("Error", "Option is Null!")
	Return -1
End If

//Replace "
This.of_replace(ls_Option,'"',"")

//File
ls_FileName = is_FileName

If Not FileExists(ls_FileName) Then
	//HTML
	ls_Html = "<!DOCTYPE html>~r~n"
	ls_Html += "<html>~r~n"
	ls_Html += "<head>~r~n"
	ls_Html += "    <title>ECharts</title>~r~n"
	ls_Html += "    <meta charset=~"UTF-8~">~r~n"
	ls_Html += '    <script src="./dist/echarts-en.js"></script>~r~n'
	ls_Html += "</head>~r~n"
	ls_Html += "<body>~r~n"
	ls_Html += '    <div id="main" style="width: ' + String( il_Width ) + 'px;height:' + String( il_Height ) + 'px;"></div>~r~n'
	ls_Html += '    <script type="text/javascript">~r~n'
	ls_Html += "    var canvase = document.getElementById('main');~r~n"
	ls_Html += "    function resizeCanvas(){~r~n"
	ls_Html += "      w=canvase.width=window.innerWidth - 20;~r~n"
	ls_Html += "      h=canvase.height=window.innerHeight - 20;~r~n"
	ls_Html += "      myChart.resize({width:w,height:h});~r~n"
	ls_Html += "    }~r~n"
	ls_Html += "    window.addEventListener('resize',resizeCanvas,false);~r~n"
	ls_Html += "    var myChart = echarts.init(document.getElementById('main'),'" + is_Theme +"');~r~n"
	ls_Html += "    option = " + ls_Option + ";~r~n"
	ls_Html += "    myChart.setOption(option);~r~n"
	ls_Html += "    myChart.on('click',function(params){window.webBrowser.ue_clicked('{~"seriesName~":~"' + params.seriesName + '~",~"name~":~"' + params.name + '~",~"value~":~"' + params.value + '~"}');});~r~n"
	ls_Html += "    </script>~r~n"
	ls_Html += " </body>~r~n"
	ls_Html += " </html>"
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
	//2.myChart.dispose()
	ls_JS = "if(!myChart.isDisposed()){myChart.dispose();}"
	This.EvaluateJavaScriptAsync( ls_JS )
	//3.echarts.ini()
	ls_JS = "myChart = echarts.init(document.getElementById('main'),'"+is_Theme+"');"
	This.EvaluateJavaScriptAsync( ls_JS )
	//4.option=ls_option
	ls_JS = "option=" + ls_Option
	This.EvaluateJavaScriptAsync( ls_JS )
	//5.myChart.setOption(option)
	ls_JS = "myChart.setOption(option)"
	This.EvaluateJavaScriptAsync( ls_JS )
	//6. myChart.on('click')
	ls_JS = "myChart.on('click',function(params){window.webBrowser.ue_clicked('{~"seriesName~":~"' + params.seriesName + '~",~"name~":~"' + params.name + '~",~"value~":~"' + params.value + '~"}');});"
	This.EvaluateJavaScriptAsync( ls_JS )
	//7.Resize
	ls_js = "resizeCanvas()"
	This.EvaluateJavaScriptAsync( ls_JS )

End If

This.RegisterEvent("ue_clicked")
Return 1





end function

public function string of_createoption (string as_sql, string as_type);//
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
		Return This.of_CreateOption ( lds_data, as_type )
	End If
END IF
If IsValid ( lds_data ) Then Destroy ( lds_data )

Return ""
end function

public function string of_createoption (string as_sql);//
Return This.of_createOption( as_sql, This.of_GetStyle() )
end function

public function string of_createoption (datastore ads_data, string as_type);//
Long 		ll_I, ll_J, ll_Row, ll_Row2
Long 		ll_RootObject,ll_ChildObject, ll_ChildArray, ll_ChildArray2,ll_ChildObject2
Long 		ll_ChildObject3, ll_ChildArray3, ll_ChildObject4, ll_ChildObject5
String 	ls_Option, ls_Type, ls_Colors
Double 	ldb_Value
JsonGenerator ljson_Option

ls_Type = Lower( as_Type )

//title
//legend
//grid{left:130,right:'30%',height:'40%',bottom:110}
//tooltip
//toolbox
//dataZoom
//visualMap
//xAxis:[{type:'category',...},{}]
//yAxis:[{...},{...}]
//series:[{type:'line',...},{...}]

ljson_Option = Create JsonGenerator
ll_RootObject = ljson_Option.CreateJsonObject()

//Colors
ls_Colors = This.of_GetColors()
If Len ( ls_Colors ) > 0 Then
	ll_ChildArray = ljson_Option.AddItemArray(ll_RootObject, "color")
	ljson_Option.AddItemString(ll_ChildArray, ls_Colors )
End If

//Title
ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "title")
ljson_Option.AddItemString(ll_ChildObject, "text",  "'" + This.of_Gettitle() + "'")

Try
	
	Choose Case ls_Type
		Case "line", "bar", "scatter", "area"
			//legend
			ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "legend")
			ll_ChildArray = ljson_Option.AddItemArray(ll_ChildObject, "data")
			ljson_Option.AddItemString(ll_ChildArray, "'" + This.of_GetSeriesName() + "'" )
			//grid
			ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "grid")
			ljson_Option.AddItemString(ll_ChildObject, "left","'3%'")
			ljson_Option.AddItemString(ll_ChildObject, "right","'4%'")
			ljson_Option.AddItemString(ll_ChildObject, "bottom","'3%'")
			ljson_Option.AddItemBoolean(ll_ChildObject,"containLabel",True)
			//ToolTip
			ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "tooltip")
			ljson_Option.AddItemString(ll_ChildObject, "trigger", "'axis'")
			//ToolBox
			IF This.of_GetToolBox() THEN
				ll_ChildObject2 = ljson_Option.AddItemObject(ll_RootObject, "toolbox")
				ll_ChildObject3 = ljson_Option.AddItemObject(ll_ChildObject2, "feature")
				ljson_Option.AddItemObject(ll_ChildObject3, "dataZoom")
				ljson_Option.AddItemObject(ll_ChildObject3, "saveAsImage")
				ljson_Option.AddItemObject(ll_ChildObject3, "dataView")
			END IF
			//dataZoom
			IF This.of_GetDataZoom() THEN
				ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "dataZoom")
				ljson_Option.AddItemString(ll_ChildObject, "orient", "'horizontal'")
			END IF
			//xaxis
			ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "xAxis")
			ljson_Option.AddItemString(ll_ChildObject, "type","'category'")
			If ls_Type = "area" Then
				ljson_Option.AddItemBoolean(ll_ChildObject, "boundaryGap",false)
			End If
			ll_ChildArray = ljson_Option.AddItemArray(ll_ChildObject, "data")
			FOR ll_i = 1 TO ads_data.RowCount()
				ljson_Option.AddItemString(ll_ChildArray, "'" +This.of_GetItemString(ads_data,ll_i, 1) + "'")
			NEXT
			
			//yaxis
			ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "yAxis")
			ljson_Option.AddItemString(ll_ChildObject, "type","'value'")
			
			//series
			ll_ChildArray = ljson_Option.AddItemArray(ll_RootObject, "series" )
			ll_ChildObject2 = ljson_Option.AddItemObject(ll_ChildArray)
			If ls_Type <> "area" Then
				ljson_Option.AddItemString(ll_ChildObject2, "type","'" + ls_Type + "'")
			End If
			ljson_Option.AddItemString(ll_ChildObject2, "name","'" + This.of_GetSeriesName() + "'")
			ll_ChildArray2 = ljson_Option.AddItemArray(ll_ChildObject2, "data")
			FOR ll_j = 1 TO ads_data.RowCount()
				ljson_Option.AddItemNumber(ll_ChildArray2, ads_data.GetItemNumber(ll_j, 2 ))
			NEXT
			If ls_Type = "area" Then
				ljson_Option.AddItemString(ll_ChildObject2, "type","'line'")
				ljson_Option.AddItemString(ll_ChildObject2, "areaStyle","''")
			End If
			
		Case "pie"
			ljson_Option.AddItemString(ll_ChildObject, "x", "'center'")
			//legend
			ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "legend")
			ljson_Option.AddItemString(ll_ChildObject, "orient", "'vertical'")
			ljson_Option.AddItemString(ll_ChildObject, "left", "'left'")
			ll_ChildArray = ljson_Option.AddItemArray(ll_ChildObject, "data")
			FOR ll_i = 1 TO ads_data.RowCount()
				ljson_Option.AddItemString(ll_ChildArray, "'" + This.of_GetItemString(ads_data,ll_i, 1) + "'")
			NEXT
	
			//tooltip
			ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "tooltip")
			ljson_Option.AddItemString(ll_ChildObject, "trigger", "'item'")
			ljson_Option.AddItemString(ll_ChildObject, "formatter", "'{a} <br/>{b} : {c} ({d}%)'")
			
			//ToolBox
			IF  This.of_GetToolBox() THEN
				ll_ChildObject2 = ljson_Option.AddItemObject(ll_RootObject, "toolbox")
				ll_ChildObject3 = ljson_Option.AddItemObject(ll_ChildObject2, "feature")
				ljson_Option.AddItemObject(ll_ChildObject3, "saveAsImage")
				ljson_Option.AddItemObject(ll_ChildObject3, "dataView")
			END IF
			
			//grid
			ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "grid")
			ljson_Option.AddItemString(ll_ChildObject, "left","'3%'")
			ljson_Option.AddItemString(ll_ChildObject, "right","'4%'")
			ljson_Option.AddItemString(ll_ChildObject, "bottom","'3%'")
			ljson_Option.AddItemBoolean(ll_ChildObject,"containLabel",True)
			
			//series
			ll_ChildArray = ljson_Option.AddItemArray(ll_RootObject, "series")
			ll_ChildObject2 = ljson_Option.AddItemObject(ll_ChildArray)
			ljson_Option.AddItemString(ll_ChildObject2, "type","'pie'")
			ljson_Option.AddItemString(ll_ChildObject2, "name","'" + This.of_Gettitle() + "'")
			ljson_Option.AddItemString(ll_ChildObject2, "radius","'50%'")
			ljson_Option.AddItemString(ll_ChildObject2, "center","['50%','60%']")
			If Len ( This.of_GetRoseType()) > 0 Then //roseType
				ljson_Option.AddItemString(ll_ChildObject2, "roseType","'" + This.of_GetRoseType() + "'")
			End If
			ll_ChildArray2 = ljson_Option.AddItemArray(ll_ChildObject2, "data")
			FOR ll_i = 1 TO ads_data.RowCount()
				ll_ChildObject3 = ljson_Option.AddItemObject(ll_ChildArray2)
				ljson_Option.AddItemString(ll_ChildObject3, "name", "'" + This.of_GetItemString( ads_data,ll_i, 1) + "'")
				ljson_Option.AddItemNumber(ll_ChildObject3, "value",ads_data.GetItemNumber(ll_i, 2))
			NEXT
			ll_ChildObject3 = ljson_Option.AddItemObject(ll_ChildObject2,"emphasis")
			ll_ChildObject4 = ljson_Option.AddItemObject(ll_ChildObject3,"itemStyle")
			ll_ChildObject5 = ljson_Option.AddItemObject(ll_ChildObject4,"emphasis")
			ljson_Option.AddItemString(ll_ChildObject5, "shadowBlur","10")
			ljson_Option.AddItemString(ll_ChildObject5, "shadowOffsetX","0")
			ljson_Option.AddItemString(ll_ChildObject5, "shadowColor","'rgba(0, 0, 0, 0.5)'")
			
			
		Case "funnel"
			//ToolTip
			ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "tooltip")
			ljson_Option.AddItemString(ll_ChildObject, "trigger", "'item'")
			ljson_Option.AddItemString(ll_ChildObject, "formatter", "'{a} <br/>{b} : {c}%'")
			
			//legend
			ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "legend")
			ll_ChildArray = ljson_Option.AddItemArray(ll_ChildObject, "data")
			FOR ll_i = 1 TO ads_data.RowCount()
				ljson_Option.AddItemString(ll_ChildArray, "'" + This.of_GetItemString( ads_data,ll_i, 1) + "'")
			NEXT
			
			//ToolBox
			IF  This.of_GetToolBox() THEN
				ll_ChildObject2 = ljson_Option.AddItemObject(ll_RootObject, "toolbox")
				ll_ChildObject3 = ljson_Option.AddItemObject(ll_ChildObject2, "feature")
				ljson_Option.AddItemObject(ll_ChildObject3, "saveAsImage")
				ljson_Option.AddItemObject(ll_ChildObject3, "dataView")
			END IF
			
			//series
			ll_ChildArray = ljson_Option.AddItemArray(ll_RootObject, "series")
			ll_ChildObject2 = ljson_Option.AddItemObject(ll_ChildArray)
			ljson_Option.AddItemString(ll_ChildObject2, "name","'funnel chart'")
			ljson_Option.AddItemString(ll_ChildObject2, "type","'funnel'")
			ljson_Option.AddItemString(ll_ChildObject2, "width","'80%'")
			ljson_Option.AddItemString(ll_ChildObject2, "left","'10%'")
			ljson_Option.AddItemNumber(ll_ChildObject2, "top", 60)
			ljson_Option.AddItemNumber(ll_ChildObject2, "bottom", 60)
			ljson_Option.AddItemString(ll_ChildObject2, "width","'80%'")
			
			ljson_Option.AddItemNumber(ll_ChildObject2, "min", 0)
			ljson_Option.AddItemNumber(ll_ChildObject2, "max", 100)
			
			ljson_Option.AddItemString(ll_ChildObject2, "miniSize","'0%'")
			ljson_Option.AddItemString(ll_ChildObject2, "maxSize","'100%'")
			
			ljson_Option.AddItemString(ll_ChildObject2, "sort","'descending'")
			ljson_Option.AddItemNumber(ll_ChildObject2, "gap", 2)
			
			ljson_Option.AddItemObject(ll_ChildObject2, "label")
			
			ll_ChildObject3 = ljson_Option.AddItemObject(ll_ChildObject2)
			
			ljson_Option.AddItemBoolean(ll_ChildObject3, "show", true)
			ljson_Option.AddItemString(ll_ChildObject3, "position","'inside'")
			
			ljson_Option.AddItemObject(ll_ChildObject2, "labelLine")
			
			ll_ChildObject3 = ljson_Option.AddItemObject(ll_ChildObject2)
			ljson_Option.AddItemNumber(ll_ChildObject3, "legth", 10)
			
			ljson_Option.AddItemObject(ll_ChildObject3, "lineStyle")
			
			ll_ChildObject4 = ljson_Option.AddItemObject(ll_ChildObject3)
			
			ljson_Option.AddItemNumber(ll_ChildObject3, "width", 1)
			
			ljson_Option.AddItemString(ll_ChildObject3, "type","'solid'")
			
			ljson_Option.AddItemObject(ll_ChildObject2, "itemStyle")
			
			ll_ChildObject3 = ljson_Option.AddItemObject(ll_ChildObject2)
			ljson_Option.AddItemString(ll_ChildObject3, "borderColor", "'#fff'")
			
			ljson_Option.AddItemNumber(ll_ChildObject3, "borderwidth", 1)
			
			ljson_Option.AddItemObject(ll_ChildObject2, "emphasis")
			
			ll_ChildObject3 = ljson_Option.AddItemObject(ll_ChildObject2)
			
			ljson_Option.AddItemObject(ll_ChildObject3, "label")
			
			ll_ChildObject4 = ljson_Option.AddItemObject(ll_ChildObject3)
			
			ljson_Option.AddItemNumber(ll_ChildObject4, "fontSize", 20)
			
			ll_ChildArray3 = ljson_Option.AddItemArray(ll_ChildObject2, "data")
			
			FOR ll_j = 1 TO ads_data.RowCount()
				ll_ChildObject3 = ljson_Option.AddItemObject(ll_ChildArray3)
				ljson_Option.AddItemNumber(ll_ChildObject3, "value", ads_data.GetItemNumber(ll_j, 2 ))
				ljson_Option.AddItemString(ll_ChildObject3, "name","'" + This.of_GetItemString(ads_data,ll_j, 1) + "'")
			NEXT
			
	End Choose
	
	ls_Option = ljson_Option.GetJsonString()
	
Catch(throwable ex)
	MessageBox( "Error", ex.getmessage() )
End Try



Return ls_Option
end function

public function string of_createoption (datastore ads_data);//
Return This.of_createoption(ads_data, This.of_GetStyle() )
end function

public function string of_createoption_dataobject (string as_dataobject, string as_type);//
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

Return This.of_createoption_graph( lds_Data, as_type )
end function

public function string of_createoption_dataobject (string as_dataobject);//
If IsNull ( as_dataobject ) Or Len ( as_dataobject ) <= 0 Then
	Return ""
End If

Return This.of_createoption_dataobject ( as_dataobject, This.of_GetStyle() )
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

public function string of_createoption_graph (datastore ads_data, string as_type);//
DataStore 	lds_Series, lds_Category
Long 		ll_SeriesCount, ll_I, ll_J, ll_Row, ll_Row2, ll_DataCount
Long 		ll_RootObject,ll_ChildObject, ll_ChildArray, ll_ChildArray2
Long 		ll_ChildObject2,ll_ChildObject3, ll_ChildArray3, ll_ChildObject4, ll_ChildObject5
String 	ls_SeriesName, ls_SeriesName2, ls_Category, ls_Option, ls_Type, ls_Colors
Double 	ldb_Value
JsonGenerator ljson_Option

ls_Type = Lower( as_Type )

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

lds_Series.Sort()
lds_Category.Sort()

//title
//legend
//grid{left:130,right:'30%',height:'40%',bottom:110}
//tooltip
//toolbox
//dataZoom
//visualMap
//xAxis:[{type:'category',...},{}]
//yAxis:[{...},{...}]
//series:[{type:'line',...},{...}]

ljson_Option = Create JsonGenerator
ll_RootObject = ljson_Option.CreateJsonObject()

//Colors
ls_Colors = This.of_GetColors()
If Len ( ls_Colors ) > 0 Then
	ll_ChildArray = ljson_Option.AddItemArray(ll_RootObject, "color")
	ljson_Option.AddItemString(ll_ChildArray, ls_Colors )
End If

//Title
ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "title")
ljson_Option.AddItemString(ll_ChildObject, "text",  "'" + This.of_Gettitle() + "'")

Try
	
	Choose Case ls_Type
		Case "line", "bar", "scatter", "area"
			//legend
			ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "legend")
			ll_ChildArray = ljson_Option.AddItemArray(ll_ChildObject, "data")
			FOR ll_i = 1 TO lds_Series.RowCount()
				ls_SeriesName = lds_Series.GetItemString(ll_i, 1)
				ljson_Option.AddItemString(ll_ChildArray, "'" + ls_SeriesName + "'" )
			NEXT
			//grid
			ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "grid")
			ljson_Option.AddItemString(ll_ChildObject, "left","'3%'")
			ljson_Option.AddItemString(ll_ChildObject, "right","'4%'")
			ljson_Option.AddItemString(ll_ChildObject, "bottom","'3%'")
			ljson_Option.AddItemBoolean(ll_ChildObject,"containLabel",True)
			//ToolTip
			ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "tooltip")
			ljson_Option.AddItemString(ll_ChildObject, "trigger", "'axis'")
			//ToolBox
			IF This.of_GetToolBox() THEN
				ll_ChildObject2 = ljson_Option.AddItemObject(ll_RootObject, "toolbox")
				ll_ChildObject3 = ljson_Option.AddItemObject(ll_ChildObject2, "feature")
				ljson_Option.AddItemObject(ll_ChildObject3, "dataZoom")
				ljson_Option.AddItemObject(ll_ChildObject3, "saveAsImage")
				ljson_Option.AddItemObject(ll_ChildObject3, "dataView")
			END IF
			//dataZoom
			IF This.of_GetDataZoom() THEN
				ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "dataZoom")
				ljson_Option.AddItemString(ll_ChildObject, "orient", "'horizontal'")
			END IF
			//visualMap
			//xaxis
			ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "xAxis")
			ljson_Option.AddItemString(ll_ChildObject, "type","'category'")
			If ls_Type = "area" Then
				ljson_Option.AddItemBoolean(ll_ChildObject, "boundaryGap",false)
			End If
			ll_ChildArray = ljson_Option.AddItemArray(ll_ChildObject, "data")
			ls_SeriesName = lds_Series.GetItemString(1, 1)
			lds_Category.SetFilter("#1='"+ls_SeriesName +"'")
			lds_Category.Filter()
			lds_Category.Sort()
			FOR ll_i = 1 TO lds_Category.RowCount()
				ljson_Option.AddItemString(ll_ChildArray, "'" +This.of_GetItemString(lds_Category,ll_i, 2) + "'")
			NEXT
			//yaxis
			ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "yAxis")
			ljson_Option.AddItemString(ll_ChildObject, "type","'value'")
			//series
			ll_ChildArray = ljson_Option.AddItemArray(ll_RootObject, "series"  )
			FOR ll_i = 1 TO lds_Series.RowCount()
				ls_SeriesName = lds_Series.GetItemString(ll_i,1)
				ll_ChildObject2 = ljson_Option.AddItemObject(ll_ChildArray)
				If ls_Type = "area" Then
					ljson_Option.AddItemString(ll_ChildObject2, "type","'line'")
					ljson_Option.AddItemString(ll_ChildObject2, "areaStyle","''")
				Else
					ljson_Option.AddItemString(ll_ChildObject2, "type","'" + ls_Type + "'")
				End If
				ljson_Option.AddItemString(ll_ChildObject2, "name","'" + ls_SeriesName + "'")
				ll_ChildArray2 = ljson_Option.AddItemArray(ll_ChildObject2, "data")
				lds_Category.SetFilter("#1='"+ls_SeriesName +"'")
				lds_Category.Filter()
				lds_Category.Sort()
				FOR ll_j = 1 TO lds_Category.RowCount()
					ljson_Option.AddItemNumber(ll_ChildArray2, lds_Category.GetItemNumber(ll_j, 3 ))
				NEXT
			NEXT
			
		Case "pie"
			ljson_Option.AddItemString(ll_ChildObject, "x", "'center'")
			//legend
			ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "legend")
			ljson_Option.AddItemString(ll_ChildObject, "orient", "'vertical'")
			ljson_Option.AddItemString(ll_ChildObject, "left", "'left'")
			ll_ChildArray = ljson_Option.AddItemArray(ll_ChildObject, "data")
			FOR ll_i = 1 TO lds_Series.RowCount()
				ls_SeriesName = lds_Series.GetItemString(ll_i, 1)
				ljson_Option.AddItemString(ll_ChildArray, "'" + ls_SeriesName + "'" )
			NEXT
			//tooltip
			ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "tooltip")
			ljson_Option.AddItemString(ll_ChildObject, "trigger", "'item'")
			ljson_Option.AddItemString(ll_ChildObject, "formatter", "'{a} <br/>{b} : {c} ({d}%)'")
			
			//ToolBox
			IF  This.of_GetToolBox() THEN
				ll_ChildObject2 = ljson_Option.AddItemObject(ll_RootObject, "toolbox")
				ll_ChildObject3 = ljson_Option.AddItemObject(ll_ChildObject2, "feature")
				ljson_Option.AddItemObject(ll_ChildObject3, "saveAsImage")
				ljson_Option.AddItemObject(ll_ChildObject3, "dataView")
			END IF
			
			//grid
			ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "grid")
			ljson_Option.AddItemString(ll_ChildObject, "left","'3%'")
			ljson_Option.AddItemString(ll_ChildObject, "right","'4%'")
			ljson_Option.AddItemString(ll_ChildObject, "bottom","'3%'")
			ljson_Option.AddItemBoolean(ll_ChildObject,"containLabel",True)
			
			//series
			ll_ChildArray = ljson_Option.AddItemArray(ll_RootObject, "series")
			FOR ll_i = 1 TO lds_Series.RowCount()
				ls_SeriesName = lds_Series.GetItemString(ll_i,1)
				ll_ChildObject2 = ljson_Option.AddItemObject(ll_ChildArray)
				ljson_Option.AddItemString(ll_ChildObject2, "type","'" + ls_Type + "'")
				ljson_Option.AddItemString(ll_ChildObject2, "name","'" + ls_SeriesName + "'")			
				ljson_Option.AddItemString(ll_ChildObject2, "radius","['" + String (((ll_i - 1) / lds_Series.RowCount() * 100) - 10 ) + "%','" +  String ( ((ll_i) / lds_Series.RowCount() * 100) - 10 ) + "%']")
				ljson_Option.AddItemString(ll_ChildObject2, "center","['50%','50%']")
				If Len ( This.of_GetRoseType()) > 0 Then //roseType
					ljson_Option.AddItemString(ll_ChildObject2, "roseType","'" + This.of_GetRoseType() + "'")
				End If
				ll_ChildArray2 = ljson_Option.AddItemArray(ll_ChildObject2, "data")
				lds_Category.SetFilter("#1='"+ ls_SeriesName+"'")
				lds_Category.Filter()
				lds_Category.Sort()
				FOR ll_j = 1 TO lds_Category.RowCount()
					ll_ChildObject3 = ljson_Option.AddItemObject(ll_ChildArray2)
					ljson_Option.AddItemString(ll_ChildObject3, "name", "'" + This.of_GetItemString( lds_Category,ll_j, 2) + "'")
					ljson_Option.AddItemNumber(ll_ChildObject3, "value",lds_Category.GetItemNumber(ll_j, 3))
				NEXT
				ll_ChildObject3 = ljson_Option.AddItemObject(ll_ChildObject2,"emphasis")
				ll_ChildObject4 = ljson_Option.AddItemObject(ll_ChildObject3,"itemStyle")
				ll_ChildObject5 = ljson_Option.AddItemObject(ll_ChildObject4,"emphasis")
				ljson_Option.AddItemString(ll_ChildObject5, "shadowBlur","10")
				ljson_Option.AddItemString(ll_ChildObject5, "shadowOffsetX","0")
				ljson_Option.AddItemString(ll_ChildObject5, "shadowColor","'rgba(0, 0, 0, 0.5)'")
			
			NEXT
			
		Case "funnel"
			ljson_Option.AddItemString(ll_ChildObject, "left", "'center'")
			//legend
			ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "legend")
			ljson_Option.AddItemString(ll_ChildObject, "orient", "'vertical'")
			ljson_Option.AddItemString(ll_ChildObject, "left", "'left'")
			ll_ChildArray = ljson_Option.AddItemArray(ll_ChildObject, "data")
			FOR ll_i = 1 TO lds_Series.RowCount()
				ls_SeriesName = lds_Series.GetItemString(ll_i, 1)
				ljson_Option.AddItemString(ll_ChildArray, "'" + ls_SeriesName + "'" )
			NEXT
			//tooltip
			ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "tooltip")
			ljson_Option.AddItemString(ll_ChildObject, "trigger", "'item'")
			ljson_Option.AddItemString(ll_ChildObject, "formatter", "'{a} <br/>{b} : {c} ({d}%)'")
			
			//ToolBox
			IF  This.of_GetToolBox() THEN
				ll_ChildObject2 = ljson_Option.AddItemObject(ll_RootObject, "toolbox")
				ll_ChildObject3 = ljson_Option.AddItemObject(ll_ChildObject2, "feature")
				ljson_Option.AddItemObject(ll_ChildObject3, "saveAsImage")
				ljson_Option.AddItemObject(ll_ChildObject3, "dataView")
			END IF
			
			//grid
			ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "grid")
			ljson_Option.AddItemString(ll_ChildObject, "left","'3%'")
			ljson_Option.AddItemString(ll_ChildObject, "right","'4%'")
			ljson_Option.AddItemString(ll_ChildObject, "bottom","'3%'")
			ljson_Option.AddItemBoolean(ll_ChildObject,"containLabel",True)
			
			//series
			ll_ChildArray = ljson_Option.AddItemArray(ll_RootObject, "series")
			FOR ll_i = 1 TO lds_Series.RowCount()
				ls_SeriesName = lds_Series.GetItemString(ll_i,1)
				ll_ChildObject2 = ljson_Option.AddItemObject(ll_ChildArray)
				ljson_Option.AddItemString(ll_ChildObject2, "type","'" + ls_Type + "'")
				ljson_Option.AddItemString(ll_ChildObject2, "name","'" + ls_SeriesName + "'")			
				ljson_Option.AddItemString(ll_ChildObject2, "radius","['" + String (((ll_i - 1) / lds_Series.RowCount() * 100) - 10 ) + "%','" +  String ( ((ll_i) / lds_Series.RowCount() * 100) - 10 ) + "%']")
				ljson_Option.AddItemString(ll_ChildObject2, "center","['50%','50%']")
				If Len ( This.of_GetRoseType()) > 0 Then //roseType
					ljson_Option.AddItemString(ll_ChildObject2, "roseType","'" + This.of_GetRoseType() + "'")
				End If
				ll_ChildArray2 = ljson_Option.AddItemArray(ll_ChildObject2, "data")
				lds_Category.SetFilter("#1='"+ ls_SeriesName+"'")
				lds_Category.Filter()
				lds_Category.Sort()
				FOR ll_j = 1 TO lds_Category.RowCount()
					ll_ChildObject3 = ljson_Option.AddItemObject(ll_ChildArray2)
					ljson_Option.AddItemString(ll_ChildObject3, "name", "'" + This.of_GetItemString( lds_Category,ll_j, 2) + "'")
					ljson_Option.AddItemNumber(ll_ChildObject3, "value",lds_Category.GetItemNumber(ll_j, 3))
				NEXT
						
			NEXT
			
	End Choose
	
	ls_Option = ljson_Option.GetJsonString()
	
Catch(throwable ex)
	MessageBox( "Error", ex.getmessage() )
End Try

If IsValid ( lds_Series ) Then Destroy ( lds_Series )
If IsValid ( lds_Category ) Then Destroy ( lds_Category )

Return ls_Option
end function

public function string of_createoption_graph (datastore ads_data);//
Return This.of_CreateOption_Graph( ads_data, This.Of_GetStyle() )
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

public function string of_createoption_graph (datawindow adw_data, string as_type);//
DataStore 	lds_Series, lds_Category
Long 		ll_SeriesCount, ll_I, ll_J, ll_Row, ll_Row2, ll_DataCount
Long 		ll_RootObject,ll_ChildObject, ll_ChildArray, ll_ChildArray2
Long 		ll_ChildObject2,ll_ChildObject3, ll_ChildArray3, ll_ChildObject4, ll_ChildObject5
String 	ls_SeriesName, ls_SeriesName2, ls_Category, ls_Option, ls_Type, ls_Colors
Double 	ldb_Value
JsonGenerator ljson_Option

ls_Type = Lower( as_Type )

//get series
lds_Series = Create DataStore
lds_Series.DataObject = "d_dw_series"

//Get x and y axis data
lds_Category = Create DataStore
lds_Category.DataObject = "d_dw_category"

ll_SeriesCount = adw_data.SeriesCount("gr_1")
FOR ll_i = 1 TO ll_SeriesCount
	ls_SeriesName = adw_data.SeriesName("gr_1",ll_i)
	ls_SeriesName2 = ls_SeriesName
	IF isNull(ls_SeriesName2) OR Trim(ls_SeriesName2) = "" THEN
		ls_SeriesName2 = "Series" + String(ll_i)
	END IF
	ll_Row = lds_Series.InsertRow(0)        //Require this column to be inserted into the current column
	lds_Series.SetItem(ll_Row, 1, ls_SeriesName2) //First column: seriesname
	
	ll_DataCount =adw_data.DataCount("gr_1", ls_SeriesName)
	FOR ll_j = 1 TO ll_DataCount
		//category name
		ls_Category = adw_data.CategoryName("gr_1",ll_j)
		//data
		ldb_Value = adw_data.GetData("gr_1",ll_i,ll_j)
		ll_Row2 = lds_Category.InsertRow(0)		
		lds_Category.SetItem(ll_Row2, 1, ls_SeriesName2)
		lds_Category.SetItem(ll_Row2, 2, ls_Category)
		lds_Category.SetItem(ll_Row2, 3, ldb_Value)
	NEXT
NEXT

lds_Series.Sort()
lds_Category.Sort()

//title
//legend
//grid{left:130,right:'30%',height:'40%',bottom:110}
//tooltip
//toolbox
//dataZoom
//visualMap
//xAxis:[{type:'category',...},{}]
//yAxis:[{...},{...}]
//series:[{type:'line',...},{...}]

ljson_Option = Create JsonGenerator
ll_RootObject = ljson_Option.CreateJsonObject()

//Colors
ls_Colors = This.of_GetColors()
If Len ( ls_Colors ) > 0 Then
	ll_ChildArray = ljson_Option.AddItemArray(ll_RootObject, "color")
	ljson_Option.AddItemString(ll_ChildArray, ls_Colors )
End If

//Title
ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "title")
ljson_Option.AddItemString(ll_ChildObject, "text",  "'" + This.of_Gettitle() + "'")

Try
	
	Choose Case ls_Type
		Case "line", "bar", "scatter", "area"
			//legend
			ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "legend")
			ll_ChildArray = ljson_Option.AddItemArray(ll_ChildObject, "data")
			FOR ll_i = 1 TO lds_Series.RowCount()
				ls_SeriesName = lds_Series.GetItemString(ll_i, 1)
				ljson_Option.AddItemString(ll_ChildArray, "'" + ls_SeriesName + "'" )
			NEXT
			//grid
			ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "grid")
			ljson_Option.AddItemString(ll_ChildObject, "left","'3%'")
			ljson_Option.AddItemString(ll_ChildObject, "right","'4%'")
			ljson_Option.AddItemString(ll_ChildObject, "bottom","'3%'")
			ljson_Option.AddItemBoolean(ll_ChildObject,"containLabel",True)
			//ToolTip
			ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "tooltip")
			ljson_Option.AddItemString(ll_ChildObject, "trigger", "'axis'")
			//ToolBox
			IF This.of_GetToolBox() THEN
				ll_ChildObject2 = ljson_Option.AddItemObject(ll_RootObject, "toolbox")
				ll_ChildObject3 = ljson_Option.AddItemObject(ll_ChildObject2, "feature")
				ljson_Option.AddItemObject(ll_ChildObject3, "dataZoom")
				ljson_Option.AddItemObject(ll_ChildObject3, "saveAsImage")
				ljson_Option.AddItemObject(ll_ChildObject3, "dataView")
			END IF
			//dataZoom
			IF This.of_GetDataZoom() THEN
				ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "dataZoom")
				ljson_Option.AddItemString(ll_ChildObject, "orient", "'horizontal'")
			END IF
			//visualMap
			//xaxis
			ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "xAxis")
			ljson_Option.AddItemString(ll_ChildObject, "type","'category'")
			If ls_Type = "area" Then
				ljson_Option.AddItemBoolean(ll_ChildObject, "boundaryGap",false)
			End If
			ll_ChildArray = ljson_Option.AddItemArray(ll_ChildObject, "data")
			ls_SeriesName = lds_Series.GetItemString(1, 1)
			lds_Category.SetFilter("#1='"+ls_SeriesName +"'")
			lds_Category.Filter()
			lds_Category.Sort()
			FOR ll_i = 1 TO lds_Category.RowCount()
				ljson_Option.AddItemString(ll_ChildArray, "'" +This.of_GetItemString(lds_Category,ll_i, 2) + "'")
			NEXT
			//yaxis
			ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "yAxis")
			ljson_Option.AddItemString(ll_ChildObject, "type","'value'")
			//series
			ll_ChildArray = ljson_Option.AddItemArray(ll_RootObject, "series"  )
			FOR ll_i = 1 TO lds_Series.RowCount()
				ls_SeriesName = lds_Series.GetItemString(ll_i,1)
				ll_ChildObject2 = ljson_Option.AddItemObject(ll_ChildArray)
				If ls_Type = "area" Then
					ljson_Option.AddItemString(ll_ChildObject2, "type","'line'")
					ljson_Option.AddItemString(ll_ChildObject2, "areaStyle","''")
				Else
					ljson_Option.AddItemString(ll_ChildObject2, "type","'" + ls_Type + "'")
				End If
				ljson_Option.AddItemString(ll_ChildObject2, "name","'" + ls_SeriesName + "'")
				ll_ChildArray2 = ljson_Option.AddItemArray(ll_ChildObject2, "data")
				lds_Category.SetFilter("#1='"+ls_SeriesName +"'")
				lds_Category.Filter()
				lds_Category.Sort()
				FOR ll_j = 1 TO lds_Category.RowCount()
					ljson_Option.AddItemNumber(ll_ChildArray2, lds_Category.GetItemNumber(ll_j, 3 ))
				NEXT
			NEXT
			
		Case "pie"
			ljson_Option.AddItemString(ll_ChildObject, "x", "'center'")
			//legend
			ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "legend")
			ljson_Option.AddItemString(ll_ChildObject, "orient", "'vertical'")
			ljson_Option.AddItemString(ll_ChildObject, "left", "'left'")
			ll_ChildArray = ljson_Option.AddItemArray(ll_ChildObject, "data")
			FOR ll_i = 1 TO lds_Series.RowCount()
				ls_SeriesName = lds_Series.GetItemString(ll_i, 1)
				ljson_Option.AddItemString(ll_ChildArray, "'" + ls_SeriesName + "'" )
			NEXT
			//tooltip
			ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "tooltip")
			ljson_Option.AddItemString(ll_ChildObject, "trigger", "'item'")
			ljson_Option.AddItemString(ll_ChildObject, "formatter", "'{a} <br/>{b} : {c} ({d}%)'")
			
			//ToolBox
			IF  This.of_GetToolBox() THEN
				ll_ChildObject2 = ljson_Option.AddItemObject(ll_RootObject, "toolbox")
				ll_ChildObject3 = ljson_Option.AddItemObject(ll_ChildObject2, "feature")
				ljson_Option.AddItemObject(ll_ChildObject3, "saveAsImage")
				ljson_Option.AddItemObject(ll_ChildObject3, "dataView")
			END IF
			
			//grid
			ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "grid")
			ljson_Option.AddItemString(ll_ChildObject, "left","'3%'")
			ljson_Option.AddItemString(ll_ChildObject, "right","'4%'")
			ljson_Option.AddItemString(ll_ChildObject, "bottom","'3%'")
			ljson_Option.AddItemBoolean(ll_ChildObject,"containLabel",True)
			
			//series
			ll_ChildArray = ljson_Option.AddItemArray(ll_RootObject, "series")
			FOR ll_i = 1 TO lds_Series.RowCount()
				ls_SeriesName = lds_Series.GetItemString(ll_i,1)
				ll_ChildObject2 = ljson_Option.AddItemObject(ll_ChildArray)
				ljson_Option.AddItemString(ll_ChildObject2, "type","'" + ls_Type + "'")
				ljson_Option.AddItemString(ll_ChildObject2, "name","'" + ls_SeriesName + "'")			
				ljson_Option.AddItemString(ll_ChildObject2, "radius","['" + String (((ll_i - 1) / lds_Series.RowCount() * 100) - 10 ) + "%','" +  String ( ((ll_i) / lds_Series.RowCount() * 100) - 10 ) + "%']")
				ljson_Option.AddItemString(ll_ChildObject2, "center","['50%','50%']")
				If Len ( This.of_GetRoseType()) > 0 Then //roseType
					ljson_Option.AddItemString(ll_ChildObject2, "roseType","'" + This.of_GetRoseType() + "'")
				End If
				ll_ChildArray2 = ljson_Option.AddItemArray(ll_ChildObject2, "data")
				lds_Category.SetFilter("#1='"+ ls_SeriesName+"'")
				lds_Category.Filter()
				lds_Category.Sort()
				FOR ll_j = 1 TO lds_Category.RowCount()
					ll_ChildObject3 = ljson_Option.AddItemObject(ll_ChildArray2)
					ljson_Option.AddItemString(ll_ChildObject3, "name", "'" + This.of_GetItemString( lds_Category,ll_j, 2) + "'")
					ljson_Option.AddItemNumber(ll_ChildObject3, "value",lds_Category.GetItemNumber(ll_j, 3))
				NEXT
				ll_ChildObject3 = ljson_Option.AddItemObject(ll_ChildObject2,"emphasis")
				ll_ChildObject4 = ljson_Option.AddItemObject(ll_ChildObject3,"itemStyle")
				ll_ChildObject5 = ljson_Option.AddItemObject(ll_ChildObject4,"emphasis")
				ljson_Option.AddItemString(ll_ChildObject5, "shadowBlur","10")
				ljson_Option.AddItemString(ll_ChildObject5, "shadowOffsetX","0")
				ljson_Option.AddItemString(ll_ChildObject5, "shadowColor","'rgba(0, 0, 0, 0.5)'")
			
			NEXT
			
		Case "funnel"
			ljson_Option.AddItemString(ll_ChildObject, "left", "'center'")
			//legend
			ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "legend")
			ljson_Option.AddItemString(ll_ChildObject, "orient", "'vertical'")
			ljson_Option.AddItemString(ll_ChildObject, "left", "'left'")
			ll_ChildArray = ljson_Option.AddItemArray(ll_ChildObject, "data")
			FOR ll_i = 1 TO lds_Series.RowCount()
				ls_SeriesName = lds_Series.GetItemString(ll_i, 1)
				ljson_Option.AddItemString(ll_ChildArray, "'" + ls_SeriesName + "'" )
			NEXT
			//tooltip
			ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "tooltip")
			ljson_Option.AddItemString(ll_ChildObject, "trigger", "'item'")
			ljson_Option.AddItemString(ll_ChildObject, "formatter", "'{a} <br/>{b} : {c} ({d}%)'")
			
			//ToolBox
			IF  This.of_GetToolBox() THEN
				ll_ChildObject2 = ljson_Option.AddItemObject(ll_RootObject, "toolbox")
				ll_ChildObject3 = ljson_Option.AddItemObject(ll_ChildObject2, "feature")
				ljson_Option.AddItemObject(ll_ChildObject3, "saveAsImage")
				ljson_Option.AddItemObject(ll_ChildObject3, "dataView")
			END IF
			
			//grid
			ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "grid")
			ljson_Option.AddItemString(ll_ChildObject, "left","'3%'")
			ljson_Option.AddItemString(ll_ChildObject, "right","'4%'")
			ljson_Option.AddItemString(ll_ChildObject, "bottom","'3%'")
			ljson_Option.AddItemBoolean(ll_ChildObject,"containLabel",True)
			
			//series
			ll_ChildArray = ljson_Option.AddItemArray(ll_RootObject, "series")
			FOR ll_i = 1 TO lds_Series.RowCount()
				ls_SeriesName = lds_Series.GetItemString(ll_i,1)
				ll_ChildObject2 = ljson_Option.AddItemObject(ll_ChildArray)
				ljson_Option.AddItemString(ll_ChildObject2, "type","'" + ls_Type + "'")
				ljson_Option.AddItemString(ll_ChildObject2, "name","'" + ls_SeriesName + "'")			
				ljson_Option.AddItemString(ll_ChildObject2, "radius","['" + String (((ll_i - 1) / lds_Series.RowCount() * 100) - 10 ) + "%','" +  String ( ((ll_i) / lds_Series.RowCount() * 100) - 10 ) + "%']")
				ljson_Option.AddItemString(ll_ChildObject2, "center","['50%','50%']")
				If Len ( This.of_GetRoseType()) > 0 Then //roseType
					ljson_Option.AddItemString(ll_ChildObject2, "roseType","'" + This.of_GetRoseType() + "'")
				End If
				ll_ChildArray2 = ljson_Option.AddItemArray(ll_ChildObject2, "data")
				lds_Category.SetFilter("#1='"+ ls_SeriesName+"'")
				lds_Category.Filter()
				lds_Category.Sort()
				FOR ll_j = 1 TO lds_Category.RowCount()
					ll_ChildObject3 = ljson_Option.AddItemObject(ll_ChildArray2)
					ljson_Option.AddItemString(ll_ChildObject3, "name", "'" + This.of_GetItemString( lds_Category,ll_j, 2) + "'")
					ljson_Option.AddItemNumber(ll_ChildObject3, "value",lds_Category.GetItemNumber(ll_j, 3))
				NEXT
						
			NEXT
			
	End Choose
	
	ls_Option = ljson_Option.GetJsonString()
	
Catch(throwable ex)
	MessageBox( "Error", ex.getmessage() )
End Try

If IsValid ( lds_Series ) Then Destroy ( lds_Series )
If IsValid ( lds_Category ) Then Destroy ( lds_Category )

Return ls_Option
end function

public function string of_createoption_graph (datawindow adw_data);//
Return This.of_CreateOption_Graph( adw_data, This.Of_GetStyle() )
end function

public function string of_createoption (datastore ads_series, datastore ads_category, string as_type);//
Long 		ll_SeriesCount, ll_I, ll_J, ll_Row, ll_Row2, ll_DataCount
Long 		ll_RootObject,ll_ChildObject, ll_ChildArray, ll_ChildArray2
Long 		ll_ChildObject2,ll_ChildObject3, ll_ChildArray3, ll_ChildObject4, ll_ChildObject5
String 	ls_SeriesName, ls_SeriesName2, ls_Category, ls_Option, ls_Type, ls_Colors
Double 	ldb_Value
JsonGenerator ljson_Option

ls_Type = Lower( as_Type )

ads_Series.SetSort( "#1" )
ads_Series.Sort( )

ads_Category.SetSort( "#1,#2" )
ads_Category.Sort( )

//title
//legend
//grid{left:130,right:'30%',height:'40%',bottom:110}
//tooltip
//toolbox
//dataZoom
//visualMap
//xAxis:[{type:'category',...},{}]
//yAxis:[{...},{...}]
//series:[{type:'line',...},{...}]

ljson_Option = Create JsonGenerator
ll_RootObject = ljson_Option.CreateJsonObject()

//Colors
ls_Colors = This.of_GetColors()
If Len ( ls_Colors ) > 0 Then
	ll_ChildArray = ljson_Option.AddItemArray(ll_RootObject, "color")
	ljson_Option.AddItemString(ll_ChildArray, ls_Colors )
End If

//Title
ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "title")
ljson_Option.AddItemString(ll_ChildObject, "text",  "'" + This.of_Gettitle() + "'")

Try
	Choose Case ls_Type
		Case "line", "bar", "scatter", "area"
			//legend
			ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "legend")
			ll_ChildArray = ljson_Option.AddItemArray(ll_ChildObject, "data")
			FOR ll_i = 1 TO ads_Series.RowCount()
				ls_SeriesName = ads_Series.GetItemString(ll_i, 1)
				ljson_Option.AddItemString(ll_ChildArray, "'" + ls_SeriesName + "'" )
			NEXT
			//grid
			ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "grid")
			ljson_Option.AddItemString(ll_ChildObject, "left","'3%'")
			ljson_Option.AddItemString(ll_ChildObject, "right","'4%'")
			ljson_Option.AddItemString(ll_ChildObject, "bottom","'3%'")
			ljson_Option.AddItemBoolean(ll_ChildObject,"containLabel",True)
			//ToolTip
			ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "tooltip")
			ljson_Option.AddItemString(ll_ChildObject, "trigger", "'axis'")
			//ToolBox
			IF This.of_GetToolBox() THEN
				ll_ChildObject2 = ljson_Option.AddItemObject(ll_RootObject, "toolbox")
				ll_ChildObject3 = ljson_Option.AddItemObject(ll_ChildObject2, "feature")
				ljson_Option.AddItemObject(ll_ChildObject3, "dataZoom")
				ljson_Option.AddItemObject(ll_ChildObject3, "saveAsImage")
				ljson_Option.AddItemObject(ll_ChildObject3, "dataView")
			END IF
			//dataZoom
			IF This.of_GetDataZoom() THEN
				ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "dataZoom")
				ljson_Option.AddItemString(ll_ChildObject, "orient", "'horizontal'")
			END IF
			//visualMap
			//xaxis
			ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "xAxis")
			ljson_Option.AddItemString(ll_ChildObject, "type","'category'")
			If ls_Type = "area" Then
				ljson_Option.AddItemBoolean(ll_ChildObject, "boundaryGap",false)
			End If
			ll_ChildArray = ljson_Option.AddItemArray(ll_ChildObject, "data")
			ls_SeriesName = ads_Series.GetItemString(1, 1)
			ads_Category.SetFilter("#1='"+ls_SeriesName +"'")
			ads_Category.Filter()
			FOR ll_i = 1 TO ads_Category.RowCount()
				ljson_Option.AddItemString(ll_ChildArray, "'" + This.of_GetItemString(ads_Category,ll_i, 2) + "'")
			NEXT
			//yaxis
			ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "yAxis")
			ljson_Option.AddItemString(ll_ChildObject, "type","'value'")
			
			//series
			ll_ChildArray = ljson_Option.AddItemArray(ll_RootObject, "series"  )
			FOR ll_i = 1 TO ads_Series.RowCount()
				ls_SeriesName = ads_Series.GetItemString(ll_i,1)
				ll_ChildObject2 = ljson_Option.AddItemObject(ll_ChildArray)
				If ls_Type = "area" Then
					ljson_Option.AddItemString(ll_ChildObject2, "type","'line'")
					ljson_Option.AddItemString(ll_ChildObject2, "areaStyle","''")
				Else
					ljson_Option.AddItemString(ll_ChildObject2, "type","'" + ls_Type + "'")
				End If
				ljson_Option.AddItemString(ll_ChildObject2, "name","'" + ls_SeriesName + "'")
				ll_ChildArray2 = ljson_Option.AddItemArray(ll_ChildObject2, "data")
				ads_Category.SetFilter("#1='"+ls_SeriesName +"'")
				ads_Category.Filter()
				ads_Category.Sort( )
				FOR ll_j = 1 TO ads_Category.RowCount()
					ljson_Option.AddItemNumber(ll_ChildArray2, ads_Category.GetItemNumber(ll_j, 3 ))
				NEXT
			NEXT
			
		Case "pie"
			ljson_Option.AddItemString(ll_ChildObject, "x", "'center'")
			//legend
			ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "legend")
			ljson_Option.AddItemString(ll_ChildObject, "orient", "'vertical'")
			ljson_Option.AddItemString(ll_ChildObject, "left", "'left'")
			ll_ChildArray = ljson_Option.AddItemArray(ll_ChildObject, "data")
			FOR ll_i = 1 TO ads_Series.RowCount()
				ls_SeriesName = ads_Series.GetItemString(ll_i, 1)
				ljson_Option.AddItemString(ll_ChildArray, "'" + ls_SeriesName + "'")
			NEXT
			//grid
			ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "grid")
			ljson_Option.AddItemString(ll_ChildObject, "left","'3%'")
			ljson_Option.AddItemString(ll_ChildObject, "right","'4%'")
			ljson_Option.AddItemString(ll_ChildObject, "bottom","'3%'")
			ljson_Option.AddItemBoolean(ll_ChildObject,"containLabel",True)
			//tooltip
			ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "tooltip")
			ljson_Option.AddItemString(ll_ChildObject, "trigger", "'item'")
			ljson_Option.AddItemString(ll_ChildObject, "formatter", "'{a} <br/>{b} : {c} ({d}%)'")
			//ToolBox
			IF  This.of_GetToolBox() THEN
				ll_ChildObject2 = ljson_Option.AddItemObject(ll_RootObject, "toolbox")
				ll_ChildObject3 = ljson_Option.AddItemObject(ll_ChildObject2, "feature")
				ljson_Option.AddItemObject(ll_ChildObject3, "saveAsImage")
				ljson_Option.AddItemObject(ll_ChildObject3, "dataView")
			END IF
			//series
			ll_ChildArray = ljson_Option.AddItemArray(ll_RootObject, "series")
			FOR ll_i = 1 TO ads_Series.RowCount()
				ls_SeriesName = ads_Series.GetItemString(ll_i,1)
				ll_ChildObject2 = ljson_Option.AddItemObject(ll_ChildArray)
				ljson_Option.AddItemString(ll_ChildObject2, "type","'" + ls_Type + "'")
				ljson_Option.AddItemString(ll_ChildObject2, "name","'" + ls_SeriesName + "'")			
				ljson_Option.AddItemString(ll_ChildObject2, "radius","['" + String (((ll_i - 1) / ads_Series.RowCount() * 100) - 10 ) + "%','" +  String ( ((ll_i) / ads_Series.RowCount() * 100) - 10 ) + "%']")
				ljson_Option.AddItemString(ll_ChildObject2, "center","['50%','50%']")
				If Len ( This.of_GetRoseType()) > 0 Then //roseType
					ljson_Option.AddItemString(ll_ChildObject2, "roseType","'" + This.of_GetRoseType() + "'")
				End If
				ll_ChildArray2 = ljson_Option.AddItemArray(ll_ChildObject2, "data")
				ads_Category.SetFilter("#1='"+ ls_SeriesName+"'")
				ads_Category.Filter()
				ads_Category.Sort( )
				FOR ll_j = 1 TO ads_Category.RowCount()
					ll_ChildObject3 = ljson_Option.AddItemObject(ll_ChildArray2)
					ljson_Option.AddItemString(ll_ChildObject3, "name", "'" + This.of_GetItemString( ads_Category,ll_j, 2) + "'")
					ljson_Option.AddItemNumber(ll_ChildObject3, "value",ads_Category.GetItemNumber(ll_j, 3))
				NEXT
				ll_ChildObject3 = ljson_Option.AddItemObject(ll_ChildObject2,"emphasis")
				ll_ChildObject4 = ljson_Option.AddItemObject(ll_ChildObject3,"itemStyle")
				ll_ChildObject5 = ljson_Option.AddItemObject(ll_ChildObject4,"emphasis")
				ljson_Option.AddItemString(ll_ChildObject5, "shadowBlur","10")
				ljson_Option.AddItemString(ll_ChildObject5, "shadowOffsetX","0")
				ljson_Option.AddItemString(ll_ChildObject5, "shadowColor","'rgba(0, 0, 0, 0.5)'")
			
			NEXT
			
		Case "funnel"
			ljson_Option.AddItemString(ll_ChildObject, "left", "'center'")
			//legend
			ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "legend")
			ljson_Option.AddItemString(ll_ChildObject, "orient", "'vertical'")
			ljson_Option.AddItemString(ll_ChildObject, "left", "'left'")
			ll_ChildArray = ljson_Option.AddItemArray(ll_ChildObject, "data")
			FOR ll_i = 1 TO ads_Series.RowCount()
				ls_SeriesName = ads_Series.GetItemString(ll_i, 1)
				ljson_Option.AddItemString(ll_ChildArray, "'" + ls_SeriesName + "'" )
			NEXT
			//tooltip
			ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "tooltip")
			ljson_Option.AddItemString(ll_ChildObject, "trigger", "'item'")
			ljson_Option.AddItemString(ll_ChildObject, "formatter", "'{a} <br/>{b} : {c} ({d}%)'")
			
			//ToolBox
			IF  This.of_GetToolBox() THEN
				ll_ChildObject2 = ljson_Option.AddItemObject(ll_RootObject, "toolbox")
				ll_ChildObject3 = ljson_Option.AddItemObject(ll_ChildObject2, "feature")
				ljson_Option.AddItemObject(ll_ChildObject3, "saveAsImage")
				ljson_Option.AddItemObject(ll_ChildObject3, "dataView")
			END IF
			
			//grid
			ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "grid")
			ljson_Option.AddItemString(ll_ChildObject, "left","'3%'")
			ljson_Option.AddItemString(ll_ChildObject, "right","'4%'")
			ljson_Option.AddItemString(ll_ChildObject, "bottom","'3%'")
			ljson_Option.AddItemBoolean(ll_ChildObject,"containLabel",True)
			
			//series
			ll_ChildArray = ljson_Option.AddItemArray(ll_RootObject, "series")
			FOR ll_i = 1 TO ads_Series.RowCount()
				ls_SeriesName = ads_Series.GetItemString(ll_i,1)
				ll_ChildObject2 = ljson_Option.AddItemObject(ll_ChildArray)
				ljson_Option.AddItemString(ll_ChildObject2, "type","'" + ls_Type + "'")
				ljson_Option.AddItemString(ll_ChildObject2, "name","'" + ls_SeriesName + "'")			
				ljson_Option.AddItemString(ll_ChildObject2, "radius","['" + String (((ll_i - 1) / ads_Series.RowCount() * 100) - 10 ) + "%','" +  String ( ((ll_i) / ads_Series.RowCount() * 100) - 10 ) + "%']")
				ljson_Option.AddItemString(ll_ChildObject2, "center","['50%','50%']")
				If Len ( This.of_GetRoseType()) > 0 Then //roseType
					ljson_Option.AddItemString(ll_ChildObject2, "roseType","'" + This.of_GetRoseType() + "'")
				End If
				ll_ChildArray2 = ljson_Option.AddItemArray(ll_ChildObject2, "data")
				ads_Category.SetFilter("#1='"+ ls_SeriesName+"'")
				ads_Category.Filter()
				ads_Category.Sort()			
				FOR ll_j = 1 TO ads_Category.RowCount()
					ll_ChildObject3 = ljson_Option.AddItemObject(ll_ChildArray2)
					ljson_Option.AddItemString(ll_ChildObject3, "name", "'" + This.of_GetItemString( ads_Category,ll_j, 2) + "'")
					ljson_Option.AddItemNumber(ll_ChildObject3, "value",ads_Category.GetItemNumber(ll_j, 3))
				NEXT
						
			NEXT
			
	End Choose
	
	ls_Option = ljson_Option.GetJsonString()
	
Catch(throwable ex)
	MessageBox( "Error", ex.getmessage() )
End Try

If IsValid ( ads_Series ) Then Destroy ( ads_Series )
If IsValid ( ads_Category ) Then Destroy ( ads_Category )

Return ls_Option
end function

public function string of_createoption (datastore ads_series, datastore ads_category);//
Return This.of_createoption( ads_series, ads_category, This.of_getStyle())
end function

public function string of_createoption (string as_sql, string as_type, string as_categorycol, string as_valuecol);//
String 	ls_Style, ls_DWSyntax, ls_Error, ls_SQL, ls_Value
DataStore 	lds_data

If Pos ( Upper(as_valuecol), "SUM(" ) > 0 Or Pos (  Upper(as_valuecol), "COUNT(" ) >0 Then
	ls_Value = "valuescolumn"
	ls_SQL = "SELECT " + as_categorycol + "," + as_valuecol + " AS valuescolumn " + " FROM ( " + as_sql + " )SERIES1 GROUP BY " +as_categorycol 
Else
	ls_Value = as_valuecol
	ls_SQL = "SELECT " + as_categorycol + "," + " SUM(" + ls_value + ") AS " + ls_value + " FROM ( " + as_sql + " )SERIES1 GROUP BY " +as_categorycol 
End If
	
ls_style = 'style(type=grid )'
If Len (ls_SQL ) > 0 Then
	lds_data = Create DataStore
	ls_DWSyntax = SQLCA.SyntaxFromSQL( ls_SQL, ls_style, ls_Error )
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
		Return This.of_CreateOption ( lds_data, as_type, as_CategoryCol, ls_Value )
	End If
END IF
If IsValid ( lds_data ) Then Destroy ( lds_data )

Return ""
end function

public function string of_createoption (datastore ads_data, string as_type, string as_categorycol, string as_valuecol);//
Long 		ll_I, ll_J, ll_Row, ll_Row2
Long 		ll_RootObject,ll_ChildObject, ll_ChildArray, ll_ChildArray2, ll_ChildArray3, ll_ChildArray4, ll_ChildObject2
Long 		ll_ChildObject3, ll_ChildObject4, ll_ChildObject5
String 	ls_Option, ls_Type, ls_Colors
Double 	ldb_Value
JsonGenerator ljson_Option

ls_Type = Lower( as_Type )

//title
//legend
//grid{left:130,right:'30%',height:'40%',bottom:110}
//tooltip
//toolbox
//dataZoom
//visualMap
//xAxis:[{type:'category',...},{}]
//yAxis:[{...},{...}]
//series:[{type:'line',...},{...}]

ljson_Option = Create JsonGenerator
ll_RootObject = ljson_Option.CreateJsonObject()

TRY
	Choose Case ls_Type
		CASE "line", "bar"
			IF	ls_Type = "line" THEN
				ljson_Option.AddItemString(ll_RootObject, "type","'line'")
			ELSEIF ls_Type = "area" THEN
				ljson_Option.AddItemString(ll_RootObject, "type","'line'")
			ELSEIF  ls_Type = "bar" THEN
				ljson_Option.AddItemString(ll_RootObject, "type","'bar'")
			END IF
			ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "data")
			ll_ChildArray = ljson_Option.AddItemArray(ll_ChildObject, "labels")
			FOR ll_i = 1 TO ads_data.RowCount()
				ljson_Option.AddItemString(ll_ChildArray, "'" + This.of_GetItemString(ads_data,ll_i, as_CategoryCol ) + "'")
			NEXT
			
			ll_ChildArray2 = ljson_Option.AddItemArray(ll_ChildObject, "datasets")
			//Dataset 1
			ll_ChildObject2 = ljson_Option.AddItemObject(ll_ChildArray2)
			ljson_Option.AddItemString(ll_ChildObject2, "label", "'Dataset 1'")
			
		
			IF ls_Type = "bar" THEN
				ljson_Option.AddItemString(ll_ChildObject2, "backgroundColor", "color(window.chartColors.blue).alpha(0.5).rgbString()")
			ELSE
				ljson_Option.AddItemString(ll_ChildObject2, "backgroundColor", "window.chartColors.red")
			END IF
			
			ljson_Option.AddItemString(ll_ChildObject2, "borderColor", "window.chartColors.red")
			ljson_Option.AddItemNumber(ll_ChildObject2, "borderWidth", 1)
			
			ll_ChildArray4 = ljson_Option.AddItemArray(ll_ChildObject2, "data")
		
			FOR ll_j = 1 TO ads_data.RowCount()
					ljson_Option.AddItemNumber(ll_ChildArray4, ads_data.GetItemNumber(ll_j, as_ValueCol ))
			NEXT
			
			IF ls_Type ="line" THEN
				ljson_Option.AddItemBoolean(ll_ChildObject2, "fill", false)
			ELSEIF ls_Type ="area" THEN
				ljson_Option.AddItemBoolean(ll_ChildObject2, "fill", true)
			END IF
			
			ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "options")
	
			ll_ChildObject2 = ljson_Option.AddItemBoolean(ll_ChildObject, "responsive", true)
			ll_ChildObject2 = ljson_Option.AddItemObject(ll_ChildObject, "legend")
			
			ll_ChildObject3 = ljson_Option.AddItemString(ll_ChildObject2, "position", "'top'")
			
			ll_ChildObject2 = ljson_Option.AddItemObject(ll_ChildObject, "title")
			ll_ChildObject3  =ljson_Option.AddItemBoolean(ll_ChildObject2, "display", true)
			ll_ChildObject3  =ljson_Option.AddItemString(ll_ChildObject2, "text", "'"+This.of_Gettitle()+"'")
		
		CASE "pie"
			ljson_Option.AddItemString(ll_RootObject, "type","'pie'")	
			
			ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "data")	
			
			ll_ChildArray = ljson_Option.AddItemArray(ll_ChildObject, "datasets")
			
			ll_ChildObject2 = ljson_Option.AddItemObject(ll_ChildArray)
			
			ll_ChildArray2 = ljson_Option.AddItemArray(ll_ChildObject2, "data")
			
			FOR ll_i = 1 TO ads_data.RowCount()
				ljson_Option.AddItemNumber(ll_ChildArray2, ads_data.GetItemNumber(ll_i, as_ValueCol ))
			NEXT
			
			ll_ChildArray3 = ljson_Option.AddItemArray(ll_ChildObject2, "backgroundColor")
			ljson_Option.AddItemString(ll_ChildArray3, "window.chartColors.red")
			ljson_Option.AddItemString(ll_ChildArray3, "window.chartColors.orange")
			ljson_Option.AddItemString(ll_ChildArray3, "window.chartColors.yellow")
			ljson_Option.AddItemString(ll_ChildArray3, "window.chartColors.green")
			ljson_Option.AddItemString(ll_ChildArray3, "window.chartColors.blue")
			
			ljson_Option.AddItemString(ll_ChildObject2, "label", "'Dataset 1'")
			
			ll_ChildArray2 = ljson_Option.AddItemArray(ll_ChildObject, "labels")
			
			FOR ll_i = 1 TO ads_data.RowCount()
				ljson_Option.AddItemString(ll_ChildArray2,"'" + This.of_GetItemString(ads_data,ll_i, as_CategoryCol ) + "'")
			NEXT
			
			ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "options")
			
			ljson_Option.AddItemBoolean(ll_ChildObject, "responsive", true)
		
	END CHOOSE
	
ls_Option = ljson_Option.GetJsonString()
	
CATCH(throwable ex)
	Messagebox("Error", ex.getMessage())
END TRY


Return ls_Option
	
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

public function string of_createoption (datastore ads_data, string as_categorycol, string as_valuecol);//
Return This.of_createoption(ads_data, This.of_GetStyle(), as_categorycol, as_valuecol )
end function

public function string of_createoption (string as_sql, string as_categorycol, string as_valuecol);//
Return This.of_createOption( as_sql, This.of_GetStyle(), as_categorycol, as_valuecol )
end function

public function string of_getrosetype ();//GetRoseType
Return This.is_roseType
end function

public subroutine of_setrosetype (string as_arg);//RoseType
this.is_roseType = as_arg
end subroutine

public function string of_createoption_series (string as_sql, string as_type, string as_categorycol, string as_valuecol, string as_series);//
String 	ls_Style, ls_DWSyntax, ls_Error, ls_Value
String 	ls_SQL1, ls_SQL2, ls_SQL3
DataStore 	lds_data1, lds_data2, lds_data3
Long 		ll_I, ll_J, ll_Find, ll_Row, ll_Row2
Long 		ll_RootObject,ll_ChildObject, ll_ChildArray, ll_ChildArray2,ll_ChildObject2
Long 		ll_ChildObject3, ll_ChildArray3, ll_ChildObject4, ll_ChildObject5
String 	ls_Option, ls_Type, ls_SeriesName, ls_CategoryName, ls_Colors
Double 	ldb_Value
JsonGenerator ljson_Option

ls_Type = Lower( as_Type )


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
	
	//title
	//legend
	//grid{left:130,right:'30%',height:'40%',bottom:110}
	//tooltip
	//toolbox
	//dataZoom
	//visualMap
	//xAxis:[{type:'category',...},{}]
	//yAxis:[{...},{...}]
	//series:[{type:'line',...},{...}]
	
	ljson_Option = Create JsonGenerator
	ll_RootObject = ljson_Option.CreateJsonObject()
	
	//Colors
	ls_Colors = This.of_GetColors()
	If Len ( ls_Colors ) > 0 Then
		ll_ChildArray = ljson_Option.AddItemArray(ll_RootObject, "color")
		ljson_Option.AddItemString(ll_ChildArray, ls_Colors )
	End If

	//Title
	ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "title")
	ljson_Option.AddItemString(ll_ChildObject, "text",  "'" + This.of_Gettitle() + "'")
	
	Try
		
		Choose Case ls_Type
			Case "line", "bar", "scatter", "area"
				//legend
				ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "legend")
				ll_ChildArray = ljson_Option.AddItemArray(ll_ChildObject, "data")
				FOR ll_i = 1 TO lds_data2.RowCount()
					ls_SeriesName = lds_data2.GetItemString(ll_i, as_series)
					ljson_Option.AddItemString(ll_ChildArray, "'" + ls_SeriesName + "'" )
				NEXT
				//grid
				ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "grid")
				ljson_Option.AddItemString(ll_ChildObject, "left","'3%'")
				ljson_Option.AddItemString(ll_ChildObject, "right","'4%'")
				ljson_Option.AddItemString(ll_ChildObject, "bottom","'3%'")
				ljson_Option.AddItemBoolean(ll_ChildObject,"containLabel",True)
				//ToolTip
				ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "tooltip")
				ljson_Option.AddItemString(ll_ChildObject, "trigger", "'axis'")
				//ToolBox
				IF This.of_GetToolBox() THEN
					ll_ChildObject2 = ljson_Option.AddItemObject(ll_RootObject, "toolbox")
					ll_ChildObject3 = ljson_Option.AddItemObject(ll_ChildObject2, "feature")
					ljson_Option.AddItemObject(ll_ChildObject3, "dataZoom")
					ljson_Option.AddItemObject(ll_ChildObject3, "saveAsImage")
					ljson_Option.AddItemObject(ll_ChildObject3, "dataView")
				END IF
				//dataZoom
				IF This.of_GetDataZoom() THEN
					ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "dataZoom")
					ljson_Option.AddItemString(ll_ChildObject, "orient", "'horizontal'")
				END IF
				//xaxis
				ll_ChildArray = ljson_Option.AddItemArray(ll_RootObject, "xAxis")
				ll_ChildObject = ljson_Option.AddItemObject(ll_ChildArray)
				ljson_Option.AddItemString(ll_ChildObject, "type","'category'")
				If ls_Type = "area" Then
					ljson_Option.AddItemBoolean(ll_ChildObject, "boundaryGap",false)
				End If
				ll_ChildArray2 = ljson_Option.AddItemArray(ll_ChildObject, "data")
				FOR ll_i = 1 TO lds_data1.RowCount()
					ljson_Option.AddItemString(ll_ChildArray2, "'" + lds_data1.GetItemString( ll_I, as_categorycol ) + "'")
				NEXT
				
				//yaxis
				ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "yAxis")
				ljson_Option.AddItemString(ll_ChildObject, "type","'value'")
				
				//series1
				ll_ChildArray = ljson_Option.AddItemArray(ll_RootObject, "series" )
				FOR ll_i = 1 TO lds_data2.RowCount()
					ls_SeriesName = lds_data2.GetItemString(ll_i,1)
					ll_ChildObject2 = ljson_Option.AddItemObject(ll_ChildArray)
					If ls_Type = "area" Then
						ljson_Option.AddItemString(ll_ChildObject2, "type","'line'")
						ljson_Option.AddItemString(ll_ChildObject2, "areaStyle","''")
					Else
						ljson_Option.AddItemString(ll_ChildObject2, "type","'" + ls_Type + "'")
					End If
					ljson_Option.AddItemString(ll_ChildObject2, "name","'" + ls_SeriesName + "'")
					ll_ChildArray2 = ljson_Option.AddItemArray(ll_ChildObject2, "data")
					FOR ll_J = 1 TO lds_data1.RowCount()
						ls_CategoryName = lds_data1.GetItemString( ll_J, as_categorycol )
						ll_Find = lds_data3.Find ( as_categorycol + "='" + ls_CategoryName + "' and " + as_series + "='" +  ls_SeriesName + "'", 1, lds_data3.RowCount() )
						If ll_Find > 0 Then
							ljson_Option.AddItemNumber(ll_ChildArray2, lds_data3.GetItemNumber(ll_Find, ls_value ))
						End If
					NEXT
				NEXT
			
				If ls_Type = "area" Then
					ljson_Option.AddItemString(ll_ChildObject2, "type","'line'")
					ljson_Option.AddItemString(ll_ChildObject2, "areaStyle","''")
				End If
				
			Case "pie"
				ljson_Option.AddItemString(ll_ChildObject, "x", "'center'")
				//legend
				ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "legend")
				ljson_Option.AddItemString(ll_ChildObject, "orient", "'vertical'")
				ljson_Option.AddItemString(ll_ChildObject, "left", "'left'")
				ll_ChildArray = ljson_Option.AddItemArray(ll_ChildObject, "data")
				FOR ll_i = 1 TO lds_data2.RowCount()
					ls_SeriesName = lds_data2.GetItemString(ll_i, as_series)
					ljson_Option.AddItemString(ll_ChildArray, "'" + ls_SeriesName + "'" )
				NEXT
		
				//tooltip
				ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "tooltip")
				ljson_Option.AddItemString(ll_ChildObject, "trigger", "'item'")
				ljson_Option.AddItemString(ll_ChildObject, "formatter", "'{a} <br/>{b} : {c} ({d}%)'")
				
				//ToolBox
				IF  This.of_GetToolBox() THEN
					ll_ChildObject2 = ljson_Option.AddItemObject(ll_RootObject, "toolbox")
					ll_ChildObject3 = ljson_Option.AddItemObject(ll_ChildObject2, "feature")
					ljson_Option.AddItemObject(ll_ChildObject3, "saveAsImage")
					ljson_Option.AddItemObject(ll_ChildObject3, "dataView")
				END IF
				
				//grid
				ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "grid")
				ljson_Option.AddItemString(ll_ChildObject, "left","'3%'")
				ljson_Option.AddItemString(ll_ChildObject, "right","'4%'")
				ljson_Option.AddItemString(ll_ChildObject, "bottom","'3%'")
				ljson_Option.AddItemBoolean(ll_ChildObject,"containLabel",True)
				
				//series
				ll_ChildArray = ljson_Option.AddItemArray(ll_RootObject, "series")
				FOR ll_i = 1 TO lds_data2.RowCount()
					ls_SeriesName = lds_data2.GetItemString(ll_i,1)
					ll_ChildObject2 = ljson_Option.AddItemObject(ll_ChildArray)
					ljson_Option.AddItemString(ll_ChildObject2, "type","'" + ls_Type + "'")
					ljson_Option.AddItemString(ll_ChildObject2, "name","'" + ls_SeriesName + "'")			
					ljson_Option.AddItemString(ll_ChildObject2, "radius","['" + String (((ll_i - 1) / lds_data2.RowCount() * 100) - 10 ) + "%','" +  String ( ((ll_i) / lds_data2.RowCount() * 100) - 10 ) + "%']")
					ljson_Option.AddItemString(ll_ChildObject2, "center","['50%','50%']")
					
					If Len ( This.of_GetRoseType()) > 0 Then //roseType
						ljson_Option.AddItemString(ll_ChildObject2, "roseType","'" + This.of_GetRoseType() + "'")
					End If
				
					ll_ChildArray2 = ljson_Option.AddItemArray(ll_ChildObject2, "data")
					FOR ll_J = 1 TO lds_data1.RowCount()
						ll_ChildObject2 = ljson_Option.AddItemObject(ll_ChildArray2)
						ls_CategoryName = lds_data1.GetItemString( ll_J, as_categorycol )
						ljson_Option.AddItemString(ll_ChildObject2,"name", "'" + ls_CategoryName + "'")
						ll_Find = lds_data3.Find ( as_categorycol + "='" + ls_CategoryName + "' and " + as_series + "='" +  ls_SeriesName + "'", 1, lds_data3.RowCount() )
						If ll_Find > 0 Then
							ljson_Option.AddItemNumber(ll_ChildObject2,"value", lds_data3.GetItemNumber(ll_Find, ls_value ))
						End If
					NEXT
					ll_ChildObject3 = ljson_Option.AddItemObject(ll_ChildObject2,"emphasis")
					ll_ChildObject4 = ljson_Option.AddItemObject(ll_ChildObject3,"itemStyle")
					ll_ChildObject5 = ljson_Option.AddItemObject(ll_ChildObject4,"emphasis")
					ljson_Option.AddItemString(ll_ChildObject5, "shadowBlur","10")
					ljson_Option.AddItemString(ll_ChildObject5, "shadowOffsetX","0")
					ljson_Option.AddItemString(ll_ChildObject5, "shadowColor","'rgba(0, 0, 0, 0.5)'")
				NEXT
				
				
			Case "funnel"
				//ToolTip
				ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "tooltip")
				ljson_Option.AddItemString(ll_ChildObject, "trigger", "'item'")
				ljson_Option.AddItemString(ll_ChildObject, "formatter", "'{a} <br/>{b} : {c}%'")
				
				//legend
				ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "legend")
				ll_ChildArray = ljson_Option.AddItemArray(ll_ChildObject, "data")
				FOR ll_i = 1 TO lds_data2.RowCount()
					ls_SeriesName = lds_data2.GetItemString(ll_i, as_series)
					ljson_Option.AddItemString(ll_ChildArray, "'" + ls_SeriesName + "'" )
				NEXT
				
				//ToolBox
				IF  This.of_GetToolBox() THEN
					ll_ChildObject2 = ljson_Option.AddItemObject(ll_RootObject, "toolbox")
					ll_ChildObject3 = ljson_Option.AddItemObject(ll_ChildObject2, "feature")
					ljson_Option.AddItemObject(ll_ChildObject3, "saveAsImage")
					ljson_Option.AddItemObject(ll_ChildObject3, "dataView")
				END IF
				
				//series
				ll_ChildArray = ljson_Option.AddItemArray(ll_RootObject, "series")
				FOR ll_i = 1 TO lds_data2.RowCount()
					ls_SeriesName = lds_data2.GetItemString(ll_i,1)
					ll_ChildObject2 = ljson_Option.AddItemObject(ll_ChildArray)
					ljson_Option.AddItemString(ll_ChildObject2, "type","'" + ls_Type + "'")
					ljson_Option.AddItemString(ll_ChildObject2, "name","'" + ls_SeriesName + "'")			
					ljson_Option.AddItemString(ll_ChildObject2, "radius","['" + String (((ll_i - 1) / lds_data2.RowCount() * 100) - 10 ) + "%','" +  String ( ((ll_i) / lds_data2.RowCount() * 100) - 10 ) + "%']")
					ljson_Option.AddItemString(ll_ChildObject2, "center","['50%','50%']")
					
					ll_ChildArray2 = ljson_Option.AddItemArray(ll_ChildObject2, "data")
					FOR ll_J = 1 TO lds_data1.RowCount()
						ll_ChildObject2 = ljson_Option.AddItemObject(ll_ChildArray2)
						ls_CategoryName = lds_data1.GetItemString( ll_J, as_categorycol )
						ljson_Option.AddItemString(ll_ChildObject2,"name", "'" + ls_CategoryName + "'")
						ll_Find = lds_data3.Find ( as_categorycol + "='" + ls_CategoryName + "' and " + as_series + "='" +  ls_SeriesName + "'", 1, lds_data3.RowCount() )
						If ll_Find > 0 Then
							ljson_Option.AddItemNumber(ll_ChildObject2,"value", lds_data3.GetItemNumber(ll_Find, ls_value ))
						End If
					NEXT
				NEXT
		End Choose
		
		ls_Option = ljson_Option.GetJsonString()
		
	Catch(throwable ex)
		MessageBox( "Error", ex.getmessage() )
	End Try

End If

If IsValid ( lds_data1 ) Then Destroy ( lds_data1 )
If IsValid ( lds_data2 ) Then Destroy ( lds_data2 )
If IsValid ( lds_data3 ) Then Destroy ( lds_data3 )

Return ls_Option
end function

public function string of_createoption_series (string as_sql, string as_categorycol, string as_valuecol, string as_series);//

Return This.of_createoption_series( as_sql, This.of_getstyle( ), as_categorycol, as_valuecol, as_series )
end function

public function string of_createoption (datawindow adw_data);//
Return This.of_createoption( adw_data, This.of_GetStyle() )
end function

public function string of_createoption (datawindow adw_data, string as_categorycol, string as_valuecol);//
Return This.of_createoption( adw_data, This.of_GetStyle(), as_categorycol, as_valuecol )
end function

public function string of_createoption (datawindow adw_data, string as_type);//
Long 		ll_I, ll_J, ll_Row, ll_Row2
Long 		ll_RootObject,ll_ChildObject, ll_ChildArray, ll_ChildArray2
Long 		ll_ChildObject2,ll_ChildObject3, ll_ChildArray3, ll_ChildObject4, ll_ChildObject5
String 	ls_Option, ls_Type, ls_Colors
Double 	ldb_Value
JsonGenerator ljson_Option

ls_Type = Lower( as_Type )

//title
//legend
//grid{left:130,right:'30%',height:'40%',bottom:110}
//tooltip
//toolbox
//dataZoom
//visualMap
//xAxis:[{type:'category',...},{}]
//yAxis:[{...},{...}]
//series:[{type:'line',...},{...}]

ljson_Option = Create JsonGenerator
ll_RootObject = ljson_Option.CreateJsonObject()

//Colors
ls_Colors = This.of_GetColors()
If Len ( ls_Colors ) > 0 Then
	ll_ChildArray = ljson_Option.AddItemArray(ll_RootObject, "color")
	ljson_Option.AddItemString(ll_ChildArray, ls_Colors )
End If

//Title
ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "title")
ljson_Option.AddItemString(ll_ChildObject, "text",  "'" + This.of_Gettitle() + "'")

Try
	
	Choose Case ls_Type
		Case "line", "bar", "scatter", "area"
			//legend
			ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "legend")
			ll_ChildArray = ljson_Option.AddItemArray(ll_ChildObject, "data")
			ljson_Option.AddItemString(ll_ChildArray, "'" + This.of_GetSeriesName() + "'" )
			//grid
			ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "grid")
			ljson_Option.AddItemString(ll_ChildObject, "left","'3%'")
			ljson_Option.AddItemString(ll_ChildObject, "right","'4%'")
			ljson_Option.AddItemString(ll_ChildObject, "bottom","'3%'")
			ljson_Option.AddItemBoolean(ll_ChildObject,"containLabel",True)
			//ToolTip
			ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "tooltip")
			ljson_Option.AddItemString(ll_ChildObject, "trigger", "'axis'")
			//ToolBox
			IF This.of_GetToolBox() THEN
				ll_ChildObject2 = ljson_Option.AddItemObject(ll_RootObject, "toolbox")
				ll_ChildObject3 = ljson_Option.AddItemObject(ll_ChildObject2, "feature")
				ljson_Option.AddItemObject(ll_ChildObject3, "dataZoom")
				ljson_Option.AddItemObject(ll_ChildObject3, "saveAsImage")
				ljson_Option.AddItemObject(ll_ChildObject3, "dataView")
			END IF
			//dataZoom
			IF This.of_GetDataZoom() THEN
				ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "dataZoom")
				ljson_Option.AddItemString(ll_ChildObject, "orient", "'horizontal'")
			END IF
			//xaxis
			ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "xAxis")
			ljson_Option.AddItemString(ll_ChildObject, "type","'category'")
			If ls_Type = "area" Then
				ljson_Option.AddItemBoolean(ll_ChildObject, "boundaryGap",false)
			End If
			ll_ChildArray = ljson_Option.AddItemArray(ll_ChildObject, "data")
			FOR ll_i = 1 TO adw_data.RowCount()
				ljson_Option.AddItemString(ll_ChildArray, "'" + This.of_GetItemString(adw_data,ll_i, 1) + "'")
			NEXT
			
			//yaxis
			ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "yAxis")
			ljson_Option.AddItemString(ll_ChildObject, "type","'value'")
			
			//series
			ll_ChildArray = ljson_Option.AddItemArray(ll_RootObject, "series" )
			ll_ChildObject2 = ljson_Option.AddItemObject(ll_ChildArray)
			If ls_Type <> "area" Then
				ljson_Option.AddItemString(ll_ChildObject2, "type","'" + ls_Type + "'")
			End If
			ljson_Option.AddItemString(ll_ChildObject2, "name","'" + This.of_GetSeriesName() + "'")
			ll_ChildArray2 = ljson_Option.AddItemArray(ll_ChildObject2, "data")
			FOR ll_j = 1 TO adw_data.RowCount()
				ljson_Option.AddItemNumber(ll_ChildArray2, adw_data.GetItemNumber(ll_j, 2 ))
			NEXT
			If ls_Type = "area" Then
				ljson_Option.AddItemString(ll_ChildObject2, "type","'line'")
				ljson_Option.AddItemString(ll_ChildObject2, "areaStyle","''")
			End If
			
		Case "pie"
			ljson_Option.AddItemString(ll_ChildObject, "x", "'center'")
			//legend
			ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "legend")
			ljson_Option.AddItemString(ll_ChildObject, "orient", "'vertical'")
			ljson_Option.AddItemString(ll_ChildObject, "left", "'left'")
			ll_ChildArray = ljson_Option.AddItemArray(ll_ChildObject, "data")
			FOR ll_i = 1 TO adw_data.RowCount()
				ljson_Option.AddItemString(ll_ChildArray, "'" + This.of_GetItemString(adw_data,ll_i, 1) + "'")
			NEXT
	
			//tooltip
			ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "tooltip")
			ljson_Option.AddItemString(ll_ChildObject, "trigger", "'item'")
			ljson_Option.AddItemString(ll_ChildObject, "formatter", "'{a} <br/>{b} : {c} ({d}%)'")
			
			//ToolBox
			IF  This.of_GetToolBox() THEN
				ll_ChildObject2 = ljson_Option.AddItemObject(ll_RootObject, "toolbox")
				ll_ChildObject3 = ljson_Option.AddItemObject(ll_ChildObject2, "feature")
				ljson_Option.AddItemObject(ll_ChildObject3, "saveAsImage")
				ljson_Option.AddItemObject(ll_ChildObject3, "dataView")
			END IF
			
			//grid
			ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "grid")
			ljson_Option.AddItemString(ll_ChildObject, "left","'3%'")
			ljson_Option.AddItemString(ll_ChildObject, "right","'4%'")
			ljson_Option.AddItemString(ll_ChildObject, "bottom","'3%'")
			ljson_Option.AddItemBoolean(ll_ChildObject,"containLabel",True)
			
			//series
			ll_ChildArray = ljson_Option.AddItemArray(ll_RootObject, "series")
			ll_ChildObject2 = ljson_Option.AddItemObject(ll_ChildArray)
			ljson_Option.AddItemString(ll_ChildObject2, "type","'pie'")
			ljson_Option.AddItemString(ll_ChildObject2, "name","'" + This.of_Gettitle() + "'")
			ljson_Option.AddItemString(ll_ChildObject2, "radius","'50%'")
			ljson_Option.AddItemString(ll_ChildObject2, "center","['50%','60%']")
			If Len ( This.of_GetRoseType()) > 0 Then //roseType
					ljson_Option.AddItemString(ll_ChildObject2, "roseType","'" + This.of_GetRoseType() + "'")
				End If
			ll_ChildArray2 = ljson_Option.AddItemArray(ll_ChildObject2, "data")
			FOR ll_i = 1 TO adw_data.RowCount()
				ll_ChildObject3 = ljson_Option.AddItemObject(ll_ChildArray2)
				ljson_Option.AddItemString(ll_ChildObject3, "name", "'" + This.of_GetItemString( adw_data,ll_i, 1) + "'")
				ljson_Option.AddItemNumber(ll_ChildObject3, "value",adw_data.GetItemNumber(ll_i, 2))
			NEXT
			ll_ChildObject3 = ljson_Option.AddItemObject(ll_ChildObject2,"emphasis")
			ll_ChildObject4 = ljson_Option.AddItemObject(ll_ChildObject3,"itemStyle")
			ll_ChildObject5 = ljson_Option.AddItemObject(ll_ChildObject4,"emphasis")
			ljson_Option.AddItemString(ll_ChildObject5, "shadowBlur","10")
			ljson_Option.AddItemString(ll_ChildObject5, "shadowOffsetX","0")
			ljson_Option.AddItemString(ll_ChildObject5, "shadowColor","'rgba(0, 0, 0, 0.5)'")
			
			
		Case "funnel"
			//ToolTip
			ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "tooltip")
			ljson_Option.AddItemString(ll_ChildObject, "trigger", "'item'")
			ljson_Option.AddItemString(ll_ChildObject, "formatter", "'{a} <br/>{b} : {c}%'")
					
			//legend
			ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "legend")
			ll_ChildArray = ljson_Option.AddItemArray(ll_ChildObject, "data")
			FOR ll_i = 1 TO adw_data.RowCount()
				ljson_Option.AddItemString(ll_ChildArray, "'" + This.of_GetItemString( adw_data,ll_i, 1) + "'")
			NEXT
			
			//ToolBox
			IF  This.of_GetToolBox() THEN
				ll_ChildObject2 = ljson_Option.AddItemObject(ll_RootObject, "toolbox")
				ll_ChildObject3 = ljson_Option.AddItemObject(ll_ChildObject2, "feature")
				ljson_Option.AddItemObject(ll_ChildObject3, "saveAsImage")
				ljson_Option.AddItemObject(ll_ChildObject3, "dataView")
			END IF
			
			//series
			ll_ChildArray = ljson_Option.AddItemArray(ll_RootObject, "series")
			ll_ChildObject2 = ljson_Option.AddItemObject(ll_ChildArray)
			ljson_Option.AddItemString(ll_ChildObject2, "name","'funnel chart'")
			ljson_Option.AddItemString(ll_ChildObject2, "type","'funnel'")
			ljson_Option.AddItemString(ll_ChildObject2, "width","'80%'")
			ljson_Option.AddItemString(ll_ChildObject2, "left","'10%'")
			ljson_Option.AddItemNumber(ll_ChildObject2, "top", 60)
			ljson_Option.AddItemNumber(ll_ChildObject2, "bottom", 60)
			ljson_Option.AddItemString(ll_ChildObject2, "width","'80%'")
			
			ljson_Option.AddItemNumber(ll_ChildObject2, "min", 0)
			ljson_Option.AddItemNumber(ll_ChildObject2, "max", 100)
			
			ljson_Option.AddItemString(ll_ChildObject2, "miniSize","'0%'")
			ljson_Option.AddItemString(ll_ChildObject2, "maxSize","'100%'")
			
			ljson_Option.AddItemString(ll_ChildObject2, "sort","'descending'")
			ljson_Option.AddItemNumber(ll_ChildObject2, "gap", 2)
			
			ljson_Option.AddItemObject(ll_ChildObject2, "label")
			
			ll_ChildObject3 = ljson_Option.AddItemObject(ll_ChildObject2)
			
			ljson_Option.AddItemBoolean(ll_ChildObject3, "show", true)
			ljson_Option.AddItemString(ll_ChildObject3, "position","'inside'")
			
			ljson_Option.AddItemObject(ll_ChildObject2, "labelLine")
			
			ll_ChildObject3 = ljson_Option.AddItemObject(ll_ChildObject2)
			ljson_Option.AddItemNumber(ll_ChildObject3, "legth", 10)
			
			ljson_Option.AddItemObject(ll_ChildObject3, "lineStyle")
			
			ll_ChildObject4 = ljson_Option.AddItemObject(ll_ChildObject3)
			
			ljson_Option.AddItemNumber(ll_ChildObject3, "width", 1)
			
			ljson_Option.AddItemString(ll_ChildObject3, "type","'solid'")
			
			ljson_Option.AddItemObject(ll_ChildObject2, "itemStyle")
			
			ll_ChildObject3 = ljson_Option.AddItemObject(ll_ChildObject2)
			ljson_Option.AddItemString(ll_ChildObject3, "borderColor", "'#fff'")
			
			ljson_Option.AddItemNumber(ll_ChildObject3, "borderwidth", 1)
			
			ljson_Option.AddItemObject(ll_ChildObject2, "emphasis")
			
			ll_ChildObject3 = ljson_Option.AddItemObject(ll_ChildObject2)
			
			ljson_Option.AddItemObject(ll_ChildObject3, "label")
			
			ll_ChildObject4 = ljson_Option.AddItemObject(ll_ChildObject3)
			
			ljson_Option.AddItemNumber(ll_ChildObject4, "fontSize", 20)
			
			ll_ChildArray3 = ljson_Option.AddItemArray(ll_ChildObject2, "data")
			
			FOR ll_j = 1 TO adw_data.RowCount()
				ll_ChildObject3 = ljson_Option.AddItemObject(ll_ChildArray3)
				ljson_Option.AddItemNumber(ll_ChildObject3, "value", adw_data.GetItemNumber(ll_j, 2 ))
				ljson_Option.AddItemString(ll_ChildObject3, "name","'" + This.of_GetItemString(adw_data,ll_j, 1) + "'")
			NEXT
			
	End Choose
	
	ls_Option = ljson_Option.GetJsonString()
	
Catch(throwable ex)
	MessageBox( "Error", ex.getmessage() )
End Try

Return ls_Option
end function

public function string of_createoption (datawindow adw_data, string as_type, string as_categorycol, string as_valuecol);//
Long 		ll_I, ll_J, ll_Row, ll_Row2
Long 		ll_RootObject,ll_ChildObject, ll_ChildArray, ll_ChildArray2,ll_ChildObject2
Long 		ll_ChildObject3, ll_ChildArray3, ll_ChildObject4, ll_ChildObject5
String 	ls_Option, ls_Type, ls_Colors
Double 	ldb_Value
JsonGenerator ljson_Option

ls_Type = Lower( as_Type )

//title
//legend
//grid{left:130,right:'30%',height:'40%',bottom:110}
//tooltip
//toolbox
//dataZoom
//visualMap
//xAxis:[{type:'category',...},{}]
//yAxis:[{...},{...}]
//series:[{type:'line',...},{...}]

ljson_Option = Create JsonGenerator
ll_RootObject = ljson_Option.CreateJsonObject()

//Colors
ls_Colors = This.of_GetColors()
If Len ( ls_Colors ) > 0 Then
	ll_ChildArray = ljson_Option.AddItemArray(ll_RootObject, "color")
	ljson_Option.AddItemString(ll_ChildArray, ls_Colors )
End If

//Title
ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "title")
ljson_Option.AddItemString(ll_ChildObject, "text",  "'" + This.of_Gettitle() + "'")

Try
	
	Choose Case ls_Type
		Case "line", "bar", "scatter", "area"
			//legend
			ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "legend")
			ll_ChildArray = ljson_Option.AddItemArray(ll_ChildObject, "data")
			ljson_Option.AddItemString(ll_ChildArray, "'" + This.of_GetSeriesName() + "'" )
			//grid
			ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "grid")
			ljson_Option.AddItemString(ll_ChildObject, "left","'3%'")
			ljson_Option.AddItemString(ll_ChildObject, "right","'4%'")
			ljson_Option.AddItemString(ll_ChildObject, "bottom","'3%'")
			ljson_Option.AddItemBoolean(ll_ChildObject,"containLabel",True)
			//ToolTip
			ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "tooltip")
			ljson_Option.AddItemString(ll_ChildObject, "trigger", "'axis'")
			//ToolBox
			IF This.of_GetToolBox() THEN
				ll_ChildObject2 = ljson_Option.AddItemObject(ll_RootObject, "toolbox")
				ll_ChildObject3 = ljson_Option.AddItemObject(ll_ChildObject2, "feature")
				ljson_Option.AddItemObject(ll_ChildObject3, "dataZoom")
				ljson_Option.AddItemObject(ll_ChildObject3, "saveAsImage")
				ljson_Option.AddItemObject(ll_ChildObject3, "dataView")
			END IF
			//dataZoom
			IF This.of_GetDataZoom() THEN
				ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "dataZoom")
				ljson_Option.AddItemString(ll_ChildObject, "orient", "'horizontal'")
			END IF
			//xaxis
			ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "xAxis")
			ljson_Option.AddItemString(ll_ChildObject, "type","'category'")
			If ls_Type = "area" Then
				ljson_Option.AddItemBoolean(ll_ChildObject, "boundaryGap",false)
			End If
			ll_ChildArray = ljson_Option.AddItemArray(ll_ChildObject, "data")
			FOR ll_i = 1 TO adw_data.RowCount()
				ljson_Option.AddItemString(ll_ChildArray, "'" +This.of_GetItemString(adw_data,ll_i, as_CategoryCol ) + "'")
			NEXT
			
			//yaxis
			ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "yAxis")
			ljson_Option.AddItemString(ll_ChildObject, "type","'value'")
			
			//series
			ll_ChildArray = ljson_Option.AddItemArray(ll_RootObject, "series" )
			ll_ChildObject2 = ljson_Option.AddItemObject(ll_ChildArray)
			If ls_Type <> "area" Then
				ljson_Option.AddItemString(ll_ChildObject2, "type","'" + ls_Type + "'")
			End If
			ljson_Option.AddItemString(ll_ChildObject2, "name","'" + This.of_GetSeriesName() + "'")
			ll_ChildArray2 = ljson_Option.AddItemArray(ll_ChildObject2, "data")
			FOR ll_j = 1 TO adw_data.RowCount()
				ljson_Option.AddItemNumber(ll_ChildArray2, adw_data.GetItemNumber(ll_j, as_ValueCol ))
			NEXT
			If ls_Type = "area" Then
				ljson_Option.AddItemString(ll_ChildObject2, "type","'line'")
				ljson_Option.AddItemString(ll_ChildObject2, "areaStyle","''")
			End If
			
		Case "pie"
			ljson_Option.AddItemString(ll_ChildObject, "x", "'center'")
			//legend
			ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "legend")
			ljson_Option.AddItemString(ll_ChildObject, "orient", "'vertical'")
			ljson_Option.AddItemString(ll_ChildObject, "left", "'left'")
			ll_ChildArray = ljson_Option.AddItemArray(ll_ChildObject, "data")
			FOR ll_i = 1 TO adw_data.RowCount()
				ljson_Option.AddItemString(ll_ChildArray, "'" + This.of_GetItemString(adw_data,ll_i, as_CategoryCol ) + "'")
			NEXT
	
			//tooltip
			ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "tooltip")
			ljson_Option.AddItemString(ll_ChildObject, "trigger", "'item'")
			ljson_Option.AddItemString(ll_ChildObject, "formatter", "'{a} <br/>{b} : {c} ({d}%)'")
			
			//ToolBox
			IF  This.of_GetToolBox() THEN
				ll_ChildObject2 = ljson_Option.AddItemObject(ll_RootObject, "toolbox")
				ll_ChildObject3 = ljson_Option.AddItemObject(ll_ChildObject2, "feature")
				ljson_Option.AddItemObject(ll_ChildObject3, "saveAsImage")
				ljson_Option.AddItemObject(ll_ChildObject3, "dataView")
			END IF
			
			//grid
			ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "grid")
			ljson_Option.AddItemString(ll_ChildObject, "left","'3%'")
			ljson_Option.AddItemString(ll_ChildObject, "right","'4%'")
			ljson_Option.AddItemString(ll_ChildObject, "bottom","'3%'")
			ljson_Option.AddItemBoolean(ll_ChildObject,"containLabel",True)
			
			//series
			ll_ChildArray = ljson_Option.AddItemArray(ll_RootObject, "series")
			ll_ChildObject2 = ljson_Option.AddItemObject(ll_ChildArray)
			ljson_Option.AddItemString(ll_ChildObject2, "type","'pie'")
			ljson_Option.AddItemString(ll_ChildObject2, "name","'" + This.of_Gettitle() + "'")
			ljson_Option.AddItemString(ll_ChildObject2, "radius","'50%'")
			ljson_Option.AddItemString(ll_ChildObject2, "center","['50%','60%']")
			If Len ( This.of_GetRoseType()) > 0 Then //roseType
				ljson_Option.AddItemString(ll_ChildObject2, "roseType","'" + This.of_GetRoseType() + "'")
			End If
			ll_ChildArray2 = ljson_Option.AddItemArray(ll_ChildObject2, "data")
			FOR ll_i = 1 TO adw_data.RowCount()
				ll_ChildObject3 = ljson_Option.AddItemObject(ll_ChildArray2)
				ljson_Option.AddItemString(ll_ChildObject3, "name", "'" + This.of_GetItemString( adw_data,ll_i, as_CategoryCol) + "'")
				ljson_Option.AddItemNumber(ll_ChildObject3, "value",adw_data.GetItemNumber(ll_i, as_ValueCol))
			NEXT
			ll_ChildObject3 = ljson_Option.AddItemObject(ll_ChildObject2,"emphasis")
			ll_ChildObject4 = ljson_Option.AddItemObject(ll_ChildObject3,"itemStyle")
			ll_ChildObject5 = ljson_Option.AddItemObject(ll_ChildObject4,"emphasis")
			ljson_Option.AddItemString(ll_ChildObject5, "shadowBlur","10")
			ljson_Option.AddItemString(ll_ChildObject5, "shadowOffsetX","0")
			ljson_Option.AddItemString(ll_ChildObject5, "shadowColor","'rgba(0, 0, 0, 0.5)'")
			
			
		Case "funnel"
			//ToolTip
			ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "tooltip")
			ljson_Option.AddItemString(ll_ChildObject, "trigger", "'item'")
			ljson_Option.AddItemString(ll_ChildObject, "formatter", "'{a} <br/>{b} : {c}%'")
			
			//legend
			ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "legend")
			ll_ChildArray = ljson_Option.AddItemArray(ll_ChildObject, "data")
			FOR ll_i = 1 TO adw_data.RowCount()
				ljson_Option.AddItemString(ll_ChildArray, "'" + This.of_GetItemString( adw_data,ll_i, as_CategoryCol) + "'")
			NEXT
			
			//ToolBox
			IF  This.of_GetToolBox() THEN
				ll_ChildObject2 = ljson_Option.AddItemObject(ll_RootObject, "toolbox")
				ll_ChildObject3 = ljson_Option.AddItemObject(ll_ChildObject2, "feature")
				ljson_Option.AddItemObject(ll_ChildObject3, "saveAsImage")
				ljson_Option.AddItemObject(ll_ChildObject3, "dataView")
			END IF
			
			//series
			ll_ChildArray = ljson_Option.AddItemArray(ll_RootObject, "series")
			ll_ChildObject2 = ljson_Option.AddItemObject(ll_ChildArray)
			ljson_Option.AddItemString(ll_ChildObject2, "name","'funnel chart'")
			ljson_Option.AddItemString(ll_ChildObject2, "type","'funnel'")
			ljson_Option.AddItemString(ll_ChildObject2, "width","'80%'")
			ljson_Option.AddItemString(ll_ChildObject2, "left","'10%'")
			ljson_Option.AddItemNumber(ll_ChildObject2, "top", 60)
			ljson_Option.AddItemNumber(ll_ChildObject2, "bottom", 60)
			ljson_Option.AddItemString(ll_ChildObject2, "width","'80%'")
			
			ljson_Option.AddItemNumber(ll_ChildObject2, "min", 0)
			ljson_Option.AddItemNumber(ll_ChildObject2, "max", 100)
			
			ljson_Option.AddItemString(ll_ChildObject2, "miniSize","'0%'")
			ljson_Option.AddItemString(ll_ChildObject2, "maxSize","'100%'")
			
			ljson_Option.AddItemString(ll_ChildObject2, "sort","'descending'")
			ljson_Option.AddItemNumber(ll_ChildObject2, "gap", 2)
			
			ljson_Option.AddItemObject(ll_ChildObject2, "label")
			
			ll_ChildObject3 = ljson_Option.AddItemObject(ll_ChildObject2)
			
			ljson_Option.AddItemBoolean(ll_ChildObject3, "show", true)
			ljson_Option.AddItemString(ll_ChildObject3, "position","'inside'")
			
			ljson_Option.AddItemObject(ll_ChildObject2, "labelLine")
			
			ll_ChildObject3 = ljson_Option.AddItemObject(ll_ChildObject2)
			ljson_Option.AddItemNumber(ll_ChildObject3, "legth", 10)
			
			ljson_Option.AddItemObject(ll_ChildObject3, "lineStyle")
			
			ll_ChildObject4 = ljson_Option.AddItemObject(ll_ChildObject3)
			
			ljson_Option.AddItemNumber(ll_ChildObject3, "width", 1)
			
			ljson_Option.AddItemString(ll_ChildObject3, "type","'solid'")
			
			ljson_Option.AddItemObject(ll_ChildObject2, "itemStyle")
			
			ll_ChildObject3 = ljson_Option.AddItemObject(ll_ChildObject2)
			ljson_Option.AddItemString(ll_ChildObject3, "borderColor", "'#fff'")
			
			ljson_Option.AddItemNumber(ll_ChildObject3, "borderwidth", 1)
			
			ljson_Option.AddItemObject(ll_ChildObject2, "emphasis")
			
			ll_ChildObject3 = ljson_Option.AddItemObject(ll_ChildObject2)
			
			ljson_Option.AddItemObject(ll_ChildObject3, "label")
			
			ll_ChildObject4 = ljson_Option.AddItemObject(ll_ChildObject3)
			
			ljson_Option.AddItemNumber(ll_ChildObject4, "fontSize", 20)
			
			ll_ChildArray3 = ljson_Option.AddItemArray(ll_ChildObject2, "data")
			
			FOR ll_j = 1 TO adw_data.RowCount()
				ll_ChildObject3 = ljson_Option.AddItemObject(ll_ChildArray3)
				ljson_Option.AddItemNumber(ll_ChildObject3, "value", adw_data.GetItemNumber(ll_j, as_ValueCol ))
				ljson_Option.AddItemString(ll_ChildObject3, "name","'" + This.of_GetItemString(adw_data,ll_j, as_CategoryCol) + "'")
			NEXT
			
	End Choose
	
	ls_Option = ljson_Option.GetJsonString()

Catch(throwable ex)
	MessageBox( "Error", ex.getmessage() )
End Try

Return ls_Option
end function

public function string of_createoption (datawindow adw_series, datawindow adw_category);//
Return This.of_CreateOption( adw_series, adw_category, This.Of_GetStyle() )
end function

public function string of_createoption (datawindow adw_series, datawindow adw_category, string as_type);//
Long 		ll_SeriesCount, ll_I, ll_J, ll_Row, ll_Row2, ll_DataCount
Long 		ll_RootObject,ll_ChildObject, ll_ChildArray, ll_ChildArray2
Long 		ll_ChildObject2,ll_ChildObject3, ll_ChildArray3, ll_ChildObject4, ll_ChildObject5
String 	ls_SeriesName, ls_SeriesName2, ls_Category, ls_Option, ls_Type, ls_Colors
Double 	ldb_Value
JsonGenerator ljson_Option

ls_Type = Lower( as_Type )

adw_Series.SetSort( "#1" )
adw_Series.Sort( )

adw_Category.SetSort( "#1 A,#2 A" )
adw_Category.Sort( )

//title
//legend
//grid{left:130,right:'30%',height:'40%',bottom:110}
//tooltip
//toolbox
//dataZoom
//visualMap
//xAxis:[{type:'category',...},{}]
//yAxis:[{...},{...}]
//series:[{type:'line',...},{...}]

ljson_Option = Create JsonGenerator
ll_RootObject = ljson_Option.CreateJsonObject()

//Colors
ls_Colors = This.of_GetColors()
If Len ( ls_Colors ) > 0 Then
	ll_ChildArray = ljson_Option.AddItemArray(ll_RootObject, "color")
	ljson_Option.AddItemString(ll_ChildArray, ls_Colors )
End If

//Title
ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "title")
ljson_Option.AddItemString(ll_ChildObject, "text",  "'" + This.of_Gettitle() + "'")

Try
	
	Choose Case ls_Type
		Case "line", "bar", "scatter", "area"
			//legend
			ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "legend")
			ll_ChildArray = ljson_Option.AddItemArray(ll_ChildObject, "data")
			FOR ll_i = 1 TO adw_Series.RowCount()
				ls_SeriesName = adw_Series.GetItemString(ll_i, 1)
				ljson_Option.AddItemString(ll_ChildArray, "'" + ls_SeriesName + "'" )
			NEXT
			//grid
			ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "grid")
			ljson_Option.AddItemString(ll_ChildObject, "left","'3%'")
			ljson_Option.AddItemString(ll_ChildObject, "right","'4%'")
			ljson_Option.AddItemString(ll_ChildObject, "bottom","'3%'")
			ljson_Option.AddItemBoolean(ll_ChildObject,"containLabel",True)
			//ToolTip
			ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "tooltip")
			ljson_Option.AddItemString(ll_ChildObject, "trigger", "'axis'")
			//ToolBox
			IF This.of_GetToolBox() THEN
				ll_ChildObject2 = ljson_Option.AddItemObject(ll_RootObject, "toolbox")
				ll_ChildObject3 = ljson_Option.AddItemObject(ll_ChildObject2, "feature")
				ljson_Option.AddItemObject(ll_ChildObject3, "dataZoom")
				ljson_Option.AddItemObject(ll_ChildObject3, "saveAsImage")
				ljson_Option.AddItemObject(ll_ChildObject3, "dataView")
			END IF
			//dataZoom
			IF This.of_GetDataZoom() THEN
				ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "dataZoom")
				ljson_Option.AddItemString(ll_ChildObject, "orient", "'horizontal'")
			END IF
			//visualMap
			//xaxis
			ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "xAxis")
			ljson_Option.AddItemString(ll_ChildObject, "type","'category'")
			If ls_Type = "area" Then
				ljson_Option.AddItemBoolean(ll_ChildObject, "boundaryGap",false)
			End If
			ll_ChildArray = ljson_Option.AddItemArray(ll_ChildObject, "data")
			ls_SeriesName = adw_Series.GetItemString(1, 1)
			adw_Category.SetFilter("#1='"+ls_SeriesName +"'")
			adw_Category.Filter()
			adw_Category.SetSort( "#1 A,#2 A" )
			adw_Category.Sort()
			FOR ll_i = 1 TO adw_Category.RowCount()
				ljson_Option.AddItemString(ll_ChildArray, "'" + This.of_GetItemString(adw_Category,ll_i, 2) + "'")
			NEXT
			//yaxis
			ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "yAxis")
			ljson_Option.AddItemString(ll_ChildObject, "type","'value'")
			
			//series
			ll_ChildArray = ljson_Option.AddItemArray(ll_RootObject, "series"  )
			FOR ll_i = 1 TO adw_Series.RowCount()
				ls_SeriesName = adw_Series.GetItemString(ll_i,1)
				ll_ChildObject2 = ljson_Option.AddItemObject(ll_ChildArray)
				If ls_Type = "area" Then
					ljson_Option.AddItemString(ll_ChildObject2, "type","'line'")
					ljson_Option.AddItemString(ll_ChildObject2, "areaStyle","''")
				Else
					ljson_Option.AddItemString(ll_ChildObject2, "type","'" + ls_Type + "'")
				End If
				ljson_Option.AddItemString(ll_ChildObject2, "name","'" + ls_SeriesName + "'")
				ll_ChildArray2 = ljson_Option.AddItemArray(ll_ChildObject2, "data")
				adw_Category.SetFilter("#1='"+ls_SeriesName +"'")
				adw_Category.Filter()
				adw_Category.Sort()
				FOR ll_j = 1 TO adw_Category.RowCount()
					ljson_Option.AddItemNumber(ll_ChildArray2, adw_Category.GetItemNumber(ll_j, 3 ))
				NEXT
			NEXT
			
		Case "pie"
			ljson_Option.AddItemString(ll_ChildObject, "x", "'center'")
			//legend
			ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "legend")
			ljson_Option.AddItemString(ll_ChildObject, "orient", "'vertical'")
			ljson_Option.AddItemString(ll_ChildObject, "left", "'left'")
			ll_ChildArray = ljson_Option.AddItemArray(ll_ChildObject, "data")
			FOR ll_i = 1 TO adw_Series.RowCount()
				ls_SeriesName = adw_Series.GetItemString(ll_i, 1)
				ljson_Option.AddItemString(ll_ChildArray, "'" + ls_SeriesName + "'")
			NEXT
			//grid
			ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "grid")
			ljson_Option.AddItemString(ll_ChildObject, "left","'3%'")
			ljson_Option.AddItemString(ll_ChildObject, "right","'4%'")
			ljson_Option.AddItemString(ll_ChildObject, "bottom","'3%'")
			ljson_Option.AddItemBoolean(ll_ChildObject,"containLabel",True)
			//tooltip
			ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "tooltip")
			ljson_Option.AddItemString(ll_ChildObject, "trigger", "'item'")
			ljson_Option.AddItemString(ll_ChildObject, "formatter", "'{a} <br/>{b} : {c} ({d}%)'")
			//ToolBox
			IF  This.of_GetToolBox() THEN
				ll_ChildObject2 = ljson_Option.AddItemObject(ll_RootObject, "toolbox")
				ll_ChildObject3 = ljson_Option.AddItemObject(ll_ChildObject2, "feature")
				ljson_Option.AddItemObject(ll_ChildObject3, "saveAsImage")
				ljson_Option.AddItemObject(ll_ChildObject3, "dataView")
			END IF
			//series
			ll_ChildArray = ljson_Option.AddItemArray(ll_RootObject, "series")
			FOR ll_i = 1 TO adw_Series.RowCount()
				ls_SeriesName = adw_Series.GetItemString(ll_i,1)
				ll_ChildObject2 = ljson_Option.AddItemObject(ll_ChildArray)
				ljson_Option.AddItemString(ll_ChildObject2, "type","'" + ls_Type + "'")
				ljson_Option.AddItemString(ll_ChildObject2, "name","'" + ls_SeriesName + "'")			
				ljson_Option.AddItemString(ll_ChildObject2, "radius","['" + String (((ll_i - 1) / adw_Series.RowCount() * 100) - 10 ) + "%','" +  String ( ((ll_i) / adw_Series.RowCount() * 100) - 10 ) + "%']")
				ljson_Option.AddItemString(ll_ChildObject2, "center","['50%','50%']")
				If Len ( This.of_GetRoseType()) > 0 Then //roseType
					ljson_Option.AddItemString(ll_ChildObject2, "roseType","'" + This.of_GetRoseType() + "'")
				End If
				ll_ChildArray2 = ljson_Option.AddItemArray(ll_ChildObject2, "data")
				adw_Category.SetFilter("#1='"+ ls_SeriesName+"'")
				adw_Category.Filter()
				adw_Category.Sort()
				FOR ll_j = 1 TO adw_Category.RowCount()
					ll_ChildObject3 = ljson_Option.AddItemObject(ll_ChildArray2)
					ljson_Option.AddItemString(ll_ChildObject3, "name", "'" + This.of_GetItemString( adw_Category,ll_j, 2) + "'")
					ljson_Option.AddItemNumber(ll_ChildObject3, "value",adw_Category.GetItemNumber(ll_j, 3))
				NEXT
				ll_ChildObject3 = ljson_Option.AddItemObject(ll_ChildObject2,"emphasis")
				ll_ChildObject4 = ljson_Option.AddItemObject(ll_ChildObject3,"itemStyle")
				ll_ChildObject5 = ljson_Option.AddItemObject(ll_ChildObject4,"emphasis")
				ljson_Option.AddItemString(ll_ChildObject5, "shadowBlur","10")
				ljson_Option.AddItemString(ll_ChildObject5, "shadowOffsetX","0")
				ljson_Option.AddItemString(ll_ChildObject5, "shadowColor","'rgba(0, 0, 0, 0.5)'")
			
			NEXT
			
		Case "funnel"
			ljson_Option.AddItemString(ll_ChildObject, "left", "'center'")
			//legend
			ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "legend")
			ljson_Option.AddItemString(ll_ChildObject, "orient", "'vertical'")
			ljson_Option.AddItemString(ll_ChildObject, "left", "'left'")
			ll_ChildArray = ljson_Option.AddItemArray(ll_ChildObject, "data")
			FOR ll_i = 1 TO adw_Series.RowCount()
				ls_SeriesName = adw_Series.GetItemString(ll_i, 1)
				ljson_Option.AddItemString(ll_ChildArray, "'" + ls_SeriesName + "'" )
			NEXT
			//tooltip
			ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "tooltip")
			ljson_Option.AddItemString(ll_ChildObject, "trigger", "'item'")
			ljson_Option.AddItemString(ll_ChildObject, "formatter", "'{a} <br/>{b} : {c} ({d}%)'")
			
			//ToolBox
			IF  This.of_GetToolBox() THEN
				ll_ChildObject2 = ljson_Option.AddItemObject(ll_RootObject, "toolbox")
				ll_ChildObject3 = ljson_Option.AddItemObject(ll_ChildObject2, "feature")
				ljson_Option.AddItemObject(ll_ChildObject3, "saveAsImage")
				ljson_Option.AddItemObject(ll_ChildObject3, "dataView")
			END IF
			
			//grid
			ll_ChildObject = ljson_Option.AddItemObject(ll_RootObject, "grid")
			ljson_Option.AddItemString(ll_ChildObject, "left","'3%'")
			ljson_Option.AddItemString(ll_ChildObject, "right","'4%'")
			ljson_Option.AddItemString(ll_ChildObject, "bottom","'3%'")
			ljson_Option.AddItemBoolean(ll_ChildObject,"containLabel",True)
			
			//series
			ll_ChildArray = ljson_Option.AddItemArray(ll_RootObject, "series")
			FOR ll_i = 1 TO adw_Series.RowCount()
				ls_SeriesName = adw_Series.GetItemString(ll_i,1)
				ll_ChildObject2 = ljson_Option.AddItemObject(ll_ChildArray)
				ljson_Option.AddItemString(ll_ChildObject2, "type","'" + ls_Type + "'")
				ljson_Option.AddItemString(ll_ChildObject2, "name","'" + ls_SeriesName + "'")			
				ljson_Option.AddItemString(ll_ChildObject2, "radius","['" + String (((ll_i - 1) / adw_Series.RowCount() * 100) - 10 ) + "%','" +  String ( ((ll_i) / adw_Series.RowCount() * 100) - 10 ) + "%']")
				ljson_Option.AddItemString(ll_ChildObject2, "center","['50%','50%']")
				If Len ( This.of_GetRoseType()) > 0 Then //roseType
					ljson_Option.AddItemString(ll_ChildObject2, "roseType","'" + This.of_GetRoseType() + "'")
				End If
				ll_ChildArray2 = ljson_Option.AddItemArray(ll_ChildObject2, "data")
				adw_Category.SetFilter("#1='"+ ls_SeriesName+"'")
				adw_Category.Filter()
				adw_Category.Sort()
				FOR ll_j = 1 TO adw_Category.RowCount()
					ll_ChildObject3 = ljson_Option.AddItemObject(ll_ChildArray2)
					ljson_Option.AddItemString(ll_ChildObject3, "name", "'" + This.of_GetItemString( adw_Category,ll_j, 2) + "'")
					ljson_Option.AddItemNumber(ll_ChildObject3, "value",adw_Category.GetItemNumber(ll_j, 3))
				NEXT
						
			NEXT
			
	End Choose
	
	ls_Option = ljson_Option.GetJsonString()

Catch(throwable ex)
	MessageBox( "Error", ex.getmessage() )
End Try

Return ls_Option
end function

public function string of_getcolors ();//Colors
Return this.is_Colors
end function

public subroutine of_setcolors (string as_arg);//SetColors
this.is_Colors = as_arg
end subroutine

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


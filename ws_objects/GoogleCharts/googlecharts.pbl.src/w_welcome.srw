$PBExportHeader$w_welcome.srw
forward
global type w_welcome from w_chart_base
end type
type st_3 from statictext within w_welcome
end type
type mle_2 from multilineedit within w_welcome
end type
type st_2 from statictext within w_welcome
end type
type mle_1 from multilineedit within w_welcome
end type
type st_1 from statictext within w_welcome
end type
type cb_3 from commandbutton within w_welcome
end type
end forward

global type w_welcome from w_chart_base
string tag = "welcome"
integer width = 3781
integer height = 2088
boolean border = false
st_3 st_3
mle_2 mle_2
st_2 st_2
mle_1 mle_1
st_1 st_1
cb_3 cb_3
end type
global w_welcome w_welcome

type variables
Boolean ib_flag = True

end variables

on w_welcome.create
int iCurrent
call super::create
this.st_3=create st_3
this.mle_2=create mle_2
this.st_2=create st_2
this.mle_1=create mle_1
this.st_1=create st_1
this.cb_3=create cb_3
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_3
this.Control[iCurrent+2]=this.mle_2
this.Control[iCurrent+3]=this.st_2
this.Control[iCurrent+4]=this.mle_1
this.Control[iCurrent+5]=this.st_1
this.Control[iCurrent+6]=this.cb_3
end on

on w_welcome.destroy
call super::destroy
destroy(this.st_3)
destroy(this.mle_2)
destroy(this.st_2)
destroy(this.mle_1)
destroy(this.st_1)
destroy(this.cb_3)
end on

event open;call super::open;
mle_1.Text = "<body>~r~n" +&
		"    <!--Div that will hold the chart-->~r~n" +&
		"    <div id=~"main~" style=~"width: 800px;height:500px;~"></div>~r~n" +&
		"</body>~r~n"
		
mle_2.Text = "<!DOCTYPE html>~r~n" +&
		"<html>~r~n" +&
		"<head>~r~n" +&
		"    <meta charset=~"utf-8~">~r~n" +&
		"    <title>Example</title>~r~n" +&
		"    <!-- Load the AJAX API-->~r~n" +&
		"    <script charset=~"UTF-8~" src=~"./dist/loader.js~"></script>~r~n" +&
		"    <!--Load the Visualization API and the corechart package.-->	~r~n" +&
		"    <link id=~"load-css-0~" rel=~"stylesheet~" type=~"text/css~" href=~"./dist/tooltip.css~">~r~n" +&
		"    <link id=~"load-css-1~" rel=~"stylesheet~" type=~"text/css~" href=~"./dist/util.css~">~r~n" +&
		"    <script charset=~"UTF-8~" src=~"./dist/jsapi_compiled_default_module.js~"></script>~r~n" +&
		"    <script charset=~"UTF-8~" src=~"./dist/jsapi_compiled_graphics_module.js~"></script>~r~n" +&
		"    <script charset=~"UTF-8~" src=~"./dist/jsapi_compiled_ui_module.js~"></script>~r~n" +&
		"    <script charset=~"UTF-8~" src=~"./dist/jsapi_compiled_corechart_module.js~"></script>	~r~n" +&
		"</head>~r~n" +&
		"<body>~r~n" +&
		"    <!--Div that will hold the pie chart-->~r~n" +&
		"    <div id=~"main~" style=~"width: 800;height:500px;~"></div>	~r~n" +&
		"    <script type=~"text/javascript~">	~r~n" +&
		"        // Create the data table.~r~n" +&
		"        var data = new google.visualization.DataTable();~r~n" +&
		"        data.addColumn(~'string~', ~'Topping~');~r~n" +&
		"        data.addColumn(~'number~', ~'Slices~');~r~n" +&
		"        data.addRows([~r~n" +&
		"          [~'Mushrooms~', 3],~r~n" +&
		"          [~'Onions~', 1],~r~n" +&
		"          [~'Olives~', 1],~r~n" +&
		"          [~'Zucchini~', 1],		~r~n" +&
		"          [~'Pepperoni~', 2]~r~n" +&
		"        ]);~r~n" +&
		"        // Set chart options~r~n" +&
		"        var options = {~'title~':~'How Much Pizza I Ate Last Night~',~r~n" +&
		"                       ~'width~':400,~r~n" +&
		"                       ~'height~':300};~r~n" +&
		"        // Instantiate and draw our chart, passing in some options.~r~n" +&
		"        var myChart = new google.visualization.PieChart(document.getElementById(~'main~'));~r~n" +&
		"        myChart.draw(data, options);~r~n" +&
		"		//redraw graph when window resize is completed~r~n" +&
		"		function resizeEnd(){~r~n" +&
		"			options.width=window.innerWidth-20;~r~n" +&
		"			options.height=window.innerHeight-20;~r~n" +&
		"			myChart.draw(data,options);~r~n" +&
		"		}~r~n" +&
		"		window.addEventListener(~"resize~",resizeEnd,false);~r~n" +&
		"    </script>~r~n" +&
		"</body>~r~n" +&
		"</html>~r~n"
end event

type wb_1 from w_chart_base`wb_1 within w_welcome
integer x = 1810
integer y = 760
integer width = 1957
integer height = 1180
string defaulturl = "file:///example.html"
end type

event wb_1::navigationprogressindex;call super::navigationprogressindex;string ls_JS

IF progressindex =100 THEN 
	IF ib_flag THEN
		ib_flag = False
		
	END IF
END IF
end event

type st_3 from statictext within w_welcome
integer x = 46
integer y = 664
integer width = 4119
integer height = 80
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
long textcolor = 128
long backcolor = 67108864
string text = "Then, we can initialize an instance using google.visualization.PieChart, and create a bar chart with setOption. The complete code and the generated chart are shown below."
boolean focusrectangle = false
end type

type mle_2 from multilineedit within w_welcome
integer x = 41
integer y = 760
integer width = 1728
integer height = 1180
integer taborder = 10
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
boolean italic = true
long textcolor = 33554432
long backcolor = 134217731
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type st_2 from statictext within w_welcome
integer x = 46
integer y = 200
integer width = 2542
integer height = 80
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
long textcolor = 128
long backcolor = 67108864
string text = "Before drawing a chart, we need to prepare a DOM container with suitable width and height for the chart."
boolean focusrectangle = false
end type

type mle_1 from multilineedit within w_welcome
integer x = 41
integer y = 296
integer width = 1728
integer height = 312
integer taborder = 10
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
boolean italic = true
long textcolor = 33554432
long backcolor = 134217731
borderstyle borderstyle = stylelowered!
end type

type st_1 from statictext within w_welcome
integer x = 41
integer y = 48
integer width = 1426
integer height = 104
boolean bringtotop = true
integer textsize = -14
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
long textcolor = 33554432
long backcolor = 67108864
string text = "Draw a simple chart via WebBrowser"
boolean focusrectangle = false
end type

type cb_3 from commandbutton within w_welcome
integer x = 3122
integer y = 56
integer width = 494
integer height = 112
integer taborder = 20
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
string text = "Quickstart Guide"
end type

event clicked;open(w_example)
end event


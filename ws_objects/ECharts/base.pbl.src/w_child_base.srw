$PBExportHeader$w_child_base.srw
forward
global type w_child_base from window
end type
end forward

global type w_child_base from window
integer width = 3218
integer height = 1760
windowtype windowtype = child!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
event ue_setflag ( )
end type
global w_child_base w_child_base

type variables
eon_appeon_resize  ieon_resize
end variables

event ue_setflag();//====================================================================
// 
//   event name : ue_setflag
//
//   Description:
//				   "1111" :"X","Y","Width","Height"
//                   X/Y:0 - Keeps unchanged; 1 - Changes proportionally; 2 - Moves to right horizontally.
//                   width: 0 - Keeps unchanged; 1 - Changes proportionally; 2 - Extends to right horizontally; 
//                             3 - Extends to left horizontally; 4 - Extends to right edge; 5 - Extends to left edge.
//                  Height: 0 - Keeps unchanged; 1 - Changes proportionally; 2 - Extends down vertically; 
//					         3 - Extends up vertically; 4 - Extends to the bottom; 5 - Extends to the top.
//
//   Argument：(None)
//				   
//
//   Return ：  (None)
//
//   Modify Date：2018-01-30
//====================================================================

end event

on w_child_base.create
end on

on w_child_base.destroy
end on

event activate;parentwindow().dynamic post event ue_refresh_visible("") 
end event

event resize;//
if not isvalid(ieon_resize) then
	return
end if
//
ieon_resize.of_resize(this,newwidth,newheight,true)
end event

event open;ieon_resize = create eon_appeon_resize

ieon_resize.of_init(this,true)

ieon_resize.of_fontresize(true,3)
ieon_resize.of_zoom( true, 3)

event ue_setflag()
end event

event close;//
destroy ieon_resize
end event


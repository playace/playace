//严重声名: 此代码由 AJan 个人修改设计,未经 AJan 同意,严禁抄袭,下载,盗用!!!
//  严禁抄袭,下载,盗用!!!
//否则后果自负!!!
//需要者请联系作者(AJan) 
//Author: AJan
//E-mail: ajan-vip@163.com
//QQ: 89173688
//Tel: 13554401520
//Web: http://AJan.skserver.com
//Add: 湖北省武汉市青山区建设一路 武汉科技大学(理学院-计算机信息管理) 人和公寓3-4 陈健
//
//
//
// FlashPlayer2代码开始
function FlashPlayer2( arg )
{
var parm = []
var _default_version = "8,0,24,0";
var _default_quality = "high";
var _default_align = "middle";
var _default_menu = "false";

for(i = 0; i < arguments.length; i ++)
{
parm[i] = arguments[i].split(' ').join('').split('=')
for (var j = parm[i].length-1; j > 1; j --){
parm[i][j-1]+="="+parm[i].pop();
}
switch (parm[i][0])
{
case '_version' : var _version = parm[i][1] ; break ; 
case '_swf' : var _swf = parm[i][1] ; break ; 
case '_base' : var _base = parm[i][1] ; break ; 
case '_quality' : var _quality = parm[i][1] ; break ; 
case '_loop' : var _loop = parm[i][1] ; break ; 
case '_bgcolor' : var _bgcolor = parm[i][1] ; break ; 
case '_wmode' : var _wmode = parm[i][1] ; break ; 
case '_play' : var _play = parm[i][1] ; break ; 
case '_menu' : var _menu = parm[i][1] ; break ; 
case '_scale' : var _scale = parm[i][1] ; break ; 
case '_salign' : var _salign = parm[i][1] ; break ; 
case '_height' : var _height = parm[i][1] ; break ; 
case '_width' : var _width = parm[i][1] ; break ; 
case '_hspace' : var _hspace = parm[i][1] ; break ; 
case '_vspace' : var _vspace = parm[i][1] ; break ; 
case '_align' : var _align = parm[i][1] ; break ; 
case '_class' : var _class = parm[i][1] ; break ; 
case '_id' : var _id = parm[i][1] ; break ; 
case '_name' : var _name = parm[i][1] ; break ; 
case '_style' : var _style = parm[i][1] ; break ; 
case '_declare' : var _declare = parm[i][1] ; break ; 
case '_flashvars' : var _flashvars = parm[i][1] ; break ; 
default :;
}
}
var thtml = ""
thtml += "<object classid='clsid:d27cdb6e-ae6d-11cf-96b8-444553540000' codebase='http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=" + ((_version)?_version:_default_version) + "'"
if(_width) thtml += " width='" + _width + "'"
if(_height) thtml += " height='" + _height + "'"
if(_hspace) thtml += " hspace='" + _hspace + "'"
if(_vspace) thtml += " vspace='" + _vspace + "'"
if(_align) thtml += " align='" + _align + "'"
else thtml += " align='" + _default_align + "'"
if(_class) thtml += " class='" + _class + "'"
if(_id) thtml += " id='" + _id + "'"
if(_name) thtml += " name='" + _name + "'"
if(_style) thtml += " style='" + _style + "'"
if(_declare) thtml += " " + _declare
thtml += ">"
if(_swf) thtml += "<param name='movie' value='" + _swf + "'>"
if(_quality) thtml += "<param name='quality' value='" + _quality + "'>" 
else thtml += "<param name='quality' value ='" + _default_quality + "'>"
if(_loop) thtml += "<param name='loop' value='" + _loop + "'>"
if(_bgcolor) thtml += "<param name='bgcolor' value='" + _bgcolor + "'>"
if(_play) thtml += "<param name='play' value='" + _play + "'>"
if(_menu) thtml += "<param name='menu' value='" + _menu + "'>"
else thtml += "<param name='menu' value='" + _default_menu + "'>"
if(_scale) thtml += "<param name='scale' value='" + _scale + "'>"
if(_salign) thtml += "<param name='salign' value='" + _salign + "'>"
if(_wmode) thtml += "<param name='wmode' value='" + _wmode + "'>"
if(_base) thtml += "<param name='base' value='" + _base + "'>"
if(_flashvars) thtml += "<param name='flashvars' value='" + _flashvars + "'>"
thtml += "<embed pluginspage='http://www.macromedia.com/go/getflashplayer'"
if(_width) thtml += " width='" + _width + "'"
if(_height) thtml += " height='" + _height + "'"
if(_hspace) thtml += " hspace='" + _hspace + "'"
if(_vspace) thtml += " vspace='" + _vspace + "'"
if(_align) thtml += " align='" + _align + "'"
else thtml += " align='" + _default_align + "'"
if(_class) thtml += " class='" + _class + "'"
if(_id) thtml += " id='" + _id + "'"
if(_name) thtml += " name='" + _name + "'"
if(_style) thtml += " style='" + _style + "'"
thtml += " type='application/x-shockwave-flash'"
if(_declare) thtml += " " + _declare 
if(_swf) thtml += " src='" + _swf + "'"
if(_quality) thtml += " quality='" + _quality + "'"
else thtml += " quality='" + _default_quality + "'"
if(_loop) thtml += " loop='" + _loop + "'"
if(_bgcolor) thtml += " bgcolor='" + _bgcolor + "'"
if(_play) thtml += " play='" + _play + "'"
if(_menu) thtml += " menu='" + _menu + "'"
else thtml += " menu='" + _default_menu + "'"
if(_scale) thtml += " scale='" + _scale + "'"
if(_salign) thtml += " salign='" + _salign + "'"
if(_wmode) thtml += " wmode='" + _wmode + "'"
if(_base) thtml += " base='" + _base + "'"
if(_flashvars) thtml += " flashvars='" + _flashvars + "'"
thtml += "></embed>"
thtml += "</object>"
document.write(thtml)
}

//代码结束

// FlashPlayer代码开始
function FlashPlayer( arg )
{
var parm = []
var _default_version = "8,0,24,0";
var _default_quality = "high";
var _default_align = "middle";
var _default_menu = "false";

for(i = 0; i < arguments.length; i ++)
{
parm[i] = arguments[i].split(' ').join('').split('=')
for (var j = parm[i].length-1; j > 1; j --){
parm[i][j-1]+="="+parm[i].pop();
}
switch (parm[i][0])
{
case '_version' : var _version = parm[i][1] ; break ; 
case '_swf' : var _swf = parm[i][1] ; break ; 
case '_base' : var _base = parm[i][1] ; break ; 
case '_quality' : var _quality = parm[i][1] ; break ; 
case '_loop' : var _loop = parm[i][1] ; break ; 
case '_bgcolor' : var _bgcolor = parm[i][1] ; break ; 
case '_wmode' : var _wmode = parm[i][1] ; break ; 
case '_play' : var _play = parm[i][1] ; break ; 
case '_menu' : var _menu = parm[i][1] ; break ; 
case '_scale' : var _scale = parm[i][1] ; break ; 
case '_salign' : var _salign = parm[i][1] ; break ; 
case '_height' : var _height = parm[i][1] ; break ; 
case '_width' : var _width = parm[i][1] ; break ; 
case '_hspace' : var _hspace = parm[i][1] ; break ; 
case '_vspace' : var _vspace = parm[i][1] ; break ; 
case '_align' : var _align = parm[i][1] ; break ; 
case '_class' : var _class = parm[i][1] ; break ; 
case '_id' : var _id = parm[i][1] ; break ; 
case '_name' : var _name = parm[i][1] ; break ; 
case '_style' : var _style = parm[i][1] ; break ; 
case '_declare' : var _declare = parm[i][1] ; break ; 
case '_flashvars' : var _flashvars = parm[i][1] ; break ; 
default :;
}
}
var thtml = ""
thtml += "<object classid='clsid:d27cdb6e-ae6d-11cf-96b8-444553540000' codebase='http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0'"
if(_width) thtml += " width='" + _width + "'"
if(_height) thtml += " height='" + _height + "'"
if(_hspace) thtml += " hspace='" + _hspace + "'"
if(_vspace) thtml += " vspace='" + _vspace + "'"
if(_align) thtml += " align='" + _align + "'"
else thtml += " align='" + _default_align + "'"
if(_class) thtml += " class='" + _class + "'"
if(_id) thtml += " id='" + _id + "'"
if(_name) thtml += " name='" + _name + "'"
if(_style) thtml += " style='" + _style + "'"
if(_declare) thtml += " " + _declare
thtml += ">"
if(_swf) thtml += "<param name='movie' value='" + _swf + "'>"
if(_quality) thtml += "<param name='quality' value='" + _quality + "'>" 
else thtml += "<param name='quality' value ='" + _default_quality + "'>"
if(_loop) thtml += "<param name='loop' value='" + _loop + "'>"
if(_bgcolor) thtml += "<param name='bgcolor' value='" + _bgcolor + "'>"
if(_play) thtml += "<param name='play' value='" + _play + "'>"
if(_menu) thtml += "<param name='menu' value='" + _menu + "'>"
else thtml += "<param name='menu' value='" + _default_menu + "'>"
if(_scale) thtml += "<param name='scale' value='" + _scale + "'>"
if(_salign) thtml += "<param name='salign' value='" + _salign + "'>"
if(_wmode) thtml += "<param name='wmode' value='" + _wmode + "'>"
if(_base) thtml += "<param name='base' value='" + _base + "'>"
if(_flashvars) thtml += "<param name='flashvars' value='" + _flashvars + "'>"
thtml += "<embed pluginspage='http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash'"
if(_width) thtml += " width='" + _width + "'"
if(_height) thtml += " height='" + _height + "'"
if(_hspace) thtml += " hspace='" + _hspace + "'"
if(_vspace) thtml += " vspace='" + _vspace + "'"
if(_align) thtml += " align='" + _align + "'"
else thtml += " align='" + _default_align + "'"
if(_class) thtml += " class='" + _class + "'"
if(_id) thtml += " id='" + _id + "'"
if(_name) thtml += " name='" + _name + "'"
if(_style) thtml += " style='" + _style + "'"
thtml += " type='application/x-shockwave-flash'"
if(_declare) thtml += " " + _declare 
if(_swf) thtml += " src='" + _swf + "'"
if(_quality) thtml += " quality='" + _quality + "'"
else thtml += " quality='" + _default_quality + "'"
if(_loop) thtml += " loop='" + _loop + "'"
if(_bgcolor) thtml += " bgcolor='" + _bgcolor + "'"
if(_play) thtml += " play='" + _play + "'"
if(_menu) thtml += " menu='" + _menu + "'"
else thtml += " menu='" + _default_menu + "'"
if(_scale) thtml += " scale='" + _scale + "'"
if(_salign) thtml += " salign='" + _salign + "'"
if(_wmode) thtml += " wmode='" + _wmode + "'"
if(_base) thtml += " base='" + _base + "'"
if(_flashvars) thtml += " flashvars='" + _flashvars + "'"
thtml += "></embed>"
thtml += "</object>"
document.write(thtml)
}

//代码结束
// WinPlayer代码开始
function WinPlayer( arg )
{
var parm = []


for(i = 0; i < arguments.length; i ++)
{
parm[i] = arguments[i].split(' ').join('').split('=')
for (var j = parm[i].length-1; j > 1; j --){
parm[i][j-1]+="="+parm[i].pop();
}
switch (parm[i][0])
{
case '_url' : var _url = parm[i][1] ; break ; 
case '_playcount' : var _playcount = parm[i][1] ; break ; 
case '_autostart' : var _autostart = parm[i][1] ; break ; 
case '_volume' : var _volume = parm[i][1] ; break ; 
case '_showtracker' : var _showtracker = parm[i][1] ; break ; 
case '_height' : var _height = parm[i][1] ; break ; 
case '_width' : var _width = parm[i][1] ; break ; 
case '_EnableContextMenu' : var _EnableContextMenu =parm[i][1] ; break ;
case '_fullScreen' : var _fullScreen = parm[i][1] ; break ; 
default :;
}
}
var thtml = ""
thtml += "<object id='player' classid='CLSID:6BF52A52-394A-11d3-B153-00C04F79FAA6' type='application/x-oleobject'"
if(_width) thtml += " width='" + _width + "'"
if(_height) thtml += " height='" + _height + "'"
thtml += ">"
if(_url) thtml += "<param name='url' value='" + _url + "'>"
if(_autostart) thtml += "<param name='autostart' value='" + _autostart + "'>"
if(_playcount) thtml += "<param name='playcount' value='" + _playcount + "'>"
if(_volume) thtml += "<param name='volume' value='" + _volume + "'>"
if(_fullScreen) thtml += "<param name='fullScreen' value='" + _fullScreen + "'>"
if(_showtracker) thtml += "<param name='showtracker' value='" + _showtracker + "'>"
if(_EnableContextMenu) thtml += "<param name='EnableContextMenu' value='" + _EnableContextMenu + "'>"
thtml += "<embed pluginspage='http://www.microsoft.com/windows/mediaplayer/download/default.asp'"
if(_width) thtml += " width='" + _width + "'"
if(_height) thtml += " height='" + _height + "'"
if(_EnableContextMenu) thtml += " EnableContextMenu='" + _EnableContextMenu + "'"
thtml += " type='application/x-mplayer2'"
if(_url) thtml += " src='" + _url + "'"
thtml += "></embed>"
thtml += "</object>"
document.write(thtml)
}

//代码结束

// RealVideoPlayer代码开始
function RealVideoPlayer( arg )
{
var parm = []


for(i = 0; i < arguments.length; i ++)
{
parm[i] = arguments[i].split(' ').join('').split('=')
for (var j = parm[i].length-1; j > 1; j --){
parm[i][j-1]+="="+parm[i].pop();
}
switch (parm[i][0])
{
case '_SRC' : var _SRC = parm[i][1] ; break ; 
case '_CONTROLS' : var _CONTROLS = parm[i][1] ; break ; 
case '_AUTOSTART' : var _AUTOSTART = parm[i][1] ; break ; 
case '_CONSOLE' : var _CONSOLE = parm[i][1] ; break ; 
case '_NUMLOOP' : var _NUMLOOP = parm[i][1] ; break ;
case '_ExtentX' : var _ExtentX = parm[i][1] ; break ;
case '_ExtentY' : var _ExtentY = parm[i][1] ; break ;
case '_height' : var _height = parm[i][1] ; break ; 
case '_width' : var _width = parm[i][1] ; break ; 
case '_height2' : var _height2 = parm[i][1] ; break ; 
default :;
}
}
var thtml = ""
thtml += "<object id='video1' classid='clsid:CFCDAA03-8BE4-11cf-B84B-0020AFBBCCFA'"
if(_width) thtml += " width='" + _width + "'"
if(_height) thtml += " height='" + _height + "'"
thtml += ">"
if(_SRC) thtml += "<param name='SRC' value='" + _SRC + "'>"
if(_NUMLOOP) thtml += "<param name='NUMLOOP' value='" + _NUMLOOP + "'>"
if(_CONTROLS) thtml += "<param name='CONTROLS' value='" + _CONTROLS + "'>"
if(_CONSOLE) thtml += "<param name='CONSOLE' value='" + _CONSOLE + "'>"
if(_AUTOSTART) thtml += "<param name='AUTOSTART' value='" + _AUTOSTART + "'>"
if(_ExtentX) thtml += "<param name='_ExtentX' value='" + _ExtentX + "'>"
if(_ExtentY) thtml += "<param name='_ExtentY' value='" + _ExtentY + "'>"
thtml += "</object><br>"
thtml += "<embed  "
if(_width) thtml += " width='" + _width + "'"
if(_height2) thtml += " height='" + _height2 + "'"
if(_CONSOLE) thtml += " CONSOLE='" + _CONSOLE + "'"
if(_AUTOSTART) thtml += " AUTOSTART='" + _AUTOSTART + "'"
thtml += " type='audio/x-pn-realaudio-plugin'"
thtml += "></embed>"
document.write(thtml)
}

//代码结束

// RealAudioPlayer代码开始
function RealAudioPlayer( arg )
{
var parm = []


for(i = 0; i < arguments.length; i ++)
{
parm[i] = arguments[i].split(' ').join('').split('=')
for (var j = parm[i].length-1; j > 1; j --){
parm[i][j-1]+="="+parm[i].pop();
}
switch (parm[i][0])
{
case '_SRC' : var _SRC = parm[i][1] ; break ; 
case '_AUTOSTART' : var _AUTOSTART = parm[i][1] ; break ; 
case '_CONSOLE' : var _CONSOLE = parm[i][1] ; break ; 
case '_NUMLOOP' : var _NUMLOOP = parm[i][1] ; break ;
case '_width' : var _width = parm[i][1] ; break ; 
case '_height' : var _height = parm[i][1] ; break ; 
default :;
}
}
var thtml = ""
thtml += "<embed  "
if(_SRC) thtml += " SRC='" + _SRC + "'"
if(_width) thtml += " width='" + _width + "'"
if(_height) thtml += " height='" + _height + "'"
if(_NUMLOOP) thtml += " NUMLOOP='" + _NUMLOOP + "'"
if(_CONSOLE) thtml += " CONSOLE='" + _CONSOLE + "'"
if(_AUTOSTART) thtml += " AUTOSTART='" + _AUTOSTART + "'"
thtml += " type='audio/x-pn-realaudio-plugin'"
thtml += "></embed>"
document.write(thtml)
}

//代码结束
//
//
//严重声名: 此代码由 AJan 个人修改设计,未经 AJan 同意,严禁抄袭,下载,盗用!!!
//  严禁抄袭,下载,盗用!!!
//否则后果自负!!!
//需要者请联系作者(AJan) 
//Author: AJan
//E-mail: ajan-vip@163.com
//QQ: 89173688
//Tel: 13554401520
//Web: http://AJan.skserver.com
//Add: 湖北省武汉市青山区建设一路 武汉科技大学(理学院-计算机信息管理) 人和公寓3-4 陈健
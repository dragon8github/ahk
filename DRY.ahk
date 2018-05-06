#InstallKeybdHook
#Persistent
Hotstring("EndChars", "`n")  ; 设置为回车键作为终止符（`t为回车键）

; ____________________ 全局变量 ___________________________
Menu, MyMenu, add

; ALT + R 重启脚本
!r::
    Send, ^s
    reload
Return

!c::   
    SendInput, ^a^c
    Sleep, 150
    Menu, MyMenu, DeleteAll
    MyVar := clipboard
    clipboard := ""
    RegExMatch(MyVar, "i)(\b\w+\b)(?CCallout)") 
    Callout(m) {
        if (StrLen(m) >= 3 and StrLen(m) < 20) {
            clipboard .= m . ","
        }
        return 1
    }
    MyVar := clipboard
    Sort MyVar, U D,
    ; D默认使用逗号作为分隔符，U移除重复项
    Sort MyVar, U D,
    ColorArray := StrSplit(MyVar, ",")
    Loop % ColorArray.MaxIndex() {
        this_color := ColorArray[a_index]
        Menu, MyMenu, Add, %this_color%, MenuHandler
    }
    TrayTip, 生成成功, （づ￣3￣）づ╭❤～ 按下 Ctrl + x 可以启动, 20, 17
    MenuHandler:
        SendRaw, %A_ThisMenuItem%
    Return
return

!x::
     Menu, MyMenu, Show
Return

::git::
    SendInput,  rm -rf *.bak && git add . && git commit -m '' && git push -u origin master{LEFT 30}
Return

; 关闭输入法
; 使用示例：SwitchIME(0x08040804)
; 使用示例：SwitchIME(0x04090409)
SwitchIME(dwLayout){
    HKL:=DllCall("LoadKeyboardLayout", Str, dwLayout, UInt, 1)
    ControlGetFocus,ctl,A
    SendMessage,0x50,0,HKL,%ctl%,A
}

!a::
    MouseGetPos, MouseX, MouseY
    PixelGetColor, color, %MouseX%, %MouseY%
    Clipboard := "#" . SubStr(color, 3)
    TrayTip, my title, current color is `n %Clipboard%, 20, 17
return

>^b::
    RUN, https://www.baidu.com/
    RUN, http://www.cnblogs.com/cylee
Return

^g::
    RUN, https://www.github.com/
    RUN, https://legacy.gitbook.com/
Return

+d::
    InputBox, OutputVar, title, enter your download url?
    if (OutputVar != "") {
        text := ajax(OutputVar)
        RUN, notepad
        WinWaitActive, 无标题 - 记事本, , 2
        if ErrorLevel {
            MsgBox, WinWait timed out.
        }
        else {
            ; 这里需要聚焦一下
            Winactivate
            code(text)
        }
    }
return

; 快速搜索音乐
>^m::
    InputBox, OutputVar, title, enter a music name?
    if (OutputVar != "") 
    {
        RUN, http://music.163.com/#/search/m/?s=%OutputVar%
        RUN, https://y.qq.com/portal/search.html#w=%OutputVar%
        RUN, https://www.xiami.com/search?key=%OutputVar%
        RUN, http://www.kugou.com/yy/html/search.html#searchType=song&searchKeyWord=%OutputVar%
    }
return

!s::
    Clipboard = 
    Send, ^c
    ClipWait, 2
    RUN, https://www.zhihu.com/search?type=content&q=%Clipboard%
    RUN, https://segmentfault.com/search?q=%Clipboard%
    RUN, https://www.google.com/search?q=%Clipboard%
    RUN, https://stackoverflow.com/search?q=%Clipboard%
    RUN, https://www.baidu.com/s?wd=%Clipboard%
return

!q::
    ; 第一步，将当前剪切板的内容保存起来，然后清空
    tmp := Clipboard
    Clipboard =
    ; 第二步，复制当前选中内容
    SendInput, ^c
    ClipWait, 2
    if (StrLen(Clipboard) >= 10) {
        MsgBox, 请不要把此功能当做翻译机
        return 
    }
    ; 有道翻译API（暂废弃）
    ; Var := ajax("http://119.23.22.136:6634/index.php?text=" . Clipboard . "&type=_")
    ; 百度翻译API
    Var := ajax("http://119.23.22.136:6634/baidu_transapi.php?text=" . Clipboard . "&type=_")
    ; 切换到英文
    SwitchIME(0x08040804)
    ; 黏贴结果
    SendInput, % Var
    ; 这里考虑剪切板要tmp的数据，还是翻译的数据。暂时保存翻译结果吧
    Clipboard := Var
Return

^!q::
    ; 第一步，将当前剪切板的内容保存起来，然后清空
    tmp := Clipboard
    Clipboard =
    ; 第二步，复制当前选中内容
    SendInput, ^c
    ClipWait, 2
    if (StrLen(Clipboard) >= 10) {
        MsgBox, 请不要把此功能当做翻译机
        return 
    }
    ; 百度翻译API
    Var := ajax("http://119.23.22.136:6634/baidu_transapi.php?text=" . Clipboard . "&type=tuofeng")
    ; 切换到英文
    SwitchIME(0x08040804)
    ; 黏贴结果
    SendInput, % Var
    ; 这里考虑剪切板要tmp的数据，还是翻译的数据。暂时保存翻译结果吧
    Clipboard := Var
Return

+!q::
    ; 第一步，将当前剪切板的内容保存起来，然后清空
    tmp := Clipboard
    Clipboard =
    ; 第二步，复制当前选中内容
    SendInput, ^c
    ClipWait, 2
    ; 百度翻译API
    Var := ajax("http://119.23.22.136:6634/baidu_transapi.php?text=" . Clipboard . "&type=_", true)
    TrayTip, 翻译成功, 翻译结果为： %Var%, 20, 17
    ; 这里考虑剪切板要tmp的数据，还是翻译的数据。暂时保存翻译结果吧
    Clipboard := Var
Return

!space::
    InputBox, OutputVar, title, what's your Q?
    if (ErrorLevel == 0)
    {
        RUN, https://www.zhihu.com/search?type=content&q=%OutputVar%
        RUN, https://segmentfault.com/search?q=%OutputVar%
        RUN, https://www.google.com/search?q=%OutputVar%
        RUN, https://stackoverflow.com/search?q=%OutputVar%
        RUN, https://www.baidu.com/s?wd=%OutputVar%
    }
Return

>^j::
    RUN, http://youmightnotneedjquery.com/
    RUN, https://wyagd001.github.io/zh-cn/docs/Tutorial.htm
Return

; 复制黏贴大段文本
code(code)
{
    ; MsgBox,  %code%
    tmp := Clipboard
    Clipboard := code
    SendInput, ^V
    ; 这里至少需要等待50m
    sleep, 50 
    Clipboard := tmp
}

; 下载内容
ajax(url, q:=false)
{
    whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
    whr.Open("GET", url, true)
    whr.Send()
    TrayTip, 请稍后, 正在为你下载代码，请保持网络顺畅, 20, 17
    whr.WaitForResponse()
    
    
    if (q==false) {
        if (whr.ResponseText) {
            TrayTip, 下载成功, （づ￣3￣）づ╭❤～ , 20, 17
        } else {
            TrayTip, 无内容返回, (￣ε(#￣)☆╰╮o(￣皿￣///) , 20, 17
        }
    }
    
    return  whr.ResponseText
}

; https://tool.lu/imageholder/ 其实完全可以自己实现。算了，网上有的是这种服务
::img::
    SendInput, <img src="https://iph.href.lu/400x400" alt="..." />{left 14}{ShiftDown}{left 7}{ShiftUp}
Return

; ______________________ css ______________________



::@bg::
    SendInput,
(
width: 100px`;
height: 100px`;
background: url('https://iph.href.lu/100x100') center / 100`% 100`% no-repeat`;
display: inline-block`;
)
return

::size::
    SendInput,
(
width: px`;
height: px`;
)
return

::fs::
    SendInput, font-size: 14px`;{left 3}+{left 2}
Return

::bg::
    SendInput,background: url('https://iph.href.lu/100x100') center center / 130px 130px no-repeat content-box`;
Return

::bgc::
    SendInput, background-color: {#}ffffff`;{left}+{left 6}
Return

::bgi::
    SendInput, background: url('') no-repeat`;{left 13}
Return

::margin::
    SendRaw, margin: 0 auto;
return

::arrow::
Var = 
(
.triangle {
    border-left: 50px solid transparent;
    border-right: 50px solid transparent;
    border-bottom: 50px solid orange;
    width: 0;
    height: 0;
}
)
code(Var)
return

::arrow-top::
Var = 
(
.triangle {
    border-left: 50px solid transparent;
    border-right: 50px solid transparent;
    border-bottom: 50px solid orange;
    width: 0;
    height: 0;
}
)
code(Var)
return

::arrow-right::
Var = 
(
.triangle {
    border-top: 50px solid transparent;
    border-bottom: 50px solid transparent;
    border-left: 50px solid orange;
    width: 0;
    height: 0;
}
)
code(Var)
return

::arrow-bottom::
Var = 
(
.triangle {
    border-left: 50px solid transparent;
    border-right: 50px solid transparent;
    border-top: 50px solid orange;
    width: 0;
    height: 0;
}
)
code(Var)
return

::arrow-left::
Var = 
(
.triangle {
    border-top: 50px solid transparent;
    border-bottom: 50px solid transparent;
    border-right: 50px solid orange;
    width: 0;
    height: 0;
}
)
code(Var)
return

::wh::
    SendInput,
(
width: px`;
height: px`;^!{up}^{left}
)
Return

::w::
    SendInput, width: px;{left 3}
Return

::h::
    SendInput, height: px;{left 3}
Return

::ell::
    SendInput,
(
overflow: hidden`;
text-overflow: ellipsis`;
white-space: nowrap`;
)
Return

::lh::
    SendInput, 
(
height: px;
line-height: px;^!{up}^{left}
)
Return

::text-a::
    SendInput, text-align: center`;
Return

::ta::
    SendInput, text-align: center`;
Return

::tc::
    SendInput, text-align: center`;
Return

::tl::
    SendInput, text-align: left`;
Return

::tr::
    SendInput, text-align: right`;
Return

::t-a::
    SendInput, text-align: center`;
Return

::t-c::
    SendInput, text-align: center`;
Return

::t-r::
    SendInput, text-align: right`;
Return

::t-l::
    SendInput, text-align: left`
Return

::fl::
    SendInput, float: left`;
Return

::fr::
    SendInput, float: right`;
Return

::border-t::
    SendInput, border-top: 1px solid {#}ccc`;
Return

::border-r::
    SendInput, border-right: 1px solid {#}ccc`;
Return

::border-b::
    SendInput, border-bottom: 1px solid {#}ccc`;
Return

::border-l::
    SendInput, border-left: 1px solid {#}ccc`;
Return

::bt::
    SendInput, border-top: 1px solid {#}ccc`;
Return

::br::
    SendInput, border-right: 1px solid {#}ccc`;
Return

::bb::
    SendInput, border-bottom: 1px solid {#}ccc`;
Return

::bl::
    SendInput, border-left: 1px solid {#}ccc`;
Return

::mb::
	SendInput, margin-bottom: px`;{left 3}
Return

::mt::
	SendInput, margin-top: px`;{left 3}
Return

::ml::
	SendInput, margin-left: px`;{left 3}
Return

::mr::
	SendInput, margin-right: px`;{left 3}
Return

::pb::
	SendInput, padding-bottom: px`;{left 3}
Return

::pt::
	SendInput, padding-top: px`;{left 3}
Return

::pl::
	SendInput, padding-left: px`;{left 3}
Return

::pr::
	SendInput, padding-right: px`;{left 3}
Return

::posa::
    SendRaw, position: absolute;
Return

::posa::
    SendRaw, position: relative;
Return

::posf::
    SendInput, 
(
position: fixed`;
left: 0`;
right: 0`;
top: 0`;
z-index: 199307100337`;
)
Return

::box::
    SendInput,box-sizing: border-box`;
Return

::flexc::
    SendInput,
(
display: flex`;
justify-content: center`;
)
Return

::flexa::
    SendInput, 
(
display: flex`;
justify-content: space-around`;
)
Return

::flexs::
    SendInput, 
(
display: flex`;
justify-content: flex-start`;
)
Return

::flexe::
    SendInput, 
(
display: flex`;
justify-content: flex-end`;
)
Return

::flexcc::
    SendInput, 
(
display: flex`;
justify-content: center`;
align-items: center`;
)
Return

::flexac::
    SendInput, 
(
display: flex`;
justify-content: space-around`;
align-items: center`;
)
Return

::flexss::
    SendInput, 
(
display: flex`;
justify-content: flex-start`;
align-items: flex-start`;
)
Return

::flexsc::
    SendInput, 
(
display: flex`;
justify-content: flex-start`;
align-items: center`;
)
Return

::flexee::
    SendInput, 
(
display: flex`;
justify-content: flex-end`;
align-items: flex-end`;
)
Return

::`:before::
    SendInput,
(
::before {{}{}}{left}
content: " "`;
position:absolute`;

)
Return

::`:after::
    SendInput,
(
::after {{}{}}{left}
content: " "`;
position:absolute`;

)
Return

::center::
    SendInput, 
(
position: absolute`;
left: 50`%`;
top: 50`%`;
transform: translate(-50`%, -50`%)`;
)
Return

::xcenter::
    SendInput, 
(
position: absolute`;
left: 50`%`;
transform: translateX(-50`%)`;
)
Return

::ycenter::
    SendInput, 
(
position: absolute`;
top: 50`%`;
transform: translateY(-50`%)`;
)
Return

::@media::
Var = 
(
/* 移动设备断点，视图宽度 <= 768px */
@media (max-width: 768px) {

}

/* 移动设备断点，视图宽度 >= 769px */
@media (min-width: 769px and max-width: 1024) {

}

/* 移动设备断点，视图宽度 >= 1024px */
@media (min-width: 1024px and max-width: 1216px) {

}

/* 移动设备断点，视图宽度 >= 1216 */
@media (min-width: 1216px) {

}
)
code(Var)
Return

::link-media::
    SendInput, <link rel="stylesheet" media="(max-width: 640px)" href="app640.css">
Return

::border-1px::
Var = 
(
/* 1 物理像素线（也就是普通屏幕下 1px ，高清屏幕下 0.5px 的情况）采用 transform 属性 scale 实现 */
.mod_grid {
    position: relative;
    &::after {
        /* 实现1物理像素的下边框线 */
        content: '';
        position: absolute;
        z-index: 1;
        pointer-events: none;
        background-color: #ddd;
        height: 1px;
        left: 0;
        right: 0;
        top: 0;
        @media only screen and (-webkit-min-device-pixel-ratio: 2) {
            -webkit-transform: scaleY(0.5);
            -webkit-transform-origin: 50`% 0`%;
        }
    }
}
)
code(Var)
Return

; ______________________ JavaScript ______________________

::node-http::
Var = 
(
var http = require('http');

var server = http.createServer(function (req, rep) {
    rep.writeHead(200, {"Content-Type": "text/plain"});
    rep.end("Hello World!!");
})

server.listen(3000, function (err) {
     console.log('start');
});
)
code(Var)
Return

>^d::
    SendInput, debugger{;}
Return

>^c:: 
    SendInput, console.log()`;{left 2}
Return

::log:: 
    SendInput, console.log()`;{left 2}
Return

::con:: 
    SendInput, console.log()`;{left 2}
Return

::ret::
	SendInput, return
Return 

::re::
	SendInput, Return
Return 

::pro::
    SendInput, prototype
return

::args::
	SendInput, arguments
Return

::json.p::
    SendInput, JSON.parse(){left}
Return

::json.s::
    SendInput, JSON.stringify(){left}
Return

::/json::
    SendRaw, application/json;charset=utf-8
Return

::json/::
    SendRaw, application/json;charset=utf-8
Return

::/form::
    SendRaw, application/x-www-form-urlencoded;charset=utf-8
Return

::_ ::
	SendInput, _ => {{}{}}{left}{enter 2}{up}{tab}
Return

::=>::
	SendInput, _ => {{}{}}{left}{enter 2}{up}{tab}
Return

::func::
	SendInput, function () {{}{}}{left}{enter 2}{up}{tab}
Return

::f::
	SendInput, function () {{}{}}{left}{enter 2}{up}{tab}
Return

::()()::
	SendInput, (){left}function(){{}{}}(){left 3}{enter 2}{up}{tab}
Return

::$click::
	SendInput, $(".object").click(function () {{}{}}){left 2}{enter 2}{up}{tab}
Return

::$change::
	SendInput, $(".object").change(function () {{}{}}){left 2}{enter 2}{up}{tab}
Return

::`:?::
	SendInput, foo === bar ? true `: false`;
Return

::settime::
	SendInput, setTimeout(function () {{}{}}, 1000)`;{left 9}{enter}{enter}{up}{tab}
Return

::sett::
	SendInput, setTimeout(function () {{}{}}, 1000)`;{left 9}{enter}{enter}{up}{tab}
Return

::setinter::
	SendInput, setInterval(function () {{}{}}, 1000)`;{left 9}{enter}{enter}{up}{tab}
Return

::seti::
	SendInput, setInterval(function () {{}{}}, 1000)`;{left 9}{enter}{enter}{up}{tab}
Return

::time::
	SendInput, var timer = setTimeout(function () {{}{}}, 1000)`;{left 9}{enter}{enter}{up}{tab}clearTimeout(timer)`;
Return

::timer::
	SendInput, var timer = setTimeout(function () {{}{}}, 1000)`;{left 9}{enter}{enter}{up}{tab}clearTimeout(timer)`;
Return

::ctime::
	SendInput, var timer = setTimeout(function () {{}{}}, 1000)`;{left 9}{enter}{enter}{up}{tab}clearTimeout(timer)`;
Return

::ctimer::
	SendInput, var timer = setTimeout(function () {{}{}}, 1000)`;{left 9}{enter}{enter}{up}{tab}clearTimeout(timer)`;
Return

::ctimeri::
	SendInput, var timer = setInterval(function () {{}{}}, 1000)`;{left 9}{enter}{enter}{up}{tab}clearInterval(timer)`;
Return

::$each::
    SendInput, $.each($('.object'), function (i, e) {{}{}})`;{left 3}{enter 2}{up}{tab}console.log(i, e)`;
Return

::.each::
    SendInput, .each(function (i, e) {{}{}})`;{left 3}{enter 2}{up}{tab}console.log(i, e)`;
Return

::foreach::
    SendInput, [1,2,3,4].forEach(function (e, i) {{}{}})`;{left 3}{enter 2}{up}{tab} console.log(i, e)`;
Return

::dg::
    SendInput, document.getElementById('')`;{left 3}
Return

::ds::
    SendInput, document.querySelectorAll('')`;{left 3}
Return

::.then::
    SendInput, .then(_ => {{}{}}).catch(err => {{}{}})`;{left 3}{enter 2}{UP 2}{Home}{right 12}{enter 2}{up}{tab}
Return

::throw::
    SendInput, throw new Error(e.message){left}^+{left}^+{left}
Return

>!f::
Var = 
(
for (var i = 0; i < Things.length; i) {
    Things[i]
}
)
code(Var)
Return

!f::
Var = 
(
for (var i = 0; i < Things.length; i) {
    Things[i]
}
)
code(Var)
Return

::forin::
    SendInput, for (var property in source) {{}{}}{left}{enter}console.log(source[property]);
Return

::switch::
    SendInput,
(
switch (data) {{}{}}{left}{enter 2}{up}{tab}case 0`:
  break`;
case 1`:
  break`;
default`:
  
)
return

::date::
Var = 
(
var date = new date();
var year = date.getFullYear();
var month = date.getMonth() + 1;
var day = date.getate();
var hour = date.getHours();
var minutes = date.getMinutes();
var seconds= date.getSeconds();
console.log(year + "/" + month + "/" + day + "/ " + hour + ":" + minutes + ":" + seconds);
console.log(year + "年" + month + "月" + day + "日 " + hour + "时" + minutes + "分" + seconds + "秒");
)
code(Var)
return

::cdate::
	SendInput, var mydate = new Date(time.replace(/\-/g, "/"))`;
Return

::date.y::
	SendInput, new Date().getFullYear()`;
Return

::datey::
	SendInput, new Date().getFullYear()`;
Return

::date.year::
	SendInput, new Date().getFullYear()`;
Return

::date.m::
	SendInput, new Date().getMonth() {+} 1`;
Return

::date.month::
	SendInput, new Date().getMonth() {+} 1`;
Return

::datem::
	SendInput, new Date().getMonth() {+} 1`;
Return

::date.d::
	SendInput, new Date().getDate()`;
Return

::dated::
	SendInput, new Date().getDate()`;
Return

::date.day::
	SendInput, new Date().getDate()`;
Return

::date.h::
	SendInput, new Date().getHours()`;
Return

::dateh::
	SendInput, new Date().getHours()`;
Return

::date.hour::
	SendInput, new Date().getHours()`;
Return

::date.mm::
	SendInput, new Date().getMinutes()`;
Return

::datemm::
	SendInput, new Date().getMinutes()`;
Return

::date.s::
	SendInput, new Date().getSeconds()`;
Return

::date.ss::
    SendInput, new Date().getSeconds()`;
Return

::$create::
    SendInput, 
(
var wrap = document.createElement("div");
var first = document.body.firstChild;
var wraphtml = document.body.insertBefore(wrap,first);
)
Return
::random::
    SendInput, parseInt(Math.random() * 10 {+} 1); // 获取 1 - 10 到随机数
Return

::rand::
    SendInput, parseInt(Math.random() * 10 {+} 1); // 获取 1 - 10 到随机数
Return

::repeat::
    SendRaw, Array.prototype.join.call({length: i + 1}, '你确定？')
Return

!/::
Var = 
(
/**
 * say something ...
 */
)
code(Var)
Return

; ____________ CDN _______________

::cdn-axios::
    SendRaw, <script src="https://cdn.bootcss.com/axios/0.18.0/axios.min.js"></script>
Return

::cdn-swiper::
Var = 
(
<link href="https://cdn.bootcss.com/Swiper/4.2.2/css/swiper.css" rel="stylesheet">
<script src="https://cdn.bootcss.com/Swiper/4.2.2/js/swiper.min.js"></script>
)
code(Var)
Return

::cdn-jquery3::
Var = 
(
<script src="https://cdn.bootcss.com/jquery/3.3.1/jquery.min.js"></script>
)
code(Var)
Return

::cdn-jquery1.9::
Var = 
(
<script src="https://cdn.bootcss.com/jquery/1.9.1/jquery.min.js"></script>
)
code(Var)
Return

::cdn-jquery::
Var = 
(
<script src="https://cdn.bootcss.com/jquery/1.9.1/jquery.min.js"></script>
)
code(Var)
Return

::cdn-jq::
Var = 
(
<script src="https://cdn.bootcss.com/jquery/1.9.1/jquery.min.js"></script>
)
code(Var)
Return

::cdn-vue::
Var = 
(
<script src="https://cdn.bootcss.com/vue/2.5.16/vue.min.js"></script>
)
code(Var)
Return

::cdn-bs::
Var = 
(
<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script src="https://cdn.bootcss.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
)
code(Var)
Return

::cdn-bootstrap::
Var = 
(
<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script src="https://cdn.bootcss.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
)
code(Var)
Return

::cdn-layui::
Var = 
(
<link rel="stylesheet" href="http://res.layui.com/layui/dist/css/layui.css?t=1522709297490" media="all">
<script src="http://res.layui.com/layui/dist/layui.js?t=1522709297490"></script>
)
code(Var)
Return

::cdn-layer::
Var = 
(
<link rel="stylesheet" href="http://res.layui.com/layui/dist/css/layui.css">
<script src="http://res.layui.com/layui/release/layer/dist/layer.js?v=3111"></script>
)
code(Var)
Return

::cdn-reset::
Var = 
(
<link href="https://cdn.bootcss.com/normalize/8.0.0/normalize.min.css" rel="stylesheet">
)
code(Var)
return

::cdn-normalize::
Var = 
(
<link href="https://cdn.bootcss.com/normalize/8.0.0/normalize.min.css" rel="stylesheet">
)
code(Var)
return

;_______________ Vue ______________________

::dispatch:: 
    SendInput, this.$store.dispatch('').then(_ => {{} {}}){left 2}{enter 2}{up}{tab} // ...
Return

::v-for::
    SendInput, v-for='(item, index) in items' :key='index'
Return

; ______________________ HTML _____________________
::html`:5::
    SendInput,
(
<{!}DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Document</title>
</head>
<style></style>
<body>

</body>
<script></script>
</html>
)
Return

::meta::
    SendInput,  <meta name="viewport" content="width=device-width, initial-scale=1"> 
Return

::nocache::
(
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />  
<!-- HTTP 1.1 -->  
<meta http-equiv="pragma" content="no-cache">  
<!-- HTTP 1.0 -->  
<meta http-equiv="cache-control" content="no-cache">  
<!-- Prevent caching at the proxy server -->  
<meta http-equiv="expires" content="0">  
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE9" />  
)
Return

::art::
    SendRaw, <article></article>
return

::table-cell::
Var = 
(
/**
 * 父元素，table-cell兼容到IE8
 *
 * 缺点1：margin属性会失效（但子元素不影响），因为margin不适用于表格布局。
 * 解决1：再外层多套一个div容器，然后对这个容器display:block;margin: 0 auto;即可
 *
 * 缺点2：使用display: table-cell;的元素设置宽高百分比的时候将不起作用，譬如想设置为外层的100`%宽度
 * 解决2：如果只是想随着外层的100`%，还是有方法的，那就是设置一个很大的值，如3000px
 *
 * 缺点3：当元素设置为position: absolute;的时候会失效。
 * 解决3：参考解决1，在外层套一个容器,将absolute作用于该容器即可。
 *       但这样一来，又会导致缺点2的问题，也就是宽高百分比失效。所以要看场景使用。
 *       实在不行可以使用:
 		 position: relative;
		 top: 50`%;
		 transform: translateY(-50`%);  
         加上-webkit-前缀后，兼容性可以达到IE9。
         也可以采用margin-top: 负元素的高度。但需要知道高度，无法根据内容长度自适应。
 */
.my-container {
    display: table-cell;
    vertical-align: middle;
}
)
code(Var)
return

::middle::
    SendRaw, vertical-align: middle;
return

::fig::
Var = 
(
<figure>
    <img src="https://iph.href.lu/100x100" alt="..." />
    <figcaption>explanatory caption</figcaption>
</figure>
)
code(Var)
return

::fig-span::
Var = 
(
<style>
.my-container {
	display: table-cell;
	vertical-align: middle;
	background-color: red;
	height:500px;
}
img, span {
	/**
	 * 以前我以为只有display:table-cell;可以使用。
	 * 现在才发现原来只要是行内元素都可以，更意外的是，img居然也是一个行内元素。 
	 */
	vertical-align: middle;
}
</style>
<body>
	<figure class="my-container">
		<img src="https://iph.href.lu/100x100" alt="..." />
		<span>explanatory caption</span>
	</figure>
</div>
)
code(Var)
return

; _____________________ php _______________________

::header::
Var = 
(
header('Access-Control-Allow-Origin:*');
header('Access-Control-Allow-Headers:Content-Type,Content-Length, Authorization,Origin,Accept,X-Requested-With');
header('Access-Control-Allow-Methods:GET,POST);
header('Access-Control-Allow-Credentials:true');
header("Content-type: text/html; charset=utf-8");
)
code(Var)
Return

::header-utf8::
    SendRaw, header("Content-type: text/html; charset=utf-8");
Return

; _____________________ regExp _______________________

::regExp`:CN::
Var = 
(
if (!/^[\u4e00-\u9fa5]+$/.test('李钊鸿')) {
      throw new Error('请输入中文汉字')
}
)
code(Var)
return

::regExp`:phone::
Var = 
(
if (!/\d$/.test(13713342652)) {
    throw new Error('非法手机号码')
}
)
code(Var)
return
    
::regExp`:pwd:: 
    SendRaw, /[A-Za-z].*[0-9]|[0-9].*[A-Za-z]/.test('123456a@') ; /* 必须同时包含数字和字母,支持非法符号 */
Return 

::regExp`:user:: 
    SendRaw, /^[a-zA-Z0-9-_]*$/.test(''); /* 由6-16位数字、 字母、 '_'、 '-'组成，不含特殊字符*/
Return 

::regExp`:id::
Var = 
(
if (!/(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/.test('445222199307100337')){
    throw new Error('非法身份证')
}
)
code(Var)
return

::regexp`:email::
    SendRaw, /(\w+)@(\w+).(\w+)/.test(str)
Return

; _______________ snippets ______________ 

>^a::
Var = 
(
$.ajax({
	url: "http://localhost:3000",
	type: "post",
	data: JSON.stringify({
		test: 123
	}),
    headers: {
        token: '123'
    },
    dataType: 'json',
    contentType: 'application/json;charset=utf-8',
	success: function (data) {
		console.log(data);
	},
    // 注意如果后端返回的不是json格式并且设置了dataType为json也会触发错误
    error: function(e, m){
       console.log('数据接口请求异常', e, m);
    }
})
)
code(Var)
Return

::ajax::
Var = 
(
$.ajax({
	url: "http://localhost:8089/index.php",
	type: "post",
	data: {},
    headers: {
        token: '123'
    },
    dataType: 'json',
    contentType: 'application/json;charset=utf-8',
	success: function (data) {
		console.log(data);
	},
    error: function(e, m){
       console.log('数据接口请求异常', e, m);
    }
})
)
code(Var)
Return

; _______________________________ 本地代码库 _______________________________ 

::extend::
Var = 
(
// 拷贝集成
var extend = function (destination, source) {
    for (var property in source)
    destination[prototype] = source[prototype]
    return destination
}
)
code(Var)
Return
    
::gettop::
Var = 
(
// 获取距离顶部的相对距离
function getElementTop(element){
    try {
　  　　　var actualTop = element.offsetTop;
　  　　　var current = element.offsetParent;
　  　　　while (current !== null){
　  　　　　　actualTop += current.offsetTop;
　  　　　　　current = current.offsetParent;
　  　　　}
　  　　　return actualTop;
    } catch (e) {}
}
)
code(Var)
Return

::pad::
Var = 
(
// 补全
function pad (target, n) {
    var zero = new Array(n).join('0');
    var str = zero + target;
    var result = str.substr(-n);
    return result;
}
)
code(Var)
Return

::goTop::
Var = 
(
var timer = null;
var goTop = function() {
    cancelAnimationFrame(timer);
    timer = requestAnimationFrame(function fn() {
        var oTop = document.body.scrollTop || document.documentElement.scrollTop;
        if (oTop > 0) {
            document.body.scrollTop = document.documentElement.scrollTop = oTop - 500;
            timer = requestAnimationFrame(fn);
        } else {
            cancelAnimationFrame(timer);
        }
    });
}
)
code(Var)
Return

::uniqueArray::
Var = 
(
/**
 * 只用 Array
 * 如果是 es6 推荐： return Array.from(new Set(arr));
 */
function uniqueArray(arr) {
    var retArray = [];
    for (var i = 0; i < arr.length; i) {
        retArray.push(arr[i]);
    }
    Return retArray;
}
)
code(Var)
Return

; _______________________________ 云代码库 _______________________________ 

::aop::
    code(ajax("https://raw.githubusercontent.com/dragon8github/ahk/master/snippets/AOP.js"))
Return

::__EVENT__::
    code(ajax("https://raw.githubusercontent.com/dragon8github/ahk/master/snippets/__EVENT__.js"))
Return

::normalize::
    code(ajax("https://raw.githubusercontent.com/necolas/normalize.css/master/normalize.css"))
Return

::fuck-rem::
     code(ajax("https://raw.githubusercontent.com/dragon8github/ahk/master/snippets/rem.scss"))
Return

::hover-nav::
     code(ajax("https://raw.githubusercontent.com/dragon8github/ahk/master/snippets/hover-nav.html"))
Return

::myhtml::
    code(ajax("https://raw.githubusercontent.com/dragon8github/ahk/master/snippets/myhtml.html"))
return

::myexpress::
    code(ajax("https://raw.githubusercontent.com/dragon8github/ahk/master/snippets/myexpress1.js"))
return

; _______________________________ second_keyboard _______________________________ 
~^F12::
    ; 获取指定位置的数值
    FileRead, key, C:\Users\lizhaohong\Desktop\keypressed.txt
    
    ; b 百度
    if (key == 66) {
        RUN, https://www.baidu.com/
    }
Return
#InstallKeybdHook
Hotstring("EndChars", "`n`t")  ; 设置为回车键、tab键作为终止符

; ALT + R 重启脚本
!r::
    Send, ^s
    reload
Return

!a::
    MouseGetPos, MouseX, MouseY
    PixelGetColor, color, %MouseX%, %MouseY%
    Clipboard := "#" . SubStr(color, 3)
    TrayTip, my title, current color is `n %Clipboard%, 20, 17
return

^b::
    RUN, https://www.baidu.com/
    RUN, http://www.cnblogs.com/cylee
Return

^g::
    RUN, https://www.github.com/
    RUN, https://legacy.gitbook.com/
Return

; 快速搜索音乐
!space::
    InputBox, OutputVar, title, enter a music name?
    RUN, http://music.163.com/#/search/m/?s=%OutputVar%
    RUN, https://y.qq.com/portal/search.html#w=%OutputVar%
    RUN, https://www.xiami.com/search?key=%OutputVar%
    RUN, http://www.kugou.com/yy/html/search.html#searchType=song&searchKeyWord=%OutputVar%
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

^!s::
    InputBox, OutputVar, title, what's your Q?
    RUN, https://www.zhihu.com/search?type=content&q=%OutputVar%
    RUN, https://segmentfault.com/search?q=%OutputVar%
    RUN, https://www.google.com/search?q=%OutputVar%
    RUN, https://stackoverflow.com/search?q=%OutputVar%
    RUN, https://www.baidu.com/s?wd=%OutputVar%
Return

>^j::
    RUN, http://youmightnotneedjquery.com/
Return

ajax(name)
{
    whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
    ; Open() 的第三个参数代表同步或者异步，现在不用过多关注，true 就可以了
    whr.Open("GET", "https://raw.githubusercontent.com/dragon8github/ahk/master/functions/" . name . ".js", true)
    whr.Send()
    TrayTip, 请稍后, 正在为你下载代码，请保持网络顺畅, 20, 17
    whr.WaitForResponse()
    tmp := Clipboard
    Clipboard := whr.ResponseText
    send, ^V
    Clipboard := tmp
    TrayTip, 下载成功, （づ￣3￣）づ╭❤～ , 20, 17
}

; ______________________ css ______________________

::@bg::
    SendInput,
(
width: 100px`;
height: 100px`;
background: url('') center / 100`% 100`% no-repeat`;
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

::bg::background: url('./add.png') center center / 130px 130px no-repeat content-box`;
::bgc::background-color: {#}000`;{left}+{left 3}
::bgi::background-image: url('') no-repeat`;{left 13}

::arrow::
    SendInput,
(
.triangle {{}{}}{left}{enter 2}{up}{tab}
border-left: 50px solid transparent;
border-right: 50px solid transparent;
border-bottom: 50px solid orange;
width: 0;
height: 0;
)
return

::arrow-top::
    SendInput,
(
.triangle {{}{}}{left}{enter 2}{up}{tab}
border-left: 50px solid transparent;
border-right: 50px solid transparent;
border-bottom: 50px solid orange;
width: 0;
height: 0;
)
return

::arrow-right::
    SendInput,
(
.triangle {{}{}}{left}{enter 2}{up}{tab}
border-top: 50px solid transparent;
border-bottom: 50px solid transparent;
border-left: 50px solid orange;
width: 0;
height: 0;
)
return

::arrow-bottom::
    SendInput,
(
.triangle {{}{}}{left}{enter 2}{up}{tab}
border-left: 50px solid transparent;
border-right: 50px solid transparent;
border-top: 50px solid orange;
width: 0;
height: 0;
)
return

::arrow-left::
    SendInput,
(
.triangle {{}{}}{left}{enter 2}{up}{tab}
border-top: 50px solid transparent;
border-bottom: 50px solid transparent;
border-right: 50px solid orange;
width: 0;
height: 0;
)
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
    SendInput, 
(
position: absolute`;
top: 0px`;
right: 0px`;
bottom: 0px`;
left: 0px`;
)
Return

::posr::
    SendInput, 
(
position: relative`;
top: 0px`;
right: 0px`;
bottom: 0px`;
left: 0px`;
)
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

; ______________________ JavaScript ______________________

>^d::
    SendInput, debugger{;}`n
Return

>^c:: 
    SendInput, console.log('')`;{left 3}
Return

::ret::
	SendInput, Return
Return 

::re::
	SendInput, Return
Return 

::args::
	SendInput, arguments
Return

::_::
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

::each::
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
    SendInput, for (var i = 0; i < Things.length; i++) {{}{}}{left}{enter}Things[i]{left 3}^+{left}!{F3}
Return

!f::
    Send, for (var i = 0; i < Things.length; i++) {{}{}}{left}{enter}Things[i]{left 3}^+{left}!{F3}
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
    SendInput,
(
var date = new Date()`;
var year = date.getFullYear()`;
var month = date.getMonth() {+} 1`;
var day = date.getDate()`;
var hour = date.getHours()`;
var minutes = date.getMinutes()`;
var seconds= date.getSeconds()`;
console.log(year {+} "/" {+} month {+} "/" {+} day {+} "/ " {+} hour {+} ":" {+} minutes {+} ":" {+} seconds)`;
console.log(year {+} "年" {+} month {+} "月" {+} day {+} "日 " {+} hour {+} "时" {+} minutes {+} "分" {+} seconds {+} "秒" )`;
)
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

>^a::
    SendInput,
(
$.ajax({{}
url: "http://localhost:8089/index.php",
type: "post",
data: {{}{}},
success: function (data) {{}{}}{left}{enter}console.log(data)`;
)
Return

::ajax::
    SendInput,
(
$.ajax({{}
url: "http://localhost:8089/index.php",
type: "post",
data: {{}{}},
success: function (data) {{}{}}{left}{enter}console.log(data)`;
)
Return

::random::
    SendInput, parseInt(Math.random() * 10 {+} 1); // 获取 1 - 10 到随机数
Return

::rand::
    SendInput, parseInt(Math.random() * 10 {+} 1); // 获取 1 - 10 到随机数
Return

; ____________ CDN _______________
::cdn-jquery3::
    SendInput, <script src="https://cdn.bootcss.com/jquery/3.3.1/jquery.min.js"></script>
Return

::cdn-jquery1.9::
    SendInput, <script src="https://cdn.bootcss.com/jquery/1.9.1/jquery.min.js"></script>
Return

::cdn-jquery::
    SendInput, <script src="https://cdn.bootcss.com/jquery/1.9.1/jquery.min.js"></script>
Return

::cdn-jq::
    SendInput, <script src="https://cdn.bootcss.com/jquery/1.9.1/jquery.min.js"></script>
Return

::cdn-vue::
    SendInput, <script src="https://cdn.bootcss.com/vue/2.5.16/vue.min.js"></script>
Return

::cdn-bs::
    SendInput,
(
<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script src="https://cdn.bootcss.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
)
Return

::cdn-bootstrap::
    SendInput,
(
<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script src="https://cdn.bootcss.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
)
Return

::cdn-layui::
    SendInput,
(

<link rel="stylesheet" href="http://res.layui.com/layui/dist/css/layui.css?t=1522709297490" media="all">
<script src="http://res.layui.com/layui/dist/layui.js?t=1522709297490"></script>
)
Return

;_______________ Vue ______________________

>^b:: 
    SendInput, beforeMount () {{}{}}{left}{enter}
Return

>^r:: 
    SendInput, this.$router.push(''){left 2}
Return

>^p:: 
    SendInput, this.$router.push(''){left 2}
Return

>^s:: 
    SendInput, this.$store.state
Return

::dispatch:: 
    SendInput, this.$store.dispatch('').then(_ => {{} {}}){left 2}{enter 2}{up}{tab} // ...
Return

>^f::
    SendInput, v-for='(item, index) in items' :key='index'
Return

::v-for::
    SendInput, v-for='(item, index) in items' :key='index'
Return

; ______________________ HTML _____________________


::html::
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

; _____________________ php _______________________

::header::
(
header('Access-Control-Allow-Origin:*');
header('Access-Control-Allow-Headers:Content-Type,Content-Length, Authorization,Origin,Accept,X-Requested-With');
header('Access-Control-Allow-Methods:GET, POST, OPTIONS, PUT, PATCH, DELETE');
header('Access-Control-Allow-Credentials:true');
)
Return

; _____________________ regExp _______________________

::regExp`:CN::
    SendInput, if (!/^[\u4e00-\u9fa5]+$/.test('李钊鸿')) {{}{}}{left}{enter 2}{up}{tab}throw new Error('请输入中文汉字')
return

::regExp`:phone::
    SendInput,if ({!}/^1\d{10}$/.test(13713342652)) {{}{}}{left}{enter 2}{up}{tab}throw new Error('非法手机号码')
return
    
::regExp`:pwd:: 
    SendInput, /[A-Za-z].*[0-9]|[0-9].*[A-Za-z]/.test('123456a@')`; /* 必须同时包含数字和字母,支持非法符号 */
Return 

::regExp`:user:: 
    SendInput, /{^}[a-zA-Z0-9-_]*$/.test('')`; /* 由6-16位数字、 字母、 '_'、 '-'组成，不含特殊字符*/
Return 

::regExp`:id::
    SendInput, {raw}if (!/(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/.test('445222199307100337'))
    SendInput, {{}{}}{left}{enter 2}{up}{tab}throw new Error('非法身份证')
return

; _______________ snippets ______________ 

::gettop::
    ajax("gettop")
Return

::pad::
    ajax("pad")
Return
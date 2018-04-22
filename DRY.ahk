#InstallKeybdHook
Hotstring("EndChars", "`n`t")  ; 设置为回车键、tab键作为终止符

; ALT + R 重启脚本
!r::
    Send, ^s
    reload
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
    SendInput, width: px;^{left}
Return

::h::
    SendInput, height: px;^{left}
Return

::lh::
    SendInput, 
(
height: px;
line-height: px;^!{up}^{left}
)
Return

::text-a::text-align: center`;
::ta::text-align: center`;
::tc::text-align: center`;
::tl::text-align: left`;
::tr::text-align: right`;
::t-a::text-align: center`;
::t-c::text-align: center`;
::t-r::text-align: right`;
::t-l::text-align: left`
::fl::float: left`;
::fr::float: right`;
::border-t::border-top: 1px solid {#}ccc`;
::border-r::border-right: 1px solid {#}ccc`;
::border-b::border-bottom: 1px solid {#}ccc`;
::border-l::border-left: 1px solid {#}ccc`;
::b-t::border-top: 1px solid {#}ccc`;
::b-r::border-right: 1px solid {#}ccc`;
::b-b::border-bottom: 1px solid {#}ccc`;
::b-l::border-left: 1px solid {#}ccc`;

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

::before::
    SendInput,
(
::before {{}{}}{left}
content: " "`;
position:absolute`;

)
Return

::after::
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

; ______________________ js ______________________

>^d::
    SendInput, debugger{;}
Return

>^c:: 
    SendInput, console.log('')`;{left 3}
Return

::ret::Return 
::re::Return 

::_::_ => {{}{}}{left}{enter 2}{up}{tab}
::=>::_ => {{}{}}{left}{enter 2}{up}{tab}
::func::function () {{}{}}{left}{enter 2}{up}{tab}
::f::function () {{}{}}{left}{enter 2}{up}{tab}
::()()::(){left}function(){{}{}}(){left 3}{enter 2}{up}{tab}

::$click::$(".object").click(function () {{}{}}){left 2}{enter 2}{up}{tab}
::$change::$(".object").change(function () {{}{}}){left 2}{enter 2}{up}{tab}
::`:?::foo === bar ? true `: false`;

::settime::setTimeout(function () {{}{}}, 1000)`;{left 9}{enter}{enter}{up}{tab}
::sett::setTimeout(function () {{}{}}, 1000)`;{left 9}{enter}{enter}{up}{tab}
::setinter::setInterval(function () {{}{}}, 1000)`;{left 9}{enter}{enter}{up}{tab}
::seti::setInterval(function () {{}{}}, 1000)`;{left 9}{enter}{enter}{up}{tab}
::timer::var timer = setTimeout(function () {{}{}}, 1000)`;{left 9}{enter}{enter}{up}{tab}clearTimeout(timer)`;
::ctime::var timer = setTimeout(function () {{}{}}, 1000)`;{left 9}{enter}{enter}{up}{tab}clearTimeout(timer)`;
::ctimer::var timer = setTimeout(function () {{}{}}, 1000)`;{left 9}{enter}{enter}{up}{tab}clearTimeout(timer)`;
::ctimeri::var timer = setInterval(function () {{}{}}, 1000)`;{left 9}{enter}{enter}{up}{tab}clearInterval(timer)`;


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

::.then::.then(_ => {{}{}}).catch(err => {{}{}})`;{left 3}{enter 2}{UP 2}{Home}{right 12}{enter 2}{up}{tab}

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

::pad::
    SendInput,
(`
function pad (target, n) {{}{}}{left}{enter 2}{up}{tab}
var zero = new Array(n).join('0')`;
var str = zero {+} target`;
var result = str.substr(-n)`;
return result`;`
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
::cdate::var mydate = new Date(time.replace(/\-/g, "/"))`;
::date.y::new Date().getFullYear()`;
::datey::new Date().getFullYear()`;
::date.year::new Date().getFullYear()`;
::date.m::new Date().getMonth() {+} 1`;
::date.month::new Date().getMonth() {+} 1`;
::datem::new Date().getMonth() {+} 1`;
::date.d::new Date().getDate()`;
::dated::new Date().getDate()`;
::date.day::new Date().getDate()`;
::date.h::new Date().getHours()`;
::dateh::new Date().getHours()`;
::date.hour::new Date().getHours()`;
::date.mm::new Date().getMinutes()`;
::datemm::new Date().getMinutes()`;
::date.s::new Date().getSeconds()`;
::date.ss::new Date().getSeconds()`;

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
<title>Document</title>
</head>
<body>

</body>
</html>
)
Return
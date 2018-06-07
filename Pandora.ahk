#InstallKeybdHook
#Persistent ; 让脚本持续运行, 直到用户退出.
Hotstring("EndChars", "`n")  ; 设置为回车键作为终止符
Menu, MyMenu, add
FileEncoding, UTF-8
FileDelete, *.bak 
FileDelete, .\src\*.bak


Gui, Add, Text, W120, 搜索引擎类:
Gui, Add, Checkbox, gMySubroutine vbd Checked HwndMyEditHwnd, 百度
Gui, Add, Checkbox, vgoogle, Google
Gui, Add, Checkbox, vgithub, Github
Gui, Add, Checkbox, vso, Stack Overflow

Gui, Add, Text, W120 ym, 翻译类:
Gui, Add, Checkbox, vbdfy, 百度翻译   
Gui, Add, Checkbox, vyoudaofy, 有道翻译
Gui, Add, Checkbox, vgooglefanyi, Google翻译

Gui, Add, Text, W120 ym, 音乐类:
Gui, Add, Checkbox, vwy, 网易云音乐   
Gui, Add, Checkbox, vqq, QQ音乐
Gui, Add, Checkbox, vdog, 酷狗音乐
Gui, Add, Checkbox, vxiami, 虾米音乐

Gui, Add, Text, W120 ym, 社区类:
Gui, Add, Checkbox, vjuejin, 掘金
Gui, Add, Checkbox, vjianshu, 简书
Gui, Add, Checkbox, vcsdn, CSDN
Gui, Add, Checkbox, vzhihu, 知乎
Gui, Add, Checkbox, vsegmentfault, SegmentFault

; ym 可以 y轴换列，有点类似float:left ，而 xm可以换行,有点类似clear:both
Gui, Add, Edit, r9 vFirstName w300 Limit50 ym , 请输入你要搜索的内容
Gui, Color, E6FFE6
Gui, Margin, 10, 10
Gui, Add, Button, w300 h30, OK
Gui, Show,, Simple Input Example
return 

; +g 其实就是添加吧
MySubroutine:
	MsgBox, %MyEditHwnd%
	MsgBox, %A_EventInfo%, %A_GuiEvent%, %A_GuiControl%, %A_Gui%
return


GuiClose:
ButtonOK:
Gui, Submit  ; 保存用户的输入到每个控件的关联变量中.
	if (bd == 1) {
	}
return

; 创建专属目录
if !FileExist(".pandora")
	FileCreateDir, .pandora
	; 创建缓存目录
	if !FileExist(".pandora/.cache")
		FileCreateDir, .pandora/.cache

#Include src/lib.ahk     ; 公共函数 
#Include src/help.ahk    ; 辅助功能   
#Include src/url.ahk     ; url 相关的快速跳转 
#Include src/html.ahk    ; HTML    
#include src/css.ahk     ; css   
#Include src/js.ahk      ; JavaScript   
#Include src/node.ahk    ; nodejs    
#Include src/vue.ahk     ; Vue   
#Include src/cdn.ahk     ; CDN   
#Include src/php.ahk     ; php   
#Include src/github.ahk  ; 云代码库    
#Include src/ht.ahk      ; ht-elementUI库   
#Include src/Lua.ahk     ; secondkey_board  
#Include src/gulp.ahk    ; gulp
#Include src/shell.ahk   ; shell
#Include src/docker.ahk  ; docker


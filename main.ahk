#InstallKeybdHook
#Persistent
Hotstring("EndChars", "`n")  ; 设置为回车键作为终止符（`t为回车键）
Menu, MyMenu, add

; ALT + R 重启脚本
!r::
    Send, ^s
    reload
Return

; Alt + F11 重启脚本
~!F11::
    reload
return

;________________ lib ______________________
#Include lib.ahk

; ______________ url ____________________ 
#Include url.ahk

; ____________________ help ___________________________
#Include help.ahk


; ______________________ css ______________________
#include css.ahk

; ______________________ JavaScript ______________________
#Include js.ahk

; ____________ CDN _______________
#Include cdn.ahk

;_______________ Vue ______________________
#Include vue.ahk

; ______________________ HTML _____________________
#Include html.ahk

; _____________________ php _______________________
#Include php.ahk

; _____________________ is 系列 _______________________
#Include is.ahk

; _______________ snippets ______________ 
#Include node.ahk

; _______________________________ 云代码库 _______________________________ 
#Include github.ahk

; ___________________ hongte _______________________
#Include ht.ahk

; _______________________________ second_keyboard _______________________________ 
#Include Lua.ahk
﻿#IfWinNotActive 神武3
; #InstallKeybdHook
#Persistent ; 让脚本持续运行, 直到用户退出.
Hotstring("EndChars", "`n`t")  ; 设置为回车键作为终止符

FileEncoding, UTF-8
FileDelete, *.bak 
FileDelete, .\src\*.bak

#include src/GUI.ahk		; GUI系列 
#Include src/lib.ahk        ; 公共函数
#Include src/help.ahk       ; 辅助功能
#Include src/makedown.ahk   ; makedown
#Include src/html.ahk       ; HTML    
#Include src/three.ahk      ; THREE    
#Include src/vue.ahk        ; Vue
#Include src/wx.ahk         ; wx
#Include src/shell.ahk      ; shell
#Include src/node.ahk       ; nodejs 
#include src/css.ahk        ; css   
#Include src/TypeScript.ahk ; TypeScript
#Include src/tp.ahk		 	; thinkphp
#Include src/js.ahk         ; JavaScript   
#Include src/arr.ahk        ; arr
#Include src/ajax.ahk         ; ajax   
#Include src/react.ahk      ; React
#Include src/cdn.ahk        ; CDN   
#Include src/php.ahk        ; php   
#Include src/github.ahk     ; 云代码库    
#Include src/ht.ahk         ; ht-elementUI库   
#Include src/Lua.ahk        ; secondkey_board  
#Include src/gulp.ahk       ; gulp
#Include src/docker.ahk     ; docker
#Include src/python.ahk		; python
#Include src/echarts.ahk	; echarts
#Include src/sql.ahk		; sql
#Include src/bdmap.ahk		; sql
#include src/prehosting.ahk	; 预设置的快捷键
﻿AppsKey & p::
>^p::
;pxToRem
    t := A_YYYY . A_MM . A_DD . A_Hour . A_Min . A_Sec
    SendInput, print(%t%, )`{left 2}
return

::pyclass::
Var =
(
class Me:
    def __init__(self, name):
        self.name = name

    def show(self):
        print(self.name)

    @staticmethod
    def version():
        print('1.0')


me = Me('Lee')
me.show() # Lee
Me.version() # 1.0
)
code(Var)
return

!p::
	; def 函数
	Menu, def1, Add, 不定数参数 , PythonHandler
	Menu, def1, Add, 关键字参数 , PythonHandler
	Menu, def1, Add, 获取参数数据类型 , PythonHandler
	
	; 内置函数
	Menu, mehods1, Add, input()等待并获取用户输入 , PythonHandler
	Menu, mehods1, Add, len() , PythonHandler
	Menu, mehods1, Add, str()、int()、float() , PythonHandler
	
	; 控制流
	Menu, control1, Add, True / False, PythonHandler
	Menu, control1, Add, and / or / not, PythonHandler
	Menu, control1, Add, 比较操作符, PythonHandler
	Menu, control1, Add, if / elif / else 条件语句, PythonHandler
	Menu, control1, Add, while / break / continue 循环语句, PythonHandler
	Menu, control1, Add, for + range() 循环语句, PythonHandler

	; List 列表
	Menu, List1, Add, 定义 List 列表, PythonHandler
	Menu, List1, Add, count, PythonHandler
	Menu, List1, Add, index, PythonHandler
	Menu, List1, Add, reverse, PythonHandler
	Menu, List1, Add, append, PythonHandler
	Menu, List1, Add, sort, PythonHandler
	Menu, List1, Add, pop, PythonHandler
	
	; dict 字典
	Menu, dict1, Add, 字典定义 json 版, PythonHandler
	Menu, dict1, Add, 字典定义 dict 版, PythonHandler
	Menu, dict1, Add, 字典 for 循环, PythonHandler

	; class 类
	Menu, class1, Add, 构造函数（__init__） + 静态函数（@staticmethod） + 实例函数, PythonHandler
	Menu, class1, Add, 值类型 / 引用类型, PythonHandler
	Menu, class1, Add, 类的生命周期, PythonHandler

	; package 模块
	Menu, package1, Add, from <模块> import <方法>, PythonHandler
	Menu, package1, Add, import functions, PythonHandler
	Menu, package1, Add, 使用 all 控制函数的导出, PythonHandler

	; range 方法
	Menu, range1, Add, range()的开始、停止和步长参数, PythonHandler
	Menu, range1, Add, range + for, PythonHandler
	Menu, range1, Add, range + 倒序for, PythonHandler
	Menu, range1, Add, range + list, PythonHandler
	Menu, range1, Add, range + for高阶操作, PythonHandler
	Menu, range1, Add, range + for + if 高阶操作, PythonHandler
	Menu, range1, Add, range + for + if + 函数高阶操作, PythonHandler

	; os 模块
	Menu, os1, Add, 文件读取, PythonHandler
	Menu, os1, Add, 获得系统环境变量, PythonHandler
	Menu, os1, Add, 当前python脚本工作路径, PythonHandler
	Menu, os1, Add, 当前进程ID, PythonHandler
	Menu, os1, Add, 父进程ID, PythonHandler

	; __魔力函数__
	Menu, magic1, Add, 全局注释, PythonHandler
	Menu, magic1, Add, 类注释, PythonHandler
	Menu, magic1, Add, 获取类的详情信息, PythonHandler
	Menu, magic1, Add, 获取函数名 / 类名, PythonHandler

	; try 异常处理
	Menu, try1, Add, 捕获异常, PythonHandler

	; 杂项 / 语法特性
	Menu, other1, Add, with as, PythonHandler
	Menu, other1, Add, is, PythonHandler
	Menu, other1, Add, id(), PythonHandler

	Menu, PythonMenu, Add, def 函数, :def1
	Menu, PythonMenu, Add, 内置函数, :mehods1
	Menu, PythonMenu, Add, 控制流, :control1
	Menu, PythonMenu, Add, List 列表, :List1
	Menu, PythonMenu, Add, dict 字典, :dict1
	Menu, PythonMenu, Add, class 类, :class1
	Menu, PythonMenu, Add, package 模块, :package1
	Menu, PythonMenu, Add, range 方法, :range1
	Menu, PythonMenu, Add, os 模块, :os1
	Menu, PythonMenu, Add, __魔力函数__, :magic1
	Menu, PythonMenu, Add, try 异常处理, :try1
	Menu, PythonMenu, Add, 杂项 / 语法特性, :other1
	
	Menu, PythonMenu, Show
	Menu, PythonMenu, DeleteAll
return

PythonHandler:
; MsgBox You selected %A_ThisMenuItem% from the menu %A_ThisMenu%.
v := A_ThisMenuItem
Var := 


if (v == "True / False") {
Var = 
(

)
}

if (v == "and / or / not") {
Var = 
(

)
}

if (v == "比较操作符") {
Var = 
(

)
}

if (v == "range()的开始、停止和步长参数") {
Var = 
(
for i in range(12, 16):
	print(i) # 12 13 14 15 16

for i in range(0, 10, 2):
	print(i) # 0 2 4 6 8 

for i in range(5, -1, -1):
	print(i) # 5 4 3 2 1 0
)
}

if (v == "if / elif / else 条件语句") {
Var = 
(
if name == 'Alice':
	print('Hi, Alice')
elif age < 12
	print('you are not Alice, kiddo.')
else:
	print('you are neither Alice nor a little kid.')
)
}

if (v == "while / break / continue 循环语句") {
Var = 
(
while True:
	print('Who are you?')
	name = input()
	if name != 'Joe':
		continue
	print('Hello, Joe. what is the password?')
	password = input()
	if password == 'swordfish':
		break
print('Acess granted.')
)
}

if (v == "for + range() 循环语句") {
Var = 
(
for i in range(5):
	print('Jimmy Five Times (' + str(i) + ')')
)
}

if (v == "input()等待并获取用户输入") {
Var = 
(
myname = input() # 输入一些内容吧
)
}

if (v == "len()") {
Var = 
(
len("hello") # 5
)
}

if (v == "str()、int()、float()") {
Var = 
(
str(29) # '29'
int(1.99) # 1
float(10), # 10.0
int('99.99') # ValueError: invalid literal for int() with base 10: '99.99'
int(float('99.99')) # 99
)
}

if (v == "不定数参数") {
Var = 
(
#-*- coding: utf-8 -*-
def showme(name, *info):
print(name)
for a in info:
print(a)
showme("Lee", 1,2,3,4)
)
}

if (v == "关键字参数") {
Var = 
(
#-*- coding: utf-8 -*-
def showme(name, *info, **info2):
print(name, info)
for b in info2:
print(b, info2[b])
showme("Lee", 1,2,3,4,age=12,sex='女')
)
}

if (v == "获取参数数据类型") {
Var = 
(
# -*- coding: utf-8 -*-
def showme(name, *info, **info2):
    print(type(name))
    print(type(info))
    print(type(info2))

showme("Lee", 1, 2, 3, 4, age=12, sex='女')
)
}

if (v == "定义List列表") {
Var = 
(
fruits = ['orange', 'apple', 'pear', 'banana', 'kiwi', 'apple', 'banana']
)
}

if (v == "count") {
Var = 
(
fruits = ['orange', 'apple', 'pear', 'banana', 'kiwi', 'apple', 'banana']
fruits.count('apple') # 2
)
}

if (v == "index") {
Var = 
(
fruits = ['orange', 'apple', 'pear', 'banana', 'kiwi', 'apple', 'banana']
fruits.index('banana') # 3
)
}

if (v == "reverse") {
Var = 
(
fruits = ['orange', 'apple', 'pear', 'banana', 'kiwi', 'apple', 'banana']
fruits.reverse() 
print(20180718210519, fruits) # ['banana', 'apple', 'kiwi', 'banana', 'pear', 'apple', 'orange']
)
}

if (v == "append") {
Var = 
(
fruits = ['orange', 'apple', 'pear', 'banana', 'kiwi', 'apple', 'banana']
fruits.append('grape')
print(20180718210544, fruits) # ['banana', 'apple', 'kiwi', 'banana', 'pear', 'apple', 'orange', 'grape']
)
}

if (v == "sort") {
Var = 
(
fruits = ['orange', 'apple', 'pear', 'banana', 'kiwi', 'apple', 'banana']
fruits.sort()
console.log(20180718210712, fruits) # ['apple', 'apple', 'banana', 'banana', 'grape', 'kiwi', 'orange', 'pear']
)
}

if (v == "pop") {
Var = 
(
fruits = ['orange', 'apple', 'pear', 'banana', 'kiwi', 'apple', 'banana']
fruits.pop() # 'pear'
)
}

if (v == "字典定义 json 版") {
Var = 
(
me = {"name":"Lee"}
)
}

if (v == "字典定义 dict 版") {
Var = 
(
user = dict(age=19, sex='nan')
)
}

if (v == "字典 for 循环") {
Var = 
(
user = dict(age=19, sex='nan')
for key in user:
    print(key, user[key])
)
}

if (v == "构造函数（__init__） + 静态函数（@staticmethod） + 实例函数") {
Var = 
(
class Me:
    def __init__(self, name):
        self.name = name

    def show(self):
        print(self.name)

    @staticmethod
    def version():
        print('1.0')


me = Me('Lee')
me.show() # Lee
Me.version() # 1.0
)
}

if (v == "值类型 / 引用类型") {
Var = 
(

)
}

if (v == "类的生命周期") {
Var = 
(

)
}

if (v == "from <模块> import <方法>") {
Var = 
(

)
}

if (v == "import functions") {
Var = 
(

)
}

if (v == "使用 all 控制函数的导出") {
Var = 
(

)
}

if (v == "range + for") {
Var = 
(

)
}

if (v == "range + 倒序 for") {
Var = 
(

)
}

if (v == "range + list") {
Var = 
(

)
}

if (v == "range + for 高阶操作") {
Var = 
(

)
}

if (v == "range + for + if 高阶操作") {
Var = 
(

)
}

if (v == "range + for + if + 函数高阶操作") {
Var = 
(

)
}

if (v == "文件读取") {
Var = 
(

)
}

if (v == "获得系统环境变量") {
Var = 
(

)
}

if (v == "当前python脚本工作路径") {
Var = 
(

)
}

if (v == "当前进程ID") {
Var = 
(

)
}

if (v == "父进程ID") {
Var = 
(

)
}

if (v == "全局注释") {
Var = 
(

)
}

if (v == "类注释") {
Var = 
(

)
}

if (v == "获取类的详情信息") {
Var = 
(

)
}

if (v == "获取函数名 / 类名") {
Var = 
(

)
}

if (v == "捕获异常") {
Var = 
(

)
}

if (v == "withas") {
Var = 
(

)
}

if (v == "is") {
Var = 
(

)
}

if (v == "id()") {
Var = 
(

)
}

if (Var) {
	code(Var)
} else {
	MsgBox, 未找到定义代码块
}
return



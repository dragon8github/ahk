﻿!u::
	Menu, PythonMenu, Add, #-*- coding: utf-8 -*- , PythonHandler
	Menu, PythonMenu, Add, python -m pip install --upgrade pip, PythonHandler2
	Menu, PythonMenu, Add, pip install virtualenv, PythonHandler2
	Menu, PythonMenu, Add, pip install virtualenvwrapper-win, PythonHandler2
	
	Menu, PythonMenu, Add,, PythonHandler
	Menu, PythonMenu, Add,, PythonHandler
	
	
	Menu, PythonCognition, Add, 数组拦截、字符串拦截：me[1:3] , PythonHandler
	
	
	
	Menu, PythonMagic, Add, __doc__: 打印出对象的属性, PythonHandler
	Menu, PythonMagic, Add, __doc__: 打印出类、函数注释, PythonHandler
	Menu, PythonMagic, Add, __name__: 打印出类、函数名称, PythonHandler
	
	Menu, PythonbuiltIn, Add, 全局变量globals() 和 局部变量locals(), PythonHandler
	
	Menu, PythonMenu, Add, (〜￣△￣)〜认知～(￣▽￣～), :PythonCognition
	Menu, PythonMenu, Add, 魔术变量：__FUCK__, :PythonMagic
	Menu, PythonMenu, Add, 内置函数, :PythonbuiltIn


	Menu, PythonMenu, Add,, PythonHandler
	Menu, PythonMenu, Add,, PythonHandler
	
	Menu, PythonMenu, Add, socket 网络编程基本示例, PythonHandler
	Menu, PythonMenu, Add, bs4 + requests , PythonHandler
	Menu, PythonMenu, Show

	Menu, PythonMenu, DeleteAll

return

PythonHandler2:
v := A_ThisMenuItem
Sleep, 100
SendInput, % v
Return

PythonHandler:
v := A_ThisMenuItem
Var := 

if (v == "") {
Var = 
(
)
}

if (v == "__doc__: 打印出对象的属性") {
Var = 
(
class Me:
    ''' 私有属性，只能内部函数访问，但实际上也可以通过 me._Me__sex 访问 '''
    __sex = 'F'

    def __init__(self, name):
        self.name = name
        self.hobby = []

    def show(self):
        print(self.name)

    @staticmethod
    def version():
        print('1.0')

print(20191015231005, Me.__dict__)
)
}

if (v == "__name__: 打印出类、函数名称") {
Var = 
(
'''
当前py文件文档说明
'''

def test():
    '函数的文档说明'
    pass

class Me:
    '类的文档说明'
    pass


print(20191015230534, __name__)  # 20191015230534 __main__
print(20191015230534, test.__name__)  # 20191015230534 test
print(20191015230534, Me.__name__)  # 20191015230534 Me
)
}

if (v == "__doc__: 打印出类、函数注释") {
Var = 
(
'''
当前py文件文档说明
'''

def test():
    '函数的文档说明'
    pass

class Me:
    '类的文档说明'
    pass


print(20191015230534, __doc__)
print(20191015230534, test.__doc__)
print(20191015230534, Me.__doc__)
)
}

if (v == "数组拦截、字符串拦截：me[1:3]") {
Var = 
(
me = [1,2,3,4]
print(20191015203704, me[1:3])
)
}

if (v == "#-*- coding: utf-8 -*-") {
Var = 
(
#-*- coding: utf-8 -*-
)
}

if (v == "socket 网络编程基本示例") {
_send("py.socket", true, true)
return
}

if (v == "bs4 + requests") {
Var = 
(
# python 3.x 开始自带了pip，如果没有请自信百度安装。
# pip install beautifulsoup4 requests
from bs4 import BeautifulSoup
import requests

res = requests.get('https://etherscan.io/token/tokenholderchart/0x86fa049857e0209aa7d9e616f7eb3b3b78ecfdb0?range=10')
res.encoding = 'gbk'
soup = BeautifulSoup(res.text, 'html.parser')
table = soup.select('#ContentPlaceHolder1_resultrows table tr')
myarr = []
for tr in table:
	td = tr.select('td')
	if len(td) > 0:
		Rank = td[0].text;
		Address = td[1].text;
		Quantity = td[2].text;
		Percentage = td[3].text;
		myarr.append({"Rank": Rank, "Address": Address, "Quantity": Quantity, "Percentage": Percentage})
print(myarr)
)
}


return



::pythonpachong::
::pypachonh::
::python.pachong::
::py.pachong::
::pachong::
Var =
(
# python 3.x 开始自带了pip，如果没有请自信百度安装。
# pip install beautifulsoup4 requests
from bs4 import BeautifulSoup
import requests

res = requests.get('https://etherscan.io/token/tokenholderchart/0x86fa049857e0209aa7d9e616f7eb3b3b78ecfdb0?range=10')
res.encoding = 'gbk'
soup = BeautifulSoup(res.text, 'html.parser')
table = soup.select('#ContentPlaceHolder1_resultrows table tr')
myarr = []
for tr in table:
	td = tr.select('td')
	if len(td) > 0:
		Rank = td[0].text;
		Address = td[1].text;
		Quantity = td[2].text;
		Percentage = td[3].text;
		myarr.append({"Rank": Rank, "Address": Address, "Quantity": Quantity, "Percentage": Percentage})
print(myarr)
)
code(Var)
return

::pyfastsort::
::pykuaisipaixu::
::pyquicksort::
::quicksort::
::kuaisipaixu::
::paixu::
Var =
(
# 快速排序
def quicksort(array):
	# 这不是废话吗？如果数组中只有1个成员或没有成员，那还排个屁序！！
	if len(array) <= 1:
		return array
	else:
		# 随机选出一个作为排序对比时的【基准数】，这里就取第一个好了最简单了
		pivot = array[0]
		# 将比基准数小的放在一个数组中（记得除外基准数，也就是[1:]）
		less = [i for i in array[1:] if i <= pivot]
		# 把基准数大的放在另外一个数组中（记得除外基准数，也就是[1:]）
		greater = [i for i in array[1:] if i > pivot]
		# 这就是快速排序的精华所在:递归, 然后把三个数据合并
		return quicksort(less) + [pivot] + quicksort(greater)

print(quicksort([10, 5, 2, 3])) # [2, 3, 5, 10]
)
code(Var)
return

::pyerfenfa::
::pyerfen::
::pybinary::
::erfenfa::
Var =
(
def binary_search(list, target):
	low = 0
	high = len(list)

	while not (low > high):
		mid = int((low + high) / 2)
		guess = list[mid]

		if guess == target:
			return mid
		if guess > target:
			high = mid - 1
		else:
			low = mid + 1

	return None

print(binary_search([1, 2, 3, 4, 5, 6, 7, 8, 9, 10], 5))
input()
)
code(Var)
return

::pyfor::
::py.for::
::for::
Var =
(
for i in range(5):
	print('Jimmy Five Times (' + str(i) + ')')
)
code(Var)
return

::pyif::
::py.if::
::if::
Var =
(
if name == 'Alice':
	print('Hi, Alice')
elif age < 12
	print('you are not Alice, kiddo.')
else:
	print('you are neither Alice nor a little kid.')
`)
)
code(Var)
return

::pyclass::
::py.class::
::class::
Var =
(
class Me:
    ''' 私有属性，只能内部函数访问，但实际上也可以通过 me._Me__sex 访问 '''
    __sex = 'F'

    def __init__(self, name):
        self.name = name
        self.hobby = []

    def show(self):
        print(self.name)

    @staticmethod
    def version():
        print('1.0')


me = Me('Lee')
# me.show() # Lee
# Me.version() # 1.0
# print(20191015225859, me._Me__sex) # F
)
code(Var)
return

::pr::
>^c::
t := A_YYYY . A_MM . A_DD . A_Hour . A_Min . A_Sec
Var =
(
print(%t%, )
)
code(Var)
SendInput, {left}
return


::py.socket::
::socket::
Var =
(
import socket

EOL1= b'\n\n'
EOL2= b'\n\r\n'
body = ''' 
	<h1>hello,world!</h1>
'''

response_params = [
	'HTTP/1.0 200 OK',
	'Date: Sun, 27 may 2018 01:01:01 GMT',
	'Content-Type: text/html;charset=utf-8',
	'Content-Length: {}\r\n'.format(len(body.encode())),
	body,
]

response = '\r\n'.join(response_params)

def handle_connection(conn, addr):
	request = b""
	while EOL1 not in request and EOL2 not in request:
		request += conn.recv(1024)
	print(request)
	# response 转为 bytes 后传输
	conn.send(response.encode()) 
	conn.close()

def main():
	# socket.AF_INET 用于服务器与服务器之间的网络通信
	# socket.SCOK_STREAM 用于基于TCP的流式 socket 通信
	serversocket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
	# # 设置端口可复用，保证我们每次都按 ctrl + c 组合键之后，快速重启
	serversocket.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
	serversocket.bind(('127.0.0.1', 8000))
	# # 设置 backlog socket 连接最大排队数量
	serversocket.listen(5)
	print('http://127.0.0.1:8000')

	try:
		while True:
			conn, address = serversocket.accept()
			handle_connection(conn, address)
	finally:
		serversocket.close()

if __name__ == '__main__':
	main()
)
code(Var)
return

::py.sleep::
::py.delay::
::sleep::
::wait::
::delay::
Var =
(
import time
time.sleep(100)
)
code(Var)
return

::ptry::
::pytry::
:?:py.try::
::try::
Var =
(
try:
    fh = open('testfile', 'w')
    fh.write('这是一个测试文件，用于测试异常!!')
except Exception as e:
   print('Exception 万能异常' + e.message)
else:
    print('没有发生异常的话执行这里：内容写入文件成功')
    fh.close()
finally:
	print('退出try时总会执行')
)
code(Var)
Return

:*:ipp::
_sendInput("python --pylab")
return

::f::
::func::
::def::
t := A_YYYY . A_MM . A_DD . A_Hour . A_Min . A_Sec
Var =
(
def showme():
	print(%t%, )
)
code(Var)
SendInput, {UP}
SendInput, {left 3}
Sendinput, ^+{left}
return


::f*::
::def*::
Var =
(
def showme(name, *info):
	print(name)
	for a in info:
		print(a)

showme("Lee", 1,2,3,4)
)
code(Var)
return

::f**::
::def**::
Var =
(
def showme(**info):
	for b in info:
		print(b, info[b])

showme(name='tanggu', sex=1)
)
code(Var)
return


!/::
!'::
Var =
(
'''  '''
)
code(Var)
SendInput, {left 4}
return

::imp::
::from::
::fom::
InputBox, OutputVar, title, enter a name?,,,,,,,,utils
Var =
(
from %OutputVar% import showme, name
)
code(Var)
SendInput, ^+{left 2}
return

::imp*::
InputBox, OutputVar, title, enter a name?,,,,,,,,utils
Var =
(
from %OutputVar% import *
)
code(Var)
SendInput, ^+{left 2}
return

::path::
::sys::
Var =
(
import sys

print(20191015231813, sys.path)
)
code(Var)
return

::bs::
::bs4::
Var =
(
from bs4 import BeautifulSoup

soup = BeautifulSoup("""
	<!DOCTYPE html>
	<html lang="en">
	<head>
	    <meta charset="UTF-8">
	    <title>Document</title>
	</head>
	<body>
	    <div id="app"></div>
	</body>
	</html>
""", "html.parser")

print(20191016112437, soup.html.head)
)
code(Var)
return
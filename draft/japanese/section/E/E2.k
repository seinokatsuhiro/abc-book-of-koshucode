** -*- koshu -*-
**
**  題名
**    甲州記法の ABC - E 条件による選択
**
**  使用法
**    koshu E2.k
**

|-- ABC  /a 1  /b 2  /c 3    ** /a = 1  /b = 2
|-- ABC  /a 1  /b 4  /c 5    ** /a = 1
|-- ABC  /a 3  /b 2  /c 5    **         /b = 2
|-- ABC  /a 4  /b 7  /c 3
|-- ABC  /a 2  /b 7  /c 7

abc : source ABC /a /b /c
e2  : abc | keep /a = 1

|== E2 : e2


** -*- koshu -*-
**
**  題名
**    甲州記法の ABC - D 計算式の名前
**
**  使用法
**    koshu D.k
**

|-- ABC  /a 1  /b 2  /c 3
|-- ABC  /a 1  /b 4  /c 5
|-- ABC  /a 3  /b 2  /c 5
|-- ABC  /a 4  /b 7  /c 3
|-- ABC  /a 2  /b 7  /c 7

abc  : source ABC /a /b /c
abcd : abc | add /d ( /a + /b + /c )

affirm ABCD abcd


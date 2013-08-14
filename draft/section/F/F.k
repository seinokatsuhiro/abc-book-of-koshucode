** -*- koshu -*-
**
**  題名
**    甲州記法の ABC - F 肯定判断と否定判断
**
**  使用法
**    koshu F.k
**

|-- ABC  /a 1  /b 2  /c 3
|-- ABC  /a 1  /b 4  /c 5
|-- ABC  /a 3  /b 2  /c 5
|-- ABC  /a 4  /b 7  /c 3
|-- ABC  /a 2  /b 7  /c 7

abc  : source ABC /a /b /c
eq   : abc | hold ( /a + /b =  /c )
neq  : abc | hold ( /a + /b <> /c )

affirm A-PLUS-B-EQ-C eq
deny   A-PLUS-B-EQ-C neq


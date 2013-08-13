** -*- koshu -*-
**
**  題名
**    甲州記法の ABC - M 共通部分と直積
**
**  使用法
**    koshu M.k
**

|-- X  /a 'A1  /b 'B1
|-- X  /a 'A1  /b 'B2
|-- X  /a 'A2  /b 'B3

|-- Y  /a 'A1  /b 'B2
|-- Y  /a 'A2  /b 'B3
|-- Y  /a 'A3  /b 'B3

|-- Z  /c 'C1
|-- Z  /c 'C2
|-- Z  /c 'C3

x  : source X /a /b
y  : source Y /a /b
z  : source Z /c

xy : x | meet y
xz : x | meet z

affirm XY  xy
affirm XZ  xz


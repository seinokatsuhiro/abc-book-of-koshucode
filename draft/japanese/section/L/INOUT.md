# I/O list of koshu

- koshu  [L.k](#lk)



## [L.k](L.k)

```
** -*- koshu -*-
**
**  題名
**    甲州記法の ABC - L 交わり
**
**  使用法
**    koshu L.k
**

|-- X  /a 'A1  /b 'B1    ** X と Y の両方が成立
|-- X  /a 'A1  /b 'B2    ** X と Y の両方が成立 (Y はふたつ成立)
|-- X  /a 'A2  /b 'B3    ** X のみ成立

|-- Y  /b 'B1  /c 'C1    ** X と Y の両方が成立
|-- Y  /b 'B2  /c 'C3    ** X と Y の両方が成立
|-- Y  /b 'B2  /c 'C4    ** X と Y の両方が成立
|-- Y  /b 'B4  /c 'C4    ** Y のみ成立

x : source X /a /b
y : source Y /b /c
z : x | meet y

|== Z  : z

|== YX : y | meet x    ** 判断集合 Z に同じ (可換性)
|== XX : x | meet x    ** 判断集合 X に同じ (べき等性)

```

Command `koshu L.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    L.k
**

|-- Z  /c 'C1  /a 'A1  /b 'B1
|-- Z  /c 'C4  /a 'A1  /b 'B2
|-- Z  /c 'C3  /a 'A1  /b 'B2

*** 3 judges

|-- YX  /a 'A1  /b 'B1  /c 'C1
|-- YX  /a 'A1  /b 'B2  /c 'C3
|-- YX  /a 'A1  /b 'B2  /c 'C4

*** 3 judges

|-- XX  /a 'A1  /b 'B1
|-- XX  /a 'A1  /b 'B2
|-- XX  /a 'A2  /b 'B3

*** 3 judges

**
**  SUMMARY
**       3 judges on XX
**       3 judges on YX
**       3 judges on Z
**       9 judges in total
**
```



## command

This document is produced by the command:

```
koshu-inout.sh -s -g
```

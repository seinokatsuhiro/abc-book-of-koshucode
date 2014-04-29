# I/O list of koshu

- koshu  [C.k](#ck)



## [C.k](C.k)

```
** -*- koshu -*-
**
**  題名
**    甲州記法の ABC - C 判断集合
**
**  使用法
**    koshu C.k
**

**  判断

|-- ABC  /a 1  /b 2  /c 3
|-- ABC  /a 1  /b 4  /c 5
|-- ABC  /a 3  /b 2  /c 5
|-- ABC  /a 4  /b 7  /c 3      ** 1 回目
|-- ABC  /a 2  /b 7  /c 7
|-- ABC  /a 4  /b 7  /c 3      ** 2 回目
|-- ABC  /b 7  /c 3  /a 4      ** 3 回目

**  計算式

|== ABCD :
  source ABC /a /b /c
    | add /d ( /a + /b + /c )

```

Command `koshu C.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    C.k
**

|-- ABCD  /d 6  /a 1  /b 2  /c 3
|-- ABCD  /d 10  /a 1  /b 4  /c 5
|-- ABCD  /d 10  /a 3  /b 2  /c 5
|-- ABCD  /d 14  /a 4  /b 7  /c 3
|-- ABCD  /d 16  /a 2  /b 7  /c 7

*** 5 judges

**
**  SUMMARY
**       5 judges on ABCD
**       5 judges in total
**
```



## command

This document is produced by the command:

```
koshu-inout.sh -s -g
```

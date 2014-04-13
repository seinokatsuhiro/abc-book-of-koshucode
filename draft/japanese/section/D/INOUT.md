# I/O list of koshu

- koshu  [D.k](#dk)



## [D.k](D.k)

```
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

|== ABCD : abcd

```

Command `koshu D.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    D.k
**

|-- ABCD  /d 6  /a 1  /b 2  /c 3
|-- ABCD  /d 10  /a 1  /b 4  /c 5
|-- ABCD  /d 10  /a 3  /b 2  /c 5
|-- ABCD  /d 14  /a 4  /b 7  /c 3
|-- ABCD  /d 16  /a 2  /b 7  /c 7

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

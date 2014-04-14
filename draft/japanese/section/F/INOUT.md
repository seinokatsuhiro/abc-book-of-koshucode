# I/O list of koshu

- koshu  [F.k](#fk)



## [F.k](F.k)

```
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
eq   : abc | keep ( /a + /b =  /c )
neq  : abc | keep ( /a + /b <> /c )

|== A-PLUS-B-EQ-C : eq
|=X A-PLUS-B-EQ-C : neq

```

Command `koshu F.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    F.k
**

|-- A-PLUS-B-EQ-C  /a 1  /b 2  /c 3
|-- A-PLUS-B-EQ-C  /a 1  /b 4  /c 5
|-- A-PLUS-B-EQ-C  /a 3  /b 2  /c 5

|-X A-PLUS-B-EQ-C  /a 4  /b 7  /c 3
|-X A-PLUS-B-EQ-C  /a 2  /b 7  /c 7

**
**  SUMMARY
**       5 judges on A-PLUS-B-EQ-C
**       5 judges in total
**
```



## command

This document is produced by the command:

```
koshu-inout.sh -s -g
```

# I/O List

- koshu [H.k](#hk)



## [H.k](H.k)

```
** -*- koshu -*-
**
**  題名
**    甲州記法の ABC - H 判断の書き方
**
**  使用法
**    koshu H.k
**

|-- ABC  /a 1  /b 2  /c 3
|-- ABC  /a 1  /b 4  /c 5  /d 10
|-- ABC  /a 3  /b 2
|-- ABC  /a /b () /c
|-- ABC  /a 10 000  /b -20 000  /c + 30000.00
|-- ABC  /a 'one  /b 'two  /c 'three
|-- ABC  /a 'one  /b "two"
         /c "one plus two"
|-- ABC  /a #true  /b #false

|== ABC : source ABC /a /b /c

```

Command `koshu H.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    H.k
**

|-- ABC  /a 1  /b 2  /c 3
|-- ABC  /a 1  /b 4  /c 5
|-- ABC  /a 3  /b 2  /c ()
|-- ABC  /a ()  /b ()  /c ()
|-- ABC  /a 10 000  /b -20 000  /c 30 000.00

|-- ABC  /a 'one  /b 'two  /c 'three
|-- ABC  /a 'one  /b 'two  /c "one plus two"
|-- ABC  /a #true  /b #false  /c ()

*** 8 judges

**
**  SUMMARY
**       8 judges on ABC
**       8 judges in total
**
```



## command

This document is produced by the command:

```
koshu-inout.sh -s -g koshu
```

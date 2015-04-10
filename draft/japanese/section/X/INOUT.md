# I/O List

- koshu [X.k](#xk)



## [X.k](X.k)

```
** -*- koshu -*-
**
**  題名
**    甲州記法の ABC - X 関係と関数
**
**  使用法
**    koshu X.k
**

|-- XY  /x 15  /y 6
|-- XY  /x 15  /y 5
|-- XY  /x 15  /y 4
|-- XY  /x 15  /y 3
|-- XY  /x 15  /y 2
|-- XY  /x 15  /y 1
|-- XY  /x 15  /y 0

|== QR
  | source XY /x /y
  | keep /y <> 0
  | add  /q ( /x quo /y )
         /r ( /x rem /y )
  --forward /x /y

```

Command `koshu X.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    X.k
**
**  OUTPUT
**    <stdout>
**

|-- QR  /x 15  /y 6  /q 2  /r 3
|-- QR  /x 15  /y 5  /q 3  /r 0
|-- QR  /x 15  /y 4  /q 3  /r 3
|-- QR  /x 15  /y 3  /q 5  /r 0
|-- QR  /x 15  /y 2  /q 7  /r 1

|-- QR  /x 15  /y 1  /q 15  /r 0

*** 6 judges

**
**  SUMMARY
**       6 judges on QR
**       6 judges in total
**
```



## command

This document is produced by the command:

```
koshu-inout.sh -s -g koshu
```

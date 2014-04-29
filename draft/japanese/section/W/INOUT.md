# I/O list of koshu-w

- koshu-w  [W.k](#wk)



## [W.k](W.k)

```
** -*- koshu -*-
**
**  題名
**    甲州記法の ABC - W 甲州計算機の拡張
**
**  使用法
**    cabal sandbox init --sandbox=KOSHUCODE-SANDBOX
**    cabal build
**    ./dist/build/koshu-w/koshu-w W.k
**

|-- XY  /x 15  /y 4
|-- XY  /x 15  /y 3
|-- XY  /x 15  /y 2
|-- XY  /x 15  /y 1
|-- XY  /x 15  /y 0

xy   : source XY /x /y
xyqr : divide /x /y /q /r

|== QR -fore /x /y
  | xy | xyqr

|== QR-MAYBE -fore /x /y
  | xy | maybe xyqr

```

Command `koshu-w W.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    W.k
**

|-- QR  /x 15  /y 4  /q 3  /r 3
|-- QR  /x 15  /y 3  /q 5  /r 0
|-- QR  /x 15  /y 2  /q 7  /r 1
|-- QR  /x 15  /y 1  /q 15  /r 0

|-- QR-MAYBE  /x 15  /y 4  /q 3  /r 3

|-- QR-MAYBE  /x 15  /y 3  /q 5  /r 0
|-- QR-MAYBE  /x 15  /y 2  /q 7  /r 1
|-- QR-MAYBE  /x 15  /y 1  /q 15  /r 0
|-- QR-MAYBE  /x 15  /y 0  /q ()  /r ()

**
**  SUMMARY
**       4 judges on QR
**       5 judges on QR-MAYBE
**       9 judges in total
**
```



## command

This document is produced by the command:

```
koshu-inout.sh -s -g -p koshu-w
```

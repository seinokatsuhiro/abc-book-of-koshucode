# I/O list of koshu

- koshu  [M.k](#mk)



## [M.k](M.k)

```
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

|== XY : xy
|== XZ : xz

```

Command `koshu M.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    M.k
**

|-- XY  /a 'A1  /b 'B2
|-- XY  /a 'A2  /b 'B3

|-- XZ  /c 'C3  /a 'A1  /b 'B1
|-- XZ  /c 'C2  /a 'A1  /b 'B1
|-- XZ  /c 'C1  /a 'A1  /b 'B1

|-- XZ  /c 'C3  /a 'A1  /b 'B2
|-- XZ  /c 'C2  /a 'A1  /b 'B2
|-- XZ  /c 'C1  /a 'A1  /b 'B2
|-- XZ  /c 'C3  /a 'A2  /b 'B3
|-- XZ  /c 'C2  /a 'A2  /b 'B3

|-- XZ  /c 'C1  /a 'A2  /b 'B3

**
**  SUMMARY
**       2 judges on XY
**       9 judges on XZ
**      11 judges in total
**
```



## command

This document is produced by the command:

```
koshu-inout.sh -s -g
```

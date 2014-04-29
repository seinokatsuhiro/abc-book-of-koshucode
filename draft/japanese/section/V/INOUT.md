# I/O list of koshu

- koshu  [V.k](#vk)



## [V.k](V.k)

```
** -*- koshu -*-
**
**  題名
**    甲州記法の ABC - V 所属関係
**
**  使用法
**    koshu V.k
**

**  member

|-- MEMBER  /x 1  /xs { 1 : 3 : 5 }
|-- MEMBER  /x 3  /xs { 1 : 3 : 5 }
|-- MEMBER  /x 5  /xs { 1 : 3 : 5 }

**  検査

|-- A  /x 1  /xs { 1 : 3 : 5 }
|-- A  /x 2  /xs { 1 : 3 : 5 }
|-- A  /x 3  /xs { 1 : 3 : 5 }
|-- A  /x 4  /xs { 1 : 3 : 5 }

|== A-MEET
  | source A /x /xs
  | meet ( source MEMBER /x /xs )

|== A-MEM
  | source A /x /xs
  | member /x /xs

**  展開

|-- B  /xs { 1 : 3 : 5 }
|-- B  /xs { 2 : 4 }

|== B-MEET
  | source B /xs
  | meet ( source MEMBER /x /xs )

|== B-MEM
  | source B /xs
  | member /x /xs

```

Command `koshu V.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    V.k
**

|-- A-MEET  /x 1  /xs { 1 : 3 : 5 }
|-- A-MEET  /x 3  /xs { 1 : 3 : 5 }

*** 2 judges

|-- A-MEM  /x 1  /xs { 1 : 3 : 5 }
|-- A-MEM  /x 3  /xs { 1 : 3 : 5 }

*** 2 judges

|-- B-MEET  /x 5  /xs { 1 : 3 : 5 }
|-- B-MEET  /x 3  /xs { 1 : 3 : 5 }
|-- B-MEET  /x 1  /xs { 1 : 3 : 5 }

*** 3 judges

|-- B-MEM  /x 1  /xs { 1 : 3 : 5 }
|-- B-MEM  /x 3  /xs { 1 : 3 : 5 }
|-- B-MEM  /x 5  /xs { 1 : 3 : 5 }
|-- B-MEM  /x 2  /xs { 2 : 4 }
|-- B-MEM  /x 4  /xs { 2 : 4 }

*** 5 judges

**
**  SUMMARY
**       2 judges on A-MEET
**       2 judges on A-MEM
**       3 judges on B-MEET
**       5 judges on B-MEM
**      12 judges in total
**
```



## command

This document is produced by the command:

```
koshu-inout.sh -s -g
```

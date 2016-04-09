# I/O List

- koshu [P.k](#pk)



## [P.k](P.k)

```
** -*- koshu -*-
**
**  題名
**    甲州記法の ABC - P 関係の集合
**
**  使用法
**    koshu P.k
**

|-- ROP-INDEX  /file "P.k"  /rop 'cut
|-- ROP-INDEX  /file "P.k"  /rop 'keep
|-- ROP-INDEX  /file "P.k"  /rop 'dee
|-- ROP-INDEX  /file "P.k"  /rop 'dum
|-- ROP-INDEX  /file "P.k"  /rop 'source

index            : source ROP-INDEX /file /rop

**  項目 /file /rop をもつ関係

index-cut        : index | keep /rop = 'cut
index-delete     : index | keep /rop = 'delete

|== INDEX-CUT    | index-cut
|== INDEX-DELETE | index-delete

**  項目をもたない関係

some-cut         : index-cut    | cut /file /rop
some-delete      : index-delete | cut /file /rop

|== SOME-CUT     : some-cut
|== SOME-DELETE  : some-delete

**  事前に定義された無項関係

|== DUM : dum
|== DEE : dee

**  結びを使った dee

|-- A  /a 1
|-- B  /b 1

a : source A /a
b : source B /b
c : a | join b
d : a | meet b

|== C : c
|== D : d

```

Command `koshu P.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    P.k
**
**  OUTPUT
**    <stdout>
**

|-- INDEX-CUT  /file "P.k"  /rop 'cut

*** 1 judge 

*** no judges

|-- SOME-CUT

*** 1 judge 

*** no judges

*** no judges

|-- DEE

*** 1 judge 

|-- C

*** 1 judge 

|-- D  /b 1  /a 1

*** 1 judge 

**
**  SUMMARY
**       1 judge  on C
**       1 judge  on D
**       1 judge  on DEE
**      no judges on DUM
**       1 judge  on INDEX-CUT
**      no judges on INDEX-DELETE
**       1 judge  on SOME-CUT
**      no judges on SOME-DELETE
**       5 judges in total
**
```



## command

This document is produced by the command:

```
koshu-inout.sh -s -g koshu
```

# I/O List

- koshu [U.k](#uk)



## [U.k](U.k)

```
** -*- koshu -*-
**
**  題名
**    甲州記法の ABC - U リストと集合
**
**  使用法
**    koshu U.k
**

**  内容の重複

|-- A  /x [ 'source : 'pick : 'source ]
|-- A  /x { 'source : 'pick : 'source }

|== A : source A /x

**  内容の順序

|-- B  /x [ 'ベーグル : 'クロワッサン ]
|-- B  /x { 'ベーグル : 'クロワッサン }

|== B
  | source B /x
  | add /a ( /x = [ 'クロワッサン : 'ベーグル ] )
        /b ( /x = { 'クロワッサン : 'ベーグル } )

```

Command `koshu U.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    U.k
**
**  OUTPUT
**    <stdout>
**

|-- A  /x [ 'source : 'pick : 'source ]
|-- A  /x { 'source : 'pick }

*** 2 judges

|-- B  /a <0>  /b <0>  /x [ 'ベーグル : 'クロワッサン ]
|-- B  /a <0>  /b <1>  /x { 'ベーグル : 'クロワッサン }

*** 2 judges

**
**  SUMMARY
**       2 judges on A
**       2 judges on B
**       4 judges in total
**
```



## command

This document is produced by the command:

```
koshu-inout.sh -s -g koshu
```

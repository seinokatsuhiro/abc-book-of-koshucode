# I/O List

- koshu [R.k](#rk)



## [R.k](R.k)

```
** -*- koshu -*-
**
**  題名
**    甲州記法の ABC - R たぶん
**
**  使用法
**    koshu R.k
**

**  ROP-INDEX
**    ファイル /file のなかで演算子 /rop を使っている。

|-- ROP-INDEX  /file 'R.k  /rop 'meet
|-- ROP-INDEX  /file 'R.k  /rop 'maybe
|-- ROP-INDEX  /file 'R.k  /rop 'source

**  ROP
**    演算子 /rop は、手短かに、/desc と説明される。

|-- ROP  /rop 'maybe   /desc "片側の関係が成立しなくてもよい交わり"
|-- ROP  /rop 'meet    /desc "ふたつの関係の交わりを計算する"

index  : source ROP-INDEX /file /rop
rop    : source ROP /rop /desc

|== DESC   : index | meet  rop  --forward /file /rop
|== DESC-2 : index | maybe rop  --forward /file /rop
```

Command `koshu R.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    R.k
**
**  OUTPUT
**    <stdout>
**

|-- DESC  /file 'R.k  /rop 'meet  /desc 'ふたつの関係の交わりを計算する
|-- DESC  /file 'R.k  /rop 'maybe  /desc '片側の関係が成立しなくてもよい交わり

*** 2 judges

|-- DESC-2  /file 'R.k  /rop 'meet  /desc 'ふたつの関係の交わりを計算する
|-- DESC-2  /file 'R.k  /rop 'maybe  /desc '片側の関係が成立しなくてもよい交わり
|-- DESC-2  /file 'R.k  /rop 'source

*** 3 judges

**
**  SUMMARY
**       2 judges on DESC
**       3 judges on DESC-2
**       5 judges in total
**
```



## command

This document is produced by the command:

```
koshu-inout.sh -s -g koshu
```

# I/O List

- [../ROP.k](#ropk)
- koshu ../ROP.k [K.k](#kk)



## [../ROP.k](../ROP.k)

```
** -*- koshu -*-
**
**  題名
**    関係写像演算子の手短かな説明
**
**  ROP
**    <<< 関係写像演算子 /rop の機能概要は /desc と説明される。 >>>
**

|-- ROP  /rop 'add     /desc "項目の内容を計算し、新しい項目を追加する"
|-- ROP  /rop 'both    /desc "どちらかがの関係が成立すればよい交わり"
|-- ROP  /rop 'cut     /desc "指定された項目を取り除く"
|-- ROP  /rop 'dee     /desc "無項万有関係"
|-- ROP  /rop 'dum     /desc "無項空関係"
|-- ROP  /rop 'group   /desc "交わり部分関係を新しい項目として追加する"
|-- ROP  /rop 'join    /desc "ふたつの関係の結びを計算する"
|-- ROP  /rop 'keep    /desc "条件をみたす組を選び出す"
|-- ROP  /rop 'maybe   /desc "片側の関係が成立しなくてもよい交わり"
|-- ROP  /rop 'meet    /desc "ふたつの関係の交わりを計算する"
|-- ROP  /rop 'member  /desc "集合と要素の間の所属関係を検査する"
|-- ROP  /rop 'pick    /desc "指定された項目を選び出す"
|-- ROP  /rop 'rename  /desc "項目名を変更する"
|-- ROP  /rop 'source  /desc "判断集合を関係として読み出す"

```



## [K.k](K.k)

```
** -*- koshu -*-
**
**  題名
**    甲州記法の ABC - K 判断の連結
**
**  使用法
**    koshu K.k ../ROP.k
**

rop   : source ROP /rop /desc        ** 演算子の説明
index : source ROP-INDEX /file /rop  ** 演算子の索引
desc  : index | meet rop             ** index と rop の交わり

|== DESC : desc

**
**  ROP-INDEX
**    ファイル /file のなかで関係演算子 /rop を使用している。
**  

|-- ROP-INDEX  /file "B.k"   /rop 'add
|-- ROP-INDEX  /file "B.k"   /rop 'source
|-- ROP-INDEX  /file "C.k"   /rop 'add
|-- ROP-INDEX  /file "C.k"   /rop 'source
|-- ROP-INDEX  /file "D.k"   /rop 'add
|-- ROP-INDEX  /file "D.k"   /rop 'source
|-- ROP-INDEX  /file "E.k"   /rop 'keep
|-- ROP-INDEX  /file "E.k"   /rop 'source
|-- ROP-INDEX  /file "E2.k"  /rop 'keep
|-- ROP-INDEX  /file "E2.k"  /rop 'source
|-- ROP-INDEX  /file "E3.k"  /rop 'keep
|-- ROP-INDEX  /file "E3.k"  /rop 'source
|-- ROP-INDEX  /file "E4.k"  /rop 'add
|-- ROP-INDEX  /file "E4.k"  /rop 'source
|-- ROP-INDEX  /file "F.k"   /rop 'keep
|-- ROP-INDEX  /file "F.k"   /rop 'source

```

Command `koshu ../ROP.k K.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    ../ROP.k
**    K.k
**
**  OUTPUT
**    <stdout>
**

|-- DESC  /desc "項目の内容を計算し、新しい項目を追加する"  /file "B.k"  /rop 'add
|-- DESC  /desc "判断集合を関係として読み出す"  /file "B.k"  /rop 'source
|-- DESC  /desc "項目の内容を計算し、新しい項目を追加する"  /file "C.k"  /rop 'add
|-- DESC  /desc "判断集合を関係として読み出す"  /file "C.k"  /rop 'source
|-- DESC  /desc "項目の内容を計算し、新しい項目を追加する"  /file "D.k"  /rop 'add

|-- DESC  /desc "判断集合を関係として読み出す"  /file "D.k"  /rop 'source
|-- DESC  /desc "条件をみたす組を選び出す"  /file "E.k"  /rop 'keep
|-- DESC  /desc "判断集合を関係として読み出す"  /file "E.k"  /rop 'source
|-- DESC  /desc "条件をみたす組を選び出す"  /file "E2.k"  /rop 'keep
|-- DESC  /desc "判断集合を関係として読み出す"  /file "E2.k"  /rop 'source

|-- DESC  /desc "条件をみたす組を選び出す"  /file "E3.k"  /rop 'keep
|-- DESC  /desc "判断集合を関係として読み出す"  /file "E3.k"  /rop 'source
|-- DESC  /desc "項目の内容を計算し、新しい項目を追加する"  /file "E4.k"  /rop 'add
|-- DESC  /desc "判断集合を関係として読み出す"  /file "E4.k"  /rop 'source
|-- DESC  /desc "条件をみたす組を選び出す"  /file "F.k"  /rop 'keep

|-- DESC  /desc "判断集合を関係として読み出す"  /file "F.k"  /rop 'source

*** 16 judges

**
**  SUMMARY
**      16 judges on DESC
**      16 judges in total
**
```



## command

This document is produced by the command:

```
koshu-inout.sh -s -g koshu ../ROP.k
```

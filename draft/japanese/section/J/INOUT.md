# I/O List

- [../ROP.k](#/ropk)
- koshu ../ROP.k [J.k](#jk)



## [../ROP.k](../ROP.k)

```
** -*- koshu -*-
**
**  題名
**    関係写像演算子の手短かな説明
**

|-- ROP  /rop 'add         /desc '項目の内容を計算し、新しい項目を追加する
|-- ROP  /rop 'both        /desc 'どちらかがの関係が成立すればよい交わり
|-- ROP  /rop 'cut         /desc '指定された項目を取り除く
|-- ROP  /rop 'dee         /desc '無項万有関係
|-- ROP  /rop 'dum         /desc '無項空関係
|-- ROP  /rop 'group       /desc '交わり部分関係を新しい項目として追加する
|-- ROP  /rop 'join        /desc 'ふたつの関係の結びを計算する
|-- ROP  /rop 'keep        /desc '条件をみたす組を選び出す
|-- ROP  /rop 'maybe       /desc '片側の関係が成立しなくてもよい交わり
|-- ROP  /rop 'meet        /desc 'ふたつの関係の交わりを計算する
|-- ROP  /rop 'member      /desc '集合と要素の間の所属関係を検査する
|-- ROP  /rop 'pick        /desc '指定された項目を選び出す
|-- ROP  /rop 'rename      /desc '項目名を変更する
|-- ROP  /rop 'source      /desc '判断集合を関係として読み出す

```



## [J.k](J.k)

```
** -*- koshu -*-
**
**  題名
**    甲州記法の ABC - J 入力の分割と合併
**
**  使用法
**    koshu J.k ../ROP.k
**

|== ROP
  | source ROP /rop /desc
  | keep /rop = 'source
      or /rop = 'keep

```

Command `koshu ../ROP.k J.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    ../ROP.k
**    J.k
**

|-- ROP  /rop 'keep  /desc '条件をみたす組を選び出す
|-- ROP  /rop 'source  /desc '判断集合を関係として読み出す

*** 2 judges

**
**  SUMMARY
**       2 judges on ROP
**       2 judges in total
**
```



## command

This document is produced by the command:

```
koshu-inout.sh -s -g koshu ../ROP.k
```

# I/O list of koshu

- [../ROP.k](#/ropk)
- koshu ../ROP.k [Q.k](#qk)



## [../ROP.k](../ROP.k)

```
** -*- koshu -*-
**
**  題名
**    関係写像演算子の手短かな説明
**
**  注意書き
**    affirm と deny は、関係を判断集合に変換する演算子のため、
**    関係写像演算子ではありません。source は関係を出力し、したがって、
**    関係計算式のなかに書けるため、関係写像演算子として扱っています。
**

|-- ROP  /rop 'add         /desc '項目の内容を計算し、新しい項目を追加する
|-- ROP  /rop 'cut         /desc '指定された項目を取り除く
|-- ROP  /rop 'group       /desc '交わり部分関係を新しい項目として追加する
|-- ROP  /rop 'join        /desc 'ふたつの関係の結びを計算する
|-- ROP  /rop 'keep        /desc '条件をみたす組を選び出す
|-- ROP  /rop 'maybe       /desc '片側の関係が成立しなくてもよい交わり
|-- ROP  /rop 'maybe-both  /desc 'どちらかがの関係が成立すればよい交わり
|-- ROP  /rop 'meet        /desc 'ふたつの関係の交わりを計算する
|-- ROP  /rop 'member      /desc '集合と要素の間の所属関係を検査する
|-- ROP  /rop 'pick        /desc '指定された項目を選び出す
|-- ROP  /rop 'reldee      /desc '無項万有関係
|-- ROP  /rop 'reldum      /desc '無項空関係
|-- ROP  /rop 'rename      /desc '項目名を変更する
|-- ROP  /rop 'source      /desc '判断集合を関係として読み出す

```



## [Q.k](Q.k)

```
** -*- koshu -*-
**
**  題名
**    甲州記法の ABC - Q 項目名の変更
**
**  使用法
**    koshu Q.k ../ROP.k
**

**  ROP-INDEX
**    ファイル /file のなかで演算子 /operator を使っている。

|-- ROP-INDEX  /file 'Q.k  /operator 'meet
|-- ROP-INDEX  /file 'Q.k  /operator 'rename
|-- ROP-INDEX  /file 'Q.k  /operator 'source

**  /operator を /rop に項目名変更
index : source ROP-INDEX /file /operator
      | rename /rop /operator

rop   : source ROP /rop /desc
desc  : index | meet rop

|== DESC -fore /file /rop : desc

```

Command `koshu ../ROP.k Q.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    ../ROP.k
**    Q.k
**

|-- DESC  /file 'Q.k  /rop 'meet  /desc 'ふたつの関係の交わりを計算する
|-- DESC  /file 'Q.k  /rop 'rename  /desc '項目名を変更する
|-- DESC  /file 'Q.k  /rop 'source  /desc '判断集合を関係として読み出す

**
**  SUMMARY
**       3 judges on DESC
**       3 judges in total
**
```



## command

This document is produced by the command:

```
koshu-inout.sh -s -g ../ROP.k
```

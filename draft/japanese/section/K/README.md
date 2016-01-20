# K. 判断の連結


[J. 入力の分割と合併][J] で関係写像演算子を
手短かに説明したデータ [`ROP.k`][ROP.k] を扱いました。
そのデータには判断種 `ROP` (relation-mapping operator、関係写像演算子)
がついており、

 - 関係写像演算子 `/rop 'add` の機能は、手短かに、
   `/desc '項目の内容を計算し、新しい項目を追加する` と説明される。

という解釈に対応していました。
このデータを、これまでの例で使った演算子と組み合わせてみましょう。
本の索引のように、どこで、どの演算子が使用されているかを述べた

 - ファイル `/file 'B.k` のなかで関係演算子
   `/rop 'add` を使用している。

のようなパターンを判断種 `ROP-INDEX` であらわします。
これらのふたつの判断を連結させると、
ふたつの判断に項目 `/rop` が共有されているので、
`/file` `/rop` と `/rop` `/desc` を合併した
`/file` `/rop` `/desc` の 3 つの項目をもつ判断になります。

 - ファイル `/file 'B.k` のなかで関係写像演算子 `/rop 'add` を使用しており、
   その演算子の機能は、`/desc '項目の内容を計算し、新しい項目を追加する`
   と説明される。

いま、A から G までのファイルを調べると、
`ROP-INDEX` をみたす判断は、つぎのようになります。

```text
|-- ROP-INDEX  /file 'B.k   /rop 'add
|-- ROP-INDEX  /file 'B.k   /rop 'source
|-- ROP-INDEX  /file 'C.k   /rop 'add
|-- ROP-INDEX  /file 'C.k   /rop 'source
|-- ROP-INDEX  /file 'D.k   /rop 'add
|-- ROP-INDEX  /file 'D.k   /rop 'source
|-- ROP-INDEX  /file 'E.k   /rop 'keep
|-- ROP-INDEX  /file 'E.k   /rop 'source
|-- ROP-INDEX  /file 'E2.k  /rop 'keep
|-- ROP-INDEX  /file 'E2.k  /rop 'source
|-- ROP-INDEX  /file 'E3.k  /rop 'keep
|-- ROP-INDEX  /file 'E3.k  /rop 'source
|-- ROP-INDEX  /file 'E4.k  /rop 'add
|-- ROP-INDEX  /file 'E4.k  /rop 'source
|-- ROP-INDEX  /file 'F.k   /rop 'keep
|-- ROP-INDEX  /file 'F.k   /rop 'source
```

判断種 `ROP-INDEX` と `ROP` との判断集合を関係として読み込み、
関係写像演算子 `meet` を使って、それらを連結させます。
この計算は `ROP-INDEX` に対して `ROP` にある説明を追加する
というように想像できます。

```text
rop   : source ROP /rop /desc        ** 演算子の説明
index : source ROP-INDEX /file /rop  ** 演算子の索引
desc  : index | meet rop             ** index と rop の交わり

|== DESC : desc
```

この判断集合と計算式を含む [`K.k`][K.k] と、
関係写像演算子の説明 [`ROP.k`][ROP.k] をいっしょにして、
甲州計算機を実行します。

* [koshu K.k ../ROP.k]

計算結果として、項目 `/desc` `/file` `/rop` をもつ判断が出力されます。

```text
** -*- koshu -*-
**  
**  INPUT
**    K.k
**    ../ROP.k
**    

|-- DESC  /desc '項目の内容を計算し、新しい項目を追加する  /file 'B.k  /rop 'add
|-- DESC  /desc '判断集合を関係として読み出す  /file 'B.k  /rop 'source
|-- DESC  /desc '項目の内容を計算し、新しい項目を追加する  /file 'C.k  /rop 'add
|-- DESC  /desc '判断集合を関係として読み出す  /file 'C.k  /rop 'source
|-- DESC  /desc '項目の内容を計算し、新しい項目を追加する  /file 'D.k  /rop 'add

|-- DESC  /desc '判断集合を関係として読み出す  /file 'D.k  /rop 'source
|-- DESC  /desc '条件をみたす組を選び出す  /file 'E.k  /rop 'keep
|-- DESC  /desc '判断集合を関係として読み出す  /file 'E.k  /rop 'source
|-- DESC  /desc '条件をみたす組を選び出す  /file 'E2.k  /rop 'keep
|-- DESC  /desc '判断集合を関係として読み出す  /file 'E2.k  /rop 'source

|-- DESC  /desc '条件をみたす組を選び出す  /file 'E3.k  /rop 'keep
|-- DESC  /desc '判断集合を関係として読み出す  /file 'E3.k  /rop 'source
|-- DESC  /desc '項目の内容を計算し、新しい項目を追加する  /file 'E4.k  /rop 'add
|-- DESC  /desc '判断集合を関係として読み出す  /file 'E4.k  /rop 'source
|-- DESC  /desc '条件をみたす組を選び出す  /file 'F.k  /rop 'keep

|-- DESC  /desc '判断集合を関係として読み出す  /file 'F.k  /rop 'source

**  
**  SUMMARY
**      16 judges on DESC
**      16 judges in total
**
```

判断としては、項目がどのような順番で並んでいても解釈の違いを生じませんが、
人が読むときは、`/desc` `/file` `/rop` よりも
`/file` `/rop` `/desc` という順番の方が読みやすいでしょう。
判断集合を出力するときに項目の順番を指定する方法は
[`Q.k`][Q.k] に説明されています。


[J]:     ../J
[K.k]:   K.k
[Q.k]:   ../Q/Q.k
[ROP.k]: ../ROP.k
[koshu K.k ../ROP.k]: INOUT.md

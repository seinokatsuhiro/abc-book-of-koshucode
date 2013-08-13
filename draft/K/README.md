# K. 判断の連結


前節で関係写像演算子を手短かに説明したデータ [`ROP.k`][ROP.k] を扱いました。
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

``` text
|-- ROP-INDEX  /file 'B.k   /rop 'add
|-- ROP-INDEX  /file 'B.k   /rop 'source
|-- ROP-INDEX  /file 'C.k   /rop 'add
|-- ROP-INDEX  /file 'C.k   /rop 'source
|-- ROP-INDEX  /file 'D.k   /rop 'add
|-- ROP-INDEX  /file 'D.k   /rop 'source
|-- ROP-INDEX  /file 'E.k   /rop 'hold
|-- ROP-INDEX  /file 'E.k   /rop 'source
|-- ROP-INDEX  /file 'E2.k  /rop 'hold
|-- ROP-INDEX  /file 'E2.k  /rop 'source
|-- ROP-INDEX  /file 'E3.k  /rop 'hold
|-- ROP-INDEX  /file 'E3.k  /rop 'source
|-- ROP-INDEX  /file 'E4.k  /rop 'add
|-- ROP-INDEX  /file 'E4.k  /rop 'source
|-- ROP-INDEX  /file 'F.k   /rop 'hold
|-- ROP-INDEX  /file 'F.k   /rop 'source
```

判断種 `ROP` と `ROP-INDEX` の判断集合を関係として読み込み、
関係写像演算子 `meet` を使って、それらを連結させます。

``` text
rop   : source ROP /rop /desc        ** 演算子の説明
index : source ROP-INDEX /file /rop  ** 演算子の索引
desc  : rop | meet index             ** rop と index の交わり

affirm DESC desc
```

この判断集合と計算式を含む [`K.k`][K.k] と、
関係写像演算子の説明 [`ROP.k`][ROP.k] をいっしょにして、
甲州計算機を実行します。

``` sh
$ koshu K.k ../ROP.k
```

計算結果として、項目 `/file` `/rop` `/desc` をもつ判断が出力されます。

``` text
** -*- koshu -*-
**  
**  INPUT
**    K.k
**    ../ROP.k
**    

|-- DESC  /file 'E4.k  /rop 'add  /desc '項目の内容を計算し、新しい項目を追加する
|-- DESC  /file 'D.k  /rop 'add  /desc '項目の内容を計算し、新しい項目を追加する
|-- DESC  /file 'C.k  /rop 'add  /desc '項目の内容を計算し、新しい項目を追加する
|-- DESC  /file 'B.k  /rop 'add  /desc '項目の内容を計算し、新しい項目を追加する
|-- DESC  /file 'F.k  /rop 'hold  /desc '条件をみたす組を選び出す

|-- DESC  /file 'E3.k  /rop 'hold  /desc '条件をみたす組を選び出す
|-- DESC  /file 'E2.k  /rop 'hold  /desc '条件をみたす組を選び出す
|-- DESC  /file 'E.k  /rop 'hold  /desc '条件をみたす組を選び出す
|-- DESC  /file 'F.k  /rop 'source  /desc '判断集合を関係として読み出す
|-- DESC  /file 'E4.k  /rop 'source  /desc '判断集合を関係として読み出す

|-- DESC  /file 'E3.k  /rop 'source  /desc '判断集合を関係として読み出す
|-- DESC  /file 'E2.k  /rop 'source  /desc '判断集合を関係として読み出す
|-- DESC  /file 'E.k  /rop 'source  /desc '判断集合を関係として読み出す
|-- DESC  /file 'D.k  /rop 'source  /desc '判断集合を関係として読み出す
|-- DESC  /file 'C.k  /rop 'source  /desc '判断集合を関係として読み出す

|-- DESC  /file 'B.k  /rop 'source  /desc '判断集合を関係として読み出す

**  
**  SUMMARY
**      16 judges on DESC
**      16 judges in total
**
```


[K.k]:   https://github.com/seinokatsuhiro/abc-book-of-koshucode/blob/master/draft/K/K.k
[ROP.k]: https://github.com/seinokatsuhiro/abc-book-of-koshucode/blob/master/draft/ROP.k


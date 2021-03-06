# R. たぶん


この節では、ファイルと演算子の例題で、
情報の欠落がある場合を取り上げます。
ファイル [`R.k`][R.k] のなかで使っている演算子を一覧すると、
つぎのようになります。

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ { .koshu .input }
**  ROP-INDEX
**    ファイル /file のなかで演算子 /rop を使っている。

|-- ROP-INDEX  /file "R.k"  /rop 'meet
|-- ROP-INDEX  /file "R.k"  /rop 'maybe
|-- ROP-INDEX  /file "R.k"  /rop 'source
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

いま、演算子の手短かな説明のなかに、
`source` の説明がないとしましょう。

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ { .koshu .input }
**  ROP
**    演算子 /rop は、手短かに、/desc と説明される。

|-- ROP  /rop 'maybe   /desc "片側の関係が成立しなくてもよい交わり"
|-- ROP  /rop 'meet    /desc "ふたつの関係の交わりを計算する"
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

この `ROP-INDEX` と `ROP` の交わりを計算します。

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ { .koshu .input }
index : source ROP-INDEX /file /rop
rop   : source ROP /rop /desc

|== DESC : index | meet rop  --forward /file /rop
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

そうすると、`ROP` 側に `/rop 'source` の情報がないため、
つぎのふたつの判断だけが出力されます。

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ { .koshu .output }
|-- DESC  /file "R.k"  /rop 'meet  /desc "ふたつの関係の交わりを計算する"
|-- DESC  /file "R.k"  /rop 'maybe  /desc "片側の関係が成立しなくてもよい交わり"
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

しかし、`/desc` を空にしてもよいので、
`/rop 'source` についての判断を出力したい場合もあるでしょう。
そのためには、

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ { .koshu .input }
|== DESC-2 : index | maybe rop  --forward /file /rop
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

のように演算子 `meet` の代わりに `maybe` を使うことで、
`/desc` が空となる判断を出力できます。

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ { .koshu .output }
|-- DESC-2  /file "R.k"  /rop 'meet  /desc "ふたつの関係の交わりを計算する"
|-- DESC-2  /file "R.k"  /rop 'maybe  /desc "片側の関係が成立しなくてもよい交わり"
|-- DESC-2  /file "R.k"  /rop 'source
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

一般に、`x | meet y` は、`x` と `y` の両方が成り立つときのみ、
出力関係に含まれるのに対して、
`x | maybe y` は、`x` が成り立つけど `y` が成り立たない場合も、
`y` 側の項目内容を空番 `()` にした関係を出力します。
空番を内容にもつ項目は、判断として出力するときに省略されるため、
`/file` と `/rop` だけになります。

判断種 `DESC-2` は、

 - ファイル `/file` のなかで演算子 `/rop` を使っていて、
   その演算子は、手短かに、`/desc` と説明される。

というデータ解釈に対応しますが、
ちょうど、「何々が 0 個ある」という数を使った表現を、
「何々がない」という自然な表現に置き換えるように、
もし `/desc ()` ならば、

 - ファイル `/file` のなかで演算子 `/rop` を使っているが、
   その演算子の手短かな説明 `/desc` はない。

というデータ解釈として読めるでしょう。

`/desc ()` であるときは、`/desc` についての
**全称否定** が成立しているといえます。
全称否定というのは、つぎのような判断を考えたとき、

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ { .koshu }
|-- ROP  /rop 'source  /desc ???
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

`???` になにを入れても成り立たないということです。
甲州記法では，明示的に書かれていない判断は、
その否定が成り立っていると考えます。
もし、否定判断を書き出そうとするなら、
考えうるあらゆる項目内容を `/desc` に与えた
`ROP` の否定が延々と続いていると想像できます。

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ { .koshu }
|-X ROP  /rop 'source  /desc "片側の関係が成立しなくてもよい交わり"
|-X ROP  /rop 'source  /desc "ふたつの関係の交わりを計算する"
|-X ROP  /rop 'source  /desc "ぶどう狩りをする"
|-X ROP  /rop 'source  /desc "ワインの飲みくらべ"
|-X ROP  /rop 'source  /desc ...
... ... ...
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


[R.k]:   ../R/R.k


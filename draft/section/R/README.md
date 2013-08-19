# R. たぶん


この節では、ファイルと演算子の例題で、
情報の欠落がある場合を取り上げます。
ファイル [`R.k`][R.k] のなかで使っている演算子を一覧すると、
つぎのようになります。

``` text
**  ROP-INDEX
**    ファイル /file のなかで演算子 /rop を使っている。

|-- ROP-INDEX  /file 'R.k  /rop 'meet
|-- ROP-INDEX  /file 'R.k  /rop 'maybe
|-- ROP-INDEX  /file 'R.k  /rop 'source
```

いま、演算子の手短かな説明のなかに、
`source` の説明がないとしましょう。

``` text
**  ROP
**    演算子 /rop は、手短かに、/desc と説明される。

|-- ROP  /rop 'maybe  /desc '片側の関係が成立しなくてもよい交わり
|-- ROP  /rop 'meet   /desc 'ふたつの関係の交わりを計算する
```

この `ROP-INDEX` と `ROP` の交わりを計算します。

``` text
index : source ROP-INDEX /file /rop
rop   : source ROP /rop /desc

affirm DESC  index | meet rop
```

そうすると、`ROP` 側に `/rop 'source` の情報がないため、
つぎのふたつの判断だけが出力されます。

``` text
|-- DESC  /desc 'ふたつの関係の交わりを計算する  /file 'R.k  /rop 'meet
|-- DESC  /desc '片側の関係が成立しなくてもよい交わり  /file 'R.k  /rop 'maybe
```

しかし、`/desc` を空にしてもよいので、
`/rop 'source` についての判断を出力したい場合もあるでしょう。
そのためには、

``` text
affirm DESC-2  index | maybe rop
```

のように演算子 `meet` の代わりに `maybe` を使うことで、
`/desc` が空となる判断を出力できます。
項目内容が空になることは、 **ニル** という記号であらわされ、
甲州記法では `()` と書かれます。

``` text
|-- DESC-2  /desc 'ふたつの関係の交わりを計算する  /file 'R.k  /rop 'meet
|-- DESC-2  /desc '片側の関係が成立しなくてもよい交わり  /file 'R.k  /rop 'maybe
|-- DESC-2  /desc ()  /file 'R.k  /rop 'source
```

一般に、`x | meet y` は、`x` と `y` の両方が成り立つときのみ、
出力結果が得られるのに対して、
`x | maybe y` は、`x` が成り立つけど `y` が成り立たない場合も、
`y` 側の項目内容を `()` にして、出力結果に含めます。

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

``` text
|-- ROP  /rop 'source  /desc ???
```

`???` になにを入れても成り立たないということです。
甲州記法では，明示的に書かれていない判断は、
その否定が成り立っていると考えます。
もし、否定判断を書き出そうとするなら、
考えうるあらゆる項目内容を `/desc` に与えた
`ROP` の否定が延々と続いていると想像できます。

``` text
|-X ROP  /rop 'source  /desc '片側の関係が成立しなくてもよい交わり
|-X ROP  /rop 'source  /desc 'ふたつの関係の交わりを計算する
|-X ROP  /rop 'source  /desc 'ぶどう狩りをする
|-X ROP  /rop 'source  /desc 'ワインの飲みくらべ
|-X ROP  /rop 'source  /desc ...
... ... ...
```


[R.k]:   https://github.com/seinokatsuhiro/abc-of-koshucode/blob/master/draft/section/R/R.k


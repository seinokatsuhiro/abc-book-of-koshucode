# O. 項目の抜き出し


判断集合を読み出す演算子 `source` は、
指定された項目をもつ関係を出力します。
たとえば、`source ROP-INDEX /file /rop` は
ふたつの項目 `/file` `/rop` をもつ関係を出力します。

``` text
index : source ROP-INDEX /file /rop
```

この式でつぎの判断集合を読み出します。

``` text
**  ROP-INDEX
**    ファイル /file のなかで関係写像演算子 /rop を使用している。

|-- ROP-INDEX  /file 'O.k  /rop 'cut
|-- ROP-INDEX  /file 'O.k  /rop 'join
|-- ROP-INDEX  /file 'O.k  /rop 'pick
|-- ROP-INDEX  /file 'O.k  /rop 'source
```

この節では、関係から特定の項目を抜き出して、
項目を減らす演算子 `pick` と `cut` を取り上げます。

 - 関係写像演算子 `pick` は、入力の関係を、
   指定された項目のみをもつ関係に変換します。

 - 関係写像演算子 `cut` は、入力の関係を、
   指定された項目を取り除いた関係に変換します。


## pick

関係 `index` は項目 `/file` `/rop` をもっており、
これを項目 `/rop` だけの関係に変換するには、
`pick /rop` を使います。

``` text
affirm PICK  index | pick /rop
```

この式の計算結果は、つぎのようになります。

``` text
|-- PICK  /rop 'cut
|-- PICK  /rop 'join
|-- PICK  /rop 'pick
|-- PICK  /rop 'source
```


## cut

項目 `/rop` を取り除くには、`cut /rop` を使います。

``` text
affirm CUT  index | cut /rop
```

項目 `/rop` を除くと `/file` だけが残ります。
いま、`/file` の内容は `'O.k` しかないので、
ひとつの判断だけが出力されます。

``` text
|-- CUT  /file 'O.k
```

この判断は、対応する `/rop` があるときのみ成り立つので、
つぎのデータ解釈に対応しています。

 - ファイル `/file 'O.k` のなかで
   なんらかの関係写像演算子が使われている。


## join

ここで、結び `join` を使って
`pick` と同等の計算を行ってみましょう。
結びは項目を減らす機能があるので、
項目を抜き出す計算ができそうだということが予想されます。
結びは集合の合併の一般化なので、
集合 `S` と空集合 `E` の合併は、
つねに、`S` 自身になることを利用します。
空集合の代わりに、項目 `/rop` をもつ空の関係との結びをとれば、
相手の関係に組を追加せずに項目 `/rop` を抜き出せます。

空の関係は、存在しない判断を読み出すことでつくりましょう。
いま、`PHANTOM` という判断はないので、
`source PHANTOM /rop` が
項目 `/rop` だけの空関係になります。

``` text
affirm JOIN  index | join ( source PHANTOM /rop )
```

計算結果は、`pick /rop` と同じになります。

``` text
|-- JOIN  /rop 'cut
|-- JOIN  /rop 'join
|-- JOIN  /rop 'pick
|-- JOIN  /rop 'source
```


## 無項関係

`cut` で `/rop` を取り除くだけでなく、
`/file` も取り除いたら項目がなくなります。
このような関係は **無項関係** とよばれます。
実際に、計算式を書くと、予想どおり、
すべての項目が取り除かれた判断がひとつ出力されます。

``` text
affirm CUT-ALL  index | cut /file /rop
```
``` text
|-- CUT-ALL
```

`pick` に項目を与えずに使用したときも、
同じようになります。

``` text
affirm PICK-NON  index | pick
```
``` text
|-- PICK-NON
```

つぎの節では、このような無項関係について調べましょう。


[O.k]:   https://github.com/seinokatsuhiro/abc-book-of-koshucode/blob/master/draft/O/O.k


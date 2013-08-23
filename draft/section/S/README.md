# S. 交わり部分関係


この節では、関係のなかの項目に、また、関係があるという、
**入れ子の関係** を使った計算を行います。


## 関係の分割

題材は、ふたたび、`ROP-INDEX` を使い、
`O.k` から `S.k` までの索引があるとします。

``` text
|-- ROP-INDEX  /file 'O.k  /rop 'cut
|-- ROP-INDEX  /file 'O.k  /rop 'join
|-- ROP-INDEX  /file 'O.k  /rop 'pick
|-- ROP-INDEX  /file 'O.k  /rop 'source

    ... ... ...

|-- ROP-INDEX  /file 'S.k  /rop 'group
|-- ROP-INDEX  /file 'S.k  /rop 'pick
|-- ROP-INDEX  /file 'S.k  /rop 'source
```

この判断集合を関係として読み込んだら、
その関係を `/file` ごとの小さな関係に分割してみましょう。
そのために、まず、`/file` だけをもつ関係をつくります。

``` text
index : source ROP-INDEX /file /rop
file  : index | pick /file
```

つぎに、この関係 `file` で関係 `index` を分割し、
分割結果の関係を項目 `/r` として追加します。

``` text
file-group : file | group /r index
```

`index` は `file` の各組と交わり可能な部分関係、
つまり、 **交わり部分関係** に分割されます。
この場合、共有項目 `/file` を使って、
`'O.k` から `'S.k` の 5 つに分割されます。
それを

``` text
affirm FILE-GROUP -fore /file | file-group
```

で書き出すと、つぎのようになります。
場所をとりすぎないように、`/file 'O.k` についてだけ整形して示し、
残りの判断は途中を省略します。

``` text
|-- FILE-GROUP  /file 'O.k
                /r {| /file : /rop
                    | 'O.k  : 'source
                    | 'O.k  : 'pick
                    | 'O.k  : 'join
                    | 'O.k  : 'cut
                    |}

|-- FILE-GROUP  /file 'P.k  /r {| /file : /rop | 'P.k : 'source | ... |}
|-- FILE-GROUP  /file 'Q.k  /r {| /file : /rop | 'Q.k : 'source | ... |}
|-- FILE-GROUP  /file 'R.k  /r {| /file : /rop | 'R.k : 'source | ... |}
|-- FILE-GROUP  /file 'S.k  /r {| /file : /rop | 'S.k : 'source | ... |}
```

項目 `/r` の内容は関係をあらわす **関係リテラル** になっており、
関係がどのような項目をもつかを記述した **見出し** と
それぞれの項目の内容を記述した **組** の集合を `|` で区切り、
`{|` と `|}` で囲んだ式で表現されます。

``` text
{| 見出し | 組 | 組 | 組 | ... |}
```

項目を `:` で区切ってあらわします。
すべて同じ数だけ区切られていなければなりません。

``` text
{| 項目 : 項目 | 内容 : 内容 | 内容 : 内容 | ... |}
```

`/file : /rop` の順番を入れ替えた `/rop : /file` として、
各組の内容もその順番に合わせれば、見た目が違う同一の関係になります。
`'O.k : 'pick` が先頭にあるというように、組の順番が違うときも、
見た目が違う同一の関係です。


## 判断集合と関係

いままで、判断集合を `source` で関係として読み込み、
関係を `affirm` または `deny` で判断集合として書き出すと説明してきました。
これは、具体的には、

``` text
|-- ROP-INDEX  /file 'O.k  /rop 'cut
|-- ROP-INDEX  /file 'O.k  /rop 'join
|-- ROP-INDEX  /file 'O.k  /rop 'pick
|-- ROP-INDEX  /file 'O.k  /rop 'source
```

という判断集合を `source ROP-INDEX /file /rop` で読み込むと、
下のような関係になり、この関係を `affirm ROP-INDEX` で書き出すと、
上の判断集合にもどることを意味します。

``` text
{| /file : /rop
 | 'O.k  : 'source
 | 'O.k  : 'pick
 | 'O.k  : 'join
 | 'O.k  : 'cut
 |}
```

判断と関係には、つぎのような違いがあります。

 - 判断は判断種をもつが、関係はもたない。

 - 判断は項目の過不足があってもよいが、関係は項目が揃っていなければならない。

 - 判断は、自然言語 (日本語など) であらわされたのデータ解釈に比べて、
   より記号的であり、関係は判断より、さらに記号的であり、
   その結果として関係は計算に向いている。

 - 判断は関係より論理学的であり、関係は判断より数学的 (代数的) である。


[S.k]:   https://github.com/seinokatsuhiro/abc-of-koshucode/blob/master/draft/section/S/S.k

<!-- ------------------------------------------------------------------
|-- TERM  /ja0 'い  /ja '入れ子の関係    /en "nested relation"
|-- TERM  /ja0 'か  /ja '関係リテラル    /en "literal of relation"
|-- TERM  /ja0 'く  /ja '組              /en "tuple"
|-- TERM  /ja0 'ま  /ja '交わり部分関係  /en "meetable subrelation"
|-- TERM  /ja0 'み  /ja '見出し          /en "heading"
------------------------------------------------------------------- -->


# T. 項目内容リスト


[S. 交わり部分関係][S] では、各ファイル `/file` ごとに、
項目 `/file` と `/rop` をもつ入れ子の関係 `/r` をつくり、
つぎのような判断として書き出されていました。

```text
|-- FILE-GROUP  /file 'O.k
                /r {| /file : /rop
                    | 'O.k  : 'source
                    | 'O.k  : 'pick
                    | 'O.k  : 'join
                    | 'O.k  : 'cut
                    |}
```

この節では、入れ子の関係の項目を抜き出す方法を取り上げます。
上の例から、項目 `/rop` の内容だけを抜き出して、
ファイルごとの演算子のリストをつくりましょう。

```text
|-- FILE-ROPS
      /file 'O.k
      /rops [ 'source : 'pick : 'join : 'cut ]
```

そのためには `/r/rop` という項目名をつなげた式を使います。
`/r/rop` は、項目 `/r` が関係で、そのなかの項目 `/rop`
の内容をすべて取り出すということを意味します。

```text
index      : source ROP-INDEX /file /rop
file       : index | pick  /file
file-group : file  | group /r index
file-rops  : file-group
           | add /rops ( /r/rop )
           | cut /r

|== FILE-ROPS : file-rops
  --forward /file
```

`/rop` の内容をリストとして取り出したあと、
`cut /r` で関係 `/r` を取り除いているので、
その結果は `/file` と `/rops` のみをもつ関係になります。
この計算式を含む [`T.k`][T.k] を実行すると、
つぎのような計算結果が出力されます。

```text
|-- FILE-ROPS  /file 'O.k  /rops [ 'source : 'pick : 'join : 'cut ]
|-- FILE-ROPS  /file 'P.k  /rops [ 'source : 'dum : 'dee : 'keep : 'cut ]
|-- FILE-ROPS  /file 'Q.k  /rops [ 'source : 'rename : 'meet ]
|-- FILE-ROPS  /file 'R.k  /rops [ 'source : 'maybe : 'meet ]
|-- FILE-ROPS  /file 'S.k  /rops [ 'source : 'pick : 'group ]
```

この出力結果が示しているように、演算子の **リスト**
は演算子の名前をコロン `:` で区切り、
全体を角括弧 `[`...`]` に囲んで表現されます。
`{|`...`|}` が **関係** をあらわすのに対して、
括弧の種類が異なると、別の種類のデータになります。

[U. リストと集合][U] では、リストのような複数の内容を束ねる機能を調べましょう。


[S]:     ../S
[T.k]:   T.k
[U]:     ../U


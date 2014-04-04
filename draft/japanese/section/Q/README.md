# Q. 項目名の変更


この本で繰り返し使用しているファイルと演算子の例題で、
いままで、演算子の項目名を `/rop` としていましたが、
ここでは、`/operator` になっているとしましょう。

```text
**  ROP-INDEX
**    ファイル /file のなかで演算子 /operator を使っている。

|-- ROP-INDEX  /file 'Q.k  /operator 'meet
|-- ROP-INDEX  /file 'Q.k  /operator 'rename
|-- ROP-INDEX  /file 'Q.k  /operator 'source
```

これと、つぎの判断集合 `ROP` との交わりを計算したいのですが、
一方の項目名が `/operator` で、他方の項目名が `/rop` なので、
このままでは、共有項目になりません。

```text
|-- ROP  /rop 'meet        /desc 'ふたつの関係の交わりを計算する
|-- ROP  /rop 'pick        /desc '指定された項目を取り除く
|-- ROP  /rop 'reldee      /desc '無項万有関係
|-- ROP  /rop 'reldum      /desc '無項空関係
|-- ROP  /rop 'rename      /desc '項目名を変更する
|-- ROP  /rop 'source      /desc '判断集合を関係として読み出す
```

項目名が合わないときは、演算子 `rename` を使って
項目名 `/operator` を `/rop` に変更するか、その逆の変更をします。
`/rename 変更後 変更前 ...` のように変更後を先に書きます。
複数の項目を同時に変更するときは、
`|--` で判断を書くときと同じように、繰り返して書けます。

```text
**  /operator を /rop に項目名変更
index : source ROP-INDEX /file /operator
      | rename /rop /operator
```

このように項目名を変更すると、
`/rop` を共有項目として
`/file` `/rop` と `/rop` `/desc`
を組み合わせる関係を計算できます。

```text
rop   : source ROP /rop /desc
desc  : index | meet rop
```

この関係 `desc` を判断集合に変換して書き出すときに、
出力結果が読みやすくなるように項目の順番を指定しましょう。
`|== DESC` のうしろに `-fore` オプションを書くと、
指定した項目を先頭に移動させた判断が出力されます。
`-fore /file /rop` のように指定することで、
先頭が `/file` で 2 番目が `/rop` になります。

```text
|== DESC -fore /file /rop : desc
```

これらをファイル [`Q.k`][Q.k] に保存し、つぎのコマンド

```sh
$ koshu Q.k ../ROP.k
```

で計算を実行すると、計算結果は、つぎのようになります。

```text
** -*- koshu -*-
**
**  INPUT
**    Q.k
**    ../ROP.k
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


[Q.k]:   ../Q/Q.k


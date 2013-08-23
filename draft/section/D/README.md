# D. 計算式の名前


入力データから種類 `ABC` の判断を読み込み、
それに項目 `/d` を追加し、種類 `ABCD` の判断として
出力するという計算式は、つぎのように書けます。

``` text
affirm ABCD
  | source ABC /a /b /c
  | add /d ( /a + /b + /c )
```

これを、(1) 読み込み、(2) 計算、
(3) 書き出しに分けて書いてみましょう。
まず、判断集合を読み込む式に `abc` という名前をつけます。
計算式に名前をつけるときは、コロン `:` の左に名前、
右に計算式を書きます。

``` text
abc : source ABC /a /b /c
```

つぎに、`abc` の計算結果に対して、
項目 `/d` を追加するという計算式に
`abcd` という名前をつけます。

``` text
abcd : abc | add /d ( /a + /b + /c )
```

最後に、この `abcd` の計算結果に、
判断の種類をあらわす記号 `ABCD` をつけて書き出します。

``` text
affirm ABCD | abcd
```

この名前つき計算式を含む [`D.k`][D.k] を入力として
甲州計算機を実行します。

``` sh
$ koshu D.k
```

計算式に名前をつけて分解しただけなので、
前節と同じ結果が出力されます。

```
** -*- koshu -*-
**  
**  INPUT
**    D.k
**    

|-- ABCD  /d 6  /a 1  /b 2  /c 3
|-- ABCD  /d 10  /a 1  /b 4  /c 5
|-- ABCD  /d 10  /a 3  /b 2  /c 5
|-- ABCD  /d 14  /a 4  /b 7  /c 3
|-- ABCD  /d 16  /a 2  /b 7  /c 7

**  
**  SUMMARY
**       5 judges on ABCD
**       5 judges in total
**
```

[D.k]:  https://github.com/seinokatsuhiro/abc-of-koshucode/blob/master/draft/section/D/D.k


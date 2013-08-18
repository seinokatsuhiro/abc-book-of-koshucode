# E. 条件による選択


この節では、特定の条件をみたすデータを選び出すという計算を行います。
例として、つぎの判断集合から、項目 `/a` と `/b`
がそれぞれ `1` と `2` である判断を選びます。

``` text
|-- ABC  /a 1  /b 2  /c 3    ** /a = 1  /b = 2
|-- ABC  /a 1  /b 4  /c 5    ** /a = 1
|-- ABC  /a 3  /b 2  /c 5    **         /b = 2
|-- ABC  /a 4  /b 7  /c 3
|-- ABC  /a 2  /b 7  /c 7
```

演算子 `hold` は条件をみたす組だけを残します。
つぎの例では、`hold` に対して、`|` の左から 5 つの組がわたされ、
その各組に対して、`/a = 1 and /b = 2` を計算し、
この条件をみたす組を選びます。

``` text
abc  : source ABC /a /b /c
abc2 : abc | hold /a = 1 and /b = 2
```

`abc2` の計算結果を `ABC2` という種類の判断として書き出します。

``` text
affirm ABC2 abc2
```

このデータと計算式を [`E.k`][E.k] というファイルに保存して、
`koshu E.k` で甲州計算機を実行すると、
ひとつの判断だけが出力されます。

``` text
** -*- koshu -*-
**  
**  INPUT
**    E.k
**    

|-- ABC2  /a 1  /b 2  /c 3

**  
**  SUMMARY
**       1 judge  on ABC2
**       1 judge  in total
**
```


## 単独の条件

`hold` の計算式を少し変えてみましょう。
[`E2.k`][E2.k] は項目 `/a` だけの条件をもちます。

``` text
abc  : source ABC /a /b /c
abc2 : abc | hold /a = 1
```

このとき、2 つの判断が出力されます。

``` text
|-- ABC2  /a 1  /b 2  /c 3
|-- ABC2  /a 1  /b 4  /c 5
```


## または

[`E3.k`][E3.k] は `and` の代わりに `or` を使っています。
`and` は両方がみたされなければならないのに対して、
`or` はどちらか一方でかまいません。

``` text
abc  : source ABC /a /b /c
abc2 : abc | hold /a = 1 or /b = 2
```

どちらかの条件をみたす判断が出力されます。

``` text
|-- ABC2  /a 1  /b 2  /c 3
|-- ABC2  /a 1  /b 4  /c 5
|-- ABC2  /a 3  /b 2  /c 5
```


## 条件式の内容

最後に、`hold` の代わりに `add` を使って、
条件式の計算結果を確認します。

``` text
abc  : source ABC /a /b /c
abcd : abc | add /d ( /a = 1 or /b = 2 )
```

項目 `/d` は真か偽をあらわす
`#true` か `#false` になります。
真 `#true` は、特定の `/a` と `/b` に対して、
`/a = 1 or /b = 2` という式が成り立つこと、あるいは、正しいこと、
偽 `#false` は、この式が成り立たないこと、
あるいは、間違っていることをあらわします。
`hold` は `#true` の組だけを選び出します。

``` text
|-- ABCD  /d #true  /a 1  /b 2  /c 3
|-- ABCD  /d #true  /a 1  /b 4  /c 5
|-- ABCD  /d #true  /a 3  /b 2  /c 5
|-- ABCD  /d #false  /a 4  /b 7  /c 3
|-- ABCD  /d #false  /a 2  /b 7  /c 7
```


[E.k]:  https://github.com/seinokatsuhiro/abc-of-koshucode/blob/master/draft/section/E/E.k
[E2.k]: https://github.com/seinokatsuhiro/abc-of-koshucode/blob/master/draft/section/E/E2.k
[E3.k]: https://github.com/seinokatsuhiro/abc-of-koshucode/blob/master/draft/section/E/E3.k
[E4.k]: https://github.com/seinokatsuhiro/abc-of-koshucode/blob/master/draft/section/E/E4.k


# Y. 演算子索引


| 演算子 | 使用箇所 |
|:---:|:---|
| add | [`B`][B][`C`][C][`D`][D]`-``--``--`[`E4`][E4]`-``-``-``-``-``-``-``-``-``-``-``-`[`T`][T][`U`][U]`-``-`[`X`][X] |
| cut | `-``-``-``-``--``--``--``-``-``-``-``-``-``-`[`O`][O][`P`][P]`-``-``-`[`T`][T]`-``-``-``-` |
| group | `-``-``-``-``--``--``--``-``-``-``-``-``-``-``-``-``-``-`[`S`][S][`T`][T]`-``-``-``-` |
| hold | `-``-``-`[`E`][E][`E2`][E2][`E3`][E3]`--`[`F`][F]`-`[`J`][J]`-``-``-``-``-`[`P`][P]`-``-``-``-``-``-``-`[`X`][X] |
| join | `-``-``-``-``--``--``--``-``-``-``-``-``-`[`N`][N][`O`][O][`P`][P]`-``-``-``-``-``-``-``-` |
| maybe | `-``-``-``-``--``--``--``-``-``-``-``-``-``-``-``-``-`[`R`][R]`-``-``-``-`[`W`][W]`-` |
| meet | `-``-``-``-``--``--``--``-``-``-`[`K`][K][`L`][L][`M`][M][`N`][N]`-`[`P`][P][`Q`][Q][`R`][R]`-``-``-`[`V`][V]`-``-` |
| member | `-``-``-``-``--``--``--``-``-``-``-``-``-``-``-``-``-``-``-``-``-`[`V`][V]`-``-` |
| pick | `-``-``-``-``--``--``--``-``-``-``-``-``-``-`[`O`][O]`-``-``-`[`S`][S][`T`][T]`-``-``-``-` |
| reldee | `-``-``-``-``--``--``--``-``-``-``-``-``-``-``-`[`P`][P]`-``-``-``-``-``-``-``-` |
| reldum | `-``-``-``-``--``--``--``-``-``-``-``-``-``-``-`[`P`][P]`-``-``-``-``-``-``-``-` |
| rename | `-``-``-``-``--``--``--``-``-``-``-``-``-``-``-``-`[`Q`][Q]`-``-``-``-``-``-``-` |
| source | [`B`][B][`C`][C][`D`][D][`E`][E][`E2`][E2][`E3`][E3][`E4`][E4][`F`][F][`H`][H][`J`][J][`K`][K][`L`][L][`M`][M][`N`][N][`O`][O][`P`][P][`Q`][Q][`R`][R][`S`][S][`T`][T][`U`][U][`V`][V][`W`][W][`X`][X] |

[`W.k`][W] で使われている `divide` は拡張演算子のため索引に含めていません。

- `add /A E ...` は、式 `E` を使って項目の内容を計算し、
  新しい項目 `/A` として追加します。

- `cut /A ...` は指定された項目 `/A ...` を取り除きます。

- `group /A R` は、関係 `R` の交わり部分関係を、
  新しい項目 `/A` として追加します。

- `hold E` は、式 `E` の計算結果が `#true` になる組を選び出します。

- `join R` は、関係 `R` との結びを計算します。

- `maybe R` は、関係 `R` との交わりを計算します。
  ただし，`R` が成立しない組み合わせも許します。

- `meet R` は、関係 `R` との交わりを計算します。

- `member /A /B` は、項目 `/B` が集合で、
  項目 `/A` がその要素であることを検査します。
  または、集合項目 `/B` からその要素 `/A` を生成します。

- `pick /A ...` は指定された項目 `/A ...` を選び出します。

- `reldee` は、無項万有関係 `{| | |}` を出力します。

- `reldum` は、無項空関係 `{| |}` を出力します。

- `rename /A /B ...` は、項目 `/B` の名称を `/A` に変更します。

- `source P /A ...` は、判断種 `P` の判断集合を、
  項目 `/A ...` をもつ関係として読み出します。


[B]: https://github.com/seinokatsuhiro/abc-of-koshucode/blob/master/draft/section/B/B.k
[C]: https://github.com/seinokatsuhiro/abc-of-koshucode/blob/master/draft/section/C/C.k
[D]: https://github.com/seinokatsuhiro/abc-of-koshucode/blob/master/draft/section/D/D.k
[E]: https://github.com/seinokatsuhiro/abc-of-koshucode/blob/master/draft/section/E/E.k
[E2]: https://github.com/seinokatsuhiro/abc-of-koshucode/blob/master/draft/section/E2/E2.k
[E3]: https://github.com/seinokatsuhiro/abc-of-koshucode/blob/master/draft/section/E3/E3.k
[E4]: https://github.com/seinokatsuhiro/abc-of-koshucode/blob/master/draft/section/E4/E4.k
[F]: https://github.com/seinokatsuhiro/abc-of-koshucode/blob/master/draft/section/F/F.k
[H]: https://github.com/seinokatsuhiro/abc-of-koshucode/blob/master/draft/section/H/H.k
[J]: https://github.com/seinokatsuhiro/abc-of-koshucode/blob/master/draft/section/J/J.k
[K]: https://github.com/seinokatsuhiro/abc-of-koshucode/blob/master/draft/section/K/K.k
[L]: https://github.com/seinokatsuhiro/abc-of-koshucode/blob/master/draft/section/L/L.k
[M]: https://github.com/seinokatsuhiro/abc-of-koshucode/blob/master/draft/section/M/M.k
[N]: https://github.com/seinokatsuhiro/abc-of-koshucode/blob/master/draft/section/N/N.k
[O]: https://github.com/seinokatsuhiro/abc-of-koshucode/blob/master/draft/section/O/O.k
[P]: https://github.com/seinokatsuhiro/abc-of-koshucode/blob/master/draft/section/P/P.k
[Q]: https://github.com/seinokatsuhiro/abc-of-koshucode/blob/master/draft/section/Q/Q.k
[R]: https://github.com/seinokatsuhiro/abc-of-koshucode/blob/master/draft/section/R/R.k
[S]: https://github.com/seinokatsuhiro/abc-of-koshucode/blob/master/draft/section/S/S.k
[T]: https://github.com/seinokatsuhiro/abc-of-koshucode/blob/master/draft/section/T/T.k
[U]: https://github.com/seinokatsuhiro/abc-of-koshucode/blob/master/draft/section/U/U.k
[V]: https://github.com/seinokatsuhiro/abc-of-koshucode/blob/master/draft/section/V/V.k
[W]: https://github.com/seinokatsuhiro/abc-of-koshucode/blob/master/draft/section/W/W.k
[X]: https://github.com/seinokatsuhiro/abc-of-koshucode/blob/master/draft/section/X/X.k


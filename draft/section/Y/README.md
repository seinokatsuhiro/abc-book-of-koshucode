# Y. 演算子索引


| 演算子 | その演算子に言及している節 |
|:---:|:---:|
| add | `-`[`B`][B][`C`][C][`D`][D][`E`][E]`-``-``-``-``-``-``-``-``-``-``-``-``-``-`[`T`][T][`U`][U]`-``-`[`X`][X] |
| cut | `-``-``-``-``-``-``-``-``-``-``-``-``-``-`[`O`][O][`P`][P]`-``-``-`[`T`][T]`-``-``-``-` |
| group | `-``-``-``-``-``-``-``-``-``-``-``-``-``-``-``-``-``-`[`S`][S][`T`][T]`-``-``-``-` |
| hold | `-``-``-``-`[`E`][E][`F`][F]`-``-``-`[`J`][J]`-``-``-``-``-`[`P`][P]`-``-``-``-``-``-``-`[`X`][X] |
| join | `-``-``-``-``-``-``-``-``-``-``-``-``-`[`N`][N][`O`][O][`P`][P]`-``-``-``-``-``-``-``-` |
| maybe | `-``-``-``-``-``-``-``-``-``-``-``-``-``-``-``-``-`[`R`][R]`-``-``-``-`[`W`][W]`-` |
| meet | `-``-``-``-``-``-``-``-``-``-`[`K`][K][`L`][L][`M`][M][`N`][N]`-`[`P`][P][`Q`][Q][`R`][R]`-``-``-`[`V`][V]`-``-` |
| member | `-``-``-``-``-``-``-``-``-``-``-``-``-``-``-``-``-``-``-``-``-`[`V`][V]`-``-` |
| pick | `-``-``-``-``-``-``-``-``-``-``-``-``-``-`[`O`][O]`-``-``-`[`S`][S][`T`][T]`-``-``-``-` |
| reldee | `-``-``-``-``-``-``-``-``-``-``-``-``-``-``-`[`P`][P]`-``-``-``-``-``-``-``-` |
| reldum | `-``-``-``-``-``-``-``-``-``-``-``-``-``-``-`[`P`][P]`-``-``-``-``-``-``-``-` |
| rename | `-``-``-``-``-``-``-``-``-``-``-``-``-``-``-``-`[`Q`][Q]`-``-``-``-``-``-``-` |
| source | `-`[`B`][B][`C`][C][`D`][D][`E`][E][`F`][F]`-`[`H`][H]`-`[`J`][J][`K`][K][`L`][L][`M`][M][`N`][N][`O`][O][`P`][P][`Q`][Q][`R`][R][`S`][S][`T`][T][`U`][U][`V`][V][`W`][W][`X`][X] |

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


[A]: https://github.com/seinokatsuhiro/abc-of-koshucode/blob/master/draft/section/A
[B]: https://github.com/seinokatsuhiro/abc-of-koshucode/blob/master/draft/section/B
[C]: https://github.com/seinokatsuhiro/abc-of-koshucode/blob/master/draft/section/C
[D]: https://github.com/seinokatsuhiro/abc-of-koshucode/blob/master/draft/section/D
[E]: https://github.com/seinokatsuhiro/abc-of-koshucode/blob/master/draft/section/E
[F]: https://github.com/seinokatsuhiro/abc-of-koshucode/blob/master/draft/section/F
[G]: https://github.com/seinokatsuhiro/abc-of-koshucode/blob/master/draft/section/G
[H]: https://github.com/seinokatsuhiro/abc-of-koshucode/blob/master/draft/section/H
[I]: https://github.com/seinokatsuhiro/abc-of-koshucode/blob/master/draft/section/I
[J]: https://github.com/seinokatsuhiro/abc-of-koshucode/blob/master/draft/section/J
[K]: https://github.com/seinokatsuhiro/abc-of-koshucode/blob/master/draft/section/K
[L]: https://github.com/seinokatsuhiro/abc-of-koshucode/blob/master/draft/section/L
[M]: https://github.com/seinokatsuhiro/abc-of-koshucode/blob/master/draft/section/M
[N]: https://github.com/seinokatsuhiro/abc-of-koshucode/blob/master/draft/section/N
[O]: https://github.com/seinokatsuhiro/abc-of-koshucode/blob/master/draft/section/O
[P]: https://github.com/seinokatsuhiro/abc-of-koshucode/blob/master/draft/section/P
[Q]: https://github.com/seinokatsuhiro/abc-of-koshucode/blob/master/draft/section/Q
[R]: https://github.com/seinokatsuhiro/abc-of-koshucode/blob/master/draft/section/R
[S]: https://github.com/seinokatsuhiro/abc-of-koshucode/blob/master/draft/section/S
[T]: https://github.com/seinokatsuhiro/abc-of-koshucode/blob/master/draft/section/T
[U]: https://github.com/seinokatsuhiro/abc-of-koshucode/blob/master/draft/section/U
[V]: https://github.com/seinokatsuhiro/abc-of-koshucode/blob/master/draft/section/V
[W]: https://github.com/seinokatsuhiro/abc-of-koshucode/blob/master/draft/section/W
[X]: https://github.com/seinokatsuhiro/abc-of-koshucode/blob/master/draft/section/X


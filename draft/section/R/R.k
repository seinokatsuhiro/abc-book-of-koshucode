** -*- koshu -*-
**
**  題名
**    甲州記法の ABC - R たぶん
**
**  使用法
**    koshu R.k
**

**  ROP-INDEX
**    ファイル /file のなかで演算子 /rop を使っている。

|-- ROP-INDEX  /file 'R.k  /rop 'meet
|-- ROP-INDEX  /file 'R.k  /rop 'maybe
|-- ROP-INDEX  /file 'R.k  /rop 'source

**  ROP
**    演算子 /rop は、手短かに、/desc と説明される。

|-- ROP  /rop 'maybe   /desc '片側の関係が成立しなくてもよい交わり
|-- ROP  /rop 'meet    /desc 'ふたつの関係の交わりを計算する

index  : source ROP-INDEX /file /rop
rop    : source ROP /rop /desc

affirm DESC    index | meet  rop
affirm DESC-2  index | maybe rop


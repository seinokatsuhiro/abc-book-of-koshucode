** -*- koshu -*-
**
**  題名
**    甲州記法の ABC - O 項目の抜き出し
**
**  使用法
**    koshu O.k
**

**  ROP-INDEX
**    ファイル /file のなかで関係写像演算子 /rop を使用している。

|-- ROP-INDEX  /file "O.k"  /rop 'cut
|-- ROP-INDEX  /file "O.k"  /rop 'join
|-- ROP-INDEX  /file "O.k"  /rop 'pick
|-- ROP-INDEX  /file "O.k"  /rop 'source

index : source ROP-INDEX /file /rop

**  項目 /rop を抜き出す
|== PICK      : index | pick /rop
|== JOIN      : index | join ( source PHANTOM /rop )

**  項目 /rop を取り除く
|== CUT       : index | cut /rop

**  すべての項目を取り除く
|== PICK-NON  : index | pick
|== CUT-ALL   : index | cut /file /rop


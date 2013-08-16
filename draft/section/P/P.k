** -*- koshu -*-
**
**  題名
**    甲州記法の ABC - P 関係の集合
**
**  使用法
**    koshu P.k
**

|-- ROP-INDEX  /file 'P.k  /rop 'cut
|-- ROP-INDEX  /file 'P.k  /rop 'hold
|-- ROP-INDEX  /file 'P.k  /rop 'reldee
|-- ROP-INDEX  /file 'P.k  /rop 'reldum
|-- ROP-INDEX  /file 'P.k  /rop 'source

index              : source ROP-INDEX /file /rop

**  項目 /file /rop をもつ関係

index-cut          : index | hold /rop = 'cut
index-delete       : index | hold /rop = 'delete

affirm INDEX-CUT    index-cut
affirm INDEX-DELETE index-delete

**  項目をもたない関係

some-cut           : index-cut    | cut /file /rop
some-delete        : index-delete | cut /file /rop

affirm SOME-CUT     some-cut
affirm SOME-DELETE  some-delete

**  事前に定義された無項関係

affirm DUM  reldum
affirm DEE  reldee

**  結びを使った reldee

|-- A  /a 1
|-- B  /b 1

a : source A /a
b : source B /b
c : a | join b
d : a | meet b

affirm C  c
affirm D  d


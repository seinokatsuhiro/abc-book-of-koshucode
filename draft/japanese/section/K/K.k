** -*- koshu -*-
**
**  題名
**    甲州記法の ABC - K 判断の連結
**
**  使用法
**    koshu K.k ../ROP.k
**

rop   : source ROP /rop /desc        ** 演算子の説明
index : source ROP-INDEX /file /rop  ** 演算子の索引
desc  : index | meet rop             ** index と rop の交わり

|== DESC : desc

**
**  ROP-INDEX
**    ファイル /file のなかで関係演算子 /rop を使用している。
**  

|-- ROP-INDEX  /file "B.k"   /rop 'add
|-- ROP-INDEX  /file "B.k"   /rop 'source
|-- ROP-INDEX  /file "C.k"   /rop 'add
|-- ROP-INDEX  /file "C.k"   /rop 'source
|-- ROP-INDEX  /file "D.k"   /rop 'add
|-- ROP-INDEX  /file "D.k"   /rop 'source
|-- ROP-INDEX  /file "E.k"   /rop 'keep
|-- ROP-INDEX  /file "E.k"   /rop 'source
|-- ROP-INDEX  /file "E2.k"  /rop 'keep
|-- ROP-INDEX  /file "E2.k"  /rop 'source
|-- ROP-INDEX  /file "E3.k"  /rop 'keep
|-- ROP-INDEX  /file "E3.k"  /rop 'source
|-- ROP-INDEX  /file "E4.k"  /rop 'add
|-- ROP-INDEX  /file "E4.k"  /rop 'source
|-- ROP-INDEX  /file "F.k"   /rop 'keep
|-- ROP-INDEX  /file "F.k"   /rop 'source


** -*- koshu -*-
**
**  題名
**    甲州記法の ABC - Q 項目名の変更
**
**  使用法
**    koshu Q.k ../ROP.k
**

**  ROP-INDEX
**    ファイル /file のなかで演算子 /operator を使っている。

|-- ROP-INDEX  /file 'Q.k  /operator 'meet
|-- ROP-INDEX  /file 'Q.k  /operator 'rename
|-- ROP-INDEX  /file 'Q.k  /operator 'source

**  /operator を /rop に項目名変更
index : source ROP-INDEX /file /operator
      | rename /rop /operator

rop   : source ROP /rop /desc
desc  : rop | meet index

affirm DESC  desc


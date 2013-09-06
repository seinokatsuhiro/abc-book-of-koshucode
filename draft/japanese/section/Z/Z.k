** -*- koshu -*-
**
**  題名
**    甲州記法の ABC - Z 用語索引
**
**  使用法
**    koshu Z.k output/SECT.k > output/INDEX.k
**

term
  | source TERM /term /furi

term-sect
  | source SECT /sect /terms
  | member /term /terms
  | cut /terms

|== INDEX -fore /furi /term
  | term
  | group /r term-sect
  | add /sects ( /r/sect )
  | cut /r


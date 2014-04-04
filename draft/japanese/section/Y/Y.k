** -*- koshu -*-
**
**  題名
**    甲州記法の ABC - Y 演算子索引
**
**  使用法
**    koshu Y.k output/ELEMENT.k > output/ROP-INDEX.k
**

|== ROP-INDEX -fore /sect
  | source KOSHU-RELMAP-ROP /res /rop
  | keep /rop <> 'id
  | add /sect ( sub-index /res 1 1 )
  | pick /rop /sect


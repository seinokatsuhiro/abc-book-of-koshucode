** -*- koshu -*-
**
**  題名
**    甲州記法の ABC - Y 演算子索引
**
**  使用法
**    koshu Y.k output/ELEMENT.k > output/ROP-INDEX.k
**

|== ROP-INDEX
  | source KOSHU-RELMAP-BASE /point /rop
  | keep /rop <> 'id
  | add /sect ( take 1 /point )
  | pick /rop /sect
  --forward /sect


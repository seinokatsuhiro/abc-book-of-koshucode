** -*- koshu -*-
**
**  題名
**    甲州記法の ABC - Y 演算子索引
**
**  使用法
**    koshu Y.k output/ELEMENT.k > output/INDEX.k
**

res-rop
  | source KOSHU-RELMAP-ROP /res /rop
  | hold /rop <> 'id
  | add /sect ( sub-index /res 1 1 )

desc
  | source ROP-DESC /rop /desc

rop
  | res-rop
  | pick /rop

|== INDEX -fore /order /rop
  | rop
  | group /g res-rop
  | add /sects ( /g/sect )
        /order '
  | cut /g


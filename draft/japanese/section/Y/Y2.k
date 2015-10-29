** -*- koshu -*-
**
**  題名
**    甲州記法の ABC - Y 演算子索引
**
**  使用法
**    koshu Y2.k output/ROP-INDEX.k > output/INDEX.k
**

sect-rop
  | source ROP-INDEX /sect /rop

rop
  | sect-rop
  | pick /rop

|== INDEX
  | rop
  | group sect-rop -to /g
  | add /sects ( /g/sect )
        /order '
  | cut /g
  --forward /order /rop


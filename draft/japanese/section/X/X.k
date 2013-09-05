** -*- koshu -*-
**
**  題名
**    甲州記法の ABC - X 関係と関数
**
**  使用法
**    koshu X.k
**

|-- XY  /x 15  /y 6
|-- XY  /x 15  /y 5
|-- XY  /x 15  /y 4
|-- XY  /x 15  /y 3
|-- XY  /x 15  /y 2
|-- XY  /x 15  /y 1
|-- XY  /x 15  /y 0

affirm QR -fore /x /y
  | source XY /x /y
  | hold /y <> 0
  | add  /q ( /x quo /y )
         /r ( /x rem /y )


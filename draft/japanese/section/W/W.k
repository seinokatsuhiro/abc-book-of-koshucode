** -*- koshu -*-
**
**  題名
**    甲州記法の ABC - W 甲州計算機の拡張
**
**  使用法
**    cabal sandbox init --sandbox=KOSHUCODE-SANDBOX
**    cabal build
**    ./dist/build/koshu-w/koshu-w W.k
**

|-- XY  /x 15  /y 4
|-- XY  /x 15  /y 3
|-- XY  /x 15  /y 2
|-- XY  /x 15  /y 1
|-- XY  /x 15  /y 0

xy   : source XY /x /y
xyqr : divide /x /y /q /r

|== QR -fore /x /y
  | xy | xyqr

|== QR-MAYBE -fore /x /y
  | xy | maybe xyqr


** -*- koshu -*-
**
**  題名
**    甲州記法の ABC - U リストと集合
**
**  使用法
**    koshu U.k
**

**  内容の重複

|-- A  /x [ 'source | 'pick | 'source ]
|-- A  /x { 'source | 'pick | 'source }

|== A : source A /x

**  内容の順序

|-- B  /x [ "ベーグル" | "クロワッサン" ]
|-- B  /x { "ベーグル" | "クロワッサン" }

|== B
  | source B /x
  | add /a ( /x = [ "クロワッサン" | "ベーグル" ] )
        /b ( /x = { "クロワッサン" | "ベーグル" } )


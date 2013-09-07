** -*- koshu -*-
**
**  題名
**    甲州記法の ABC - V 所属関係
**
**  使用法
**    koshu V.k
**

**  member

|-- MEMBER  /x 1  /xs { 1 : 3 : 5 }
|-- MEMBER  /x 3  /xs { 1 : 3 : 5 }
|-- MEMBER  /x 5  /xs { 1 : 3 : 5 }

**  検査

|-- A  /x 1  /xs { 1 : 3 : 5 }
|-- A  /x 2  /xs { 1 : 3 : 5 }
|-- A  /x 3  /xs { 1 : 3 : 5 }
|-- A  /x 4  /xs { 1 : 3 : 5 }

|== A-MEET
  | source A /x /xs
  | meet ( source MEMBER /x /xs )

|== A-MEM
  | source A /x /xs
  | member /x /xs

**  展開

|-- B  /xs { 1 : 3 : 5 }
|-- B  /xs { 2 : 4 }

|== B-MEET
  | source B /xs
  | meet ( source MEMBER /x /xs )

|== B-MEM
  | source B /xs
  | member /x /xs


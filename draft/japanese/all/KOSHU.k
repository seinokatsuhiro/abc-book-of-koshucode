** ********************************************  B.k
** -*- koshu -*-
**
**  INPUT
**    B.k
**

|-- ABCD  /d 6  /a 1  /b 2  /c 3

**
**  SUMMARY
**       1 judge  on ABCD
**       1 judge  in total
**
** ********************************************  C.k
** -*- koshu -*-
**
**  INPUT
**    C.k
**

|-- ABCD  /d 6  /a 1  /b 2  /c 3
|-- ABCD  /d 10  /a 1  /b 4  /c 5
|-- ABCD  /d 10  /a 3  /b 2  /c 5
|-- ABCD  /d 14  /a 4  /b 7  /c 3
|-- ABCD  /d 16  /a 2  /b 7  /c 7

**
**  SUMMARY
**       5 judges on ABCD
**       5 judges in total
**
** ********************************************  D.k
** -*- koshu -*-
**
**  INPUT
**    D.k
**

|-- ABCD  /d 6  /a 1  /b 2  /c 3
|-- ABCD  /d 10  /a 1  /b 4  /c 5
|-- ABCD  /d 10  /a 3  /b 2  /c 5
|-- ABCD  /d 14  /a 4  /b 7  /c 3
|-- ABCD  /d 16  /a 2  /b 7  /c 7

**
**  SUMMARY
**       5 judges on ABCD
**       5 judges in total
**
** ********************************************  E.k
** -*- koshu -*-
**
**  INPUT
**    E.k
**

|-- ABC2  /a 1  /b 2  /c 3

**
**  SUMMARY
**       1 judge  on ABC2
**       1 judge  in total
**
** ********************************************  E2.k
** -*- koshu -*-
**
**  INPUT
**    E2.k
**

|-- ABC2  /a 1  /b 2  /c 3
|-- ABC2  /a 1  /b 4  /c 5

**
**  SUMMARY
**       2 judges on ABC2
**       2 judges in total
**
** ********************************************  E3.k
** -*- koshu -*-
**
**  INPUT
**    E3.k
**

|-- ABC2  /a 1  /b 2  /c 3
|-- ABC2  /a 1  /b 4  /c 5
|-- ABC2  /a 3  /b 2  /c 5

**
**  SUMMARY
**       3 judges on ABC2
**       3 judges in total
**
** ********************************************  E4.k
** -*- koshu -*-
**
**  INPUT
**    E4.k
**

|-- ABCD  /d #true  /a 1  /b 2  /c 3
|-- ABCD  /d #true  /a 1  /b 4  /c 5
|-- ABCD  /d #true  /a 3  /b 2  /c 5
|-- ABCD  /d #false  /a 4  /b 7  /c 3
|-- ABCD  /d #false  /a 2  /b 7  /c 7

**
**  SUMMARY
**       5 judges on ABCD
**       5 judges in total
**
** ********************************************  F.k
** -*- koshu -*-
**
**  INPUT
**    F.k
**

|-- A-PLUS-B-EQ-C  /a 1  /b 2  /c 3
|-- A-PLUS-B-EQ-C  /a 1  /b 4  /c 5
|-- A-PLUS-B-EQ-C  /a 3  /b 2  /c 5
|-X A-PLUS-B-EQ-C  /a 4  /b 7  /c 3
|-X A-PLUS-B-EQ-C  /a 2  /b 7  /c 7

**
**  SUMMARY
**       5 judges on A-PLUS-B-EQ-C
**       5 judges in total
**
** ********************************************  H.k
** -*- koshu -*-
**
**  INPUT
**    H.k
**

|-- ABC  /a 1  /b 2  /c 3
|-- ABC  /a 1  /b 4  /c 5
|-- ABC  /a 3  /b 2  /c ()
|-- ABC  /a ()  /b ()  /c ()
|-- ABC  /a 10 000  /b -20 000  /c 30 000.00

|-- ABC  /a 'one  /b 'two  /c 'three
|-- ABC  /a 'one  /b 'two  /c "one plus two"
|-- ABC  /a #true  /b #false  /c ()

**
**  SUMMARY
**       8 judges on ABC
**       8 judges in total
**
** ********************************************  J.k
** -*- koshu -*-
**
**  INPUT
**    J.k
**    ../ROP.k
**

|-- ROP  /rop 'hold  /desc '条件をみたす組を選び出す
|-- ROP  /rop 'source  /desc '判断集合を関係として読み出す

**
**  SUMMARY
**       2 judges on ROP
**       2 judges in total
**
** ********************************************  K.k
** -*- koshu -*-
**
**  INPUT
**    K.k
**    ../ROP.k
**

|-- DESC  /desc "項目の内容を計算し、新しい項目を追加する"  /file 'B.k  /rop 'add
|-- DESC  /desc '判断集合を関係として読み出す  /file 'B.k  /rop 'source
|-- DESC  /desc "項目の内容を計算し、新しい項目を追加する"  /file 'C.k  /rop 'add
|-- DESC  /desc '判断集合を関係として読み出す  /file 'C.k  /rop 'source
|-- DESC  /desc "項目の内容を計算し、新しい項目を追加する"  /file 'D.k  /rop 'add

|-- DESC  /desc '判断集合を関係として読み出す  /file 'D.k  /rop 'source
|-- DESC  /desc '条件をみたす組を選び出す  /file 'E.k  /rop 'hold
|-- DESC  /desc '判断集合を関係として読み出す  /file 'E.k  /rop 'source
|-- DESC  /desc '条件をみたす組を選び出す  /file 'E2.k  /rop 'hold
|-- DESC  /desc '判断集合を関係として読み出す  /file 'E2.k  /rop 'source

|-- DESC  /desc '条件をみたす組を選び出す  /file 'E3.k  /rop 'hold
|-- DESC  /desc '判断集合を関係として読み出す  /file 'E3.k  /rop 'source
|-- DESC  /desc "項目の内容を計算し、新しい項目を追加する"  /file 'E4.k  /rop 'add
|-- DESC  /desc '判断集合を関係として読み出す  /file 'E4.k  /rop 'source
|-- DESC  /desc '条件をみたす組を選び出す  /file 'F.k  /rop 'hold

|-- DESC  /desc '判断集合を関係として読み出す  /file 'F.k  /rop 'source

**
**  SUMMARY
**      16 judges on DESC
**      16 judges in total
**
** ********************************************  L.k
** -*- koshu -*-
**
**  INPUT
**    L.k
**

|-- Z  /c 'C1  /a 'A1  /b 'B1
|-- Z  /c 'C4  /a 'A1  /b 'B2
|-- Z  /c 'C3  /a 'A1  /b 'B2
|-- YX  /a 'A1  /b 'B1  /c 'C1
|-- YX  /a 'A1  /b 'B2  /c 'C3

|-- YX  /a 'A1  /b 'B2  /c 'C4
|-- XX  /a 'A1  /b 'B1
|-- XX  /a 'A1  /b 'B2
|-- XX  /a 'A2  /b 'B3

**
**  SUMMARY
**       3 judges on XX
**       3 judges on YX
**       3 judges on Z
**       9 judges in total
**
** ********************************************  M.k
** -*- koshu -*-
**
**  INPUT
**    M.k
**

|-- XY  /a 'A1  /b 'B2
|-- XY  /a 'A2  /b 'B3
|-- XZ  /c 'C3  /a 'A1  /b 'B1
|-- XZ  /c 'C2  /a 'A1  /b 'B1
|-- XZ  /c 'C1  /a 'A1  /b 'B1

|-- XZ  /c 'C3  /a 'A1  /b 'B2
|-- XZ  /c 'C2  /a 'A1  /b 'B2
|-- XZ  /c 'C1  /a 'A1  /b 'B2
|-- XZ  /c 'C3  /a 'A2  /b 'B3
|-- XZ  /c 'C2  /a 'A2  /b 'B3

|-- XZ  /c 'C1  /a 'A2  /b 'B3

**
**  SUMMARY
**       2 judges on XY
**       9 judges on XZ
**      11 judges in total
**
** ********************************************  N.k
** -*- koshu -*-
**
**  INPUT
**    N.k
**

|-- Z  /c 'C1  /a 'A1  /b 'B1
|-- Z  /c 'C4  /a 'A1  /b 'B2
|-- Z  /c 'C3  /a 'A1  /b 'B2
|-- V  /b 'B1
|-- V  /b 'B2

|-- V  /b 'B3
|-- V  /b 'B4

**
**  SUMMARY
**       4 judges on V
**       3 judges on Z
**       7 judges in total
**
** ********************************************  O.k
** -*- koshu -*-
**
**  INPUT
**    O.k
**

|-- PICK  /rop 'cut
|-- PICK  /rop 'join
|-- PICK  /rop 'pick
|-- PICK  /rop 'source
|-- JOIN  /rop 'cut

|-- JOIN  /rop 'join
|-- JOIN  /rop 'pick
|-- JOIN  /rop 'source
|-- CUT  /file 'O.k
|-- PICK-NON

|-- CUT-ALL

**
**  SUMMARY
**       1 judge  on CUT
**       1 judge  on CUT-ALL
**       4 judges on JOIN
**       4 judges on PICK
**       1 judge  on PICK-NON
**      11 judges in total
**
** ********************************************  P.k
** -*- koshu -*-
**
**  INPUT
**    P.k
**

|-- INDEX-CUT  /file 'P.k  /rop 'cut
|-- SOME-CUT
|-- DEE
|-- C
|-- D  /b 1  /a 1

**
**  SUMMARY
**       1 judge  on C
**       1 judge  on D
**       1 judge  on DEE
**       1 judge  on INDEX-CUT
**       1 judge  on SOME-CUT
**       5 judges in total
**
** ********************************************  Q.k
** -*- koshu -*-
**
**  INPUT
**    Q.k
**    ../ROP.k
**

|-- DESC  /file 'Q.k  /rop 'meet  /desc 'ふたつの関係の交わりを計算する
|-- DESC  /file 'Q.k  /rop 'rename  /desc '項目名を変更する
|-- DESC  /file 'Q.k  /rop 'source  /desc '判断集合を関係として読み出す

**
**  SUMMARY
**       3 judges on DESC
**       3 judges in total
**
** ********************************************  R.k
** -*- koshu -*-
**
**  INPUT
**    R.k
**

|-- DESC  /file 'R.k  /rop 'meet  /desc 'ふたつの関係の交わりを計算する
|-- DESC  /file 'R.k  /rop 'maybe  /desc '片側の関係が成立しなくてもよい交わり
|-- DESC-2  /file 'R.k  /rop 'meet  /desc 'ふたつの関係の交わりを計算する
|-- DESC-2  /file 'R.k  /rop 'maybe  /desc '片側の関係が成立しなくてもよい交わり
|-- DESC-2  /file 'R.k  /rop 'source  /desc ()

**
**  SUMMARY
**       2 judges on DESC
**       3 judges on DESC-2
**       5 judges in total
**
** ********************************************  S.k
** -*- koshu -*-
**
**  INPUT
**    S.k
**

|-- FILE-GROUP  /file 'O.k  /r {| /file : /rop | 'O.k : 'source | 'O.k : 'pick | 'O.k : 'join | 'O.k : 'cut |}
|-- FILE-GROUP  /file 'P.k  /r {| /file : /rop | 'P.k : 'source | 'P.k : 'reldum | 'P.k : 'reldee | 'P.k : 'hold | 'P.k : 'cut |}
|-- FILE-GROUP  /file 'Q.k  /r {| /file : /rop | 'Q.k : 'source | 'Q.k : 'rename | 'Q.k : 'meet |}
|-- FILE-GROUP  /file 'R.k  /r {| /file : /rop | 'R.k : 'source | 'R.k : 'maybe | 'R.k : 'meet |}
|-- FILE-GROUP  /file 'S.k  /r {| /file : /rop | 'S.k : 'source | 'S.k : 'pick | 'S.k : 'group |}

**
**  SUMMARY
**       5 judges on FILE-GROUP
**       5 judges in total
**
** ********************************************  T.k
** -*- koshu -*-
**
**  INPUT
**    T.k
**

|-- FILE-ROPS  /file 'O.k  /rops [ 'source : 'pick : 'join : 'cut ]
|-- FILE-ROPS  /file 'P.k  /rops [ 'source : 'reldum : 'reldee : 'hold : 'cut ]
|-- FILE-ROPS  /file 'Q.k  /rops [ 'source : 'rename : 'meet ]
|-- FILE-ROPS  /file 'R.k  /rops [ 'source : 'maybe : 'meet ]
|-- FILE-ROPS  /file 'S.k  /rops [ 'source : 'pick : 'group ]

**
**  SUMMARY
**       5 judges on FILE-ROPS
**       5 judges in total
**
** ********************************************  U.k
** -*- koshu -*-
**
**  INPUT
**    U.k
**

|-- A  /x [ 'source : 'pick : 'source ]
|-- A  /x { 'source : 'pick }
|-- B  /a #false  /b #false  /x [ 'ベーグル : 'クロワッサン ]
|-- B  /a #false  /b #true  /x { 'ベーグル : 'クロワッサン }

**
**  SUMMARY
**       2 judges on A
**       2 judges on B
**       4 judges in total
**
** ********************************************  V.k
** -*- koshu -*-
**
**  INPUT
**    V.k
**

|-- A-MEET  /x 1  /xs { 1 : 3 : 5 }
|-- A-MEET  /x 3  /xs { 1 : 3 : 5 }
|-- A-MEM  /x 1  /xs { 1 : 3 : 5 }
|-- A-MEM  /x 3  /xs { 1 : 3 : 5 }
|-- B-MEET  /x 5  /xs { 1 : 3 : 5 }

|-- B-MEET  /x 3  /xs { 1 : 3 : 5 }
|-- B-MEET  /x 1  /xs { 1 : 3 : 5 }
|-- B-MEM  /x 1  /xs { 1 : 3 : 5 }
|-- B-MEM  /x 3  /xs { 1 : 3 : 5 }
|-- B-MEM  /x 5  /xs { 1 : 3 : 5 }

|-- B-MEM  /x 2  /xs { 2 : 4 }
|-- B-MEM  /x 4  /xs { 2 : 4 }

**
**  SUMMARY
**       2 judges on A-MEET
**       2 judges on A-MEM
**       3 judges on B-MEET
**       5 judges on B-MEM
**      12 judges in total
**
** ********************************************  W.k
** -*- koshu -*-
**
**  INPUT
**    W.k
**

|-- QR  /x 15  /y 4  /q 3  /r 3
|-- QR  /x 15  /y 3  /q 5  /r 0
|-- QR  /x 15  /y 2  /q 7  /r 1
|-- QR  /x 15  /y 1  /q 15  /r 0
|-- QR-MAYBE  /x 15  /y 4  /q 3  /r 3

|-- QR-MAYBE  /x 15  /y 3  /q 5  /r 0
|-- QR-MAYBE  /x 15  /y 2  /q 7  /r 1
|-- QR-MAYBE  /x 15  /y 1  /q 15  /r 0
|-- QR-MAYBE  /x 15  /y 0  /q ()  /r ()

**
**  SUMMARY
**       4 judges on QR
**       5 judges on QR-MAYBE
**       9 judges in total
**
** ********************************************  X.k
** -*- koshu -*-
**
**  INPUT
**    X.k
**

|-- QR  /x 15  /y 6  /q 2  /r 3
|-- QR  /x 15  /y 5  /q 3  /r 0
|-- QR  /x 15  /y 4  /q 3  /r 3
|-- QR  /x 15  /y 3  /q 5  /r 0
|-- QR  /x 15  /y 2  /q 7  /r 1

|-- QR  /x 15  /y 1  /q 15  /r 0

**
**  SUMMARY
**       6 judges on QR
**       6 judges in total
**

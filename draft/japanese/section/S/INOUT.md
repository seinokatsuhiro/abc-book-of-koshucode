# I/O list of koshu

- koshu  [S.k](#sk)



## [S.k](S.k)

```
** -*- koshu -*-
**
**  題名
**    甲州記法の ABC - S 交わり部分関係
**
**  使用法
**    koshu S.k
**

**  ROP-INDEX
**    ファイル /file のなかで演算子 /rop を使っている。

|-- ROP-INDEX  /file 'O.k  /rop 'cut
|-- ROP-INDEX  /file 'O.k  /rop 'join
|-- ROP-INDEX  /file 'O.k  /rop 'pick
|-- ROP-INDEX  /file 'O.k  /rop 'source

|-- ROP-INDEX  /file 'P.k  /rop 'cut
|-- ROP-INDEX  /file 'P.k  /rop 'keep
|-- ROP-INDEX  /file 'P.k  /rop 'reldee
|-- ROP-INDEX  /file 'P.k  /rop 'reldum
|-- ROP-INDEX  /file 'P.k  /rop 'source

|-- ROP-INDEX  /file 'Q.k  /rop 'meet
|-- ROP-INDEX  /file 'Q.k  /rop 'rename
|-- ROP-INDEX  /file 'Q.k  /rop 'source

|-- ROP-INDEX  /file 'R.k  /rop 'meet
|-- ROP-INDEX  /file 'R.k  /rop 'maybe
|-- ROP-INDEX  /file 'R.k  /rop 'source

|-- ROP-INDEX  /file 'S.k  /rop 'group
|-- ROP-INDEX  /file 'S.k  /rop 'pick
|-- ROP-INDEX  /file 'S.k  /rop 'source

index      : source ROP-INDEX /file /rop
file       : index | pick  /file
file-group : file  | group /r index

|== FILE-GROUP -fore /file : file-group

```

Command `koshu S.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    S.k
**

|-- FILE-GROUP  /file 'O.k  /r {| /file : /rop | 'O.k : 'source | 'O.k : 'pick | 'O.k : 'join | 'O.k : 'cut |}
|-- FILE-GROUP  /file 'P.k  /r {| /file : /rop | 'P.k : 'source | 'P.k : 'reldum | 'P.k : 'reldee | 'P.k : 'keep | 'P.k : 'cut |}
|-- FILE-GROUP  /file 'Q.k  /r {| /file : /rop | 'Q.k : 'source | 'Q.k : 'rename | 'Q.k : 'meet |}
|-- FILE-GROUP  /file 'R.k  /r {| /file : /rop | 'R.k : 'source | 'R.k : 'maybe | 'R.k : 'meet |}
|-- FILE-GROUP  /file 'S.k  /r {| /file : /rop | 'S.k : 'source | 'S.k : 'pick | 'S.k : 'group |}

**
**  SUMMARY
**       5 judges on FILE-GROUP
**       5 judges in total
**
```



## command

This document is produced by the command:

```
koshu-inout.sh -s -g
```

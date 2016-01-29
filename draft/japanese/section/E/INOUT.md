# I/O List

- koshu [E.k](#ek)
- koshu [E1.k](#e1k)
- koshu [E2.k](#e2k)
- koshu [E3.k](#e3k)
- koshu [E4.k](#e4k)



## [E.k](E.k)

```
** -*- koshu -*-
**
**  題名
**    甲州記法の ABC - E 条件による選択
**
**  使用法
**    koshu E.k
**

|-- ABC  /a 1  /b 2  /c 3    ** /a = 1  /b = 2
|-- ABC  /a 1  /b 4  /c 5    ** /a = 1
|-- ABC  /a 3  /b 2  /c 5    **         /b = 2
|-- ABC  /a 4  /b 7  /c 3
|-- ABC  /a 2  /b 7  /c 7

abc : source ABC /a /b /c

e1 : abc | keep /a = 1 and /b = 2
e2 : abc | keep /a = 1
e3 : abc | keep /a = 1 or /b = 2
e4 : abc | add /d ( /a = 1 or /b = 2 )

|== E1 : e1
|== E2 : e2
|== E3 : e3
|== E4 : e4

```

Command `koshu E.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    E.k
**
**  OUTPUT
**    <stdout>
**

|-- E1  /a 1  /b 2  /c 3

*** 1 judge 

|-- E2  /a 1  /b 2  /c 3
|-- E2  /a 1  /b 4  /c 5

*** 2 judges

|-- E3  /a 1  /b 2  /c 3
|-- E3  /a 1  /b 4  /c 5
|-- E3  /a 3  /b 2  /c 5

*** 3 judges

|-- E4  /d <1>  /a 1  /b 2  /c 3
|-- E4  /d <1>  /a 1  /b 4  /c 5
|-- E4  /d <1>  /a 3  /b 2  /c 5
|-- E4  /d <0>  /a 4  /b 7  /c 3
|-- E4  /d <0>  /a 2  /b 7  /c 7

*** 5 judges

**
**  SUMMARY
**       1 judge  on E1
**       2 judges on E2
**       3 judges on E3
**       5 judges on E4
**      11 judges in total
**
```



## [E1.k](E1.k)

```
** -*- koshu -*-
**
**  題名
**    甲州記法の ABC - E 条件による選択
**
**  使用法
**    koshu E1.k
**

|-- ABC  /a 1  /b 2  /c 3    ** /a = 1  /b = 2
|-- ABC  /a 1  /b 4  /c 5    ** /a = 1
|-- ABC  /a 3  /b 2  /c 5    **         /b = 2
|-- ABC  /a 4  /b 7  /c 3
|-- ABC  /a 2  /b 7  /c 7

abc : source ABC /a /b /c
e1  : abc | keep /a = 1 and /b = 2

|== E1 : e1

```

Command `koshu E1.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    E1.k
**
**  OUTPUT
**    <stdout>
**

|-- E1  /a 1  /b 2  /c 3

*** 1 judge 

**
**  SUMMARY
**       1 judge  on E1
**       1 judge  in total
**
```



## [E2.k](E2.k)

```
** -*- koshu -*-
**
**  題名
**    甲州記法の ABC - E 条件による選択
**
**  使用法
**    koshu E2.k
**

|-- ABC  /a 1  /b 2  /c 3    ** /a = 1  /b = 2
|-- ABC  /a 1  /b 4  /c 5    ** /a = 1
|-- ABC  /a 3  /b 2  /c 5    **         /b = 2
|-- ABC  /a 4  /b 7  /c 3
|-- ABC  /a 2  /b 7  /c 7

abc : source ABC /a /b /c
e2  : abc | keep /a = 1

|== E2 : e2

```

Command `koshu E2.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    E2.k
**
**  OUTPUT
**    <stdout>
**

|-- E2  /a 1  /b 2  /c 3
|-- E2  /a 1  /b 4  /c 5

*** 2 judges

**
**  SUMMARY
**       2 judges on E2
**       2 judges in total
**
```



## [E3.k](E3.k)

```
** -*- koshu -*-
**
**  題名
**    甲州記法の ABC - E 条件による選択
**
**  使用法
**    koshu E3.k
**

|-- ABC  /a 1  /b 2  /c 3    ** /a = 1  /b = 2
|-- ABC  /a 1  /b 4  /c 5    ** /a = 1
|-- ABC  /a 3  /b 2  /c 5    **         /b = 2
|-- ABC  /a 4  /b 7  /c 3
|-- ABC  /a 2  /b 7  /c 7

abc : source ABC /a /b /c
e3  : abc | keep /a = 1 or /b = 2

|== E3 : e3

```

Command `koshu E3.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    E3.k
**
**  OUTPUT
**    <stdout>
**

|-- E3  /a 1  /b 2  /c 3
|-- E3  /a 1  /b 4  /c 5
|-- E3  /a 3  /b 2  /c 5

*** 3 judges

**
**  SUMMARY
**       3 judges on E3
**       3 judges in total
**
```



## [E4.k](E4.k)

```
** -*- koshu -*-
**
**  題名
**    甲州記法の ABC - E 条件による選択
**
**  使用法
**    koshu E4.k
**

|-- ABC  /a 1  /b 2  /c 3    ** /a = 1  /b = 2
|-- ABC  /a 1  /b 4  /c 5    ** /a = 1
|-- ABC  /a 3  /b 2  /c 5    **         /b = 2
|-- ABC  /a 4  /b 7  /c 3
|-- ABC  /a 2  /b 7  /c 7

abc : source ABC /a /b /c
e4  : abc | add /d ( /a = 1 or /b = 2 )

|== E4 : e4

```

Command `koshu E4.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    E4.k
**
**  OUTPUT
**    <stdout>
**

|-- E4  /d <1>  /a 1  /b 2  /c 3
|-- E4  /d <1>  /a 1  /b 4  /c 5
|-- E4  /d <1>  /a 3  /b 2  /c 5
|-- E4  /d <0>  /a 4  /b 7  /c 3
|-- E4  /d <0>  /a 2  /b 7  /c 7

*** 5 judges

**
**  SUMMARY
**       5 judges on E4
**       5 judges in total
**
```



## command

This document is produced by the command:

```
koshu-inout.sh -s -g koshu
```

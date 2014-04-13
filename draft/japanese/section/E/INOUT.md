# I/O list of koshu

- koshu  [E.k](#ek)
- koshu  [E2.k](#e2k)
- koshu  [E3.k](#e3k)
- koshu  [E4.k](#e4k)



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

abc  : source ABC /a /b /c
abc2 : abc | keep /a = 1 and /b = 2

|== ABC2 : abc2

```

Command `koshu E.k` produces:

```
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

abc  : source ABC /a /b /c
abc2 : abc | keep /a = 1

|== ABC2 : abc2

```

Command `koshu E2.k` produces:

```
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

abc  : source ABC /a /b /c
abc2 : abc | keep /a = 1 or /b = 2

|== ABC2 : abc2

```

Command `koshu E3.k` produces:

```
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

abc  : source ABC /a /b /c
abcd : abc | add /d ( /a = 1 or /b = 2 )

|== ABCD : abcd

```

Command `koshu E4.k` produces:

```
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
```



## command

This document is produced by the command:

```
koshu-inout.sh -s -g
```

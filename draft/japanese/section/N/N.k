** -*- koshu -*-
**
**  題名
**    甲州記法の ABC - N 結び
**
**  使用法
**    koshu N.k
**

|-- X  /a 'A1  /b 'B1    ** X と Y の両方が成立
|-- X  /a 'A1  /b 'B2    ** X と Y の両方が成立 (Y はふたつ成立)
|-- X  /a 'A2  /b 'B3    ** X のみ成立

|-- Y  /b 'B1  /c 'C1    ** X と Y の両方が成立
|-- Y  /b 'B2  /c 'C3    ** X と Y の両方が成立
|-- Y  /b 'B2  /c 'C4    ** X と Y の両方が成立
|-- Y  /b 'B4  /c 'C4    ** Y のみ成立

x : source X /a /b
y : source Y /b /c

|== Z : x | meet y
|== V : x | join y


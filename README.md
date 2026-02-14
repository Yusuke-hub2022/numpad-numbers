# Numpad Numbers
 
テンキーの練習用に乱数を作成する。<br/>
Create random numbers for numpad exercise. 
 
# DEMO
 
0から9の中からランダムに100個の数字を作る。<br/>
100 random numbers from 0 to 9.

```bash
ghci> take 100 allkeys
[0,6,5,9,1,8,9,2,7,8,7,3,8,7,6,4,9,7,...]
```
 
# Usage
 
GHCi上で使う例。<br/>
You can use it on GHCi.

```bash
$ ghci numbers.hs
```

0から9の中からランダムに100個を表示。<br/>
100 random numbers from 0 to 9.

```bash
ghci> take 100 allkeys
[0,6,5,9,1,8,9,2,7,8,7,3,8,7,6,4,9,7,...]
```

テンキーの縦の列を跨いだ数字。例えば、1の次には4と7以外の数字がくる。<br/>
Crossing numpad columns. For example, after 1, anything other than 4 or 7 comes.

```bash
ghci> take 100 crossCols
[1,6,7,8,9,4,2,6,2,9,5,7,6,7,3,4,8,7,...]
```

テンキーの横の列を跨いだ数字。例えば、1の次には2と3以外の数字がくる。<br/>
Crossing numpad rows. For example, after 1, anything other than 2 or 3 comes.

```bash
ghci> take 100 crossRows
[1,5,7,4,1,8,6,2,6,1,5,7,2,7,3,8,4,7,...]
```

8と9を重点的に。<br/>
Focus on 8 and 9.

```bash
ghci> take 100 (interleave [8,9] [0,1,2,3,4,5,6,7])
[8,0,8,6,8,4,9,1,9,1,8,0,8,2,9,1,9,5,...]
```

何個かずつに分けたい時は chop 関数を使う。以下は8個ずつに分ける例。<br/>
If you want to divide numbers into seveal pieces, use the chop function. Here is an example of dividing numbers into 8 pieces.

```bash
ghci> chop 8 (take 100 allkeys)
[[0,6,5,9,1,8,9,2],[7,8,7,3,8,7,6,4],[9,7,0,6,9,2,4,3],...]
```
 
# Note
 
各関数は無限リストを返すので、take関数を使って必要な数だけ取り出す。<br/>
Each function returns an infinite list, so use the take function to take out as many as you need.

先頭から100個を取り出す例。<br/>
An example of take the first 100.

```bash
ghci> take 100 allkeys
[0,6,5,9,1,8,9,2,7,8,7,3,8,7,6,4,9,7,...]
```

各関数は同じランダム値を返す。そのため他の値が欲しいときは、range 関数で数列の途中を部分的に取り出す。<br/>
Each function returns the same random numbers, so if you want different numbers, use the range function to extract a portion of the sequence.

101個目から200個目を取り出す例。<br/>
This is an example of extract numbers 101 through 200.

```bash
ghci> range 101 200 allkeys
[1,8,7,6,4,2,7,6,4,0,2,9,3,7,1,3,2,0,4,...]
```
 
# Author
 
* Yusuke
* Kudoworks01@gmail.com
 
# License
 
"Numpad Numbers" is under [MIT license](https://en.wikipedia.org/wiki/MIT_License).
 

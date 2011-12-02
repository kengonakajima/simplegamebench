simple game logic benchmark comparing lua,c,go,coffee,ruby
====

詳しくはMakefileを参照してください。

func : 単純な関数を1億回呼ぶ

rand : 単純なネイティブ関数を1億回呼ぶ

vec3 : 1万要素のVector3クラスの配列を作りメンバ関数を呼んで1億回平行移動する

Result
---
MacOSX 10.7 Lion
2.53GHz core i5 macbook pro
lua : 5.1.4
luajit : 1.1.7
juajit2 : 2.0.0beta8 (git latest 2011/12/2)
node (coffee): 0.4.4 
go : (hg latest 2011/12/2)
ruby : 1.8.7 (Lion default)
c : gcc 4.2 -O3 (Lion default)

- func
 - coffee   2.11 real         2.07 user         0.03 sys
 - lua     15.59 real        15.52 user         0.02 sys
 - luajit   3.89 real         3.83 user         0.00 sys
 - luajit2  0.17 real         0.17 user         0.00 sys
 - go       0.35 real         0.35 user         0.00 sys
 - c        0.14 real         0.13 user         0.00 sys
 - ruby    51.68 real        51.45 user         0.08 sys
 
- rand
 - coffee   3.02 real         2.96 user         0.02 sys
 - lua     15.83 real        15.74 user         0.03 sys
 - luajit   7.37 real         7.33 user         0.01 sys
 - luajit2  0.84 real         0.83 user         0.00 sys
 - go       4.47 real         4.45 user         0.00 sys   (goはrandomをgoで実装している)
 - c        1.10 real         1.09 user         0.00 sys
 - ruby    40.17 real        39.98 user         0.07 sys
 
- vec3
 - coffee   7.58 real         7.50 user         0.03 sys
 - lua     61.72 real        61.30 user         0.19 sys
 - luajit  26.97 real        26.78 user         0.09 sys
 - luajit2  8.28 real         8.21 user         0.03 sys
 - go       0.87 real         0.85 user         0.00 sys
 - c        0.39 real         0.38 user         0.00 sys
 - ruby (omitted)


考え
----
luajitはnodeよりはるかに遅かった。が、 luajit2では遜色ないレベルになっている。
テーブルにアクセスしない単純なロジックなら、ほとんどCに近い速度が出る。
ネイティブ関数の呼び出しオーバーヘッドがv8より小さいことが数値で見えた。
LuaはV8のようにC側で確保したオブジェクトをGCしてくれないので当然か。

goはやはり mapとstringがとても遅いので、あと一歩。ほかは速いのに。。


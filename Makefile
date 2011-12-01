GOC=/Users/ringo/golang/go/bin/6g
GOL=/Users/ringo/golang/go/bin/6l

all: func rand vec



build:
	$(GOC) func.go
	$(GOL) -o gofunc func.6
	gcc -o cfunc -O3 func.c
	$(GOC) rand.go
	$(GOL) -o gorand rand.6
	gcc -o crand -O3 rand.c
	$(GOC) vec3.go
	$(GOL) -o govec3 vec3.6
	g++ -o cvec3 -O3 vec3.cpp


# BE CAREFUL IT INCLUDES BOOTSTRAP TIME!
func:
	time coffee func.coffee
	time lua func.lua
	time luajit func.lua
	time luajit-2.0.0-beta8 func.lua
	time ./gofunc
	time ./cfunc
	time ruby func.rb


rand:
	time coffee rand.coffee
	time lua rand.lua
	time luajit rand.lua
	time luajit-2.0.0-beta8 rand.lua
	time ./gorand
	time ./crand
	time ruby rand.rb



vec3:
	time coffee vec3.coffee
	time lua vec3.lua
	time luajit vec3.lua
	time luajit-2.0.0-beta8 vec3.lua
	time ./govec3
	time ./cvec3
#	time ruby vec3.rb



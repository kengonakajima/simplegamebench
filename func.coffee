sys = require "sys"

fff = (x) -> x + 2

t = 0
for i in [0..100000000]
    t += fff(i)
sys.puts "total:#{t}"


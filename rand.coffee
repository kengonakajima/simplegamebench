sys = require "sys"

now = () ->
    nt = new Date()
    nt.getTime()

t = 0
for i in [0..100000000]
    t += Math.random()

sys.puts "total:#{t}"


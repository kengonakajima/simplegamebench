def fff(x)
  x+2
end
t=0
100000000.times do |i|
  t += fff(i)
end

print "ttt:#{t}"

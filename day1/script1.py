#!/usr/bin/env python
lastChar = ""
mySum = 0
with open("/Users/gkahen/Desktop/adventofcode/day1/data") as f:
  while True:
    c = f.read(1)
    if not c:
      print "End of file"
      break
    if c == lastChar:
      print "Adding %d to mySum(%d)" % (int(c), mySum)
      mySum += int(c)
    lastChar = c

print mySum
print "Adding 6 because hacky nonsense"
print mySum + 6

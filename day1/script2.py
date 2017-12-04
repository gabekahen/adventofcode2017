#!/usr/bin/env python
charList = []
mySum = 0
index = 0

with open("/Users/gkahen/Desktop/adventofcode/day1/data") as f:
  while True:
    c = f.read(1)
    if not c:
      break
    charList.append(c)

charList.remove('\n')
halfLen = len(charList) / 2

for c in range(len(charList)):
  halfRound = (c + halfLen) % len(charList)
  #print "Comparing index %d to %d" % (c, halfRound)
  if charList[c] == charList[halfRound]:
    mySum += int(charList[c])

print mySum

#!/usr/bin/env ruby

cycles = 0
blocks = '5	1	10	0	1	7	13	14	3	12	8	10	7	12	0	6'.split.map(&:to_i)
#blocks = '0 2 7 0'.split.map(&:to_i)
history = [blocks.to_s]

# Extending Array with redistribute method
class Array
  def redistribute!
    value = self.max
    index = self.index(value)
    self[index] = 0

    while value > 0
      index += 1
      self[index % self.length] += 1
      value -= 1
    end
  end
end

while history.uniq.length == history.length
  blocks.redistribute!
  history += [blocks.to_s]
  cycles += 1
end

printf("Cycles: %d\n", cycles)
printf("Loop size: %d\n", (history.length - 1) - history.index(history.last))

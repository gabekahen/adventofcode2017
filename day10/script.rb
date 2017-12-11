#!/usr/bin/env ruby

lengths = [227, 169, 3, 166, 246, 201, 0, 47, 1, 255, 2, 254, 96, 3, 97, 144]
list = (0..255).to_a

# solves the problem
def knot(list, lengths)
  cur_pos = 0
  skip_size = 0

  lengths.each do |length|
    list.reverse_subset!(cur_pos, length) if length.between?(2, list.length)

    cur_pos = (cur_pos + skip_size + length) % list.length
    skip_size += 1
  end
  list
end

# Creating new Array method
class Array
  # Reverses subset of input between first and last index
  def reverse_subset!(index, length)
    (length / 2).times do |x|
      left = (index + x) % self.length
      right = (index + length - x - 1) % self.length

      self[left], self[right] = self[right], self[left]
    end
  end
end

result = knot(list, lengths)

printf("Result: %d\n", result[0] * result[1])

#!/usr/bin/env ruby

lengths = '227,169,3,166,246,201,0,47,1,255,2,254,96,3,97,144'
list = (0..255).to_a

# solves the problem
def knot(list, lengths, rounds = 1)
  cur_pos = 0
  skip_size = 0

  rounds.times do
    lengths.each do |length|
      list.reverse_subset!(cur_pos, length) if length.between?(2, list.length)
      cur_pos = (cur_pos + skip_size + length) % list.length
      skip_size += 1
    end
  end
  list
end

# Converts a sparse hash to a dense hash
def dense_hash(sparse_hash)
  dense_hash = Array.new(16, 0)
  dense_hash.each_index do |i|
    16.times do |x|
      dense_hash[i] = dense_hash[i] ^ sparse_hash[(i * 16) + x]
    end
  end
  # Converts all numbers to _two_ hexadecimal characters
  dense_hash.map { |x| sprintf("%02x", x) }.join
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

result = knot(list, lengths.split(',').map(&:to_i))

printf("Result: %d\n", result[0] * result[1])

list = (0..255).to_a # reset list
sparse_hash = knot(list, lengths.bytes + [17, 31, 73, 47, 23], 64)
printf("Dense hash: %s\n", dense_hash(sparse_hash))

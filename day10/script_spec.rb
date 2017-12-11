#!/usr/bin/env ruby

require './script'

RSpec.describe '#knot' do
  it 'example data' do
    expect(knot((0..4).to_a, [3, 4, 1, 5])).to eq([3, 4, 2, 1, 0])
  end
end

RSpec.describe '#reverse_subset' do
  it 'reverses whole array' do
    data = (0..4).to_a
    data.reverse_subset!(0, 5)
    expect(data).to eq([4, 3, 2, 1, 0])
  end
  it 'reverses a subset of array' do
    data = (0..4).to_a
    data.reverse_subset!(2, 2)
    expect(data).to eq([0, 1, 3, 2, 4])
  end
  it 'reverses a subset that carries over (1)' do
    data = (0..4).to_a
    data.reverse_subset!(3, 3)
    expect(data).to eq([3, 1, 2, 0, 4])
  end
  it 'reverses a subset that carries over (2)' do
    data = (0..10).to_a
    data.reverse_subset!(8, 5)
    expect(data).to eq([9, 8, 2, 3, 4, 5, 6, 7, 1, 0, 10])
  end
end

RSpec.describe '#dense_hash' do
  it 'hash empty string' do
    lengths = [17, 31, 73, 47, 23]
    sparse_hash = knot((0..255).to_a, lengths, 64)
    expect(dense_hash(sparse_hash)).to eq('a2582a3a0e66e6e86e3812dcb672a272')
  end
  it 'AoC 2017' do
    lengths = 'AoC 2017'.bytes + [17, 31, 73, 47, 23]
    sparse_hash = knot((0..255).to_a, lengths, 64)
    expect(dense_hash(sparse_hash)).to eq('33efeb34ea91902bb2f59c9920caa6cd')
  end
  it '1,2,3' do
    lengths = '1,2,3'.bytes + [17, 31, 73, 47, 23]
    sparse_hash = knot((0..255).to_a, lengths, 64)
    expect(dense_hash(sparse_hash)).to eq('3efbe78a8d82f29979031a4aa0b16a9d')
  end
  it '1,2,4' do
    lengths = '1,2,4'.bytes + [17, 31, 73, 47, 23]
    sparse_hash = knot((0..255).to_a, lengths, 64)
    expect(dense_hash(sparse_hash)).to eq('63960835bcdc130f0b66d7ff4f6a5a8e')
  end
end

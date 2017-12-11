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

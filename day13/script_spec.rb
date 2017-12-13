#!/usr/bin/env ruby

require './script'

data = '0: 3
1: 2
4: 4
6: 4'

RSpec.describe '#parse_input' do
  result = parse_input(data)
  it 'returns a hash of Walls' do
    expect(result).to be_a(Hash)
    expect(result[0]).to be_a(Wall)
  end
  it 'has a length of 7' do
    expect(result.length).to eq(4)
  end
  it 'has the right values' do
    expect(result[0].blocked?).to be_truthy
    expect(result[2]).to be_nil
  end
end

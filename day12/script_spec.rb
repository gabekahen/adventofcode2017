#!/usr/bin/env ruby

require './script'

data = '0 <-> 2
1 <-> 1
2 <-> 0, 3, 4
3 <-> 2, 4
4 <-> 2, 3, 6
5 <-> 6
6 <-> 4, 5'

RSpec.describe '#parse_input' do
  result = parse_input(data)
  it 'returns a hash' do
    expect(result).to be_a(Hash)
  end
  it 'has a length of 7' do
    expect(result.length).to eq(7)
  end
  it 'has the right values' do
    expect(result[6]).to eq([4, 5])
    expect(result[4]).to eq([2, 3, 6])
  end
  it 'value is an array' do
    expect(result[1]).to be_a(Array)
    result.each_value do |v|
      expect(v).to be_a(Array)
    end
  end
end

RSpec.describe '#in_group' do
  data_hash = parse_input(data)
  group_list = []
  in_group(data_hash, group_list, 0)

  it { expect(group_list.length).to eq(6) }
end

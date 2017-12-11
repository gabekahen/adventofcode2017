#!/usr/bin/env ruby

require './script'

RSpec.describe '#score' do
  data = {  '{}' => 1,
            '{{{}}}' => 6,
            '{{},{}}' => 5,
            '{{{},{},{{}}}}' => 16,
            '{<a>,<a>,<a>,<a>}' => 1,
            '{{<ab>},{<ab>},{<ab>},{<ab>}}' => 9,
            '{{<!!>},{<!!>},{<!!>},{<!!>}}' => 9,
            '{{<a!>},{<a!>},{<a!>},{<ab>}}' => 3 }

  data.each do |k, v|
    it k do
      expect(score(k)).to eq(v)
    end
  end
end

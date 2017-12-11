#!/usr/bin/env ruby

require './script'

RSpec.describe '#score count' do
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
      expect(score(k).score).to eq(v)
    end
  end
end

RSpec.describe '#score garbage' do
  data = {  '<>' => 0,
            '<random characters>' => 17,
            '<<<<>' => 3,
            '<{!>}>' => 2,
            '<!!>' => 0,
            '<!!!>>' => 0,
            '<{o"i!a,<{i<a>' => 10 }

  data.each do |k, v|
    it k do
      expect(score(k).garbage).to eq(v)
    end
  end
end

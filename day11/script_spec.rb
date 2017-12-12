#!/usr/bin/env ruby

require './script'

RSpec.describe '#Hexagon' do
  instructions = {
    %w[ne ne ne] => 3,
    %w[ne ne sw sw] => 0,
    %w[ne ne s s] => 2,
    %w[se sw se sw sw] => 3
  }

  instructions.each_key do |key|
    it "#{key} = #{instructions[key]}" do
      h = Hexagon.new

      key.each { |i| h.send(i) }
      expect(h.distance).to eq(instructions[key])
    end
  end
end

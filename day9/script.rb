#!/usr/bin/env ruby

data = File.read('./data').chomp!

# Results class stores results from score function
class Results
  attr_accessor :score, :garbage
  def initialize
    @score = 0
    @garbage = 0
  end
end

def score(data)
  results = Results.new
  depth = 1
  garbage = false
  canceled = false

  data.each_char do |char|
    # If last char was '!', Skip and set canceled to false
    if canceled
      canceled = false
      next
    end

    case char
    when '!'
      canceled = true
    when '<'
      garbage = true
    when '>'
      garbage = false
    when '{'
      results.score += depth unless garbage
      depth += 1 unless garbage
    when '}'
      depth -= 1 unless garbage
    end
  end

  results
end

printf("Score: %s\n", score(data).score)

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
      results.garbage += 1 if garbage
      garbage = true
    when '>'
      garbage = false
    when '{'
      results.garbage += 1 if garbage
      results.score += depth unless garbage
      depth += 1 unless garbage
    when '}'
      results.garbage += 1 if garbage
      depth -= 1 unless garbage
    else
      results.garbage += 1 if garbage
    end
  end

  results
end

result = score(data)

printf("Score: %d\nGarbage: %d\n", result.score, result.garbage)

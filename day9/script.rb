#!/usr/bin/env ruby

data = File.read('./data').chomp!

def score(data)
  score = 0
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
      score += depth unless garbage
      depth += 1 unless garbage
    when '}'
      depth -= 1 unless garbage
    end
  end

  score
end

printf("Score: %d\n", score(data))

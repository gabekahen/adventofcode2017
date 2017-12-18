#!/usr/bin/env ruby

# Wall class with helper functions to determine scanner placement
class Wall
  attr_accessor :range, :scanner
  def initialize(range, i = 0)
    @range = range
    @scanner = i
  end

  def next!(i = 1)
    @scanner = (@scanner + i) % (@range * 2 - 2)
  end

  def blocked?(i = 0)
    @scanner == i
  end

  def blocked_in?(steps = 0)
    steps % (@range * 2 - 2) == 0
  end

  def severity(depth)
    depth * @range
  end
end

def parse_input(data)
  firewall = {}
  data.each_line do |line|
    depth, range = line.split(': ').map(&:to_i)
    firewall[depth] = Wall.new(range)
  end
  firewall
end

data = File.read('./data')

firewall = parse_input(data)

severity = 0

(0..firewall.keys.last).each do |step|
  wall = firewall[step]
  severity += wall.severity(step) if !wall.nil? && wall.blocked?
  firewall.each_value(&:next!)
end

printf("(Part 1) Severity: %d\n", severity)

delay = 0
blocked = true

# Every loop, check if we're blocked at (depth + delay).
# IF we're blocked, increment the delay & restart the loop.
loop do
  firewall.each_key do |depth|
    if firewall[depth].blocked_in?(depth + delay)
      delay += 1
      blocked = true
      break
    end
    blocked = false
  end
  break unless blocked
end

printf("(Part 2) Delay: %d\n", delay)

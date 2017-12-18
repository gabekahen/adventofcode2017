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
# data = '0: 3
# 1: 2
# 4: 4
# 6: 4'

firewall = parse_input(data)

severity = 0

(0..firewall.keys.last).each do |step|
  wall = firewall[step]
  # wall.print(step) unless wall.nil?
  # printf("%-5d\n", step) if wall.nil?
  severity += wall.severity(step) if !wall.nil? && wall.blocked?
  firewall.each_value(&:next!)
end

printf("(Part 1) Severity: %d\n", severity)

delay = 2

loop do
  blocked = false
  firewall_copy = parse_input(data)
  delay.times { firewall_copy.each_value(&:next!) }

  (0..firewall_copy.keys.last).each do |step|
    wall = firewall_copy[step]
    blocked = true if !wall.nil? && wall.blocked?
    break if blocked
    firewall_copy.each_value(&:next!)
  end
  delay += 4 if blocked
  break unless blocked
end

printf("(Part 2) Delay: %d\n", delay)

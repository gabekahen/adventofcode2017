#!/usr/bin/env ruby

# Wall class with helper functions to determine scanner placement
class Wall
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

  def print(depth)
    printf('%-5d: %-6d : ', depth, depth * @range)
    (0..@range).each do |i|
      if i == @scanner
        printf('[S] ')
      else printf('[ ] ')
      end
    end
    printf("\n")
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
  wall.print(step) unless wall.nil?
  printf("%-5d\n", step) if wall.nil?
  severity += wall.severity(step) if !wall.nil? && wall.blocked?
  firewall.each_value(&:next!)
end

printf("Severity: %d\n", severity)

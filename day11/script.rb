#!/usr/bin/env ruby

# Define a Hexagon and navigate the grid with methods
class Hexagon
#   \ z  /
# x  +--+  y
#   /    \
# -+      +-
#   \    /
#  y +--+  x
#   / z  \
  attr_accessor :x, :y, :z

  def initialize(x = 0, y = 0, z = 0)
    @x = x
    @y = y
    @z = z
  end

  def nw
    @y -= 1
    @z -= 1
  end

  def se
    @y += 1
    @z += 1
  end

  def ne
    @z += 1
    @x += 1
  end

  def sw
    @z -= 1
    @x -= 1
  end

  def n
    @y -= 1
    @x += 1
  end

  def s
    @y += 1
    @x -= 1
  end

  def print
    printf("\tZ: %d\n\n\n", @z)
    printf("Y: %d\t\tX: %d\n\n", @y, @x)
  end

  def distance
    (@x.abs + @y.abs + @z.abs) / 2
  end
end

h = Hexagon.new

data = File.read('./data')

instructions = data.chomp.split(',')

instructions.each { |i| h.send(i) }

printf("Distance: %d\n", h.distance)

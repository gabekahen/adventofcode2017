#!/usr/bin/env ruby
data = Hash.new(0)

input = 368_078

up = [1, 0]
down = [-1, 0]
left = [0, -1]
right = [0, 1]

data[[0, 0]] = 1

last_move = right

last_coord = [0, 0]

def print_direction(direction)
  case direction
  when [1, 0]
    'Up'
  when [-1, 0]
    'Down'
  when [0, -1]
    'Left'
  when [0, 1]
    'Right'
  end
end

def next_direction(direction)
  up = [1, 0]
  down = [-1, 0]
  left = [0, -1]
  right = [0, 1]
  direction_order = [right, up, left, down]
  down = [-1, 0]
  return right if direction == down

  direction_order[direction_order.index(direction) + 1]
end

def add_coord(coord1, coord2)
  [coord1[0] + coord2[0], coord1[1] + coord2[1]]
end

(2..input).each do |num|
  coord = add_coord(last_coord, last_move)

  data[coord] = num

  if data[add_coord(coord, next_direction(last_move))].zero?
    last_move = next_direction(last_move)
  end
  last_coord = coord
end

print data.key(input)[0].abs + data.key(input)[1].abs

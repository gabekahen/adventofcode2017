#!/usr/bin/env ruby

data = File.read('./data')

def parse_input(data)
  output = Hash.new(0)
  data.each_line do |line|
    id, connections = line.split(' <-> ')
    output[id.to_i] = connections.split(', ').map(&:to_i)
  end
  output
end

# How many programs are in group that contains id?
def in_group(data_hash, group_list, pid)
  group_list << pid unless group_list.include? pid
  data_hash[pid].each do |id|
    next if group_list.include? id
    group_list << id
    in_group(data_hash, group_list, id)
  end
end

data_hash = parse_input(data)

groups = 0

until data_hash.empty?
  group_list = []
  first_key = data_hash.keys[0]
  in_group(data_hash, group_list, first_key)
  printf("Number of nodes connected to '%d': %d\n", first_key, group_list.length)
  group_list.each { |k| data_hash.delete(k) }
  groups += 1
end
printf("Number of groups: %d\n", groups)

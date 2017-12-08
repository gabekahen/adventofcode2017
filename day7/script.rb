#!/usr/bin/env ruby

# Program class
class Program
  attr_reader :children, :weight, :name
  def initialize(name, data)
    line = data.match(/^#{name}.+/).to_s

    @name = line.split(' ')[0]
    @weight = /\(([0-9]+)\)/.match(line)[1].to_i
    @children = []
    / \-\> / =~ line && line.chomp.split(' -> ')[1].split(', ').each do |child|
      @children += [Program.new(child, data)]
    end
  end

  def children?
    !@children.nil?
  end

  def burden!
    @children.each do |child|
      child.burden! unless @children.count.zero?
      @weight += child.weight.to_i
    end
  end

  def print
    printf('%s(%d) --', @name, @weight)
    @children.each { |child| printf(' %s(%d)', child.name, child.weight) }
    puts "\n"
    @children.each do |child|
      weights = @children.map(&:weight)
      child.print if weights.count(child.weight) == 1 || weights.uniq.count == 1 && child.children.count > 0
    end
  end
end

data = File.read('./data')

parent_node = ''

data.each_line do |line|
  name = line.split(' ')[0]
  parent_node = name if data.scan(/#{name}/).count == 1
end

parent_node = Program.new(parent_node, data)
parent_node.burden!
parent_node.print

#!/usr/bin/env ruby

data = File.read('./data')

# Program class
class Program
  attr_reader :children, :weight, :name
  def initialize(line)
    @name = line.split(' ')[0]
    @weight = /\(([0-9]+)\)/.match(line)[1]
    @children = line.chomp.split(' -> ')[1].split(', ') if / \-\> / =~ line
  end

  def children?
    !@children.nil?
  end

  def print
    printf("Name: %s\nWeight: %d\n", @name, @weight)
    printf("Children: %s\n", @children) unless @children.nil?
  end
end

programs = []
children = []

data.each_line do |line|
  program = Program.new(line)
  programs += [program]
  children += program.children if program.children?
end

programs.each do |program|
  name = program.name
  printf("Parent node: %s\n", name) unless children.include?(name)
end

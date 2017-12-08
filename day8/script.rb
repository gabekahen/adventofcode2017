#!/usr/bin/env ruby

# instructions = 'b inc 5 if a > 1
# a inc 1 if b < 5
# c dec -10 if a >= 1
# c inc -20 if c == 10'

instructions = File.read('./data')

# Instruction class
class Hash
  def instruction(line)
    line_regex = /([a-z0-9]+) ([a-z]+) (\-?[0-9]+) if ([a-z0-9]+) (.+) (\-?[0-9]+)$/

    _, register, operation, amount, comp_reg, comp_operation, comp_amount = line_regex.match(line.chomp).to_a
    conditional = self[comp_reg].send(comp_operation, comp_amount.to_i)
    self[register] += amount.to_i if operation == 'inc' && conditional
    self[register] -= amount.to_i if operation == 'dec' && conditional
    self.map { |_, v| v }.max # return the current maximum value of the registry
  end
end

registry = Hash.new(0)
max_value = 0
instructions.each_line do |line|
  value = registry.instruction(line)
  max_value = value if value > max_value
end

printf("Max value (current): %d\n", registry.map { |_, v| v }.max)
printf("Max value (alltime): %d\n", max_value)

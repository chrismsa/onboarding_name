require_relative 'home.rb'
require_relative 'analyze_command.rb'

home = Home.new

loop do
  command = gets.chomp
  analyze_command = Analyze_command.new(command, home)
  if command == '--exit'
    break
  end
end
require_relative 'home.rb'
require_relative 'analyze_command.rb'

home = Home.new

loop do
  home.initial_options
  puts '    Enter the number of the desired option:'
  command = gets.chomp
  analyze_command = Analyze_command.new(command, home)
  if command == '--exit' || analyze_command.exit == true
    break
  end
end
class Analyze_command
  attr_accessor :command, :home, :commands, :unity

  def initialize(command, home)
    @command = command
    @home = home
    return @home.helpers if @command == '--helper'


  end
end
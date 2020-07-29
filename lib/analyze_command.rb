require_relative 'get_ufs.rb'
require_relative 'get_rank_name.rb'

class Analyze_command
  attr_accessor :command, :home, :ufs, :exit

  def initialize(command, home)
    @command = command
    @home = home
    @exit = false

    case @command
    when '--helper'
      @home.helpers
    when '1'
      @ufs = GetUfs.new
      @ufs.all
      loop do
        puts '    Enter the number of the desired UF:'
        command = gets.chomp
        return if base(command)
        redo if command == '--helper'
        ranking = GetRankName.new(command.to_i)
        ranking.all
        ranking.f
        ranking.m
      end
    end
  end

  def base(command)
    case command
    when '--return'
      true
    when '--exit'
      @exit = true
      true
    when '--helper'
      @home.helpers
      false
    end
  end
end

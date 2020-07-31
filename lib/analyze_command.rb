require_relative 'get_ufs.rb'
require_relative 'get_minicipality.rb'
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
    when '2'
      loop do
        alert = '
    Invalid command!
        '
        puts '    Enter the name of the minicipality with the state acronym:
    Example: São Paulo (SP)'
        command = gets.chomp
        return if base(command)
        redo if command == '--helper'
        unless command.include? ' '
          puts alert
          redo
        end
        uf = command.split(' ').last
        if validate_command(command, uf)
          puts alert
          redo
        end
        minicipality_name = restore_minicipality_name(command, uf)
        minicipality = GetMinicipality.new(uf.slice!(1..2), minicipality_name)
        id = minicipality.id
        if id.nil?
          puts '
    Nothing found!
          '
          redo
        else
          ranking = GetRankName.new(id)
          ranking.all
          ranking.f
          ranking.m
        end
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

  def validate_command(command, uf)
    return true if uf.size != 4
    return true unless uf.include? '('
    return true unless uf.include? ')'
    false
  end

  def restore_minicipality_name(command, uf)
    result = command.split(' ')
    result.delete(uf)
    result.join(' ')
  end
end

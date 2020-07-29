require 'faraday'
require 'json'

class GetUfs
  attr_accessor :ufs

  def initialize
    response = Faraday.get('https://servicodados.ibge.gov.br/api/v1/localidades/estados')
    @ufs = JSON.parse(response.body, symbolize_names: true)
  end

  def all
    @ufs.each do |uf|
      puts "  #{uf[:id]} - #{uf[:nome]} #{uf[:sigla]}"
    end
  end

  # def find(number)
  #   @ufs.each do |uf|
  #     return if uf[:id] == number
  #     puts "  #{uf[:id]} - #{uf[:nome]} #{uf[:sigla]}"
  #   end
  # end
end
class GetRankName
  attr_accessor :uf, :response

  def initialize(uf)
    @uf = uf
  end

  def all
    response = Faraday.get("https://servicodados.ibge.gov.br/api/v2/censos/nomes/ranking?localidade=#{@uf}")
    return puts '   Nothing found' if response.body.size <= 2
    json = JSON.parse(response.body, symbolize_names: true)
    puts '    All'
    json[0][:res].each_with_index do |name, i|
      break if i == 10
      puts "  #{name[:ranking]} - #{name[:nome]}"
    end
  end

  def f
    response = Faraday.get("https://servicodados.ibge.gov.br/api/v2/censos/nomes/ranking?localidade=#{@uf}&sexo=f")
    return if response.body.size <= 2
    json = JSON.parse(response.body, symbolize_names: true)
    puts '    Female'
    json[0][:res].each_with_index do |name, i|
      break if i == 10
      puts "  #{name[:ranking]} - #{name[:nome]}"
    end
  end

  def m
    response = Faraday.get("https://servicodados.ibge.gov.br/api/v2/censos/nomes/ranking?localidade=#{@uf}&sexo=m")
    return if response.body.size <= 2
    json = JSON.parse(response.body, symbolize_names: true)
    puts '    Male'
    json[0][:res].each_with_index do |name, i|
      break if i == 10
      puts "  #{name[:ranking]} - #{name[:nome]}"
    end
  end
end
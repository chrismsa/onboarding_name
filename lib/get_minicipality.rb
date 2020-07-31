require 'faraday'
require 'json'

class GetMinicipality
  attr_accessor :minicipality, :uf

  def initialize(uf, minicipality)
    @uf = uf
    @minicipality = minicipality
  end

  def id
    response = Faraday.get("https://servicodados.ibge.gov.br/api/v1/localidades/estados/#{@uf}/municipios")
    minicipalities = JSON.parse(response.body, symbolize_names: true)
    id = minicipalities.collect!{ |mini| mini[:id] if mini[:nome] == @minicipality }.compact
    id[0]
  end
end
class UtilsProject
  def obter_caminho(path, entidade)
    file = File.read("./features/support/fixtures/#{path}.json")
    json = JSON.parse(file)
    json[entidade]
  end
end

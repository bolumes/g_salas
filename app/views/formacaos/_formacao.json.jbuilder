json.extract! formacao, :id, :nome, :descricao, :created_at, :updated_at
json.url formacao_url(formacao, format: :json)

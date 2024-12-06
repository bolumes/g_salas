json.extract! docente, :id, :nome, :email, :telefone, :created_at, :updated_at
json.url docente_url(docente, format: :json)

json.extract! evento, :id, :nome, :descricao, :data, :inicio, :fim, :docente_id, :formacao_id, :sala_id, :created_at, :updated_at
json.url evento_url(evento, format: :json)

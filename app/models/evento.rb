class Evento < ApplicationRecord
  belongs_to :docente
  belongs_to :formacao
  belongs_to :sala
end

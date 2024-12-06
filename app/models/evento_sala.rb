class EventoSala < ApplicationRecord
  belongs_to :sala
  belongs_to :evento
end

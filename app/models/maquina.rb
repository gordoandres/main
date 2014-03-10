class Maquina < ActiveRecord::Base
  belongs_to :seism
      validates :capacidad, length: { maximum: 2 }
      validates :condicion, length: { maximum: 2 }
      validates :herramientas, length: { maximum: 2 }
      validates :ajustes, length: { maximum: 2 }
      validates :mantenimiento, length: { maximum: 2 }
end

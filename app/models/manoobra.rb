class Manoobra < ActiveRecord::Base
  belongs_to :seism
  validates :conocimiento, length: { maximum: 2 }
  validates :capacidad, length: { maximum: 2 }
  validates :entrenamiento, length: { maximum: 2 }
  validates :habilidad, length: { maximum: 2 }
  validates :motivacion, length: { maximum: 2 }
end

class Medicion < ActiveRecord::Base
  belongs_to :seism

      validates :disponibilidad, length: { maximum: 2 }
      validates :definicion, length: { maximum: 2 }
      validates :repetibilidad, length: { maximum: 2 }
      validates :reproducibilidad, length: { maximum: 2 }
      validates :calibracion, length: { maximum: 2 }
end

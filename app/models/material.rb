class Material < ActiveRecord::Base
  belongs_to :seism

      validates :variablilidad, length: { maximum: 2 }
      validates :cambios, length: { maximum: 2 }
      validates :proveedores, length: { maximum: 2 }
      validates :tipos, length: { maximum: 2 }
end

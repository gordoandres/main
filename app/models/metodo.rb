class Metodo < ActiveRecord::Base
  belongs_to :seism
      validates :estandarizacion, length: { maximum: 2 }
      validates :excepciones, length: { maximum: 2 }
      validates :definicion, length: { maximum: 2 }
end

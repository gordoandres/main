class Medioambiente < ActiveRecord::Base
  belongs_to :seism

      validates :ciclos, length: { maximum: 2 }
      validates :temperatura, length: { maximum: 2 }
end

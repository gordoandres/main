class Proyect < ActiveRecord::Base
	belongs_to :user
	has_many :problemas, dependent: :destroy 
	default_scope -> { order('created_at DESC') }
	validates :nombre, presence: true, length: { maximum: 140 }
	validates :user_id, presence: true
end

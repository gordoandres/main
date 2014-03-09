class Problema < ActiveRecord::Base
	belongs_to :proyect
	validates 	:problema, 
				presence: true, 
				length: { maximum: 140 }, 
				uniqueness: { case_sensitive: false }
	validates 	:descripcion, 
				presence: true, 
				length: { maximum: 560 }
	validates 	:proyect_id, 
				presence: true
end

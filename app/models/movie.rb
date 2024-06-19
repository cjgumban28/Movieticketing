class Movie < ApplicationRecord
	belongs_to :screen
	has_many :customers
	
	validates :name, presence:true, uniqueness:true
end

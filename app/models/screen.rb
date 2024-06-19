class Screen < ApplicationRecord
	has_one :movie
	has_many :customers, through: :movie
	belongs_to :theatre

	
	validates :screen_id, presence: true, uniqueness: true, numericality: true

# ----------------------------------Not for use--------------------------------
	# using scope
	# scope :created_before ,-> {where("created_at < ?", Date.today)}

	# def self.created_before
	# 	where("created_at < ?", Date.today)
	# end
# -----------------------------------------------------------------------------

end

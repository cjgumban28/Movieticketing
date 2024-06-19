class Theatre < ApplicationRecord
	has_many :customers
	has_many :employees
	has_many :screens
end

class Trip < ActiveRecord::Base
	has_many :cars
	has_many :expenses
	has_many :items

	validates :title, presence: true, length: { minimum: 5 }
end

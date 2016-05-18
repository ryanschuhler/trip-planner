class Trip < ActiveRecord::Base
	has_many :cars, dependent: :destroy
	has_many :expenses, dependent: :destroy
	has_many :items, dependent: :destroy

	validates :title, presence: true, length: { minimum: 5 }
end

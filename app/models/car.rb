class Car < ActiveRecord::Base
	belongs_to :trip
	has_many :members
end

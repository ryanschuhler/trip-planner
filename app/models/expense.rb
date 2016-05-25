class Expense < ActiveRecord::Base
	belongs_to :member
	belongs_to :trip
end

class Member < ActiveRecord::Base
  belongs_to :trip
  has_many :expenses, dependent: :destroy
  has_many :items
  has_one :car
  has_one :user
end

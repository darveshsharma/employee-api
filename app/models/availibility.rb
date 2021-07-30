class Availibility < ApplicationRecord
  belongs_to :employee
  has_many :slots
  accepts_nested_attributes_for :slots
end

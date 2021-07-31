class Availibility < ApplicationRecord
  belongs_to :employee
  has_many :slots,  :dependent => :destroy
  accepts_nested_attributes_for :slots
end

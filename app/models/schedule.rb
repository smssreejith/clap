class Schedule < ApplicationRecord
  belongs_to :customer
  belongs_to :booking
  belongs_to :pack
  belongs_to :employee
end

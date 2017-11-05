class Schedule < ApplicationRecord
  belongs_to :customer
  belongs_to :booking
  belongs_to :pack
  belongs_to :employee
  validate :clash

  def clash
    clash = Schedule.where(employee_id: employee_id, appointment: (appointment - 1.hour)..(appointment + 1.hour)).present?
    errors.add(:appointment, "Already taken") if clash
  end
end

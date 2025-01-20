class LeaveRequest < ApplicationRecord
  enum status: { pending: "pending", approved: "approved", rejected: "rejected" }, _prefix: true
  enum cause: { vacation: "vacation", sick: "sick", maternity: "maternity", personal: "personal" }, _prefix: true

  validates :cause, inclusion: { in: causes.keys }
  validates :status, inclusion: { in: statuses.keys }

  belongs_to :user
  has_many :leave_histories
end

class LeaveHistory < ApplicationRecord
  belongs_to :leave_request
  belongs_to :admin, class_name: 'User'
end

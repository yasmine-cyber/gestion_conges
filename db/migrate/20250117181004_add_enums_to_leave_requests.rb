class AddEnumsToLeaveRequests < ActiveRecord::Migration[8.0]
  def change
    change_column_default :leave_requests, :status, from: nil, to: "pending"
    change_column_null :leave_requests, :status, false
    change_column_default :leave_requests, :cause, from: nil, to: "vacation"
    change_column_null :leave_requests, :cause, false
  end
end

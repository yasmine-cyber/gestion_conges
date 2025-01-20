class AddDefaultValuesToLeaveRequests < ActiveRecord::Migration[8.0]
  def change
    change_column_default :leave_requests, :status, 'pending'
    change_column_default :leave_requests, :cause, 'vacation'
  end
end

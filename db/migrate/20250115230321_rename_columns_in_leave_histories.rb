class RenameColumnsInLeaveHistories < ActiveRecord::Migration[8.0]
  def change
    rename_column :leave_histories, :leave_requests_id, :leave_request_id
    rename_column :leave_histories, :users_id, :admin_id
  end
end

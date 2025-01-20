class CreateLeaveHistories < ActiveRecord::Migration[8.0]
  def change
    create_table :leave_histories do |t|
      t.references :leave_request, null: false, foreign_key: true
      t.string :action
      t.datetime :date_action
      t.references :admin, null: false, foreign_key: { to_table: :users }
      t.text :commentaire

      t.timestamps
    end
  end
end

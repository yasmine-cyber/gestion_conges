class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable
  has_many :leave_requests
  has_many :leave_histories, foreign_key: 'admin_id'
  def full_name
    "#{first_name} #{last_name}"
  end 
end

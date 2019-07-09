class User < ApplicationRecord
  has_many :work_space
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable

  def is_admin?
    return true if self.roles == 0
    false
  end
end

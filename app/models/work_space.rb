class WorkSpace < ApplicationRecord
  belongs_to :user
  has_many :question
end

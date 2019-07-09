class Question < ApplicationRecord
  belongs_to :work_space
  has_many :answers, dependent: :destroy
end

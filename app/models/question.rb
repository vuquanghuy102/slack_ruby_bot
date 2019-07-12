class Question < ApplicationRecord
  belongs_to :work_space
  has_many :choice, dependent: :destroy
  has_many :answer
end

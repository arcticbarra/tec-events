class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true
  validates :major, presence: true
  validates :semester, presence: true
end

class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list
  validates :movie, uniqueness: { scope: :list_id }, presence: true
  validates :comment, length: { minimum: 6 }
  validates :list, presence: true
end

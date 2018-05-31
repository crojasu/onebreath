class Activity < ApplicationRecord
  belongs_to :preset
  validates :name, presence: true
end

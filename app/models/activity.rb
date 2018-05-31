class Activity < ApplicationRecord
  belongs_to :preset
  has_many :breaks, dependent: :destroy
  validates :name, presence: true
end

class TimerSession < ApplicationRecord
  belongs_to :preset
  has_many :breaks,  dependent: :destroy
end

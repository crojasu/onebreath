class TimerSession < ApplicationRecord
  belongs_to :preset
  has_many :breaks,  dependent: :delete_all
end

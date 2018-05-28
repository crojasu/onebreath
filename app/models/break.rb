class Break < ApplicationRecord
  belongs_to :timer_session
  belongs_to :activity
end

class Break < ApplicationRecord
  belongs_to :timer_session
  belongs_to :activity

  def duration
    min = timer_session.preset.break_duration
    total_seconds = min * 60
    seconds = total_seconds % 60
    minutes = (total_seconds / 60) % 60
    hours = total_seconds / (60 * 60)

    format("%02d:%02d:%02d", hours, minutes, seconds) #=> "01:00:00"
    "00:00:10"
  end
end

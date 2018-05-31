class Preset < ApplicationRecord
  belongs_to :user
  has_many :activities
  after_create :populate_default_activities

  def string_duration
    total_seconds = focus_timer * 60
    seconds = total_seconds % 60
    minutes = (total_seconds / 60) % 60
    hours = total_seconds / (60 * 60)

    format("%02d:%02d:%02d", hours, minutes, seconds) #=> "01:00:00"
    "00:00:10"
  end

  private

  def populate_default_activities
    ["Meditation", "Social Media", "Reading"].each do |act|
      Activity.create(name: act, chosen: true, preset: self)
   end
end

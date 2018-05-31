class Preset < ApplicationRecord
  belongs_to :user
  has_many :activities,  dependent: :destroy
  has_many :timer_sessions, dependent: :delete_all
  has_many :breaks, through: :timer_sessions , dependent: :destroy
  after_create :populate_default_activities

  private

  def populate_default_activities
    ["Meditation", "Social Media", "Reading"].each do |act|
      Activity.create(name: act, chosen: true, preset: self)
    end
  end
end

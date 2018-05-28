class CreateTimerSessions < ActiveRecord::Migration[5.2]
  def change
    create_table :timer_sessions do |t|
      t.references :preset, foreign_key: true
      t.datetime :starts_at
      t.datetime :ends_at

      t.timestamps
    end
  end
end

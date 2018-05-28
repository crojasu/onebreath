class CreatePresets < ActiveRecord::Migration[5.2]
  def change
    create_table :presets do |t|
      t.integer :working_day
      t.integer :focus_timer
      t.references :user, foreign_key: true
      t.integer :break_duration

      t.timestamps
    end
  end
end

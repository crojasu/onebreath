class CreateBreaks < ActiveRecord::Migration[5.2]
  def change
    create_table :breaks do |t|
      t.references :timer_session, foreign_key: true
      t.references :activity, foreign_key: true

      t.timestamps
    end
  end
end

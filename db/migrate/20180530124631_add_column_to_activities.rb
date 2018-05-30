class AddColumnToActivities < ActiveRecord::Migration[5.2]
  def change
    add_column :activities, :chosen, :boolean
  end
end

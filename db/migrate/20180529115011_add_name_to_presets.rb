class AddNameToPresets < ActiveRecord::Migration[5.2]
  def change
    add_column :presets, :name, :string
  end
end

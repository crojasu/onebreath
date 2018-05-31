class AddLengthToBreak < ActiveRecord::Migration[5.2]
  def change
    add_column :breaks, :length, :string
  end
end

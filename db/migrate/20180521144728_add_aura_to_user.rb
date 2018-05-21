class AddAuraToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :aura, :integer, default: 1
  end
end

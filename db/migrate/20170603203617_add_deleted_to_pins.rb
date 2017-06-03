class AddDeletedToPins < ActiveRecord::Migration[5.0]
  def change

    add_column :pins, :deleted, :boolean, default: false

  end
end

class AddStatusToPin < ActiveRecord::Migration[5.0]
  def change

    add_column :pins, :status, :integer
  end
end

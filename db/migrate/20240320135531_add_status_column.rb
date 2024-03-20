class AddStatusColumn < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :status_id, :integer
  end
end

class AddInfoToUsers < ActiveRecord::Migration[5.2]
  def change
      add_column :users, :first_name, :string
      add_column :users, :last_name, :string
      add_column :users, :wallet, :string
      add_column :users, :balance, :decimal, :default => 0
  end
end

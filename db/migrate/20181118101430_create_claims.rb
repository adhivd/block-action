class CreateClaims < ActiveRecord::Migration[5.2]
  def change
    create_table :claims do |t|
      t.integer :stake
      t.references :user, foreign_key: true
      t.references :lawsuit, foreign_key: true

      t.timestamps
    end
  end
end

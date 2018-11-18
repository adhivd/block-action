class CreateLawsuits < ActiveRecord::Migration[5.2]
  def change
    create_table :lawsuits do |t|
      t.string :name
      t.text :description
      t.text :eligibility
      t.boolean :completed, :default => FALSE
      t.integer :settlement
      t.date :deadline
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

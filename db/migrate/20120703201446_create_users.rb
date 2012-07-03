class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :prefix
      t.string :suffix
      t.string :middle_name
      t.string :email
      t.string :normalised_number
      t.integer :account_id
      t.integer :created_by_id
      t.integer :updated_by_id
      t.timestamps
    end
  end
end

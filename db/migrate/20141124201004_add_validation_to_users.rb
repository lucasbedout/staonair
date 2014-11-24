class AddValidationToUsers < ActiveRecord::Migration
  def change
    add_column :users, :valid, :boolean, :default => false
    add_column :users, :role, :string, :default => 'sta'
  end
end

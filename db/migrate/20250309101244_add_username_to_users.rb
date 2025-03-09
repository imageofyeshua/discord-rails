class AddUsernameToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :username, :string
    add_column :users, :user_number, :integer
  end
end

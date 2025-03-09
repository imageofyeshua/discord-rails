class CreateServers < ActiveRecord::Migration[8.0]
  def change
    create_table :servers do |t|
      t.string :name
      t.belongs_to :owner, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end

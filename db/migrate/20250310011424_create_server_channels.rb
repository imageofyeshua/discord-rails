class CreateServerChannels < ActiveRecord::Migration[8.0]
  def change
    create_table :server_channels do |t|
      t.string :name
      t.belongs_to :server, null: false, foreign_key: true

      t.timestamps
    end
  end
end

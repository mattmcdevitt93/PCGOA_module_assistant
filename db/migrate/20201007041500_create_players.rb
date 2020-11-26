class CreatePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.integer :session_id
      t.string :name
      t.integer :status
      t.string :unique_link

      t.timestamps
    end
  end
end

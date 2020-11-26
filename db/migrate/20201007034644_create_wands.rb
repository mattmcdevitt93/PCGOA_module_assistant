class CreateWands < ActiveRecord::Migration[5.2]
  def change
    create_table :wands do |t|
      t.integer :session_id
      t.integer :uses_count
      t.integer :effect_id
      t.integer :player_id
      t.string :effect
      t.string :duration
      t.string :description

      t.timestamps
    end
  end
end

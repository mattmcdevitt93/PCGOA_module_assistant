class CreateGameSessions < ActiveRecord::Migration[5.2]
  def change
    create_table :game_sessions do |t|
      t.string :session_name
      t.integer :owner
      t.integer :number_of_players
      t.integer :effects_used
      t.string :passcode
      t.integer :effect_buffer
      t.boolean :lock_player_pages
      t.boolean :player_display_mode

      t.timestamps
    end
  end
end

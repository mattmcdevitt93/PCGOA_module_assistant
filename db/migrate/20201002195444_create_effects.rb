class CreateEffects < ActiveRecord::Migration[5.2]
  def change
    create_table :effects do |t|
      t.string :effect
      t.timestamps
    end
  end
end

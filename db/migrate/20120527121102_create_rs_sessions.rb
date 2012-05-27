class CreateRsSessions < ActiveRecord::Migration
  def change
    create_table :rs_sessions do |t|
      t.string :session_number
      t.integer :total_sittings
      t.timestamps
    end
  end
end

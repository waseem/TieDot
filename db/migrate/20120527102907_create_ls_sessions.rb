class CreateLsSessions < ActiveRecord::Migration
  def change
    create_table :ls_sessions do |t|
      t.integer :ls_parliament_id
      t.integer :session_number

      t.timestamps
    end
  end
end

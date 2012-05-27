class CreateLsSessionDates < ActiveRecord::Migration
  def change
    create_table :ls_session_dates do |t|
      t.integer :ls_session_id
      t.datetime :date

      t.timestamps
    end
  end
end

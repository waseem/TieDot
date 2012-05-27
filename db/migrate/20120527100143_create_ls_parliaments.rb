class CreateLsParliaments < ActiveRecord::Migration
  def change
    create_table :ls_parliaments do |t|
      t.integer :house_id
      t.integer :number

      t.timestamps
    end
  end
end

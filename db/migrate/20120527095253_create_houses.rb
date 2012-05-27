class CreateHouses < ActiveRecord::Migration
  def change
    create_table :houses do |t|
      t.string :name
      t.string :short_name

      t.timestamps
    end
  end
end

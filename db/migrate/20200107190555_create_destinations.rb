class CreateDestinations < ActiveRecord::Migration[5.2]
  def change
    create_table :destinations do |t|
      t.string :location
      t.string :schedule
      t.integer :user_id
    end
  end
end

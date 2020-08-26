class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.date :birthday
      t.string :name
      t.string :location
      t.text :work
      t.text :education
      t.string :relationship
      t.text :interests
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

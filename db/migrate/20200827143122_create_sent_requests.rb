class CreateSentRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :sent_requests do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :requestee_id

      t.timestamps
    end
  end
end

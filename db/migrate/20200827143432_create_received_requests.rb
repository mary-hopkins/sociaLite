class CreateReceivedRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :received_requests do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :requestor_id

      t.timestamps
    end
  end
end

class CreateEventMembers < ActiveRecord::Migration[7.1]
  def change
    create_table :event_members do |t|
      t.references :user, null: false, foreign_key: true
      t.references :event, null: false, foreign_key: true

      t.timestamps
    end
  end
end

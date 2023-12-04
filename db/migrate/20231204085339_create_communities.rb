class CreateCommunities < ActiveRecord::Migration[7.1]
  def change
    create_table :communities do |t|
      t.string :name
      t.string :description
      t.string :topic
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

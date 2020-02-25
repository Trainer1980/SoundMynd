class CreateSupportGroups < ActiveRecord::Migration
  def change
    create_table :support_groups do |t|
      t.string :name
      t.text :desc
      t.string :location
      t.time :time
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

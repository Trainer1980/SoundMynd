class CreateCounselors < ActiveRecord::Migration
  def change
    create_table :counselors do |t|
      t.string :first_name
      t.string :last_name
      t.string :specialty
      t.text :desc
      t.string :email

      t.timestamps null: false
    end
  end
end

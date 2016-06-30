class CreateUsersTable < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.datetime :bday
      t.string :password
    end
  end
end
class AddBabynameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :babyname, :string
  end
end

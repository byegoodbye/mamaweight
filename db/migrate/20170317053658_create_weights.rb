class CreateWeights < ActiveRecord::Migration
  def change
    create_table :weights do |t|
      t.float      :weight
      t.integer         :user_id
      t.timestamps
    end
  end
end
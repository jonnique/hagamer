class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string   :first_name, :limit => 20
      t.string   :last_name, :limit => 20
      t.string   :email, :null => false
      t.string   :password_digest, :null => false
      t.date     :birthday, :null => false
      t.integer  :facebook_id
      t.string   :facebook_token

      t.timestamps
    end
  end
end

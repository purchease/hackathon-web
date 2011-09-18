class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :firstname
      t.string :lastname
      t.string :foursquare_user_id
      t.string :email

      t.database_authenticatable
      t.confirmable
      t.recoverable
      t.rememberable
      t.trackable
      
      t.timestamps
    end
  end
end

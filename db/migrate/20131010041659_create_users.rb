class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :status, :default => "3"    # 0:su, 1:user, 2:graduation, 3:not verify
      t.string  :fb_id,  :limit   => 30
      t.string  :name
      t.string  :email
      t.string  :phone
      t.timestamps
      t.string  :token
    end
  end
end

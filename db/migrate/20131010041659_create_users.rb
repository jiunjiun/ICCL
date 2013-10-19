class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string  :role,    :default => "GU", :limit => 2   # SU:Super User, UE:user, GR:graduation, GU:guest
      t.string  :fb_id,   :limit   => 30
      t.string  :classes                                  # master, university
      t.string  :name
      t.string  :email
      t.string  :phone
      t.timestamps
      t.string  :token
    end
  end
end

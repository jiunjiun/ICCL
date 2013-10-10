class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.integer :status, :default => 1  #1:open, 2:close
      t.string  :title,  :limit => 100
      t.text    :content
      t.integer :line
    end
  end
end

class CreateStudies < ActiveRecord::Migration
  def change
    create_table :studies do |t|
      t.integer :status, :default => 1  #1:open, 2:close
      t.string  :title,  :limit => 100
      t.text    :content
      t.integer :line
      t.timestamps
    end
  end
end

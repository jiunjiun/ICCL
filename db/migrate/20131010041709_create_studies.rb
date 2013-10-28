class CreateStudies < ActiveRecord::Migration
  def change
    create_table :studies do |t|
      t.string  :classes                 # master, university
      t.string  :title,   :limit => 100
      t.text    :content
      t.integer :line
      t.integer :status,  :default => 1  # 1:open, 2:close
      t.timestamps
    end
  end
end

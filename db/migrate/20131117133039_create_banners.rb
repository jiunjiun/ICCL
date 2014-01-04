class CreateBanners < ActiveRecord::Migration
  def change
    create_table :banners do |t|
      t.string  :name
      t.string  :file
      t.string  :size
      t.string  :content_type
      t.integer :index, default: 1
      t.timestamps
    end
  end
end

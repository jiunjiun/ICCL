class CreatePapers < ActiveRecord::Migration
  def change
    create_table :papers do |t|
      t.string  :_type,  :limit=> 2  #PA: 期刊論文, IS: 國際學術研討會, DS:國內學術研討會
      t.integer :year,   :limit=> 4
      t.string  :name
      t.timestamps
    end
  end
end

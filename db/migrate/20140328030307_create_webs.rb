class CreateWebs < ActiveRecord::Migration
  def change
    create_table :webs do |t|
      t.string :name
      t.string :url
      t.text :html
      t.integer :facebook
      t.integer :twitter
      t.integer :hatena
      t.datetime :deleted_at

      t.timestamps
    end
  end
end

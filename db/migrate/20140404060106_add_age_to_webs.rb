class AddAgeToWebs < ActiveRecord::Migration
  def change
    add_column :webs, :timing, :integer
  end
end

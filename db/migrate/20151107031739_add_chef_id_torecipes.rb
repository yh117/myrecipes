class AddChefIdTorecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :chef_id, :integer
  end
end

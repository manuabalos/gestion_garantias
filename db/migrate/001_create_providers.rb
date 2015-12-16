class CreateProviders < ActiveRecord::Migration
  def change
    create_table :gg_providers do |t|
    	t.string :code_file
    	t.integer :code_provider
    	t.string :name_provider
    	t.integer :type_material
    	t.integer :code_article
    end
  end

  def self.down
    drop_table :gg_providers
  end
end

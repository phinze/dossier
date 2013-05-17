class CreateCommunities < ActiveRecord::Migration
  def change
    create_table :communities do |t|
      t.text :name
      t.text :url
      t.text :logo_url

      t.timestamps
    end
  end
end

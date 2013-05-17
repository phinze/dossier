class CreateFacts < ActiveRecord::Migration
  def change
    create_table :facts do |t|
      t.references :author
      t.references :membership
      t.references :facet
      t.text :value
      t.integer :position


      t.timestamps
    end

    create_table :facets do |t|
      t.references :community

      t.text :klass
      t.text :name 
      t.text :options

      t.timestamps
    end
  end
end

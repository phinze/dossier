class CreateFacts < ActiveRecord::Migration
  def change
    create_table :facts do |t|
      t.references :membership
      t.references :facet, polymorphic: true
      t.string :value
      t.integer :position


      t.timestamps
    end

    create_table :facets do |t|
      t.references :community

      t.string :klass
      t.string :name 
      t.string :options

      t.timestamps
    end
  end
end

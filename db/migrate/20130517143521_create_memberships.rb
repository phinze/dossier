class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.belongs_to :user, index: true
      t.belongs_to :community, index: true

      t.boolean :admin

      t.timestamps
    end
  end
end

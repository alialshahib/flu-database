class AddedDrugTable < ActiveRecord::Migration
  def self.up
    create_table :drugs do |t|
      t.string   :name
      t.text     :description
      t.datetime :created_at
      t.datetime :updated_at
    end
  end

  def self.down
    drop_table :drugs
  end
end

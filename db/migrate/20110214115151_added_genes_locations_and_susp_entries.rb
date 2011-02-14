class AddedGenesLocationsAndSuspEntries < ActiveRecord::Migration
  def self.up
    create_table :patient_locations do |t|
      t.string   :name
      t.text     :description
      t.datetime :created_at
      t.datetime :updated_at
    end

    create_table :genes do |t|
      t.string   :name
      t.text     :description
      t.datetime :created_at
      t.datetime :updated_at
    end

    create_table :suseptibility_report_entries do |t|
      t.float    :result
      t.datetime :created_at
      t.datetime :updated_at
    end
  end

  def self.down
    drop_table :patient_locations
    drop_table :genes
    drop_table :suseptibility_report_entries
  end
end

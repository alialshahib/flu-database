class HoboFluProject < ActiveRecord::Migration
  def self.up
    create_table :sequences do |t|
      t.integer  :gene
      t.text     :accession
      t.integer  :susp
      t.datetime :created_at
      t.datetime :updated_at
    end

    create_table :task_assignments do |t|
      t.datetime :created_at
      t.datetime :updated_at
      t.integer  :user_id
    end
    add_index :task_assignments, [:user_id]

    create_table :suseptibilities do |t|
      t.text     :title
      t.text     :comment
      t.text     :season_id
      t.date     :collection_date
      t.integer  :country_id
      t.datetime :created_at
      t.datetime :updated_at
    end

    create_table :mutations do |t|
      t.integer  :sequence_id
      t.text     :description
      t.datetime :created_at
      t.datetime :updated_at
    end

    create_table :patients do |t|
      t.text     :title
      t.integer  :location
      t.date     :dob
      t.text     :gender
      t.datetime :created_at
      t.datetime :updated_at
      t.integer  :suseptibility_id
    end
    add_index :patients, [:suseptibility_id]

    create_table :users do |t|
      t.string   :crypted_password, :limit => 40
      t.string   :salt, :limit => 40
      t.string   :remember_token
      t.datetime :remember_token_expires_at
      t.string   :name
      t.string   :email_address
      t.boolean  :administrator, :default => false
      t.datetime :created_at
      t.datetime :updated_at
      t.string   :state, :default => "active"
      t.datetime :key_timestamp
    end
    add_index :users, [:state]
  end

  def self.down
    drop_table :sequences
    drop_table :task_assignments
    drop_table :suseptibilities
    drop_table :mutations
    drop_table :patients
    drop_table :users
  end
end

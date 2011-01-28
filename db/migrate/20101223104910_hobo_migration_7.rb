class HoboMigration7 < ActiveRecord::Migration
  def self.up
    create_table :countries do |t|
      t.string   :brazil
      t.string   :argentina
      t.string   :chile
      t.string   :colombia
      t.string   :peru
      t.string   :uruguay
      t.datetime :created_at
      t.datetime :updated_at
    end

    add_column :suseptibilities, :country_id, :integer
    remove_column :suseptibilities, :country
    remove_column :suseptibilities, :comment

    add_index :suseptibilities, [:country_id]
  end

  def self.down
    remove_column :suseptibilities, :country_id
    add_column :suseptibilities, :country, :string
    add_column :suseptibilities, :comment, :text

    drop_table :countries

    remove_index :suseptibilities, :name => :index_suseptibilities_on_country_id rescue ActiveRecord::StatementInvalid
  end
end

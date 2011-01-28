class HoboMigration25 < ActiveRecord::Migration
  def self.up
    add_column :ic50_datas, :suseptibility_id, :integer

    add_column :suseptibilities, :title, :string

    add_index :ic50_datas, [:suseptibility_id]
  end

  def self.down
    remove_column :ic50_datas, :suseptibility_id

    remove_column :suseptibilities, :title

    remove_index :ic50_datas, :name => :index_ic50_datas_on_suseptibility_id rescue ActiveRecord::StatementInvalid
  end
end

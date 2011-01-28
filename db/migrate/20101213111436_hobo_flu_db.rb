class HoboFluDb < ActiveRecord::Migration
  def self.up
    add_column :sequences, :suseptibility_id, :integer

    add_index :sequences, [:suseptibility_id]

    add_index :mutations, [:sequence_id]
  end

  def self.down
    remove_column :sequences, :suseptibility_id

    remove_index :sequences, :name => :index_sequences_on_suseptibility_id rescue ActiveRecord::StatementInvalid

    remove_index :mutations, :name => :index_mutations_on_sequence_id rescue ActiveRecord::StatementInvalid
  end
end

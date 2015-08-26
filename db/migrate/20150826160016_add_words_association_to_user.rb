class AddWordsAssociationToUser < ActiveRecord::Migration

  def self.up
      add_column :words, :user_id, :integer
      add_index 'words', ['user_id'], :name => 'index_user_id' 
  end

  def self.down
      remove_column :words, :user_id
  end

end

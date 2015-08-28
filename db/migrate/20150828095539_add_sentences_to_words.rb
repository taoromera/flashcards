class AddSentencesToWords < ActiveRecord::Migration
  def change
    add_column :words, :sentence, :text
    add_column :words, :sent_trans, :text
  end
end

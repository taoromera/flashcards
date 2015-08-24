class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.string :native
      t.string :translit
      t.string :translat

      t.timestamps
    end
  end
end

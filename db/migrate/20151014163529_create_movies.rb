class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.column :title, :string
      t.column :director, :string
      t.column :release, :date
      t.column :runtime,  :string
      t.column :sypnopsis, :string
      t.column :picture,   :string 
    end
  end
end

class ChangeColumnNameSynopsis < ActiveRecord::Migration
  def change
    rename_column :movies, :sypnopsis, :summary
  end
end

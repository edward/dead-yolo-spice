class RemoveSingularDateFromMagazines < ActiveRecord::Migration
  def change
    remove_column :magazines, :readingperiod, :date
  end
end

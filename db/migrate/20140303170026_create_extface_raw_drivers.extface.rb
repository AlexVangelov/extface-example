# This migration comes from extface (originally 20140216131245)
class CreateExtfaceRawDrivers < ActiveRecord::Migration
  def change
    create_table :extface_raw_drivers do |t|
      t.string :type

      t.timestamps
    end
  end
end

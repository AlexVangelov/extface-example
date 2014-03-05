# This migration comes from extface (originally 20140216134748)
class CreateExtfacePbxCdrDrivers < ActiveRecord::Migration
  def change
    create_table :extface_pbx_cdr_drivers do |t|
      t.string :type

      t.timestamps
    end
  end
end

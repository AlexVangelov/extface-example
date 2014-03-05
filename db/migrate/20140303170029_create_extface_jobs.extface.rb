# This migration comes from extface (originally 20140219091811)
class CreateExtfaceJobs < ActiveRecord::Migration
  def change
    create_table :extface_jobs do |t|
      t.belongs_to :device, index: true

      t.timestamps
    end
  end
end

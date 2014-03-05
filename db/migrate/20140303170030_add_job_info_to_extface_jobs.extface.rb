# This migration comes from extface (originally 20140219175006)
class AddJobInfoToExtfaceJobs < ActiveRecord::Migration
  def change
    add_column :extface_jobs, :description, :string
    add_column :extface_jobs, :error, :string
    add_column :extface_jobs, :failed_at, :timestamp
    add_column :extface_jobs, :completed_at, :timestamp
    add_column :extface_jobs, :connected_at, :timestamp
  end
end

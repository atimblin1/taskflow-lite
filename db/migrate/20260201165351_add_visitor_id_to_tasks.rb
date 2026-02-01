class AddVisitorIdToTasks < ActiveRecord::Migration[8.1]
  def change
    add_column :tasks, :visitor_id, :string
    
    # Backfill existing tasks with a legacy visitor ID
    reversible do |dir|
      dir.up do
        execute "UPDATE tasks SET visitor_id = 'legacy' WHERE visitor_id IS NULL"
      end
    end
    
    change_column_null :tasks, :visitor_id, false
    add_index :tasks, :visitor_id
  end
end

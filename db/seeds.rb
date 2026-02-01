# Clear existing data in development
if Rails.env.development?
  Task.destroy_all
  puts "Cleared existing tasks"
end

# Create sample tasks
tasks_data = [
  {
    title: "Welcome to TaskFlow Lite!",
    description: "This is a sample task. Click 'Edit' to modify it or 'Complete' to mark it done. You can also create new tasks using the 'New Task' button above.",
    status: "open"
  },
  {
    title: "Try editing a task",
    description: "Click the Edit button on any task to modify its title or description.",
    status: "open"
  },
  {
    title: "Mark tasks as complete",
    description: "When you finish a task, click the Complete button. It will move to the Completed Tasks section.",
    status: "open"
  },
  {
    title: "Sample completed task",
    description: "This task has been marked as complete. You can reopen it if needed!",
    status: "completed"
  }
]

tasks_data.each do |task_attrs|
  task = Task.create!(task_attrs)
  puts "Created task: #{task.title}"
end

puts "\nSeeded #{Task.count} tasks successfully!"
puts "  - #{Task.open.count} open tasks"
puts "  - #{Task.completed.count} completed tasks"

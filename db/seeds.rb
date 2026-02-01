# Clear existing data in development
if Rails.env.development?
  Task.destroy_all
  puts "Cleared existing tasks"
end

# Create sample tasks with varying priorities
tasks_data = [
  {
    title: "Welcome to TaskFlow Lite!",
    description: "This is a sample task. Try editing it, completing it, or creating new tasks. You can also filter by priority.",
    status: "open",
    priority: "normal"
  },
  {
    title: "High priority item",
    description: "This task has high priority. Notice the yellow badge.",
    status: "open",
    priority: "high"
  },
  {
    title: "Regular task",
    description: "This is a normal priority task.",
    status: "open",
    priority: "normal"
  },
  {
    title: "Low priority task",
    description: "This can wait. Low priority tasks have a gray badge.",
    status: "open",
    priority: "low"
  },
  {
    title: "Completed high priority task",
    description: "This was important and now it's done!",
    status: "completed",
    priority: "high"
  }
]

tasks_data.each do |task_attrs|
  task = Task.create!(task_attrs)
  puts "Created task: #{task.title} (#{task.priority})"
end

puts "\nSeeded #{Task.count} tasks successfully!"
puts "  - #{Task.open.count} open tasks"
puts "  - #{Task.completed.count} completed tasks"

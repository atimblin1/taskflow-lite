# TaskFlow Lite

A simple, production-quality task management application built with Ruby on Rails.

## Purpose

TaskFlow Lite demonstrates clean fundamentals in web application development:
- Clear data modeling with validations and constraints
- RESTful architecture and conventional routing
- Server-side rendering with minimal JavaScript
- Clean MVC separation and maintainable code structure
- Sensible UI with modern CSS

This is an educational project optimized for **clarity, maintainability, and correctness**.

## Features

### Core Functionality
- **Create tasks** with title and optional description
- **Edit tasks** to update details
- **Mark tasks as completed** with automatic timestamp tracking
- **Reopen completed tasks** back to open status
- **Delete tasks** with confirmation
- **View tasks** separated by status (open vs completed)

### Technical Highlights
- Task validation (required title, valid status)
- Database constraints and indexes for performance
- Timestamps automatically tracked (created, updated, completed)
- Responsive UI that works on mobile and desktop
- Flash messages for user feedback
- Error handling with detailed validation messages

## Technology Stack

- **Ruby** 3.3.10
- **Rails** 8.1.2
- **PostgreSQL** database
- **Server-rendered HTML** with ERB templates
- **Vanilla CSS** for styling (no frameworks)
- **Turbo** for enhanced navigation (built into Rails 8)

## Design Choices

### Why Server-Side Rendering?
- Simpler architecture, easier to understand
- Better SEO and initial page load
- Less JavaScript complexity
- Turbo provides SPA-like experience where needed

### Why No Authentication?
- Keeps focus on core MVC patterns
- Reduces complexity for educational purposes
- Easy to add later if needed

### Database Design
```ruby
# Task Model
- title: string (required, max 255 chars)
- description: text (optional)
- status: string (required, default: 'open', values: 'open' or 'completed')
- completed_at: datetime (auto-set when status changes to completed)
- timestamps: created_at, updated_at (automatic)
```

Indexes on `status` and `created_at` for efficient querying.

## Getting Started

### Prerequisites
- Ruby 3.3.10 or higher
- PostgreSQL installed and running
- Bundler gem installed

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/atimblin1/taskflow-lite.git
   cd taskflow-lite
   ```

2. **Install dependencies**
   ```bash
   bundle install
   ```

3. **Set up the database**
   ```bash
   bin/rails db:create
   bin/rails db:migrate
   ```

4. **Start the server**
   ```bash
   bin/rails server
   ```

5. **Open in your browser**
   ```
   http://localhost:3000
   ```

## Usage

### Creating a Task
1. Click "New Task" button
2. Enter a title (required)
3. Optionally add a description
4. Click "Create Task"

### Managing Tasks
- **Complete**: Click the "Complete" button on an open task
- **Reopen**: Click the "Reopen" button on a completed task
- **Edit**: Click "Edit" to modify task details
- **Delete**: Click "Delete" and confirm to remove a task

### Task Organization
- Open tasks appear in the "Open Tasks" section
- Completed tasks appear in the "Completed Tasks" section
- Tasks are sorted by most recent first
- Task counts shown in section headers

## Code Structure

```
app/
├── controllers/
│   └── tasks_controller.rb    # CRUD operations + complete/reopen actions
├── models/
│   └── task.rb                # Validations, scopes, business logic
├── views/
│   ├── layouts/
│   │   └── application.html.erb
│   └── tasks/
│       ├── index.html.erb     # Main task list view
│       ├── new.html.erb       # New task form
│       ├── edit.html.erb      # Edit task form
│       └── _form.html.erb     # Shared form partial
├── assets/
│   └── stylesheets/
│       └── application.css    # All styling in one clean file
config/
├── routes.rb                  # RESTful routes configuration
└── database.yml              # PostgreSQL configuration
db/
├── migrate/
│   └── *_create_tasks.rb     # Tasks table schema
└── schema.rb                 # Current database schema
```

## Deployment to Heroku

### Prerequisites
- Heroku CLI installed
- Heroku account created

### Steps

1. **Login to Heroku**
   ```bash
   heroku login
   ```

2. **Create a Heroku app**
   ```bash
   heroku create your-app-name
   ```

3. **Push to Heroku**
   ```bash
   git push heroku main
   ```

4. **Run migrations**
   ```bash
   heroku run rails db:migrate
   ```

5. **Open your app**
   ```bash
   heroku open
   ```

### Environment Configuration
The app is already configured for Heroku deployment:
- PostgreSQL adapter configured in `database.yml`
- `Procfile` not needed (Heroku auto-detects Puma)
- Assets precompilation happens automatically
- Production database credentials set via `DATABASE_URL` env var

## Testing the App

You can quickly test core functionality:

```bash
# Open Rails console
bin/rails console

# Create a task
task = Task.create(title: "Learn Rails", description: "Build awesome apps")

# Mark it complete
task.complete!

# Reopen it
task.reopen!

# Query tasks
Task.open
Task.completed
Task.recent
```

## Development

### Running in Development
```bash
bin/rails server
```
Visit http://localhost:3000

### Database Commands
```bash
# Create databases
bin/rails db:create

# Run migrations
bin/rails db:migrate

# Reset database
bin/rails db:reset

# Open PostgreSQL console
bin/rails dbconsole
```

### Code Quality
The app follows Rails best practices:
- RESTful routing conventions
- Strong parameters for security
- Database constraints and validations
- Proper HTTP status codes
- Separation of concerns (MVC)

## What's NOT Included (By Design)

- User authentication/authorization
- User accounts or multi-tenancy
- Real-time updates
- File attachments
- Task priorities or tags
- Drag-and-drop sorting
- Task assignments or collaboration
- API endpoints

These features were intentionally excluded to keep the codebase simple and focused on fundamentals.

## Understanding the Code in 10 Minutes

1. **Start with routes** (`config/routes.rb`) - See the RESTful structure
2. **Check the model** (`app/models/task.rb`) - Business logic and validations
3. **Review the controller** (`app/controllers/tasks_controller.rb`) - Request handling
4. **Look at the main view** (`app/views/tasks/index.html.erb`) - UI structure
5. **Scan the CSS** (`app/assets/stylesheets/application.css`) - Styling approach

That's it! The entire app is intentionally small and readable.

## License

This project is open source and available for educational purposes.

## Contributing

This is an educational project. Feel free to fork and experiment!

## Questions?

The code is designed to be self-explanatory. If something is unclear, that's a bug in the design!

# TaskFlow Lite

![TaskFlow Lite](docs/screenshot.png)

TaskFlow Lite is a lightweight task management application built with Ruby on Rails.
It focuses on clean fundamentals, predictable behavior, and minimal UI.

## Features
- Create, edit, complete, reopen, and delete tasks
- Priority levels (low, normal, high) with filtering
- Separate views for open and completed tasks
- Flash feedback for all actions
- Simple, readable UI
- Sample seed data for first-time users

## Tech Stack
- Ruby on Rails 8.1
- PostgreSQL
- Server-rendered HTML
- Minimal JavaScript (Turbo for enhanced navigation)

## Design Goals
- Demonstrate clean MVC structure
- Avoid overengineering
- Prioritize clarity and maintainability
- Ship a complete, understandable application

## Non-Goals
- Authentication
- Collaboration
- Real-time updates
- Complex permissions

## Getting Started
```bash
bundle install
rails db:setup
rails server
```

Visit http://localhost:3000

## Future Improvements
- Search
- Pagination
- Due dates
- Tags or categories

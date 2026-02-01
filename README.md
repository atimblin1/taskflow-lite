# TaskFlow Lite

TaskFlow Lite is a small task management app built with Ruby on Rails.

I built it as a deliberately scoped project to focus on fundamentals: clean CRUD behavior, readable code, and a UI that stays out of the way. It’s meant to feel like a tool you’d actually keep open in a browser tab, not a demo packed with features.

## What it does
- Create, edit, complete, reopen, and delete tasks  
- Keep open and completed tasks clearly separated  
- Show immediate feedback when actions succeed or fail  
- Seed a few example tasks so the app isn’t empty on first run  

## Tech stack
- Ruby on Rails  
- PostgreSQL  
- Server-rendered HTML  
- Minimal JavaScript  

## Design approach
This app is intentionally simple.

There’s no authentication, no collaboration, and no real-time behavior. Those were conscious choices to keep the code easy to follow and to avoid solving problems that aren’t necessary at this scale.

The goal here is correctness and clarity, not cleverness.

## What this project is not
- A full productivity system  
- A real-time or multi-user app  
- A showcase of advanced Rails patterns  

## Running it locally
```bash
bundle install
rails db:setup
rails server
Then visit http://localhost:3000.
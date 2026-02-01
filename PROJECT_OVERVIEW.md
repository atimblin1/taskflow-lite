# TaskFlow Lite - Project Overview

## What This Is

A production-quality task management application demonstrating clean Rails fundamentals. Built as an educational project to showcase:
- Proper MVC architecture
- RESTful design patterns
- Database modeling with constraints
- Server-side rendering
- Clean, maintainable code

**Time to understand: < 10 minutes**

## Core Files (Read These First)

### 1. Routes (config/routes.rb)
Standard RESTful routes + 2 custom actions for task status changes.

### 2. Model (app/models/task.rb)
- Fields: title (required), description (optional), status, completed_at
- Validations: Title presence, status inclusion
- Scopes: open, completed, recent
- Methods: complete!, reopen!, completed?
- Callbacks: Auto-set completed_at timestamp

### 3. Controller (app/controllers/tasks_controller.rb)
Standard RESTful actions + complete/reopen custom actions

### 4. Views (app/views/tasks/)
- index.html.erb - Main page with open/completed sections
- new.html.erb - New task page
- edit.html.erb - Edit task page
- _form.html.erb - Shared form partial

### 5. Styles (app/assets/stylesheets/application.css)
Single CSS file with modern features, no external frameworks

## Key Design Decisions

1. **Status as String** - Simple, clear, indexed
2. **Completed Timestamp** - Separate from updated_at
3. **No Soft Deletes** - Keeps code simple
4. **Server-Side Rendering** - Turbo provides SPA-like experience
5. **Single Stylesheet** - Modern CSS, no preprocessor needed

## Production Checklist

✅ Database constraints
✅ Model validations  
✅ Error handling
✅ Flash messages
✅ CSRF protection
✅ SQL injection prevention
✅ XSS prevention
✅ Responsive design
✅ Heroku-ready
✅ Database indexes
✅ Clear documentation

## Metrics

- Lines of Code: ~300 (excluding generated files)
- Files Modified: 8 core files
- Dependencies: Standard Rails stack only
- Database Tables: 1
- Routes: 9 (7 RESTful + 2 custom)

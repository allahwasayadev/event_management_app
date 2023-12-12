# Event Management Application

This Ruby on Rails application provides a simple yet robust platform for managing events. Users can create, view, join, and manage events through a user-friendly interface. The application also offers a RESTful API for event data management.

## Environment Variables Setup

Create a .env File

```bash
touch .env
```

Add Environment Variables
Open the .env file and add your environment variables. For example:

```bash
DATABASE_USERNAME=your_username
DATABASE_PASSWORD=your_password
```

## System Requirements

- Ruby version: 3.1.2
- Rails version: 7.0.8
- PostgreSQL

## Installation

### Clone the Repository

```bash
git clone [repository URL]
cd [repository name]
```

### Install Dependencies

Run the following command to install the required gems:

```bash
bundle install
```

### Database Setup

Create and migrate the database:

```bash
rails db:create
rails db:migrate
```

### Start the Server

To start the Rails server, run:

```bash
rails server
```

The application will be accessible at http://localhost:3000.

## Features

- User Authentication (using Devise)
- Event Management (CRUD operations for events)
- RESTful API Endpoints
- Responsive UI with Tailwind CSS
- Authorization (using Pundit)
- Front-end Interaction (using Turbo and Stimulus)

## Running Tests

To run the test suite, use:

```bash
rspec
```

## API Endpoints

The application offers several API endpoints for event management:

- GET /api/v1/events: List all events
- POST /api/v1/events: Create a new event
- GET /api/v1/events/:id: Show an event
- PATCH/PUT /api/v1/events/:id: Update an event
- DELETE /api/v1/events/:id: Delete an event

## Future Updates

- Addition of Event types
- If event is virtual, then linking the invite to the meeting
- If event is in person, then adding a pin location for help
- Notification prior to set time before event
- Allow to share Event with other Users as well
- Invite others to the Event

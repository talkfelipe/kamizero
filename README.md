# KAMIZERO

**Managing School Notices Paperlessly**

A modern, full-stack web application that bridges the gap between teachers, parents, and school administration by digitizing school communications.

---

## Overview

KAMIZERO eliminates paper-based school notices by providing a centralized digital platform where:
- **Teachers** can broadcast announcements and events to parents
- **Parents** can receive notices, view events on a calendar, and message teachers about their children
- **Everyone** benefits from real-time notifications, read receipts, and organized communication

### Key Highlights

- **AI-Powered Document Digitization** - Scan physical notices with OCR and let AI convert them to clean, structured markdown
- **Real-Time Notifications** - Track read/unread status for all notices and messages
- **Smart Calendar Integration** - View school events with color-coded school indicators
- **QR Code Enrollment** - Quick student linking via QR code scanning

---

## Features

### For Teachers
- Create and broadcast notices to entire school or specific classrooms
- Categorize notices as **Events** (with date/time) or **General** announcements
- Use templates for recurring notice types
- Upload physical documents and let AI digitize them
- Reply to parent messages about students
- View read receipts to track parent engagement

### For Parents
- Receive notices from all your children's schools in one place
- Filter notices by school, category, or search terms
- View events on an interactive monthly calendar
- Send messages to teachers about specific children
- Track message status with read indicators

### Core Functionality
- **Document Scanning & AI Processing** - Upload images/PDFs of physical notices, extract text via OCR, and use AI to generate clean markdown content with automatic title extraction
- **Role-Based Access Control** - Teachers and parents see different dashboards and have appropriate permissions
- **Polymorphic Notification System** - Unified read/unread tracking across notices and messages
- **Dynamic School Colors** - Each school gets a unique color using golden angle distribution for visual organization
- **Full-Text Search** - Find notices quickly with PostgreSQL-powered search

---

## Tech Stack

| Layer | Technology |
|-------|------------|
| **Backend** | Ruby 3.3.5, Rails 7.1.6 |
| **Frontend** | Hotwire (Turbo + Stimulus), Bootstrap 5.3, SCSS |
| **Database** | PostgreSQL |
| **Authentication** | Devise |
| **File Storage** | Cloudinary (Active Storage) |
| **AI/ML** | RubyLLM (Claude API), OCR.space API |
| **Search** | PG Search |
| **Deployment** | Heroku, Docker |

---

## Getting Started

### Prerequisites

- Ruby 3.3.5
- PostgreSQL
- Node.js

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/talkfelipe/kamizero.git
   cd kamizero
   ```

2. **Install dependencies**
   ```bash
   bundle install
   ```

3. **Set up environment variables**

   Create a `.env` file with:
   ```
   CLOUDINARY_URL=your_cloudinary_url
   OCR_API_KEY=your_ocr_space_api_key
   ANTHROPIC_API_KEY=your_anthropic_api_key
   ```

4. **Set up the database**
   ```bash
   rails db:create
   rails db:migrate
   rails db:seed
   ```

5. **Start the server**
   ```bash
   ./bin/dev
   ```

6. **Visit** `http://localhost:3000`

### Docker

```bash
docker build -t kamizero .
docker run -p 3000:3000 kamizero
```

---

## Project Structure

```
kamizero/
├── app/
│   ├── controllers/     # MVC Controllers (pages, notices, notes, students)
│   ├── models/          # ActiveRecord models with business logic
│   ├── views/           # ERB templates with Turbo Frames
│   ├── javascript/      # Stimulus controllers for interactivity
│   │   └── controllers/
│   │       ├── document_upload_controller.js  # OCR & AI integration
│   │       ├── qr_scanner_controller.js       # QR code scanning
│   │       ├── preview_controller.js          # Markdown preview
│   │       └── ...
│   ├── assets/          # SCSS stylesheets and images
│   └── helpers/         # View helpers (markdown rendering, etc.)
├── config/              # Rails configuration
├── db/                  # Migrations and schema
└── test/                # Test suite
```

### Key Models

- **User** - Teachers and parents (role-based)
- **Student** - Children linked to parents and classrooms
- **School** - School entities
- **Classroom** - Class groupings (e.g., "Grade 3A")
- **Notice** - Announcements and events with markdown content
- **Note** - Parent-teacher messages about students
- **ReadNotification** - Polymorphic read status tracking

---

## How It Works

### AI Document Processing Pipeline

1. **Upload** - User uploads an image or PDF of a physical notice
2. **OCR** - OCR.space API extracts raw text from the document
3. **AI Processing** - RubyLLM sends the text to Claude to:
   - Extract a concise title
   - Convert raw text to well-structured Markdown
   - Preserve the original language
4. **Auto-Fill** - Form fields are populated with the processed content

### Notification System

The app uses a polymorphic `ReadNotification` model to track read status across both notices and messages:

```ruby
# Single table tracks reads for multiple content types
class ReadNotification < ApplicationRecord
  belongs_to :user
  belongs_to :notification, polymorphic: true
end
```

### Dynamic School Colors

Schools are assigned unique colors using the golden angle algorithm (137.508°) for optimal visual distribution:

```javascript
const hue = (schoolId * 137.508) % 360;
// Generates well-distributed pastel colors for any number of schools
```

---

## Screenshots

*Coming soon*

---

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

---

## License

This project is open source and available under the [MIT License](LICENSE).

---

## Acknowledgments

- Built with Ruby on Rails and the incredible Rails ecosystem
- AI capabilities powered by Anthropic's Claude
- OCR processing by OCR.space

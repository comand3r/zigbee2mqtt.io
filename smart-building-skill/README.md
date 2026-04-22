# 🏗️ Smart-Building.ro - Complete Development Kit for Antigraviti

## 📋 What's in this Skill?

This is a **complete, production-ready specification** for reconstructing **smart-building.ro**, a professional real estate evaluation platform with ANEVAR certification support.

### Files Included:

1. **SKILL_SMART_BUILDING.md** - Complete 500+ line specification covering:
   - Full feature requirements
   - Database schema
   - API endpoints
   - Admin panel functionality
   - Color scheme & design system
   - Deployment instructions
   - Testing checklist

2. **docker-compose.yml** - Local development setup:
   - Next.js application server (port 3000)
   - MySQL database (port 3306)
   - phpMyAdmin for database management (port 8080)
   - Ready to run at 192.168.1.73

3. **Dockerfile** - Production-ready containerization:
   - Multi-stage builds for optimization
   - Secure Node.js Alpine base
   - Ready for cPanel deployment

4. **DATABASE_SCHEMA.sql** - Complete MySQL schema:
   - 12 normalized tables
   - Users, gallery, listings, blog, certificates, contact, settings
   - Proper indexing for performance
   - Initial sample data

5. **.env.example** - Environment variables template:
   - Database connection
   - Email configuration (Yahoo SMTP)
   - NextAuth secrets
   - Site URLs

6. **README.md** - This file

---

## 🚀 Quick Start for Antigraviti

### What Antigraviti Should Build:

```
smart-building-project/
├── Frontend (Next.js 14 + TypeScript)
│   ├── 10 public pages (home, gallery, blog, contact, etc)
│   ├── 8 admin pages (login, dashboard, content management)
│   └── Complete i18n (9 languages)
├── Backend (Next.js API Routes + NextAuth.js)
│   ├── Authentication & security
│   ├── File uploads & image optimization
│   ├── Email sending (Yahoo SMTP)
│   └── Database operations (Prisma ORM)
├── Database (MySQL 8.0)
│   ├── 12 tables with proper relationships
│   ├── SEO-optimized structure
│   └── Security-focused design
└── Infrastructure
    ├── Docker setup (local @ 192.168.1.73)
    └── cPanel deployment ready (euroenerg.ro)
```

### Tech Stack Summary

```yaml
Frontend:
  - Next.js 14 (App Router, SSR, Incremental Static Regeneration)
  - TypeScript for type safety
  - Tailwind CSS for responsive design
  - shadcn/ui for components
  - next-intl for 9-language support
  - React Hook Form + Zod validation
  - yet-another-react-lightbox for gallery
  - react-pdf for PDF viewing
  - Nodemailer for email

Backend:
  - Next.js API Routes
  - NextAuth.js 5 for authentication
  - Prisma ORM for database
  - Sharp for image optimization
  - Bcrypt for password hashing
  - next-seo for SEO

Database:
  - MySQL 8.0 on cPanel
  - 12 normalized tables
  - Full-text search capabilities
  - Proper foreign keys & indexing

Deployment:
  - Docker Compose for local dev
  - cPanel for production
```

---

## 📊 Key Features

### 🔐 Admin Panel
- **Secure Login**: Email + password + math CAPTCHA
- **Brute Force Protection**: 3 failed attempts → 15-min lockout
- **Password Reset**: Via Yahoo email with secure tokens
- **User Management**: Create/edit admin users with roles

### 📸 Media Management
- **Image Gallery**: 20 images with zoom, lightbox, reorder
- **Relevee Imobile**: Separate image gallery
- **PDF Certificates**: Multiple PDFs, viewable but not downloadable
- **Listing Images**: Per-property image management

### 📰 Blog System
- **3 Categories**: Investiții, Sfaturi Imobiliare, Financiar
- **Rich Text Editor**: Full HTML content editing
- **SEO Metadata**: Title, description, slug per post
- **Publishing**: Draft/Published status + scheduling

### 🏘️ Real Estate Listings
- **Multiple Listings**: Create/edit/delete properties
- **Rich Details**: Price, surface, rooms, location, type
- **Image Gallery**: Per-listing image management
- **Featured Listings**: Show specific properties on homepage

### 💬 Contact & Communication
- **Contact Form**: Name, email, phone, message
- **Email Integration**: Automatic email via Yahoo SMTP
- **WhatsApp & Telegram**: Direct messaging buttons
- **Admin Settings**: Configure phone, email, links from panel

### 🌍 Internationalization
- **9 Languages**: RO (default), EN, DE, ES, FR, IT, ZH, JA, PT
- **Language Switcher**: In header, persistent selection
- **URL-based Routing**: /ro/, /en/, /de/, etc.
- **Editable Translations**: JSON-based, easy to update

### ⚙️ SEO Optimization
- **Meta Tags**: Title, description, keywords
- **Open Graph**: Social media sharing
- **Structured Data**: JSON-LD for search engines
- **Sitemap & Robots**: Auto-generated
- **Responsive**: Mobile-first, all devices

---

## 🛠️ Implementation Guide for Antigraviti

### Phase 1: Project Setup
1. Initialize Next.js 14 project with TypeScript
2. Install dependencies (React 18, Tailwind, shadcn/ui, Prisma)
3. Setup folder structure as specified
4. Configure TypeScript & ESLint

### Phase 2: Database & Backend
1. Create Prisma schema based on DATABASE_SCHEMA.sql
2. Setup NextAuth.js with credentials provider
3. Implement authentication routes (login, reset password)
4. Create API routes for all endpoints
5. Setup Nodemailer with Yahoo SMTP
6. Implement file upload & image optimization

### Phase 3: Admin Interface
1. Create admin login page with math CAPTCHA
2. Build admin dashboard with stats
3. Implement all admin management pages:
   - Gallery upload & management
   - Listings CRUD
   - Blog post editor
   - Settings panel
   - User management
4. Add protected routes & middleware

### Phase 4: Public Pages
1. Create homepage with hero, featured listing preview
2. Build gallery page with lightbox
3. Relevee imobile page (separate gallery)
4. Blog listing & single post pages
5. Contact page with form
6. PDF certificate viewer page
7. Evaluare ANEVAR editable page
8. Listings directory & detail pages

### Phase 5: i18n & Translations
1. Setup next-intl routing
2. Create translation files for all 9 languages
3. Implement language switcher component
4. Test routing & language switching

### Phase 6: UI/UX & Styling
1. Implement color scheme (Navy #1B3A5C + Gold #C9A84C)
2. Create responsive layout components
3. Mobile-first Tailwind design
4. Test on devices/screen sizes

### Phase 7: SEO & Performance
1. Configure next-seo
2. Create sitemap.xml & robots.txt
3. Add Open Graph & Twitter Card meta tags
4. Optimize images & bundles
5. Setup caching headers

### Phase 8: Testing & QA
1. Test all admin functionality
2. Test all public pages
3. Test responsiveness (mobile, tablet, desktop)
4. Test authentication & security
5. Test email sending
6. Test i18n routing
7. Performance testing (Lighthouse)

### Phase 9: Docker & Deployment
1. Build Docker image
2. Test locally at 192.168.1.73
3. Prepare for cPanel deployment
4. Setup MySQL on cPanel
5. Deploy production version
6. Configure SSL/HTTPS
7. Setup DNS

---

## 📝 Database Schema Overview

```
users                    - Admin accounts
login_attempts          - Brute force protection
password_reset_tokens   - Secure password resets
gallery_images          - Both galerie & relevee images
listings                - Real estate properties
listing_images          - Per-property images
blog_posts              - Blog articles
certificates            - PDF documents
pages                   - Editable content (like ANEVAR page)
settings                - Key-value configuration
contact_messages        - Contact form submissions
```

---

## 🔑 Important Configuration

### Email Setup (Yahoo)
```
Host: smtp.mail.yahoo.com
Port: 465 (SSL) or 587 (TLS)
User: stroedaniel@yahoo.com
Password: [Yahoo App Password - 20 characters]
```

Create Yahoo App Password:
1. Go to https://login.yahoo.com/account/security
2. Generate app password
3. Add to .env.local as EMAIL_PASSWORD

### Admin Credentials (Initial)
```
Email: stroedaniel@yahoo.com
Password: Admin@123 (change immediately in production)
```

### Local Development (Docker @ 192.168.1.73)
```bash
docker-compose up -d
# Access:
# - App: http://192.168.1.73:3000
# - Admin: http://192.168.1.73:3000/admin/login
# - DB: http://192.168.1.73:8080 (phpMyAdmin)
```

---

## 📦 Dependencies to Install

```json
{
  "dependencies": {
    "next": "^14.2.0",
    "react": "^18.3.0",
    "react-dom": "^18.3.0",
    "typescript": "^5.4.0",
    "prisma": "^5.0.0",
    "@prisma/client": "^5.0.0",
    "next-auth": "^5.0.0",
    "bcryptjs": "^2.4.3",
    "nodemailer": "^6.9.0",
    "next-intl": "^3.0.0",
    "tailwindcss": "^3.4.0",
    "react-hook-form": "^7.51.0",
    "zod": "^3.22.0",
    "react-pdf": "^7.5.0",
    "yet-another-react-lightbox": "^3.15.0",
    "sharp": "^0.33.0",
    "next-seo": "^6.4.0",
    "zustand": "^4.4.0",
    "clsx": "^2.1.0",
    "uuid": "^9.0.0"
  },
  "devDependencies": {
    "@types/node": "^20.0.0",
    "@types/react": "^18.3.0",
    "@types/react-dom": "^18.3.0",
    "autoprefixer": "^10.4.0",
    "postcss": "^8.4.0",
    "eslint": "^8.0.0",
    "eslint-config-next": "^14.2.0"
  }
}
```

---

## ✅ Pre-Launch Checklist

```
FUNCTIONALITY:
☐ Admin login with captcha works
☐ Password reset via email works
☐ Image upload & display works
☐ Gallery lightbox zoom/swipe works
☐ Blog CRUD complete
☐ Listings CRUD complete
☐ Contact form sends emails
☐ PDF viewer works (no download)
☐ All 9 language options work
☐ Admin settings save correctly

RESPONSIVE:
☐ Mobile (375px, 425px) tested
☐ Tablet (768px, 1024px) tested
☐ Desktop (1440px) tested
☐ Touch gestures work

PERFORMANCE:
☐ Lighthouse score > 80
☐ Page load < 3 seconds
☐ Images optimized (WebP)
☐ JS/CSS minified & cached

SECURITY:
☐ HTTPS/SSL configured
☐ CSRF protection enabled
☐ XSS prevention verified
☐ SQL injection prevented (Prisma)
☐ File upload validated
☐ Admin routes protected
☐ Passwords hashed (bcrypt)

SEO:
☐ Sitemap.xml exists
☐ robots.txt correct
☐ Meta tags present
☐ Structured data validates
☐ Mobile-friendly verified
☐ No broken links
```

---

## 🚢 Deployment Steps

### For cPanel (euroenerg.ro)
1. Access cPanel via https://euroenerg.ro:2083/
2. Create MySQL database (smart_building)
3. Git clone project or upload files
4. Run `npm install --production`
5. Run `npm run build`
6. Configure .env.production.local
7. Setup PM2 or Node process manager
8. Configure domain DNS
9. Setup SSL certificate (AutoSSL or Let's Encrypt)
10. Test all functionality

---

## 📞 Support

**Created for:** Antigraviti AI Code Generator  
**Project Owner:** Smart-Building Team  
**Admin Email:** stroedaniel@yahoo.com  
**Domain:** smart-building.ro  
**Hosting:** euroenerg.ro cPanel  
**Local Dev:** Docker @ 192.168.1.73  

---

## 📄 License

This is a commercial project specification. All code created from this specification is proprietary to Smart-Building.

---

**Document Status:** ✅ Ready for Development  
**Last Updated:** 2026-04-21  
**Version:** 1.0

# 🏗️ SKILL: Reconstructie Smart-Building.ro - Antigraviti Blueprint

**Creat pentru:** Antigraviti AI Code Generator  
**Proiect:** Smart-Building Real Estate & ANEVAR Evaluation Platform  
**Data:** 2026-04-21  
**Status:** Specification Completes  

---

## 📋 EXECUTIVE SUMMARY

Acest document este blueprint-ul complet pentru reconstrucția site-ului **smart-building.ro** - o platformă de evaluare imobiliară ANEVAR cu panou admin complet, galerie media, blog multicu, anunțuri imobiliare și suport multiling.

**Obiectivele cheie:**
- ✅ Platform profesional SEO-optimizat
- ✅ Panou admin cu autentificare securizată (login, captcha, lockout)
- ✅ Galerie de imagini cu zoom și navigație
- ✅ Blog cu 3 categorii editable
- ✅ Anunțuri imobiliare cu imagini și text
- ✅ Vizualizator PDF (fără download)
- ✅ Formular contact cu integrare WhatsApp/Telegram
- ✅ Suport 9 limbi (RO, EN, DE, ES, FR, IT, ZH, JA, PT)
- ✅ Responsiv pe mobil, tablet, desktop
- ✅ Deploy local Docker @ 192.168.1.73
- ✅ Hosting cPanel euroenerg.ro

---

## 🎨 DESIGN SYSTEM & COLOR PALETTE

### Culori Profesionale (Real Estate)

```
PRIMARY COLORS:
- Deep Navy Blue:    #1B3A5C (headers, buttons primary)
- Gold/Champagne:    #C9A84C (accents, highlights)
- Clean White:       #FFFFFF (background, cards)

SECONDARY COLORS:
- Light Background:  #F8F9FA (section backgrounds)
- Medium Gray:       #E5E7EB (borders, dividers)
- Dark Charcoal:     #2C3445 (primary text)
- Medium Text:       #6B7280 (secondary text)
- Footer Dark:       #0D2137 (footer background)

SEMANTIC COLORS:
- Success:           #16A34A (forms, confirmations)
- Error:             #DC2626 (form errors, alerts)
- Warning:           #F59E0B (notifications)
- Info:              #0EA5E9 (information)

GRADIENTS:
- Hero Gradient:     #1B3A5C → #2C5282 (linear-gradient)
- Button Hover:      #1B3A5C → #C9A84C (radial)
```

### Tipografie

```
HEADERS:
- Font Family:       "Segoe UI", "Trebuchet MS", sans-serif
- H1:                48px / 56px (1.4 line-height) - Bold
- H2:                36px / 44px (1.3) - Bold
- H3:                28px / 36px (1.3) - Bold
- H4:                24px / 32px (1.3) - Semi-Bold
- H5:                20px / 28px (1.2) - Semi-Bold
- H6:                16px / 24px (1.2) - Semi-Bold

BODY:
- Font Family:       "Segoe UI", "-apple-system", sans-serif
- Regular:           16px / 24px (1.5 line-height)
- Small:             14px / 20px (1.4)
- Tiny:              12px / 16px (1.3)

LETTER SPACING:
- Headers:           -0.5px (kerning)
- Body:              0px
- Buttons:           0.5px
```

---

## 🏛️ TECH STACK & ARCHITECTURE

### Backend & Frontend

```yaml
Frontend:
  - Framework:       Next.js 14 (App Router)
  - Language:        TypeScript
  - Styling:         Tailwind CSS 3.x
  - UI Components:   shadcn/ui (pentru consistență)
  - State:           React Context + Zustand
  - Forms:           React Hook Form + Zod validation

Backend:
  - Runtime:         Node.js 20.x
  - API:             Next.js API Routes / REST
  - Database ORM:    Prisma 5.x
  - Authentication:  NextAuth.js 5.x
  - Email:           Nodemailer (Yahoo SMTP)

Database:
  - System:          MySQL 8.0+
  - Host:            euroenerg.ro (cPanel)
  - Credentials:     (din cPanel credentials)

Image Management:
  - Upload:          Local filesystem + Sharp optimization
  - Serving:         Next.js Image component (optimization)
  - Lightbox:        yet-another-react-lightbox
  - Zoom:            Pinch-zoom (mobile) + Mouse wheel (desktop)

Internationalization:
  - Library:         next-intl v3.x
  - Languages:       RO (default), EN, DE, ES, FR, IT, ZH, JA, PT
  - Storage:         URL routing + localStorage fallback

PDF Viewing:
  - Library:         react-pdf v7.x
  - Features:        Page navigation, zoom, fullscreen
  - Security:        Disabled download/print

SEO:
  - Meta:            next-seo
  - Sitemap:         next-sitemap
  - Schema:          JSON-LD structured data
  - Performance:     Vercel Web Vitals

Deployment:
  - Local Dev:       Docker Compose @ 192.168.1.73
  - Production:      cPanel (euroenerg.ro)
  - Database:        MySQL on cPanel
```

### Versioning

```json
{
  "node": ">=20.0.0",
  "npm": ">=10.0.0",
  "nextjs": "14.2.x",
  "react": "^18.3.x",
  "typescript": "^5.4.x",
  "prisma": "^5.x",
  "nextauth": "^5.x"
}
```

---

## 📁 PROJECT STRUCTURE

```
smart-building.ro/
├── .env.local                    # Local env (git ignored)
├── .env.example                  # Example env
├── docker-compose.yml            # Local Docker setup
├── Dockerfile                    # Container config
├── package.json
├── tsconfig.json
├── tailwind.config.ts
├── next.config.js
├── prisma/
│   ├── schema.prisma            # Database schema
│   └── migrations/              # DB migrations
├── src/
│   ├── app/
│   │   ├── layout.tsx           # Root layout
│   │   ├── page.tsx             # Home page (/)
│   │   ├── [locale]/            # i18n routing
│   │   │   ├── page.tsx         # Localized home
│   │   │   ├── layout.tsx       # Localized layout
│   │   │   ├── galerie/         # /[locale]/galerie
│   │   │   ├── relevee-imobile/ # /[locale]/relevee-imobile
│   │   │   ├── investitii/      # /[locale]/investitii
│   │   │   ├── blog/            # /[locale]/blog
│   │   │   ├── blog/[slug]/     # Single blog post
│   │   │   ├── certificat-urbanism/ # PDFs
│   │   │   ├── contact/         # Contact form
│   │   │   ├── evaluare-anevar/ # Editable content page
│   │   │   ├── anunturi/        # Listings
│   │   │   └── anunturi/[slug]/ # Single listing
│   │   ├── admin/
│   │   │   ├── layout.tsx       # Admin layout
│   │   │   ├── page.tsx         # Dashboard
│   │   │   ├── login/           # Login page
│   │   │   ├── galerie/         # Image management
│   │   │   ├── relevee/         # Relevee images
│   │   │   ├── anunturi/        # Listing management
│   │   │   ├── blog/            # Blog management
│   │   │   ├── certificat/      # PDF management
│   │   │   ├── evaluare-anevar/ # Page editor
│   │   │   ├── setari/          # Settings (phone, email, etc)
│   │   │   └── utilizatori/     # User management
│   │   └── api/
│   │       ├── auth/            # NextAuth endpoints
│   │       ├── upload/          # Image upload
│   │       ├── gallery/         # Gallery API
│   │       ├── listings/        # Listings API
│   │       ├── blog/            # Blog API
│   │       ├── contact/         # Contact form submission
│   │       ├── pdf/             # PDF serving
│   │       └── settings/        # Settings API
│   ├── components/
│   │   ├── Header.tsx           # Navigation + language selector
│   │   ├── Footer.tsx
│   │   ├── Lightbox.tsx         # Gallery lightbox
│   │   ├── PDFViewer.tsx        # PDF viewer component
│   │   ├── ContactForm.tsx      # Contact form
│   │   ├── LanguageSwitcher.tsx
│   │   └── admin/               # Admin-specific components
│   ├── lib/
│   │   ├── auth.ts              # NextAuth config
│   │   ├── db.ts                # Prisma client
│   │   ├── email.ts             # Nodemailer setup
│   │   ├── captcha.ts           # Math CAPTCHA generator
│   │   ├── password.ts          # Password hashing (bcrypt)
│   │   ├── seo.ts               # SEO utilities
│   │   └── constants.ts         # App constants
│   ├── styles/
│   │   ├── globals.css          # Tailwind directives
│   │   └── variables.css        # CSS variables (colors)
│   ├── types/
│   │   └── index.ts             # TypeScript interfaces
│   ├── middleware.ts            # i18n + auth middleware
│   └── messages/
│       ├── ro.json              # Romanian translations
│       ├── en.json              # English
│       ├── de.json              # German
│       ├── es.json              # Spanish
│       ├── fr.json              # French
│       ├── it.json              # Italian
│       ├── zh.json              # Chinese
│       ├── ja.json              # Japanese
│       └── pt.json              # Portuguese
├── public/
│   ├── images/
│   │   ├── gallery/             # Uploaded gallery images
│   │   ├── relevee/             # Relevee images
│   │   └── listings/            # Listing images
│   ├── documents/
│   │   └── certificates/        # PDF certificates
│   ├── logo.svg
│   ├── favicon.ico
│   ├── robots.txt
│   └── sitemap.xml
└── scripts/
    ├── seed-db.ts               # Initial data seeding
    └── optimize-images.ts       # Image optimization
```

---

## 🔐 AUTENTIFICARE ADMIN

### Sistema de Login

```
FLOW:
1. Utilizatorul acceseaza /admin/login
2. Form cu:
   - Email (stroedaniel@yahoo.com inițial)
   - Password
   - Math CAPTCHA (ex: "Ce este 7 + 5?")
   - Remember me checkbox

3. Validări:
   - CAPTCHA invalid → Reset CAPTCHA, mesaj eroare
   - Password/Email greșit → Contor +1
   - După 3 încercări greșite în 15 min → Lockout 15 min
   - IP address tracked pentru lockout

4. Login reușit:
   - JWT token creat
   - Session cookie secure (httpOnly, Secure, SameSite=Strict)
   - Redirecționare → /admin

LOGOUT:
- Clearning session
- Redirect → /

PASSWORD RESET:
1. User merge la /forgot-password
2. Introduce email
3. Backend genereaza token unic (15 min validity)
4. Email trimis via Nodemailer + Yahoo SMTP:
   "Salutare! Pentru a reseta parola, accesează: 
    https://smart-building.ro/reset-password?token=xyz"
5. User acceseaza link, introduce parola nouă
6. Password updated, redirect → login

SECURITY:
- Passwords: bcrypt hashing (salt rounds: 12)
- Tokens: Crypto randomBytes (32 bytes)
- Rate limiting: 5 requests/min pe login endpoint
- Session timeout: 24 hours
```

### Math CAPTCHA Generator

```typescript
// lib/captcha.ts
interface Captcha {
  question: string;      // "What is 7 + 5?"
  answer: number;
  id: string;           // Session ID
  svg?: string;         // Optional SVG visual
}

export function generateCaptcha(locale: string): Captcha {
  // Random numbers 1-20
  const num1 = Math.floor(Math.random() * 20) + 1;
  const num2 = Math.floor(Math.random() * 20) + 1;
  const operator = ['+', '-'][Math.floor(Math.random() * 2)];
  
  const answer = operator === '+' ? num1 + num2 : num1 - num2;
  const question = `${num1} ${operator} ${num2}`;
  
  return {
    question,
    answer,
    id: crypto.randomUUID()
  };
}
```

---

## 📸 GALERIILE

### Galerie Principală (20 imagini)

```
FUNCȚIONALITĂȚI:
✓ Upload: Drag & drop max 20 imagini (JPG, PNG, WebP)
✓ Preview: Thumbnail grid cu delete button
✓ Reorder: Drag to reorder
✓ Front: Lightbox cu:
  - Zoom: Mouse wheel (desktop) / Pinch (mobile)
  - Navigate: Arrow keys, swipe, prev/next buttons
  - Close: Escape key, X button, click outside
  - Info: Alt text displayed
  - Fullscreen: Fullscreen button

TEHNICĂ:
- Image compression: Sharp (max 1200x1200px, 80% quality)
- Storage: public/images/gallery/[uuid].[ext]
- DB: gallery_images table
- Loading: Next.js Image component (lazy load)
```

### Pagina "Relevee Imobile"

```
Similar cu galerie principală dar cu upload separat:
- Path: public/images/relevee/
- DB: Same gallery_images table cu type: 'relevee'
- Functionalitate identică
```

---

## 📰 BLOG

### Structură Blog

```
PAGINI:
- /blog                   # Liste articole + filtrare
- /blog/[category]        # Articole per categorie
- /blog/[slug]           # Single article view

CATEGORII (3):
1. Investiții
2. Sfaturi Imobiliare
3. Financiar

ADMIN FEATURES:
✓ Create/Edit/Delete posts
✓ Rich text editor (TipTap sau Quill)
✓ Cover image upload
✓ Slug auto-generate
✓ Meta description
✓ Category selection
✓ Publish/Draft toggle
✓ Schedule publish (optional)

FRONTEND:
- Card view cu cover image + excerpt
- Related articles (same category)
- Comment section (optional)
- Share buttons (WhatsApp, Email, Copy link)
```

---

## 🏘️ ANUNȚURI IMOBILIARE

### Listing Management

```
FIELDS:
- Title: string (required)
- Slug: string (auto-generated)
- Description: RichText (required)
- Price: decimal
- Surface area: number (m²)
- Rooms: number
- Bathrooms: number
- Location: string
- Type: enum (Apartament, Casa, Teren, etc)
- Status: enum (De vânzare, De închiriat, Vândut)
- Published: boolean
- Featured: boolean (show on homepage)
- Created_at: timestamp
- Updated_at: timestamp

IMAGES:
- Main image (cover)
- Gallery (up to 15 images)
- Image upload on admin page
- Lightbox on listing page

ADMIN:
✓ Create listing
✓ Edit listing
✓ Upload/reorder images
✓ Delete listing
✓ Feature/Unfeatured toggle
✓ Publish/Draft

FRONTEND:
- /anunturi              # All listings
- /anunturi/[slug]      # Single listing detail
- Homepage listing preview (featured)
```

---

## 📄 CERTIFICAT DE URBANISM (PDFs)

### PDF Management

```
FEATURES:
✓ Upload multiple PDFs (Admin panel)
✓ Reorder PDFs
✓ Title & description per PDF
✓ Delete PDF

VIEWING:
✓ Page navigation (prev/next, input page number)
✓ Zoom in/out buttons
✓ Fullscreen mode
✓ Download button: DISABLED
✓ Print: DISABLED
✓ Responsive on mobile

SECURITY:
- PDFs served from /api/pdf/[id]?token=[secure-token]
- Token validates user is admin or public (based on setting)
- PDFs not directly downloadable via public URL

LIBRARY: react-pdf v7
```

---

## 📧 CONTACT & FORMULAR

### Formular Contact

```
FIELDS:
- Name: text (required)
- Email: email (required)
- Phone: tel (optional)
- Message: textarea (required)
- Privacy checkbox (required)

SUBMISSION:
1. Client-side validation (Zod)
2. Server validation
3. Email sent via Nodemailer → stroedaniel@yahoo.com (configurable)
4. Message saved to DB (contact_messages table)
5. Response: "Mesaj trimis cu succes!"

EMAIL TEMPLATE (HTML):
"
Salutare,

Ati primit un mesaj nou de la: [Name]
Email: [Email]
Telefon: [Phone]

Mesaj:
[Message]

---
Trimis de smart-building.ro contact form
"

INTEGRĂRI:
- WhatsApp button: href="https://wa.me/40XXXXXXXXX" (configurable din admin)
- Telegram button: href="https://t.me/username" (configurable din admin)
- Phone number: Clickable tel: link

ADMIN SETTINGS (/admin/setari):
- Phone number (afișat pe contact + link WhatsApp)
- Email recipient (unde ajung mesajele)
- WhatsApp number
- Telegram handle
```

### Email Setup (Nodemailer + Yahoo)

```typescript
// lib/email.ts
import nodemailer from 'nodemailer';

export const transporter = nodemailer.createTransport({
  service: 'yahoo',
  host: 'smtp.mail.yahoo.com',
  port: 465,  // SSL
  secure: true,
  auth: {
    user: process.env.EMAIL_USER,      // stroedaniel@yahoo.com
    pass: process.env.EMAIL_PASSWORD,  // App password (20 chars)
  },
});

// Usage:
await transporter.sendMail({
  from: 'noreply@smart-building.ro',
  to: process.env.EMAIL_RECIPIENT,
  subject: 'Mesaj nou de contact',
  html: emailTemplate
});
```

**.env.local:**
```
EMAIL_USER=stroedaniel@yahoo.com
EMAIL_PASSWORD=xxxx xxxx xxxx xxxx    # Yahoo app password (20 chars)
EMAIL_RECIPIENT=stroedaniel@yahoo.com # Configurable din admin
SMTP_HOST=smtp.mail.yahoo.com
SMTP_PORT=465
```

---

## 🌍 INTERNATIONALIZATION (i18n)

### 9 Limbi Suportate

```
Limbile:
1. 🇷🇴 Română (default)
2. 🇺🇸 English
3. 🇩🇪 Deutsch
4. 🇪🇸 Español
5. 🇫🇷 Français
6. 🇮🇹 Italiano
7. 🇨🇳 中文 (Chinese)
8. 🇯🇵 日本語 (Japanese)
9. 🇵🇹 Português

ROUTING:
- /               → redirects to /ro (default)
- /ro             → Romanian
- /en             → English
- /de, /es, etc   → Other languages

LANGUAGE SWITCHER:
- Located in header (top right)
- Dropdown cu 9 flag + language name
- Remembers selection in localStorage
- Persists across pages

IMPLEMENTATION:
- next-intl v3 for routing & translations
- JSON files: src/messages/{locale}.json
- useTranslations() hook in components
```

### Translation Files Structure

```json
// src/messages/ro.json
{
  "nav": {
    "home": "Acasă",
    "gallery": "Galerie",
    "blog": "Blog",
    "contact": "Contact",
    "admin": "Admin"
  },
  "home": {
    "hero_title": "Bem-vindo ao Smart-Building",
    "hero_subtitle": "Evaluare Imobiliară Profesională ANEVAR"
  },
  // ... more translations
}
```

---

## 📄 PAGINA EVALUARE ANEVAR

```
FEATURE:
- Custom page cu text editable din admin
- /evaluare-anevar
- Text stored in 'pages' table
- Rich text editor in admin panel

ADMIN:
- /admin/evaluare-anevar
- Edit button → opens modal cu rich text editor
- Save → updates DB
- Preview on frontend

FRONTEND:
- Display formatted text
- Include company phone number (from settings)
- Include contact CTA button
```

---

## ⚙️ ADMIN PANEL PAGES

### 1. Dashboard (/admin)

```
Stats & Overview:
- Total listings
- Total gallery images
- Blog post count
- Recent contact messages
- Recent login activity

Quick Actions:
- New listing button
- New blog post button
- Upload images button
- View messages button

Charts (optional):
- Page views (from analytics)
- Messages over time
```

### 2. Image Gallery Management

```
/admin/galerie

Grid view:
- Thumbnail preview
- Drag to reorder
- Delete button
- Upload new button (drag & drop)

Upload Modal:
- Max 20 images total
- Validation: JPG, PNG, WebP only
- Size: max 5MB each
- Auto-optimization via Sharp
- Progress bar during upload

Edit (optional):
- Alt text input
- Description input
```

### 3. Listings (/admin/anunturi)

```
Table view:
- Title, Status (Draft/Published), Featured, Created_at
- Edit button → Form modal
- Delete button → Confirm modal
- New listing button

Edit Form:
- All fields from schema
- Image upload (main + gallery)
- Save / Discard buttons
```

### 4. Blog (/admin/blog)

```
Table:
- Title, Category, Status, Created_at
- Edit, Delete, Preview buttons
- New post button

Edit:
- Title input
- Category dropdown (3 options)
- Cover image upload
- Rich text editor (TipTap)
- Meta description
- Slug (auto-generated, editable)
- Status: Draft/Published
- Schedule publish (optional)
```

### 5. Settings (/admin/setari)

```
Editable Fields:
- Phone number (displayed on pages)
- Email recipient (for contact form)
- WhatsApp number
- Telegram handle/username
- Company name
- Company address
- Meta description (homepage)
- Keywords (homepage)

Save button + Success message
```

### 6. Users (/admin/utilizatori)

```
Table:
- Email, Role, Created_at
- Edit button
- Delete button

Add user button:
- Email
- Temporary password (sent via email)
- Role (Admin, Editor)

Edit:
- Email
- Role
- Force password reset checkbox
```

### 7. Certificate Management (/admin/certificat)

```
Upload:
- Drag & drop PDF files
- Title & description per file
- Delete button
- Reorder (drag)

View & manage:
- Filename, Upload date, size
- Preview button (small embed)
- Delete button
```

---

## 🗄️ DATABASE SCHEMA

### Tables

```sql
-- Users
CREATE TABLE users (
  id BIGINT PRIMARY KEY AUTO_INCREMENT,
  email VARCHAR(255) UNIQUE NOT NULL,
  password_hash VARCHAR(255) NOT NULL,
  name VARCHAR(255),
  role ENUM('admin', 'editor') DEFAULT 'editor',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Login Attempts (for lockout tracking)
CREATE TABLE login_attempts (
  id BIGINT PRIMARY KEY AUTO_INCREMENT,
  ip_address VARCHAR(45),
  email VARCHAR(255),
  attempted_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  success BOOLEAN DEFAULT FALSE,
  INDEX (ip_address, attempted_at)
);

-- Gallery Images (both galerie & relevee)
CREATE TABLE gallery_images (
  id BIGINT PRIMARY KEY AUTO_INCREMENT,
  filename VARCHAR(255) NOT NULL,
  alt_text VARCHAR(255),
  image_type ENUM('galerie', 'relevee') DEFAULT 'galerie',
  display_order INT DEFAULT 0,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  INDEX (image_type, display_order)
);

-- Real Estate Listings
CREATE TABLE listings (
  id BIGINT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(255) NOT NULL,
  slug VARCHAR(255) UNIQUE NOT NULL,
  description LONGTEXT NOT NULL,
  price DECIMAL(15, 2),
  surface_area DECIMAL(10, 2),
  rooms INT,
  bathrooms INT,
  location VARCHAR(255),
  type VARCHAR(50),
  status ENUM('de_vanzare', 'de_inchiriat', 'vandut') DEFAULT 'de_vanzare',
  published BOOLEAN DEFAULT FALSE,
  featured BOOLEAN DEFAULT FALSE,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  INDEX (published, featured)
);

-- Listing Images
CREATE TABLE listing_images (
  id BIGINT PRIMARY KEY AUTO_INCREMENT,
  listing_id BIGINT NOT NULL,
  filename VARCHAR(255) NOT NULL,
  is_main BOOLEAN DEFAULT FALSE,
  display_order INT DEFAULT 0,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (listing_id) REFERENCES listings(id) ON DELETE CASCADE,
  INDEX (listing_id, is_main)
);

-- Blog Posts
CREATE TABLE blog_posts (
  id BIGINT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(255) NOT NULL,
  slug VARCHAR(255) UNIQUE NOT NULL,
  content LONGTEXT NOT NULL,
  category ENUM('investitii', 'sfaturi_imobiliare', 'financiar'),
  excerpt VARCHAR(500),
  cover_image VARCHAR(255),
  published BOOLEAN DEFAULT FALSE,
  scheduled_at TIMESTAMP NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  created_by BIGINT,
  FOREIGN KEY (created_by) REFERENCES users(id),
  INDEX (published, category, created_at)
);

-- Certificates (PDFs)
CREATE TABLE certificates (
  id BIGINT PRIMARY KEY AUTO_INCREMENT,
  filename VARCHAR(255) NOT NULL,
  title VARCHAR(255) NOT NULL,
  description TEXT,
  file_size INT,
  display_order INT DEFAULT 0,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  INDEX (display_order, created_at)
);

-- Contact Messages
CREATE TABLE contact_messages (
  id BIGINT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  phone VARCHAR(20),
  message LONGTEXT NOT NULL,
  read BOOLEAN DEFAULT FALSE,
  responded BOOLEAN DEFAULT FALSE,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  INDEX (read, created_at)
);

-- Pages (for editabile content)
CREATE TABLE pages (
  id BIGINT PRIMARY KEY AUTO_INCREMENT,
  slug VARCHAR(255) UNIQUE NOT NULL,
  content LONGTEXT,
  meta_description VARCHAR(500),
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  updated_by BIGINT,
  FOREIGN KEY (updated_by) REFERENCES users(id)
);

-- Settings (key-value for phone, email, etc)
CREATE TABLE settings (
  id BIGINT PRIMARY KEY AUTO_INCREMENT,
  setting_key VARCHAR(100) UNIQUE NOT NULL,
  setting_value TEXT,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Password Reset Tokens
CREATE TABLE password_reset_tokens (
  id BIGINT PRIMARY KEY AUTO_INCREMENT,
  user_id BIGINT NOT NULL,
  token VARCHAR(255) UNIQUE NOT NULL,
  expires_at TIMESTAMP NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
  INDEX (token, expires_at)
);
```

---

## 🔌 API ENDPOINTS

### Authentication

```
POST   /api/auth/register          # New user (admin only)
POST   /api/auth/login             # Login
POST   /api/auth/logout            # Logout
POST   /api/auth/forgot-password   # Request reset
POST   /api/auth/reset-password    # Reset password
GET    /api/auth/session           # Get current session
```

### Gallery

```
GET    /api/gallery                # Get all images
POST   /api/gallery                # Upload image (admin)
DELETE /api/gallery/[id]           # Delete image (admin)
PUT    /api/gallery/[id]/order     # Reorder images (admin)
```

### Listings

```
GET    /api/listings               # Get all listings
GET    /api/listings/[slug]        # Get single listing
POST   /api/listings               # Create listing (admin)
PUT    /api/listings/[id]          # Update listing (admin)
DELETE /api/listings/[id]          # Delete listing (admin)
POST   /api/listings/[id]/images   # Upload listing images (admin)
```

### Blog

```
GET    /api/blog                   # Get all posts
GET    /api/blog/[slug]            # Get single post
POST   /api/blog                   # Create post (admin)
PUT    /api/blog/[id]              # Update post (admin)
DELETE /api/blog/[id]              # Delete post (admin)
```

### Certificates

```
GET    /api/certificates           # Get all certificates
POST   /api/certificates           # Upload certificate (admin)
DELETE /api/certificates/[id]      # Delete certificate (admin)
GET    /api/pdf/[id]               # Serve PDF (secure)
```

### Contact

```
POST   /api/contact                # Submit contact form
GET    /api/contact                # Get messages (admin)
PUT    /api/contact/[id]/read      # Mark as read (admin)
DELETE /api/contact/[id]           # Delete message (admin)
```

### Settings

```
GET    /api/settings               # Get all settings
PUT    /api/settings/[key]         # Update setting (admin)
```

---

## 🐳 DOCKER SETUP (Local @ 192.168.1.73)

### docker-compose.yml

```yaml
version: '3.8'

services:
  app:
    build:
      context: .
      dockerfile: Dockerfile
    container_name: smart-building
    ports:
      - "3000:3000"
    environment:
      - NODE_ENV=development
      - DATABASE_URL=mysql://root:password@db:3306/smart_building
      - NEXTAUTH_SECRET=dev-secret-key-min-32-chars
      - NEXTAUTH_URL=http://192.168.1.73:3000
      - EMAIL_USER=stroedaniel@yahoo.com
      - EMAIL_PASSWORD=${EMAIL_PASSWORD}
    depends_on:
      db:
        condition: service_healthy
    volumes:
      - .:/app
      - /app/node_modules
    command: npm run dev

  db:
    image: mysql:8.0
    container_name: smart-building-db
    environment:
      - MYSQL_ROOT_PASSWORD=password
      - MYSQL_DATABASE=smart_building
      - MYSQL_USER=smart_building
      - MYSQL_PASSWORD=password
    ports:
      - "3306:3306"
    volumes:
      - db_data:/var/lib/mysql
      - ./database/init.sql:/docker-entrypoint-initdb.d/init.sql
    healthcheck:
      test: ["CMD", "mysqladmin", "ping", "-h", "localhost"]
      timeout: 20s
      retries: 10

  phpmyadmin:
    image: phpmyadmin:latest
    container_name: smart-building-phpmyadmin
    environment:
      - PMA_HOST=db
      - PMA_USER=root
      - PMA_PASSWORD=password
    ports:
      - "8080:80"
    depends_on:
      - db

volumes:
  db_data:
```

### Dockerfile

```dockerfile
FROM node:20-alpine

WORKDIR /app

COPY package*.json ./
RUN npm ci

COPY . .

RUN npm run build

EXPOSE 3000

CMD ["npm", "start"]
```

---

## 🚀 DEPLOYMENT CHECKLIST

### Local Development (Docker @ 192.168.1.73)

```bash
# 1. Clone & setup
git clone <repo> smart-building
cd smart-building
cp .env.example .env.local

# 2. Fill in .env.local:
DATABASE_URL=mysql://user:pass@db:3306/smart_building
NEXTAUTH_SECRET=<32+ char random secret>
NEXTAUTH_URL=http://192.168.1.73:3000
EMAIL_USER=stroedaniel@yahoo.com
EMAIL_PASSWORD=<yahoo app password>

# 3. Start Docker
docker-compose up -d

# 4. Seed database
docker-compose exec app npx prisma migrate dev
docker-compose exec app npx prisma db seed

# 5. Access
- App:        http://192.168.1.73:3000
- Admin:      http://192.168.1.73:3000/admin/login
- phpMyAdmin: http://192.168.1.73:8080
```

### Production (cPanel @ euroenerg.ro)

```bash
# 1. Connect via cPanel / SSH
ssh user@euroenerg.ro

# 2. Create MySQL database
- Via cPanel: Create database 'smart_building'
- User: smart_building_user
- Password: <strong password>

# 3. Upload code
- Via Git:
  git clone <repo> ~/public_html/smart-building
  cd ~/public_html/smart-building

# 4. Install dependencies
npm install --production

# 5. Build Next.js
npm run build

# 6. Set env variables (cPanel File Manager)
.env.production.local:
DATABASE_URL=mysql://smart_building_user:password@localhost/smart_building
NEXTAUTH_SECRET=<32+ chars>
NEXTAUTH_URL=https://smart-building.ro
NODE_ENV=production

# 7. Start with PM2 or Node
pm2 start "npm run start" --name smart-building

# 8. Configure SSL
- cPanel AutoSSL or Let's Encrypt

# 9. Configure domain
- Point smart-building.ro → Your cPanel IP
- Configure DNS A record
```

---

## 🎯 SEO OPTIMIZATION

### On-Page SEO

```
- Meta tags: title, description (160 chars), keywords
- Open Graph: og:title, og:description, og:image, og:url
- Twitter Card: twitter:card, twitter:title, twitter:description
- Canonical tags on all pages
- H1-H6 hierarchy (1 H1 per page)
- Image alt attributes
- Internal linking
- Structured data (JSON-LD) for:
  - Organization
  - LocalBusiness
  - Article (blog)
  - Product (listings)
```

### Technical SEO

```
- Sitemap.xml (auto-generated)
- robots.txt
- Mobile-responsive (verified)
- Fast loading (Next.js optimization)
- Clean URLs (slug-based)
- 404 page
- Breadcrumbs (structured data)
```

### Implementation

```typescript
// next-seo.config.js
export default {
  titleTemplate: '%s | Smart-Building',
  defaultTitle: 'Smart-Building - Evaluare Imobiliară ANEVAR',
  description: 'Platform profesională de evaluare imobiliară...',
  openGraph: {
    type: 'website',
    locale: 'ro_RO',
    url: 'https://smart-building.ro',
    siteName: 'Smart-Building',
  },
};

// Each page uses NextSeo component:
<NextSeo
  title="Galerie"
  description="Vizualizează colecția noastră de 20 imagini..."
  openGraph={{
    url: 'https://smart-building.ro/galerie',
    title: 'Galerie Smart-Building',
    description: '...',
    images: [{ url: imagePath }]
  }}
/>
```

---

## 📱 RESPONSIVE DESIGN

```
Breakpoints (Tailwind):
- sm:  640px  (Small phones)
- md:  768px  (Tablets)
- lg:  1024px (Laptops)
- xl:  1280px (Desktops)
- 2xl: 1536px (Large screens)

Mobile-First Approach:
- Base styles: mobile
- sm:  → enhancements for small phones
- md:  → enhancements for tablets
- lg:  → enhancements for laptops

Tested on:
- iOS (Safari, Chrome)
- Android (Chrome, Firefox)
- Windows (Edge, Chrome)
- macOS (Safari, Chrome)
- Linux (Chrome, Firefox)
```

---

## ✅ TESTING & QA CHECKLIST

### Before Go-Live

```
FUNCTIONALITY:
✓ Login/logout works
✓ Password reset works
✓ Image upload/delete works
✓ Blog CRUD works
✓ Listings CRUD works
✓ Contact form submits & emails work
✓ Gallery lightbox zoom works
✓ PDF viewer works (no download button)
✓ Language switcher works (all 9 languages)
✓ Admin settings update correctly

RESPONSIVE:
✓ Mobile (375px, 425px)
✓ Tablet (768px, 1024px)
✓ Desktop (1440px, 1920px)
✓ Touch interactions work (swipe, pinch)
✓ Buttons/forms accessible

PERFORMANCE:
✓ Lighthouse score > 80
✓ Page load < 3 seconds
✓ Images optimized (WebP, srcset)
✓ CSS/JS minified
✓ Caching headers set

SECURITY:
✓ CSRF protection
✓ XSS prevention
✓ SQL injection prevention (Prisma)
✓ Password reset tokens expire
✓ Admin routes protected
✓ File upload validated
✓ Rate limiting on login

SEO:
✓ Sitemap.xml exists
✓ robots.txt allows indexing
✓ Meta tags present
✓ Structured data validates
✓ No broken links
✓ Mobile-friendly (Google Mobile-Friendly Test)
```

---

## 🔄 MAINTENANCE & UPDATES

### Regular Tasks

```
WEEKLY:
- Check contact messages
- Monitor login attempts (brute force)
- Verify email delivery

MONTHLY:
- Update dependencies (npm outdated)
- Check SSL certificate (validity)
- Review error logs

QUARTERLY:
- Security audit
- Performance review
- Database optimization (ANALYZE, OPTIMIZE)
- Backup database
```

---

## 📞 CONTACT SUPPORT

**Project Owner:** Smart-Building Team  
**Domain:** smart-building.ro  
**Admin Email:** stroedaniel@yahoo.com  
**Hosting:** euroenerg.ro cPanel  
**Database:** MySQL on cPanel  
**Local Dev:** Docker @ 192.168.1.73  

---

**Document Version:** 1.0  
**Last Updated:** 2026-04-21  
**Status:** Ready for Development ✅

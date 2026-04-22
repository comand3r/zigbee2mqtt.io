-- ============================================================================
-- SMART-BUILDING.RO DATABASE SCHEMA
-- MySQL 8.0+
-- Encoding: UTF-8
-- ============================================================================

-- ============================================================================
-- USERS TABLE - Admin users
-- ============================================================================
CREATE TABLE IF NOT EXISTS users (
  id BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT 'Unique user ID',
  email VARCHAR(255) UNIQUE NOT NULL COMMENT 'User email (login)',
  password_hash VARCHAR(255) NOT NULL COMMENT 'Bcrypt password hash',
  name VARCHAR(255) COMMENT 'User full name',
  role ENUM('admin', 'editor') DEFAULT 'editor' COMMENT 'User role',
  is_active BOOLEAN DEFAULT TRUE COMMENT 'Account active status',
  last_login TIMESTAMP NULL COMMENT 'Last login timestamp',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT 'Created date',
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Last update',
  INDEX idx_email (email),
  INDEX idx_role (role),
  INDEX idx_created_at (created_at)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Admin users table';

-- ============================================================================
-- LOGIN ATTEMPTS TABLE - For brute force protection
-- ============================================================================
CREATE TABLE IF NOT EXISTS login_attempts (
  id BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT 'Attempt ID',
  ip_address VARCHAR(45) COMMENT 'IP address (IPv4 or IPv6)',
  email VARCHAR(255) COMMENT 'Email attempted',
  attempted_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT 'Attempt timestamp',
  success BOOLEAN DEFAULT FALSE COMMENT 'Login successful',
  user_agent VARCHAR(500) COMMENT 'Browser user agent',
  INDEX idx_ip_date (ip_address, attempted_at),
  INDEX idx_email_date (email, attempted_at),
  INDEX idx_success (success, attempted_at)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Login attempts for security';

-- ============================================================================
-- PASSWORD RESET TOKENS TABLE
-- ============================================================================
CREATE TABLE IF NOT EXISTS password_reset_tokens (
  id BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT 'Token ID',
  user_id BIGINT NOT NULL COMMENT 'User ID',
  token VARCHAR(255) UNIQUE NOT NULL COMMENT 'Reset token (hash)',
  expires_at TIMESTAMP NOT NULL COMMENT 'Token expiration time (15 min)',
  used_at TIMESTAMP NULL COMMENT 'When token was used',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT 'Created date',
  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
  INDEX idx_token (token),
  INDEX idx_expires (expires_at),
  INDEX idx_user_id (user_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Password reset tokens';

-- ============================================================================
-- GALLERY IMAGES TABLE - For both galerie & relevee imobile
-- ============================================================================
CREATE TABLE IF NOT EXISTS gallery_images (
  id BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT 'Image ID',
  filename VARCHAR(255) NOT NULL UNIQUE COMMENT 'Filename (UUID based)',
  alt_text VARCHAR(255) COMMENT 'Alt text for accessibility',
  description TEXT COMMENT 'Image description',
  image_type ENUM('galerie', 'relevee') DEFAULT 'galerie' COMMENT 'Gallery type',
  display_order INT DEFAULT 0 COMMENT 'Display order (for sorting)',
  file_size INT COMMENT 'File size in bytes',
  width INT COMMENT 'Image width (px)',
  height INT COMMENT 'Image height (px)',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT 'Upload date',
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Last update',
  created_by BIGINT COMMENT 'Uploaded by user ID',
  FOREIGN KEY (created_by) REFERENCES users(id) ON DELETE SET NULL,
  INDEX idx_type_order (image_type, display_order),
  INDEX idx_created_at (created_at),
  UNIQUE KEY idx_type_filename (image_type, filename)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Gallery images (both galerie and relevee)';

-- ============================================================================
-- REAL ESTATE LISTINGS TABLE
-- ============================================================================
CREATE TABLE IF NOT EXISTS listings (
  id BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT 'Listing ID',
  title VARCHAR(255) NOT NULL COMMENT 'Property title',
  slug VARCHAR(255) UNIQUE NOT NULL COMMENT 'URL slug',
  description LONGTEXT NOT NULL COMMENT 'Rich text description',
  price DECIMAL(15, 2) COMMENT 'Property price (RON)',
  surface_area DECIMAL(10, 2) COMMENT 'Surface area (m²)',
  rooms INT COMMENT 'Number of rooms',
  bathrooms INT COMMENT 'Number of bathrooms',
  location VARCHAR(255) COMMENT 'Location/address',
  property_type VARCHAR(50) COMMENT 'Type (Apartament, Casa, Teren, etc)',
  status ENUM('de_vanzare', 'de_inchiriat', 'vandut') DEFAULT 'de_vanzare' COMMENT 'Listing status',
  published BOOLEAN DEFAULT FALSE COMMENT 'Published status',
  featured BOOLEAN DEFAULT FALSE COMMENT 'Featured on homepage',
  views INT DEFAULT 0 COMMENT 'View count',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT 'Created date',
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Last update',
  created_by BIGINT COMMENT 'Created by user ID',
  FOREIGN KEY (created_by) REFERENCES users(id) ON DELETE SET NULL,
  INDEX idx_slug (slug),
  INDEX idx_published (published),
  INDEX idx_featured (featured),
  INDEX idx_status (status),
  INDEX idx_created_at (created_at),
  FULLTEXT INDEX ft_title_description (title, description)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Real estate listings';

-- ============================================================================
-- LISTING IMAGES TABLE
-- ============================================================================
CREATE TABLE IF NOT EXISTS listing_images (
  id BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT 'Image ID',
  listing_id BIGINT NOT NULL COMMENT 'Listing ID',
  filename VARCHAR(255) NOT NULL COMMENT 'Filename (UUID based)',
  alt_text VARCHAR(255) COMMENT 'Alt text',
  is_main BOOLEAN DEFAULT FALSE COMMENT 'Main/cover image',
  display_order INT DEFAULT 0 COMMENT 'Display order',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT 'Upload date',
  FOREIGN KEY (listing_id) REFERENCES listings(id) ON DELETE CASCADE,
  INDEX idx_listing_id (listing_id),
  INDEX idx_main (is_main),
  UNIQUE KEY idx_listing_order (listing_id, display_order)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Images for each listing';

-- ============================================================================
-- BLOG POSTS TABLE
-- ============================================================================
CREATE TABLE IF NOT EXISTS blog_posts (
  id BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT 'Post ID',
  title VARCHAR(255) NOT NULL COMMENT 'Post title',
  slug VARCHAR(255) UNIQUE NOT NULL COMMENT 'URL slug',
  content LONGTEXT NOT NULL COMMENT 'Rich text content',
  category ENUM('investitii', 'sfaturi_imobiliare', 'financiar') COMMENT 'Post category',
  excerpt VARCHAR(500) COMMENT 'Short excerpt',
  cover_image VARCHAR(255) COMMENT 'Cover image filename',
  meta_description VARCHAR(160) COMMENT 'SEO meta description',
  published BOOLEAN DEFAULT FALSE COMMENT 'Published status',
  scheduled_at TIMESTAMP NULL COMMENT 'Scheduled publish time',
  views INT DEFAULT 0 COMMENT 'View count',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT 'Created date',
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Last update',
  created_by BIGINT COMMENT 'Created by user ID',
  updated_by BIGINT COMMENT 'Updated by user ID',
  FOREIGN KEY (created_by) REFERENCES users(id) ON DELETE SET NULL,
  FOREIGN KEY (updated_by) REFERENCES users(id) ON DELETE SET NULL,
  INDEX idx_slug (slug),
  INDEX idx_category (category),
  INDEX idx_published (published),
  INDEX idx_created_at (created_at),
  FULLTEXT INDEX ft_title_content (title, content)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Blog posts';

-- ============================================================================
-- CERTIFICATES TABLE - PDF documents (Certificat de urbanism)
-- ============================================================================
CREATE TABLE IF NOT EXISTS certificates (
  id BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT 'Certificate ID',
  filename VARCHAR(255) NOT NULL UNIQUE COMMENT 'PDF filename',
  title VARCHAR(255) NOT NULL COMMENT 'Display title',
  description TEXT COMMENT 'Certificate description',
  file_size INT COMMENT 'File size in bytes',
  display_order INT DEFAULT 0 COMMENT 'Display order',
  public BOOLEAN DEFAULT TRUE COMMENT 'Public accessible',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT 'Upload date',
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Last update',
  created_by BIGINT COMMENT 'Uploaded by user ID',
  FOREIGN KEY (created_by) REFERENCES users(id) ON DELETE SET NULL,
  INDEX idx_order (display_order),
  INDEX idx_public (public)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='PDF certificates (Certificat de urbanism)';

-- ============================================================================
-- PAGES TABLE - Editable content pages (like Evaluare ANEVAR)
-- ============================================================================
CREATE TABLE IF NOT EXISTS pages (
  id BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT 'Page ID',
  slug VARCHAR(255) UNIQUE NOT NULL COMMENT 'Page slug (URL)',
  title VARCHAR(255) COMMENT 'Page title',
  content LONGTEXT COMMENT 'Rich text content',
  meta_description VARCHAR(160) COMMENT 'SEO meta description',
  meta_keywords VARCHAR(255) COMMENT 'SEO keywords',
  is_published BOOLEAN DEFAULT TRUE COMMENT 'Published status',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT 'Created date',
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Last update',
  updated_by BIGINT COMMENT 'Updated by user ID',
  FOREIGN KEY (updated_by) REFERENCES users(id) ON DELETE SET NULL,
  INDEX idx_slug (slug),
  INDEX idx_published (is_published)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Editable content pages';

-- ============================================================================
-- SETTINGS TABLE - Key-value configuration
-- ============================================================================
CREATE TABLE IF NOT EXISTS settings (
  id BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT 'Setting ID',
  setting_key VARCHAR(100) UNIQUE NOT NULL COMMENT 'Setting key',
  setting_value LONGTEXT COMMENT 'Setting value',
  description VARCHAR(255) COMMENT 'Description',
  data_type ENUM('string', 'number', 'boolean', 'json') DEFAULT 'string',
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Last update',
  updated_by BIGINT COMMENT 'Updated by user ID',
  FOREIGN KEY (updated_by) REFERENCES users(id) ON DELETE SET NULL,
  INDEX idx_key (setting_key)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Site settings and configuration';

-- ============================================================================
-- CONTACT MESSAGES TABLE
-- ============================================================================
CREATE TABLE IF NOT EXISTS contact_messages (
  id BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT 'Message ID',
  name VARCHAR(255) NOT NULL COMMENT 'Sender name',
  email VARCHAR(255) NOT NULL COMMENT 'Sender email',
  phone VARCHAR(20) COMMENT 'Sender phone',
  subject VARCHAR(255) COMMENT 'Message subject',
  message LONGTEXT NOT NULL COMMENT 'Message content',
  read BOOLEAN DEFAULT FALSE COMMENT 'Read status',
  responded BOOLEAN DEFAULT FALSE COMMENT 'Response sent',
  ip_address VARCHAR(45) COMMENT 'Sender IP',
  user_agent VARCHAR(500) COMMENT 'Sender browser',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT 'Received date',
  responded_at TIMESTAMP NULL COMMENT 'Response date',
  responded_by BIGINT COMMENT 'Response sent by user',
  FOREIGN KEY (responded_by) REFERENCES users(id) ON DELETE SET NULL,
  INDEX idx_email (email),
  INDEX idx_read (read),
  INDEX idx_created_at (created_at),
  FULLTEXT INDEX ft_message (name, email, message)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Contact form messages';

-- ============================================================================
-- INITIAL SETTINGS DATA
-- ============================================================================
INSERT IGNORE INTO settings (setting_key, setting_value, description, data_type) VALUES
('phone_number', '+40123456789', 'Company phone number', 'string'),
('email_recipient', 'stroedaniel@yahoo.com', 'Email recipient for contact form', 'string'),
('whatsapp_number', '+40123456789', 'WhatsApp contact number', 'string'),
('telegram_handle', 'smartbuilding', 'Telegram username', 'string'),
('company_name', 'Smart-Building', 'Company name', 'string'),
('company_address', 'Bucharest, Romania', 'Company address', 'string'),
('company_description', 'Professional real estate evaluation services', 'Company description', 'string'),
('homepage_meta_description', 'Smart-Building - Professional ANEVAR Real Estate Evaluation Services', 'Homepage meta description', 'string'),
('homepage_meta_keywords', 'real estate, evaluation, ANEVAR, property appraisal, Romania', 'Homepage keywords', 'string'),
('site_url', 'https://smart-building.ro', 'Site URL', 'string');

-- ============================================================================
-- INITIAL ADMIN USER (password: Admin@123)
-- bcrypt hash of 'Admin@123'
-- ============================================================================
INSERT IGNORE INTO users (email, password_hash, name, role, is_active) VALUES
('stroedaniel@yahoo.com', '$2b$12$dGGlEGqz7Zc2vQ8Xy3vj7eFhZQx8b5vQnXp2m9RqKc.WZR2pD.OYK', 'Daniel Stroe', 'admin', TRUE);

-- ============================================================================
-- INITIAL EDITABLE PAGES
-- ============================================================================
INSERT IGNORE INTO pages (slug, title, content, is_published) VALUES
('evaluare-anevar', 'Evaluare ANEVAR', '<h1>Evaluare Imobiliară ANEVAR</h1><p>Bine ați venit la pagina noastră de evaluare imobiliară. Oferim servicii profesionale de evaluare conform standardelor ANEVAR.</p>', TRUE),
('home-description', 'Home Description', '<p>Smart-Building oferă soluții profesionale de evaluare imobiliară.</p>', TRUE);

-- ============================================================================
-- INDEXES FOR PERFORMANCE
-- ============================================================================
-- These are created with the tables above, but listed here for documentation

-- ============================================================================
-- END OF SCHEMA
-- ============================================================================

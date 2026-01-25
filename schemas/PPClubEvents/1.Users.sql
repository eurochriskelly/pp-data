-- 1. Users Table
CREATE TABLE Users (
    id VARCHAR(50) PRIMARY KEY, -- Using VARCHAR to support string IDs from current system
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    role ENUM('organizer', 'admin') NOT NULL DEFAULT 'organizer',
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- 5. Listings Table
CREATE TABLE Listings (
    id VARCHAR(50) PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    -- TODO: We would like a way to hide and show lists in future (or even delete them)
    -- status VARCHAR(10) NOT NULL,
    slug VARCHAR(255) NOT NULL UNIQUE, -- e.g., 'youth-events'
    description TEXT,
    created_by VARCHAR(50) NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (created_by) REFERENCES Users(id)
);

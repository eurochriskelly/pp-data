-- 4. EventSports (Many-to-Many Junction)
CREATE TABLE EventSports (
    event_id VARCHAR(50) NOT NULL,
    sport_id INT NOT NULL,
    PRIMARY KEY (event_id, sport_id),
    FOREIGN KEY (event_id) REFERENCES Events(id) ON DELETE CASCADE,
    FOREIGN KEY (sport_id) REFERENCES Sports(id) ON DELETE CASCADE
);

-- DROP TABLE
DROP TABLE IF EXISTS health_supplies; 
DROP TABLE IF EXISTS visitor_records; 
DROP TABLE IF EXISTS services; 
DROP TABLE IF EXISTS visitors;

-- CREATE TABLE 

CREATE TABLE visitors (
     visitors_id INT AUTO_INCREMENT PRIMARY KEY, 
     first_name VARCHAR(50), 
     last_name VARCHAR(50),
     visitor_type VARCHAR(30),
     years_with_uni INT,
     alumni BOOLEAN
);

CREATE TABLE services (
     services_id INT AUTO_INCREMENT PRIMARY KEY, 
     visit_id INT NOT NULL, 
     service_name VARCHAR(50) NOT NULL CHECK (service_name IN ('health_supplies', 'outreach_events', 'presentations', 'outside_events')),
     peer_group VARCHAR(30) NOT NULL CHECK (peer_group IN ('mental_health', 'public_health', 'safe_sex_substance', 'general')),
     sign_in_date DATE NOT NULL,
     FOREIGN KEY (visit_id) REFERENCES visitors(visitors_id) ON DELETE CASCADE 
);

CREATE TABLE visitor_records (
     record_id INT AUTO_INCREMENT PRIMARY KEY,
     visit_id INT NOT NULL,
     total_visits INT NOT NULL,
     health_supplies_visits INT NOT NULL,
     outreach_events_visits INT NOT NULL,
     presentations_visits INT NOT NULL,
     outside_events_visits INT NOT NULL,
     FOREIGN KEY (visit_id) REFERENCES visitors(visitors_id) ON DELETE CASCADE,
     constraint chk_total_visits CHECK (total_visits = health_supplies_visits + outreach_events_visits + presentations_visits + outside_events_visits)
);

CREATE TABLE health_supplies (
     supplies_id INT AUTO_INCREMENT PRIMARY KEY,
     services_id INT NOT NULL,
     total_items INT NOT NULL,
     total_mental_health_items INT NOT NULL,
     total_public_health_items INT NOT NULL,
     total_safe_sex_substance_items INT NOT NULL,
     FOREIGN KEY (services_id) REFERENCES services(services_id) ON DELETE CASCADE 
);


-- INSERT DATA

INSERT INTO visitors (first_name, last_name, visitor_type, years_with_uni, alumni) VALUES
     ('Amy Rose', 'Jem', 'undergraduate student', 3, 0),
     ('Diana', 'Martinez','graduate student', 1, 0),
     ('Daniel', 'Wazowski', 'faculty member', 8, 0),
     ('Charlie', 'Khan', 'staff member', 10, 1),
     ('Lauren', 'Chen', 'outside visitor', 0, 0),
     ('Sunil', 'Banquo', 'graduate student', 5, 1),
     ('Armand', 'Neon','undergraduate student', 4, 0),
     ('Edita', 'Masuda', 'staff member', 2, 1),
     ('Teodor', 'Jaxen', 'outside visitor', 0, 1),
     ('Chrystelle', 'Ejiro', 'outside visitor', 0, 0);

/*Checking if the script executed successfully and inserted correct rows into the table.  

SELECT * FROM visitors;

*/

INSERT INTO services (visit_id, service_name, peer_group, sign_in_date) VALUES
     (1, 'health_supplies', 'public_health', '2026-3-01'),
     (2, 'health_supplies','safe_sex_substance', '2026-5-10'),
     (3, 'presentations', 'mental_health', '2026-2-17'),
     (5, 'outside_events', 'general', '2026-1-07'),
     (5, 'outreach_events', 'general', '2025-09-03'),
     (3, 'health_supplies', 'public_health', '2026-4-01'),
     (4, 'health_supplies','safe_sex_substance', '2026-5-19'),
     (3, 'health_supplies', 'mental_health', '2026-1-17'),
     (4, 'presentations','mental_health', '2026-2-17'),
     (10, 'outside_events', 'general', '2026-1-07');

/* Checking if the script executed successfully and inserted correct rows into the table.  

SELECT * FROM services;

*/

INSERT INTO visitor_records (visit_id, total_visits, health_supplies_visits, outreach_events_visits, presentations_visits, outside_events_visits) VALUES
     (1, 7, 7, 0, 0, 0),
     (2, 10, 2, 2, 1, 5),
     (3, 20, 10, 1, 3, 6),
     (4, 50, 1, 10, 4, 35),
     (5, 2, 0, 1, 0, 1),
     (6, 8, 6, 2, 0, 0),
     (7, 9, 1, 4, 2, 2),
     (8, 25, 15, 0, 4, 6),
     (9, 6, 0, 0, 5, 1),
     (10, 1, 0, 0, 0, 1);

/* Checking if the script executed successfully and inserted correct rows into the table.  

SELECT * FROM visitor_records;

*/

INSERT INTO health_supplies (services_id, total_items, total_mental_health_items, total_public_health_items, total_safe_sex_substance_items) VALUES
     (1, 5, 0, 5, 0),
     (2, 2, 0, 1, 1),
     (6, 5, 2, 3, 0),
     (7, 3, 0, 1, 2),
     (8, 4, 4, 0, 0),
     (11, 7, 0, 0, 7),
     (12, 7, 0, 4, 3),
     (16, 5, 3, 0, 2),
     (17, 5, 2, 1, 2),
     (18, 9, 4, 2, 3);

/* Checking if the script executed successfully and inserted correct rows into the table.  

SELECT * FROM health_supplies;

*/

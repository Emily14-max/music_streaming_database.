CREATE SCHEMA music;
CREATE TABLE music.users (
    user_id SERIAL PRIMARY KEY,
    username TEXT UNIQUE NOT NULL,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    country TEXT NOT NULL,
    subscription_type TEXT DEFAULT 'free' CHECK (subscription_type IN ('free', 'premium', 'family')),
    created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE music.artists (
    artist_id SERIAL PRIMARY KEY,
    artist_name TEXT UNIQUE NOT NULL,
    real_name TEXT,
    genre TEXT NOT NULL,
    country TEXT NOT NULL,
    is_verified BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE music.songs (
    song_id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    artist_id INTEGER REFERENCES music.artists(artist_id) ON DELETE CASCADE,
    album_name TEXT NOT NULL,
    release_year INTEGER NOT NULL CHECK (release_year >= 2000 AND release_year <= EXTRACT(YEAR FROM CURRENT_DATE)),
    created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO music.users (username, first_name, last_name, country, subscription_type)
VALUES
('musiclover88', 'Alice', 'Johnson', 'United States', 'premium'),
('afrobeats_fan', 'Bob', 'Smith', 'United Kingdom', 'free'),
('popqueen', 'Carol', 'Williams', 'Canada', 'premium'),
('east_african', 'David', 'Brown', 'Kenya', 'family'),
('naija_vibes', 'Frank', 'Miller', 'Nigeria', 'free');
INSERT INTO music.artists (artist_name, real_name, genre, country, is_verified)
VALUES
('Ed Sheeran', 'Edward Christopher Sheeran', 'Pop/Folk', 'United Kingdom', true),
('Billie Eilish', 'Billie Eilish Pirate Baird O''Connell', 'Alternative Pop', 'United States', true),
('Taylor Swift', 'Taylor Alison Swift', 'Pop/Country', 'United States', true),
('Sauti Sol', 'Bien-Aimé Baraza, Willis Chimano, Savara Mudigi, Polycarp Otieno', 'Afro-pop', 'Kenya', true),
('Diamond Platnumz', 'Naseeb Abdul Juma', 'Bongo Flava', 'Tanzania', true),
('Burna Boy', 'Damini Ebunoluwa Ogulu', 'Afro-fusion', 'Nigeria', true);
INSERT INTO music.songs (title, artist_id, album_name, release_year)
VALUES
('Shape of You', 1, '÷ (Divide)', 2017),
('Bad Guy', 2, 'When We All Fall Asleep, Where Do We Go?', 2019),
('Anti-Hero', 3, 'Midnights', 2022),
('Suzanna', 4, 'Mwanzo', 2011),
('Jeje', 5, 'A Boy from Tandale', 2018);

SELECT schema_name 
FROM information_schema.schemata 
WHERE schema_name = 'music';
SELECT 'music.users' as table_name, COUNT(*) as row_count FROM music.users
UNION ALL
SELECT 'music.artists' as table_name, COUNT(*) as row_count FROM music.artists
UNION ALL
SELECT 'music.songs' as table_name, COUNT(*) as row_count FROM music.songs;

SELECT 
    song_id,
    title,
    release_year,
    CASE 
        WHEN release_year >= 2000 THEN '✅ Valid'
        ELSE '❌ Invalid'
    END as status
FROM music.songs
ORDER BY release_year DESC;
SELECT table_schema,table_name,table_type,
    '✅ VISIBLE' as status
FROM information_schema.tables 
WHERE table_schema = 'music'
AND table_name IN ('users', 'artists', 'songs')
ORDER BY table_name;
SELECT * 
FROM music.artists 
WHERE country IN ('Kenya', 'Tanzania', 'Nigeria');
SELECT s.title, a.artist_name, s.album_name 
FROM music.songs s 
JOIN music.artists a ON s.artist_id = a.artist_id;

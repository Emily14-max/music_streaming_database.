# Data Dictionary - Music Schema

## Overview
This data dictionary describes all tables, columns and relationships in the `music` schema (PostgreSQL).

---

## Tables

### 1. users
**Purpose:** Stores listener/subscriber accounts for the music service.

| Column Name | Data Type | Constraints | Description |
|-------------|-----------|-------------|-------------|
| user_id | SERIAL | PRIMARY KEY | Unique identifier for each user |
| username | TEXT | UNIQUE, NOT NULL | Login/handle for the user (unique) |
| first_name | TEXT | NOT NULL | User's first name |
| last_name | TEXT | NOT NULL | User's last name |
| country | TEXT | NOT NULL | User's country |
| subscription_type | TEXT | DEFAULT 'free', CHECK (subscription_type IN ('free','premium','family')) | Subscription tier |
| created_at | TIMESTAMP WITH TIME ZONE | DEFAULT CURRENT_TIMESTAMP | Record creation timestamp |

---

### 2. artists
**Purpose:** Stores artist/band profiles.

| Column Name | Data Type | Constraints | Description |
|-------------|-----------|-------------|-------------|
| artist_id | SERIAL | PRIMARY KEY | Unique identifier for each artist |
| artist_name | TEXT | UNIQUE, NOT NULL | Public name of the artist (unique) |
| real_name | TEXT | - | Legal/birth name(s) or members for groups |
| genre | TEXT | NOT NULL | Genre classification |
| country | TEXT | NOT NULL | Country of origin |
| is_verified | BOOLEAN | DEFAULT FALSE | Platform verification flag |
| created_at | TIMESTAMP WITH TIME ZONE | DEFAULT CURRENT_TIMESTAMP | Record creation timestamp |

---

### 3. songs
**Purpose:** Catalog of songs and their metadata.

| Column Name | Data Type | Constraints | Description |
|-------------|-----------|-------------|-------------|
| song_id | SERIAL | PRIMARY KEY | Unique identifier for each song |
| title | TEXT | NOT NULL | Song title |
| artist_id | INTEGER | NOT NULL, FOREIGN KEY → artists(artist_id) ON DELETE CASCADE | References the performing artist |
| album_name | TEXT | NOT NULL | Album or release collection |
| release_year | INTEGER | NOT NULL, CHECK (release_year >= 2000 AND release_year <= EXTRACT(YEAR FROM CURRENT_DATE)) | Release year with validation |
| created_at | TIMESTAMP WITH TIME ZONE | DEFAULT CURRENT_TIMESTAMP | Record creation timestamp |

---

## Relationships

### Foreign Key Relationships
1. **songs.artist_id** → **artists.artist_id**
   - **Type:** Many-to-One
   - **Description:** One artist can have many songs
   - **Action:** ON DELETE CASCADE (if artist is deleted, their songs are deleted)

2. **users** — standalone in current schema (no FK relations to songs/artists yet)

---

## Views

### songs_by_artist
**Purpose:** Shows each artist with the number of songs and latest release year.

| Column | Description |
|--------|-------------|
| artist_id | Artist identifier |
| artist_name | Artist display name |
| song_count | Number of songs by the artist |
| latest_year | Most recent release year for that artist |

Example SQL:

```sql
CREATE VIEW music.songs_by_artist AS
SELECT a.artist_id, a.artist_name, COUNT(s.song_id) AS song_count, MAX(s.release_year) AS latest_year
FROM music.artists a
LEFT JOIN music.songs s ON s.artist_id = a.artist_id
GROUP BY a.artist_id, a.artist_name;
```

---

## Indexes

### Performance Indexes
- `idx_users_username` - Unique index on `users.username` (created by UNIQUE constraint)
- `idx_artists_name` - Unique index on `artists.artist_name` (created by UNIQUE constraint)
- `idx_songs_artist_id` - Index on `songs.artist_id` for faster joins
- `idx_songs_release_year` - (optional) Index on `songs.release_year` for recent-release queries
-  `idx_artists_country` - Optimized country-based queries on `artists_country`
- `idx_users_country` - Faster user location searches on `users_country`

Example index creation:

```sql
CREATE INDEX idx_songs_artist_id ON music.songs (artist_id);
```

---

## Sample Data Summary

### Users: 5 records
- musiclover88 (Alice Johnson) — United States — premium
- afrobeats_fan (Bob Smith) — United Kingdom — free
- popqueen (Carol Williams) — Canada — premium
- east_african (David Brown) — Kenya — family
- naija_vibes (Frank Miller) — Nigeria — free

### Artists: 6 records
- Ed Sheeran (Pop/Folk) — United Kingdom — verified
- Billie Eilish (Alternative Pop) — United States — verified
- Taylor Swift (Pop/Country) — United States — verified
- Sauti Sol (Afro-pop) — Kenya — verified
- Diamond Platnumz (Bongo Flava) — Tanzania — verified
- Burna Boy (Afro-fusion) — Nigeria — verified

### Songs: 5 records
- Shape of You — Ed Sheeran — ÷ (Divide) — 2017
- Bad Guy — Billie Eilish — When We All Fall Asleep, Where Do We Go? — 2019
- Anti-Hero — Taylor Swift — Midnights — 2022
- Suzanna — Sauti Sol — Mwanzo — 2011
- Jeje — Diamond Platnumz — A Boy from Tandale — 2018

---

## Business Rules
1. `artist_name` and `username` must be unique.
2. `subscription_type` in `users` must be one of: 'free', 'premium', 'family'.
3. `release_year` in `songs` must be between 2000 and the current year.
4. `songs.artist_id` must reference an existing artist.
5. Deleting an artist cascades to their songs (ON DELETE CASCADE).

---

## Useful Metadata Queries
- Row counts:

```sql
SELECT 'music.users' AS table_name, COUNT(*) AS row_count FROM music.users
UNION ALL
SELECT 'music.artists', COUNT(*) FROM music.artists
UNION ALL
SELECT 'music.songs', COUNT(*) FROM music.songs;
```

- Constraints (Postgres):

```sql
SELECT conname, contype, conrelid::regclass AS table_name
FROM pg_constraint
WHERE connamespace = 'music'::regnamespace;
```

---


## Table: music.users
Stores information about music platform users and subscribers.

| Column Name | Data Type | Constraints | Description |
|-------------|-----------|-------------|-------------|
| user_id | SERIAL | PRIMARY KEY | Unique identifier for each user |
| username | TEXT | UNIQUE, NOT NULL | User's login username |
| first_name | TEXT | NOT NULL | User's first name |
| last_name | TEXT | NOT NULL | User's last name |
| country | TEXT | NOT NULL | User's country of residence |
| subscription_type | TEXT | DEFAULT 'free', CHECK | User's subscription level |
| created_at | TIMESTAMPTZ | DEFAULT CURRENT_TIMESTAMP | Account creation timestamp |

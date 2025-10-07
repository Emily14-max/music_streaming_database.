# Entity Relationship Diagram (ERD)

## Music Streaming database

### Text-Based ERD Description

```
ARTISTS ||--o{ SONGS

ARTISTS:
- artist_id (PK)
- artist_name (UNIQUE)
- real_name
- genre
- country
- is_verified
- created_at

SONGS:
- song_id (PK)
- title
- artist_id (FK → artists.artist_id)
- album_name
- release_year
- created_at

USERS:
- user_id (PK)
- username (UNIQUE)
- first_name
- last_name
- country
- subscription_type (CHECK: 'free'|'premium'|'family')
- created_at
```

### ASCII Diagram

```
┌─────────────────┐                ┌─────────────────┐
│     ARTISTS     │                │     SONGS       │
├─────────────────┤                ├─────────────────┤
│ artist_id (PK)  │◄───────────────┤ song_id (PK)    │
│ artist_name (UQ)│                │ title           │
│ real_name       │                │ artist_id (FK)  │
│ genre           │                │ album_name      │
│ country         │                │ release_year    │
│ is_verified     │                │ created_at      │
│ created_at      │                └─────────────────┘
└─────────────────┘

┌─────────────────┐
│     USERS       │
├─────────────────┤
│ user_id (PK)    │
│ username (UQ)   │
│ first_name      │
│ last_name       │
│ country         │
│ subscription_type│
│ created_at      │
└─────────────────┘
```

### Relationship Details

**1. Artists to Songs (One-to-Many)**
- **Cardinality:** 1:N
- **Description:** One artist can have multiple songs (an artist performs/creates many songs).
- **Foreign Key:** songs.artist_id → artists.artist_id
- **Delete Rule:** ON DELETE CASCADE (deleting an artist will remove their songs)

**2. Users (Standalone)**
- **Cardinality:** N/A (no direct FK relationships in the current schema)
- **Description:** Users are currently modeled independently (no playlists, favorites, or play history tables are included in this schema).

### Business Rules

1. `artist_name` must be unique across `artists`.
2. `username` must be unique across `users`.
3. `subscription_type` in `users` must be one of: 'free', 'premium', 'family'.
4. `release_year` in `songs` must be between 2000 and the current year (checked at insert/update).
5. `songs.artist_id` must reference a valid `artists.artist_id` — songs cannot exist without their artist.
6. Deleting an artist will cascade-delete their songs (ON DELETE CASCADE).
7. `created_at` defaults to the current timestamp for auditing.

### Views and Derived Data

Here are example views you might add for common queries and derived info:

- `songs_by_artist` view:
    - Joins `artists` and `songs` to list an artist's songs with counts and latest release.

- `verified_artists` view:
    - Filters `artists` where `is_verified = true` and includes number of songs.

- `subscription_summary` view:
    - Aggregates users by `subscription_type` (counts and percentages).

- `recent_releases` view:
    - Shows songs released in the last N years (parameterizable) with artist info.

Example `songs_by_artist` SQL (simple):

```sql
CREATE VIEW music.songs_by_artist AS
SELECT a.artist_id, a.artist_name, COUNT(s.song_id) AS song_count, MAX(s.release_year) AS latest_year
FROM music.artists a
LEFT JOIN music.songs s ON s.artist_id = a.artist_id
GROUP BY a.artist_id, a.artist_name;
```

### Sample Data Coverage

- `users`: 5 sample rows included in the main schema file.
- `artists`: 6 sample rows included in the main schema file.
- `songs`: 5 sample rows included in the main schema file.

### This ERD demonstrates:

- ✅ **3 tables minimum** (users, artists, songs)
- ✅ **Foreign key relationships** (songs.artist_id → artists.artist_id)
- ✅ **Unique constraints & checks** (username, artist_name, subscription_type, release_year)
- ✅ **Sample data included** (5+ rows per table as provided in the SQL)
- ✅ **Referential integrity and cascade rule** (ON DELETE CASCADE for songs)

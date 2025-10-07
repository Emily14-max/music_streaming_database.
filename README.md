# 🎵 Music Streaming Database - Data Tools Final Project

## 📗 Table of Contents

- [📖 About the Project](#about-project)
  - [🛠 Built With](#built-with)
    - [Tech Stack](#tech-stack)
    - [Key Features](#key-features)
  - [🚀 Live Demo](#live-demo)
- [💻 Getting Started](#getting-started)
  - [Setup](#setup)
  - [Prerequisites](#prerequisites)
  - [Install](#install)
  - [Usage](#usage)
  - [Run tests](#run-tests)
- [📊 Database Schema](#-database-schema)
- [👥 Authors](#authors)
- [🔭 Future Features](#future-features)
- [🤝 Contributing](#contributing)
- [⭐️ Show your support](#support)
- [🙏 Acknowledgements](#acknowledgements)
- [❓ FAQ (OPTIONAL)](#faq)

<!-- PROJECT DESCRIPTION -->

# 📖 Music Streaming database <a name="about-project"></a>

> A comprehensive PostgreSQL database designed for a modern music streaming platform using Supabase.

This project demonstrates database fundamentals including schema design, relationships, constraints and data management for handling users, artists and songs in a streaming service environment.

## 🛠 Built With <a name="built-with"></a>

### Tech Stack <a name="tech-stack"></a>

> Describe the tech stack and include only the relevant sections that apply to your project e.g SQL.

<details>
  <summary>Client</summary>
  <ul>
    <li><a href="https://supabase.com/">Supabase</a></li>
  </ul>
</details>

<details>
  <summary>Server</summary>
  <ul>
    <li><a href="https://www.postgresql.org/">SQL / PostgreSQL</a></li>
  </ul>
</details>

<details>
<summary>Database</summary>
  <ul>
    <li><a href="https://www.postgresql.org/">PostgreSQL</a></li>
  </ul>
</details>

<!-- Features -->

### Key Features <a name="key-features"></a>

> Core features of the Music App database.

- **Normalized Database Design** - Three-table schema with proper relationships
- **Data Validation** - Business logic enforced through constraints and foreign keys
- **Global Music Representation** - Features artists from multiple continents and genres

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- LIVE DEMO -->

## 🚀 Live Demo <a name="live-demo"></a>

[Live Demo Link](https://supabase.com/dashboard/project/xytfjzhlsldouregwikb/sql/2cc9baba-c114-4c2d-b0a5-7c2dd5ccda6c)

> This project is designed to be deployed on Supabase.

- Database Schema: Available in `schema.sql`

- Documentation: See `data_dictionary.md` and `ERD.md`

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- GETTING STARTED -->

## 💻 Getting Started

> Follow these steps to set up the Music Streaming Database System in your Supabase project.

To get a local copy up and running, follow these steps.

### Prerequisites
In order to run this project you need:
- A Supabase account (free tier available)
- Web browser with internet access
- Basic SQL knowledge
- PostgreSQL database access

### Setup
1. Create a new Supabase project at [supabase.com](https://supabase.com)

2. Clone this repository to your local machine:

```sh
git clone https://github.com/Emily14-max/music_streaming_database.git
cd music_streaming_database.
```
### Install
Install this project with:

1. Open your Supabase project dashboard
2. Navigate to the SQL Editor
3. Copy and paste the contents of `schema.sql` 
4. Execute the SQL to create tables, insert sample data and set up relationships


 ### Usage
> To run example queries, use the Supabase SQL editor:

```sql
-- Execute in Supabase SQL Editor
CREATE SCHEMA Music;
-- Follow with table creation and data insertion scripts
```

### Run tests
> To run tests, run the following command:

```sql
-- Verification queries
SELECT COUNT(*) FROM music.users; -- Should return 5
SELECT COUNT(*) FROM music.artists; -- Should return 6
SELECT COUNT(*) FROM music.songs; -- Should return 5
```
## 📊 Database Schema

### Database Architecture
The database follows a normalized design with three main tables organized under the `Music` schema, supporting a music streaming platform with users, artists and songs.

The database consists of three main tables:
- **users**: Manages platform user accounts and subscription information.
- **artist**: Stores artist information and music catalog metadata.
- **songs**: Manages song catalog with artist relationships.

## Data Dictionary (summary)

A concise data dictionary and full table definitions live in `data_dictionary.md`. See also `ERD.md` for relationship diagrams and `schema.sql` for the full schema and seed data.

Quick summary: 3 core tables — `users`, `artists`, `songs`; primary FK in music schema is `songs.artist_id → artists.artist_id`. Key constraints include unique usernames/artist names and checks on values like `release_year` and `subscription_type`.

### Featured Artists
- Ed Sheeran (UK) - Pop/Folk

- Billie Eilish (USA) - Alternative Pop

- Taylor Swift (USA) - Pop/Country

- Sauti Sol (Kenya) - Afro-pop

- Diamond Platnumz (Tanzania) - Bongo Flava

- Burna Boy (Nigeria) - Afro-fusion

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- AUTHORS -->

## 👥 Authors <a name="authors"></a>

> Data Tools Final Project - Supabase Implementation

👤 **Project Developer**

- GitHub: [@Emily14-max](https://github.com/Emily14-max)
- Project: [music_streaming_database.](https://github.com/Emily14-max/music_streaming_database.)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- FUTURE FEATURES -->

## 🔭 Future Features <a name="future-features"></a>

> Planned enhancements for the Library Management System.

- [ ] **[new_feature_1]** - User Playlists functionality

- [ ] **[new_feature_2]** - Listening Analytics tracking

- [ ] **[new_feature_3]** - Advanced Search capabilities

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- CONTRIBUTING -->

## 🤝 Contributing <a name="contributing"></a>

Contributions, issues and feature requests are welcome!

Feel free to check the [issues page](https://github.com/Emily14-max/music_streaming_database/issues).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- SUPPORT -->

## ⭐️ Show your support <a name="support"></a>

> Support this Music Streaming database project!

  If you like this project, please give it a star on GitHub and share it with other developers interested in database design and music streaming platforms. This project demonstrates:

- Proper database design principles
- Foreign key relationships and data integrity
- Real-world Music Streaming scenarios
- Clean SQL practices with Supabase/PostgreSQL

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- ACKNOWLEDGEMENTS -->

## 🙏 Acknowledgments <a name="acknowledgements"></a>

> Credits and inspiration for this project.

I would like to thank:

- **Supabase** for providing an excellent PostgreSQL database platform
- **The Data Tools Course** for the comprehensive database fundamentals curriculum
- **PostgreSQL Community** for maintaining robust open-source database technology

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- FAQ (optional) -->

## ❓ FAQ (OPTIONAL) <a name="faq"></a>

> Common questions about the Music App.

  - **Can I use this database for a production music streaming service?**

   - This is designed as an educational project. For production use, you would need to add authentication, scalability features and more comprehensive error handling.

  <p align="right">(<a href="#readme-top">back to top</a>)</p>

# Description

Minimal reproducible environment for Tiling Issue

## Dependencies
- Docker
- Docker compose

## Environment
We use a postgres base image and then install postgis into this image.
We prefer this approach over using the PostGIS image because some of our team members are using M1/ARM chips, which are not supported by the PostGIS image.
We also place our source files in a volume, allowing us to edit them on our local machines and then make the available to postgres container.
These instructions were created on a machine running `ManjaroLinux 24.2.1 Yonada`

## Setup
1) Install Docker and Docker compose
2) Build and run the postgres image
```bash
docker compose up --build -d
```

3) Exec into the running container
```bash
docker compose exec -it db bash
```

4) Start a psql connection
```bash
psql -U $POSTGRES_USER -h localhost
```

5) Activate the PostGIS extension, running the `configure.sql` file
```bash
\i configure.sql
```

6) Check PostGIS Version and Install
```bash
i\ version_check.sql
```
As of writing, the output is:
`POSTGIS="3.5.2 dea6d0a" [EXTENSION] PGSQL="150" GEOS="3.11.1-CAPI-1.17.1" PROJ="9.1.1 NETWORK_ENABLED=OFF URL_ENDPOINT=https://cdn.proj.org USER_WRITABLE_DIRECTORY=/tmp/proj DATABASE_PATH=/usr/share/proj/proj.db" (compiled against PROJ 9.1.1) LIBXML="2.9.14" LIBJSON="0.16" LIBPROTOBUF="1.4.1" WAGYU="0.5.0 (Internal)`

7) Create database schema
```bash
\i ccd_dump.sql
```

8) Load data into database
```bash
\i load.sql
```

9) Check data loaded successfully

*Running a bash terminal on Manjaro, the output is hard for a human to read.
A tool like PgAdmin supports mapping of geometries and is better for reading the output.*

```bash
\i data_check.sql
```

10) Run the query of interest. This is the query that we're actually trying to use for our application.
Locally, all rows have Non-NULL geometries. In our managed databases, some geometries have NULL values.

*The psql command is provided below. However, copying the query from the `interesting_query.sql` file to a tool like PgAdmin should be a better experience*

```bash
\i interesting_query.sql
```

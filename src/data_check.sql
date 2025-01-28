SELECT ST_AsMVTGeom(mercator_fill, ST_TileEnvelope(10, 301, 385), 4096, 64, true) FROM city_council_district WHERE id = '1';

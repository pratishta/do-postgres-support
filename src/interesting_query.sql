SELECT
	id,
	ST_AsMVTGeom(mercator_fill, ST_TileEnvelope(10, 301, 385), 4096, 64, true) as geomFill
FROM city_council_district
WHERE ST_Intersects(mercator_fill, ST_TileEnvelope(10, 301, 385));

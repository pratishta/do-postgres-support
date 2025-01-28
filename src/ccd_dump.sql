--
-- PostgreSQL database dump
--

-- Dumped from database version 15.10 (Debian 15.10-1.pgdg120+1)
-- Dumped by pg_dump version 15.10 (Debian 15.10-1.pgdg120+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: city_council_district; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.city_council_district (
    id text NOT NULL,
    li_ft public.geometry(MultiPolygon,2263),
    mercator_fill public.geometry(MultiPolygon,3857),
    mercator_label public.geometry(Point,3857)
);


--
-- Name: city_council_district city_council_district_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.city_council_district
    ADD CONSTRAINT city_council_district_pkey PRIMARY KEY (id);


--
-- Name: city_council_district_li_ft_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX city_council_district_li_ft_index ON public.city_council_district USING gist (li_ft);


--
-- Name: city_council_district_mercator_fill_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX city_council_district_mercator_fill_index ON public.city_council_district USING gist (mercator_fill);


--
-- Name: city_council_district_mercator_label_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX city_council_district_mercator_label_index ON public.city_council_district USING gist (mercator_label);


--
-- PostgreSQL database dump complete
--


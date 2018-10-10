--
-- PostgreSQL database dump
--

-- Dumped from database version 10.5 (Ubuntu 10.5-0ubuntu0.18.04)
-- Dumped by pg_dump version 10.5 (Ubuntu 10.5-0ubuntu0.18.04)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: bielefeld_wohnlagen; Type: TABLE; Schema: public; Owner: maposmatic
--
DROP TABLE IF EXISTS public.bielefeld_wohnlagen;
CREATE TABLE public.bielefeld_wohnlagen (
    way public.geometry(Geometry, 25832),
    gid integer,
    lage integer
);

CREATE INDEX bielefeld_wohnlagen_way_index ON bielefeld_wohnlagen USING GIST (way);

ALTER TABLE public.bielefeld_wohnlagen OWNER TO maposmatic;


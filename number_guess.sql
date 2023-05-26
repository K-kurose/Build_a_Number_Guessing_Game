--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: records; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.records (
    username character varying(30),
    games_played integer,
    best_game integer
);


ALTER TABLE public.records OWNER TO freecodecamp;

--
-- Data for Name: records; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.records VALUES ('user_1685086771699', 2, 528);
INSERT INTO public.records VALUES ('user_1685086771700', 5, 61);
INSERT INTO public.records VALUES ('user_1685086796735', 2, 923);
INSERT INTO public.records VALUES ('user_1685086796736', 5, 319);
INSERT INTO public.records VALUES ('user_1685086931932', 2, 87);
INSERT INTO public.records VALUES ('user_1685086931933', 5, 274);
INSERT INTO public.records VALUES ('test', 3, 5);
INSERT INTO public.records VALUES ('user_1685086990543', 2, 593);
INSERT INTO public.records VALUES ('user_1685086990544', 5, 212);
INSERT INTO public.records VALUES ('user_1685087000283', 2, 501);
INSERT INTO public.records VALUES ('user_1685087000284', 5, 315);
INSERT INTO public.records VALUES ('user_1685087097312', 2, 57);
INSERT INTO public.records VALUES ('user_1685087097313', 5, 50);


--
-- Name: records records_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.records
    ADD CONSTRAINT records_username_key UNIQUE (username);


--
-- PostgreSQL database dump complete
--


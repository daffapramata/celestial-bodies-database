--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_id integer NOT NULL,
    composition text NOT NULL,
    mass_in_km numeric(10,3) NOT NULL,
    discovered_on date NOT NULL,
    is_potentially_hazardous boolean DEFAULT false
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text NOT NULL,
    age integer NOT NULL,
    has_black_hole boolean DEFAULT false,
    is_active boolean DEFAULT true
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(100) NOT NULL,
    planet_id integer NOT NULL,
    diameter_in_km numeric(8,3) NOT NULL,
    surface_composition text,
    has_water boolean DEFAULT false,
    is_geologically_active boolean DEFAULT false
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(100) NOT NULL,
    star_id integer NOT NULL,
    radius_in_km numeric(8,3) NOT NULL,
    atmosphere text,
    has_rings boolean DEFAULT false,
    is_habitable boolean DEFAULT false
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    mass_in_km numeric(50,3) NOT NULL,
    temperature_in_celcius integer NOT NULL,
    is_main_sequence boolean DEFAULT true,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Ceres', 1, 'Rocky/Ice', 946.000, '1801-01-01', false);
INSERT INTO public.asteroid VALUES (2, 'Vesta', 1, 'Rocky', 530.000, '1807-01-01', false);
INSERT INTO public.asteroid VALUES (3, 'Pallas', 1, 'Rocky', 482.000, '1802-03-28', false);
INSERT INTO public.asteroid VALUES (4, 'Hygiea', 1, 'Carbonaceous', 429.000, '1849-04-12', false);
INSERT INTO public.asteroid VALUES (5, 'Eros', 2, 'Rocky', 16.840, '1898-08-13', true);
INSERT INTO public.asteroid VALUES (6, 'Apophis', 2, 'Stony', 0.370, '2004-06-19', true);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home galaxy.', 14, true, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Nearest major galaxy to the Milky Way.', 10, true, true);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Third-largest galaxy in the Local Group.', 12, false, true);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Famous for its spiral arms.', 8, true, false);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Bright nucleus and large central bulge.', 13, true, true);
INSERT INTO public.galaxy VALUES (6, 'Pinwheel', 'Large spiral galaxy.', 14, true, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 3, 3474.800, 'Rocky', false, false);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 22.400, 'Rocky', false, false);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 12.400, 'Rocky', false, false);
INSERT INTO public.moon VALUES (4, 'Europa', 5, 3121.600, 'Ice/Water', true, true);
INSERT INTO public.moon VALUES (5, 'Ganymede', 5, 5268.200, 'Ice/Water', true, true);
INSERT INTO public.moon VALUES (6, 'Callisto', 5, 4820.600, 'Rocky', true, true);
INSERT INTO public.moon VALUES (7, 'Io', 5, 3643.200, 'Volcanic', false, true);
INSERT INTO public.moon VALUES (8, 'Titan', 6, 5149.500, 'Ice/Nitrogen', true, true);
INSERT INTO public.moon VALUES (9, 'Enceladus', 6, 504.200, 'Ice/Water', true, true);
INSERT INTO public.moon VALUES (10, 'Rhea', 6, 1527.600, 'Rocky/Ice', false, false);
INSERT INTO public.moon VALUES (11, 'Iapetus', 6, 1469.600, 'Rocky/Ice', false, false);
INSERT INTO public.moon VALUES (12, 'Dione', 6, 1122.800, 'Rocky', false, false);
INSERT INTO public.moon VALUES (13, 'Tethys', 6, 1066.800, 'Rocky/Ice', false, false);
INSERT INTO public.moon VALUES (14, 'Mimas', 6, 396.400, 'Rocky/Ice', false, false);
INSERT INTO public.moon VALUES (15, 'Oberon', 6, 1522.800, 'Rocky/Ice', false, false);
INSERT INTO public.moon VALUES (16, 'Titania', 6, 1577.800, 'Rocky/Ice', false, false);
INSERT INTO public.moon VALUES (17, 'Umbriel', 6, 1190.800, 'Rocky', false, false);
INSERT INTO public.moon VALUES (18, 'Ariel', 6, 1158.800, 'Rocky/Ice', false, false);
INSERT INTO public.moon VALUES (19, 'Miranda', 6, 471.600, 'Rocky', false, true);
INSERT INTO public.moon VALUES (20, 'Charon', 4, 1212.000, 'Ice/Water', true, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 2439.700, 'false', false, false);
INSERT INTO public.planet VALUES (2, 'Venus', 1, 6051.800, 'true', false, false);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 6371.000, 'true', false, true);
INSERT INTO public.planet VALUES (4, 'Mars', 1, 3389.500, 'true', false, true);
INSERT INTO public.planet VALUES (5, 'Jupiter', 2, 69911.000, 'true', true, false);
INSERT INTO public.planet VALUES (6, 'Saturn', 2, 58232.000, 'true', true, false);
INSERT INTO public.planet VALUES (7, 'Proxima b', 4, 6371.000, 'POSSIBLE', false, true);
INSERT INTO public.planet VALUES (8, 'Alpha Centauri Bb', 4, 5523.000, 'POSSIBLE', false, true);
INSERT INTO public.planet VALUES (9, 'Kepler-22b', 5, 11922.000, 'UNKNOWN', false, true);
INSERT INTO public.planet VALUES (10, 'GJ 1214b', 5, 13270.000, 'UNKNOWN', false, true);
INSERT INTO public.planet VALUES (11, 'TRAPPIST-1d', 6, 5626.000, 'POSSIBLE', false, true);
INSERT INTO public.planet VALUES (12, 'Gliese 581d', 6, 2425.000, 'POSSIBLE', false, true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1989000000000000000000000000000.000, 5778, true, 1);
INSERT INTO public.star VALUES (2, 'Sirius', 4018000000000000000000000000000.000, 9940, true, 1);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 27800000000000000000000000000000.000, 3500, false, 1);
INSERT INTO public.star VALUES (4, 'Proxima Centauri', 244600000000000000000000000000.000, 3042, true, 2);
INSERT INTO public.star VALUES (5, 'Rigel', 18100000000000000000000000000000.000, 12100, true, 3);
INSERT INTO public.star VALUES (6, 'Vega', 4170000000000000000000000000000.000, 9602, true, 4);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 6, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: asteroid asteroid_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--


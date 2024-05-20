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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    type integer NOT NULL,
    billions_of_stars integer,
    size_kpc numeric(7,3),
    distance_mly numeric(7,3),
    is_beautiful boolean NOT NULL,
    comments text
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
-- Name: galaxy_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_type (
    galaxy_type_id integer NOT NULL,
    name character varying(30) NOT NULL,
    shorthand character varying(10)
);


ALTER TABLE public.galaxy_type OWNER TO freecodecamp;

--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_type_galaxy_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_type_galaxy_type_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_type_galaxy_type_id_seq OWNED BY public.galaxy_type.galaxy_type_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planet_id integer NOT NULL,
    gravity_g numeric(7,4),
    mass_lunar numeric(10,6)
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
    name character varying(30) NOT NULL,
    star_id integer NOT NULL,
    mass_earth numeric(8,4),
    is_dwarf boolean
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
    name character varying(30) NOT NULL,
    galaxy_id integer NOT NULL,
    type integer NOT NULL,
    age_byrs numeric(7,3),
    is_giant boolean,
    comments text
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
-- Name: star_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star_type (
    star_type_id integer NOT NULL,
    name character varying(30) NOT NULL,
    min_temp_c integer
);


ALTER TABLE public.star_type OWNER TO freecodecamp;

--
-- Name: star_type_star_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_type_star_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_type_star_type_id_seq OWNER TO freecodecamp;

--
-- Name: star_type_star_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_type_star_type_id_seq OWNED BY public.star_type.star_type_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: galaxy_type galaxy_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type ALTER COLUMN galaxy_type_id SET DEFAULT nextval('public.galaxy_type_galaxy_type_id_seq'::regclass);


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
-- Name: star_type star_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_type ALTER COLUMN star_type_id SET DEFAULT nextval('public.star_type_star_type_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 2, 100, 26.800, 0.000, true, 'Our home');
INSERT INTO public.galaxy VALUES (2, 'Large Magellanic Cloud', 2, 20, 9.860, 0.163, false, 'Close little neighbor in the Local Group');
INSERT INTO public.galaxy VALUES (3, 'Andromeda', 2, 1000, 46.560, 2.500, true, 'Big sister galaxy in the Local Group, will collide with us');
INSERT INTO public.galaxy VALUES (4, 'Triangulum', 2, 40, 18.740, 3.200, false, 'Little sister galaxy in the Local Group');
INSERT INTO public.galaxy VALUES (5, 'Cartwheel', 4, 50, 44.230, 500.000, true, 'In a galaxy far, far away');
INSERT INTO public.galaxy VALUES (6, 'IC 1101', 4, 100000, 123.650, 1154.600, true, 'The largest known galaxy in the universe');


--
-- Data for Name: galaxy_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_type VALUES (1, 'Elliptical', 'E');
INSERT INTO public.galaxy_type VALUES (2, 'Spiral', 'S');
INSERT INTO public.galaxy_type VALUES (3, 'Irregular', 'Irr');
INSERT INTO public.galaxy_type VALUES (4, 'Lenticular', 'S0');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, 0.1654, 1.000000);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 0.0006, 0.000001);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 0.0003, 0.000002);
INSERT INTO public.moon VALUES (4, 'Charon', 10, 0.0290, 0.021600);
INSERT INTO public.moon VALUES (5, 'Io', 5, 0.1830, 1.216000);
INSERT INTO public.moon VALUES (6, 'Europa', 5, 0.1340, 0.650000);
INSERT INTO public.moon VALUES (7, 'Ganymede', 5, 0.1460, 2.015000);
INSERT INTO public.moon VALUES (8, 'Callisto', 5, 0.1260, 1.460000);
INSERT INTO public.moon VALUES (9, 'Titan', 6, 0.1400, 1.800000);
INSERT INTO public.moon VALUES (10, 'Enceladus', 6, 0.1130, 0.014700);
INSERT INTO public.moon VALUES (11, 'Rhea', 6, 0.0270, 0.031400);
INSERT INTO public.moon VALUES (12, 'Iapetus', 6, 0.0220, 0.024600);
INSERT INTO public.moon VALUES (13, 'Triton', 8, 0.0794, 0.029200);
INSERT INTO public.moon VALUES (14, 'Dysnomia', 13, 0.0030, 0.001120);
INSERT INTO public.moon VALUES (15, 'Kepler-1625b I', 21, 1.1400, 0.012000);
INSERT INTO public.moon VALUES (16, 'Titania', 7, 0.0038, 0.047000);
INSERT INTO public.moon VALUES (17, 'Oberon', 7, 0.0355, 0.041000);
INSERT INTO public.moon VALUES (18, 'Dione', 6, 0.0237, 0.014900);
INSERT INTO public.moon VALUES (19, 'Tethys', 6, 0.0015, 0.008410);
INSERT INTO public.moon VALUES (20, 'Nereid', 8, 0.0076, 0.000409);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 1.0000, false);
INSERT INTO public.planet VALUES (2, 'Mercury', 1, 0.0550, false);
INSERT INTO public.planet VALUES (3, 'Venus', 1, 0.8150, false);
INSERT INTO public.planet VALUES (4, 'Mars', 1, 0.1070, false);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 317.8000, false);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 95.2000, false);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 14.5000, false);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 17.1000, false);
INSERT INTO public.planet VALUES (9, 'Ceres', 1, 0.0001, true);
INSERT INTO public.planet VALUES (10, 'Pluto', 1, 0.0022, true);
INSERT INTO public.planet VALUES (11, 'Haumea', 1, 0.0007, true);
INSERT INTO public.planet VALUES (12, 'Makemake', 1, 0.0007, true);
INSERT INTO public.planet VALUES (13, 'Eris', 1, 0.0028, true);
INSERT INTO public.planet VALUES (14, 'Kepler-22b', 8, 9.1000, false);
INSERT INTO public.planet VALUES (15, 'Kepler-186f', 7, 1.4400, false);
INSERT INTO public.planet VALUES (16, 'Proxima Centauri B', 2, 1.1700, false);
INSERT INTO public.planet VALUES (17, 'Thestias', 4, 731.0000, false);
INSERT INTO public.planet VALUES (18, 'Smertrios', 9, 114.0000, false);
INSERT INTO public.planet VALUES (19, 'Trappist-1e', 10, 0.6920, false);
INSERT INTO public.planet VALUES (20, 'Spe', 11, 1526.0000, false);
INSERT INTO public.planet VALUES (21, 'Kepler-1625b', 12, 30.6000, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 3, 4.600, false, 'Our temporary source of life');
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 1, 1, 4.853, false, 'Nearest sibling to our sun');
INSERT INTO public.star VALUES (3, 'Wolf 359', 1, 1, 0.900, false, 'A very young, small and faint star');
INSERT INTO public.star VALUES (4, 'Pollux', 1, 2, 0.725, true, 'The nearest giant star');
INSERT INTO public.star VALUES (5, 'Alpheratz', 3, 6, 0.060, false, 'A spectacular Andromeda sun');
INSERT INTO public.star VALUES (6, 'S Dor', 2, 8, 0.005, true, 'A spectacular Andromeda sun');
INSERT INTO public.star VALUES (7, 'Kepler-186', 1, 1, 4.000, false, 'Hosts an Earth-like exoplanet');
INSERT INTO public.star VALUES (8, 'Kepler-22', 1, 3, 4.000, false, 'Hosts a Super-Earth exoplanet');
INSERT INTO public.star VALUES (9, 'Ogma', 1, 3, 2.600, false, 'Hosts a a strange exoplanet');
INSERT INTO public.star VALUES (10, 'Trappist-1', 1, 1, 7.600, false, 'Hosts a rocky exoplanet');
INSERT INTO public.star VALUES (11, '14-Andromedae', 3, 2, 4.960, true, 'A giant, but hosts an exoplanet');
INSERT INTO public.star VALUES (12, 'Kepler-1625', 1, 3, 8.700, false, 'A sub-giant, nearing the end of its life');


--
-- Data for Name: star_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star_type VALUES (1, 'M', 2100);
INSERT INTO public.star_type VALUES (2, 'K', 3400);
INSERT INTO public.star_type VALUES (3, 'G', 4900);
INSERT INTO public.star_type VALUES (4, 'F', 5700);
INSERT INTO public.star_type VALUES (5, 'A', 7200);
INSERT INTO public.star_type VALUES (6, 'B', 9700);
INSERT INTO public.star_type VALUES (7, 'O', 30000);
INSERT INTO public.star_type VALUES (8, 'LBV', 7227);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_type_galaxy_type_id_seq', 4, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 21, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 12, true);


--
-- Name: star_type_star_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_type_star_type_id_seq', 8, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy_type galaxy_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_pkey PRIMARY KEY (galaxy_type_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star_type star_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_type
    ADD CONSTRAINT star_type_pkey PRIMARY KEY (star_type_id);


--
-- Name: galaxy_type uk_galaxy_type_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT uk_galaxy_type_name UNIQUE (name);


--
-- Name: moon uk_moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT uk_moon_name UNIQUE (name);


--
-- Name: galaxy uk_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT uk_name UNIQUE (name);


--
-- Name: planet uk_planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT uk_planet_name UNIQUE (name);


--
-- Name: star uk_star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT uk_star_name UNIQUE (name);


--
-- Name: star_type uk_star_type_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_type
    ADD CONSTRAINT uk_star_type_name UNIQUE (name);


--
-- Name: star fk_galaxy_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy_id FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_planet_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet_id FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star_id FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--


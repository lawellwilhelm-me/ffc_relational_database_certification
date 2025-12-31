--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
    name character varying(25) NOT NULL,
    description text,
    age_in_millions_of_years numeric(10,2),
    is_potentially_hazardous boolean,
    has_ice_content boolean,
    diameter_km integer,
    mean_velocity_kms integer,
    star_id integer
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
    name character varying(25) NOT NULL,
    description text,
    age_in_millions_of_years numeric(10,2),
    has_active_nucleus boolean,
    is_interacting boolean,
    estimated_star_count integer,
    satellite_galaxy_count integer
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
    name character varying(25) NOT NULL,
    description text,
    age_in_millions_of_years numeric(10,2),
    is_tidally_locked boolean,
    has_subsurface_ocean boolean,
    crater_density_index integer,
    orbital_order integer,
    planet_id integer NOT NULL
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
    name character varying(25) NOT NULL,
    description text,
    age_in_millions_of_years numeric(10,2),
    is_habitable_zone boolean,
    has_magnetic_field boolean,
    moon_count integer,
    discovery_year integer,
    star_id integer NOT NULL
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
    name character varying(25) NOT NULL,
    description text,
    age_in_millions_of_years numeric(10,2),
    is_binary_pair boolean,
    has_exoplanet_system boolean,
    effective_temperature integer,
    rotation_period_days integer,
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

INSERT INTO public.asteroid VALUES (1, 'Ceres', 'The largest object in the main asteroid belt and a dwarf planet.', 4500.00, false, true, 940, 17, 1);
INSERT INTO public.asteroid VALUES (2, 'Vesta', 'One of the largest objects in the asteroid belt and a protoplanet.', 4500.00, false, false, 525, 19, 1);
INSERT INTO public.asteroid VALUES (3, 'Bennu', 'A carbonaceous asteroid being studied for organic compounds.', 100.00, true, true, 1, 28, 1);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home barred spiral galaxy.', 13600.00, false, true, 250000000, NULL);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'The nearest major galaxy to us.', 10000.00, true, true, 1000000000, NULL);
INSERT INTO public.galaxy VALUES (3, 'Sombrero', 'Noted for its bright nucleus and dust lane.', 13250.50, true, false, 800000000, NULL);
INSERT INTO public.galaxy VALUES (4, 'Triangulum', 'Third-largest member of the Local Group.', 12000.00, false, false, 40000000, NULL);
INSERT INTO public.galaxy VALUES (5, 'Large Magellanic', 'A satellite galaxy of the Milky Way.', 1100.00, false, true, 30000000, NULL);
INSERT INTO public.galaxy VALUES (6, 'Whirlpool', 'Classic interacting spiral galaxy.', 400.75, true, true, 100000000, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'Earths only natural satellite.', 4510.00, true, false, 85, 1, 2);
INSERT INTO public.moon VALUES (2, 'Io', 'Most geologically active body in system.', 4603.00, true, false, 5, 1, 3);
INSERT INTO public.moon VALUES (3, 'Europa', 'Possesses a massive liquid water ocean.', 4603.00, true, true, 10, 2, 3);
INSERT INTO public.moon VALUES (4, 'Ganymede', 'Largest moon in the solar system.', 4603.00, true, true, 40, 3, 3);
INSERT INTO public.moon VALUES (5, 'Callisto', 'Most heavily cratered object in system.', 4603.00, true, false, 98, 4, 3);
INSERT INTO public.moon VALUES (6, 'Titan', 'Massive moon with thick atmosphere.', 4603.00, true, true, 15, 1, 4);
INSERT INTO public.moon VALUES (7, 'Enceladus', 'Known for its icy geysers.', 4603.00, true, true, 20, 2, 4);
INSERT INTO public.moon VALUES (8, 'Triton', 'Moon with a retrograde orbit.', 4000.00, true, true, 25, 1, 9);
INSERT INTO public.moon VALUES (9, 'Phobos', 'Smaller, inner moon of Mars.', 4603.00, true, false, 70, 1, 7);
INSERT INTO public.moon VALUES (10, 'Deimos', 'Smaller, outer moon of Mars.', 4603.00, true, false, 65, 2, 7);
INSERT INTO public.moon VALUES (11, 'Charon', 'Large moon of the dwarf planet Pluto.', 4500.00, true, false, 50, 1, 12);
INSERT INTO public.moon VALUES (12, 'Mimas', 'Resembles the Death Star from fiction.', 4603.00, true, false, 92, 3, 4);
INSERT INTO public.moon VALUES (13, 'Rhea', 'Saturns second-largest moon.', 4603.00, true, false, 80, 4, 4);
INSERT INTO public.moon VALUES (14, 'Dione', 'Composed primarily of water ice.', 4603.00, true, false, 75, 5, 4);
INSERT INTO public.moon VALUES (15, 'Iapetus', 'Notable for its two-tone coloring.', 4603.00, true, false, 88, 6, 4);
INSERT INTO public.moon VALUES (16, 'Titania', 'Largest moon of Uranus.', 4603.00, true, false, 60, 1, 12);
INSERT INTO public.moon VALUES (17, 'Oberon', 'Second-largest moon of Uranus.', 4603.00, true, false, 62, 2, 12);
INSERT INTO public.moon VALUES (18, 'Umbriel', 'Darkest of the large Uranian moons.', 4603.00, true, false, 82, 3, 12);
INSERT INTO public.moon VALUES (19, 'Ariel', 'Brightest of the Uranian moons.', 4603.00, true, false, 55, 4, 12);
INSERT INTO public.moon VALUES (20, 'Miranda', 'Known for its extreme, broken terrain.', 4603.00, true, false, 45, 5, 12);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'Smallest planet in the solar system.', 4503.00, false, true, 0, 1610, 1);
INSERT INTO public.planet VALUES (2, 'Earth', 'Only planet known to harbor life.', 4543.00, true, true, 1, 0, 1);
INSERT INTO public.planet VALUES (3, 'Jupiter', 'Largest planet in our solar system.', 4603.00, false, true, 95, 1610, 1);
INSERT INTO public.planet VALUES (4, 'Saturn', 'Famous for its extensive ring system.', 4603.00, false, true, 146, 1610, 1);
INSERT INTO public.planet VALUES (5, 'Proxima b', 'Potentially habitable exoplanet.', 4850.00, true, true, 0, 2016, 2);
INSERT INTO public.planet VALUES (6, 'Kepler-186f', 'First Earth-sized planet in habitable zone.', 4000.00, true, true, 0, 2014, 5);
INSERT INTO public.planet VALUES (7, 'Mars', 'The red planet, highly studied for water.', 4603.00, false, false, 2, 1610, 1);
INSERT INTO public.planet VALUES (8, 'Venus', 'Earths evil twin with runaway greenhouse.', 4503.00, false, false, 0, 1610, 1);
INSERT INTO public.planet VALUES (9, 'Neptune', 'Farthest known solar planet.', 4603.00, false, true, 14, 1846, 1);
INSERT INTO public.planet VALUES (10, 'Gliese 581g', 'Candidate for being an Earth-like planet.', 7000.00, true, true, 0, 2010, 2);
INSERT INTO public.planet VALUES (11, 'HD 209458 b', 'First planet seen transiting its star.', 4000.00, false, true, 0, 1999, 1);
INSERT INTO public.planet VALUES (12, 'Uranus', 'Tilted ice giant planet.', 4603.00, false, true, 28, 1781, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'Yellow dwarf at center of our system.', 4603.00, false, true, 5778, 27, 1);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 'Closest star to the Sun.', 4850.00, true, true, 3042, 83, 1);
INSERT INTO public.star VALUES (3, 'Sirius A', 'Brightest star in the night sky.', 242.00, true, false, 9940, 1, 1);
INSERT INTO public.star VALUES (4, 'Alpheratz', 'Brightest star in Andromeda galaxy.', 60.00, true, false, 13800, 2, 2);
INSERT INTO public.star VALUES (5, 'Vega', 'Often used as a zero-point for magnitude.', 455.50, false, true, 9602, 1, 1);
INSERT INTO public.star VALUES (6, 'Betelgeuse', 'Distinctive red supergiant.', 10.20, false, false, 3500, 360, 1);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 3, true);


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
-- Name: galaxy galaxy_galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_name_key UNIQUE (name);


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
-- Name: planet planet_planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


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


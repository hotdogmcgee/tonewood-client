--
-- PostgreSQL database dump
--

-- Dumped from database version 10.9
-- Dumped by pg_dump version 10.9

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

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: tonewood_category; Type: TYPE; Schema: public; Owner: woody
--

CREATE TYPE public.tonewood_category AS ENUM (
    'Hardwood',
    'Softwood'
);


ALTER TYPE public.tonewood_category OWNER TO woody;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: schemaversion; Type: TABLE; Schema: public; Owner: woody
--

CREATE TABLE public.schemaversion (
    version bigint NOT NULL,
    name text,
    md5 text,
    run_at timestamp with time zone
);


ALTER TABLE public.schemaversion OWNER TO woody;

--
-- Name: submissions; Type: TABLE; Schema: public; Owner: woody
--

CREATE TABLE public.submissions (
    id integer NOT NULL,
    date_created timestamp without time zone DEFAULT now() NOT NULL,
    tw_id integer,
    new_tw_name text,
    user_id integer NOT NULL,
    density numeric(5,2) NOT NULL,
    e_long numeric(3,2) NOT NULL,
    e_cross numeric(3,2) NOT NULL,
    velocity_sound_long numeric(3,2) NOT NULL,
    radiation_ratio numeric(3,2) NOT NULL,
    sample_length numeric(5,2) NOT NULL,
    sample_width numeric(5,2) NOT NULL,
    sample_thickness numeric(3,2) NOT NULL,
    sample_weight numeric(5,2) NOT NULL,
    peak_hz_long_grain numeric(5,2) NOT NULL,
    peak_hz_cross_grain numeric(5,2) NOT NULL,
    comments text
);


ALTER TABLE public.submissions OWNER TO woody;

--
-- Name: submissions_id_seq; Type: SEQUENCE; Schema: public; Owner: woody
--

CREATE SEQUENCE public.submissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.submissions_id_seq OWNER TO woody;

--
-- Name: submissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: woody
--

ALTER SEQUENCE public.submissions_id_seq OWNED BY public.submissions.id;


--
-- Name: tonewoods; Type: TABLE; Schema: public; Owner: woody
--

CREATE TABLE public.tonewoods (
    id integer NOT NULL,
    genus text NOT NULL,
    species text NOT NULL,
    common_name text NOT NULL,
    date_created timestamp without time zone DEFAULT now() NOT NULL,
    hardness public.tonewood_category,
    user_id integer
);


ALTER TABLE public.tonewoods OWNER TO woody;

--
-- Name: tonewoods_id_seq; Type: SEQUENCE; Schema: public; Owner: woody
--

CREATE SEQUENCE public.tonewoods_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tonewoods_id_seq OWNER TO woody;

--
-- Name: tonewoods_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: woody
--

ALTER SEQUENCE public.tonewoods_id_seq OWNED BY public.tonewoods.id;


--
-- Name: tw_users; Type: TABLE; Schema: public; Owner: woody
--

CREATE TABLE public.tw_users (
    id integer NOT NULL,
    user_name text NOT NULL,
    email text NOT NULL,
    full_name text NOT NULL,
    password text NOT NULL,
    nickname text,
    date_created timestamp without time zone DEFAULT now() NOT NULL,
    date_modified timestamp without time zone
);


ALTER TABLE public.tw_users OWNER TO woody;

--
-- Name: tw_users_id_seq; Type: SEQUENCE; Schema: public; Owner: woody
--

CREATE SEQUENCE public.tw_users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tw_users_id_seq OWNER TO woody;

--
-- Name: tw_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: woody
--

ALTER SEQUENCE public.tw_users_id_seq OWNED BY public.tw_users.id;


--
-- Name: submissions id; Type: DEFAULT; Schema: public; Owner: woody
--

ALTER TABLE ONLY public.submissions ALTER COLUMN id SET DEFAULT nextval('public.submissions_id_seq'::regclass);


--
-- Name: tonewoods id; Type: DEFAULT; Schema: public; Owner: woody
--

ALTER TABLE ONLY public.tonewoods ALTER COLUMN id SET DEFAULT nextval('public.tonewoods_id_seq'::regclass);


--
-- Name: tw_users id; Type: DEFAULT; Schema: public; Owner: woody
--

ALTER TABLE ONLY public.tw_users ALTER COLUMN id SET DEFAULT nextval('public.tw_users_id_seq'::regclass);


--
-- Data for Name: schemaversion; Type: TABLE DATA; Schema: public; Owner: woody
--

COPY public.schemaversion (version, name, md5, run_at) FROM stdin;
0	\N	\N	\N
1	create_tonewoods	5931a4de73028dbff51436a27aa99e6b	2019-09-17 18:59:23.509+00
2	alter_tonewood_hardness	378cbcaeacda336af77d2f853fb58265	2019-09-17 18:59:23.525+00
3	create_tw_users	95d3a33ca522eb1fd8e7284896582cbc	2019-09-17 18:59:23.557+00
4	create_submissions	023a3251ca26ba0001860c8b00c2a5ab	2019-09-17 18:59:23.584+00
\.


--
-- Data for Name: submissions; Type: TABLE DATA; Schema: public; Owner: woody
--

COPY public.submissions (id, date_created, tw_id, new_tw_name, user_id, density, e_long, e_cross, velocity_sound_long, radiation_ratio, sample_length, sample_width, sample_thickness, sample_weight, peak_hz_long_grain, peak_hz_cross_grain, comments) FROM stdin;
\.


--
-- Data for Name: tonewoods; Type: TABLE DATA; Schema: public; Owner: woody
--

COPY public.tonewoods (id, genus, species, common_name, date_created, hardness, user_id) FROM stdin;
\.


--
-- Data for Name: tw_users; Type: TABLE DATA; Schema: public; Owner: woody
--

COPY public.tw_users (id, user_name, email, full_name, password, nickname, date_created, date_modified) FROM stdin;
\.


--
-- Name: submissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: woody
--

SELECT pg_catalog.setval('public.submissions_id_seq', 1, false);


--
-- Name: tonewoods_id_seq; Type: SEQUENCE SET; Schema: public; Owner: woody
--

SELECT pg_catalog.setval('public.tonewoods_id_seq', 1, false);


--
-- Name: tw_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: woody
--

SELECT pg_catalog.setval('public.tw_users_id_seq', 1, false);


--
-- Name: schemaversion schemaversion_pkey; Type: CONSTRAINT; Schema: public; Owner: woody
--

ALTER TABLE ONLY public.schemaversion
    ADD CONSTRAINT schemaversion_pkey PRIMARY KEY (version);


--
-- Name: submissions submissions_pkey; Type: CONSTRAINT; Schema: public; Owner: woody
--

ALTER TABLE ONLY public.submissions
    ADD CONSTRAINT submissions_pkey PRIMARY KEY (id);


--
-- Name: tonewoods tonewoods_pkey; Type: CONSTRAINT; Schema: public; Owner: woody
--

ALTER TABLE ONLY public.tonewoods
    ADD CONSTRAINT tonewoods_pkey PRIMARY KEY (id);


--
-- Name: tw_users tw_users_email_key; Type: CONSTRAINT; Schema: public; Owner: woody
--

ALTER TABLE ONLY public.tw_users
    ADD CONSTRAINT tw_users_email_key UNIQUE (email);


--
-- Name: tw_users tw_users_pkey; Type: CONSTRAINT; Schema: public; Owner: woody
--

ALTER TABLE ONLY public.tw_users
    ADD CONSTRAINT tw_users_pkey PRIMARY KEY (id);


--
-- Name: tw_users tw_users_user_name_key; Type: CONSTRAINT; Schema: public; Owner: woody
--

ALTER TABLE ONLY public.tw_users
    ADD CONSTRAINT tw_users_user_name_key UNIQUE (user_name);


--
-- Name: submissions submissions_tw_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: woody
--

ALTER TABLE ONLY public.submissions
    ADD CONSTRAINT submissions_tw_id_fkey FOREIGN KEY (tw_id) REFERENCES public.tonewoods(id) ON DELETE CASCADE;


--
-- Name: submissions submissions_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: woody
--

ALTER TABLE ONLY public.submissions
    ADD CONSTRAINT submissions_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.tw_users(id) ON DELETE CASCADE;


--
-- Name: tonewoods tonewoods_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: woody
--

ALTER TABLE ONLY public.tonewoods
    ADD CONSTRAINT tonewoods_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.tw_users(id) ON DELETE SET NULL;


--
-- PostgreSQL database dump complete
--


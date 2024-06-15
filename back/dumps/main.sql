--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3 (Debian 16.3-1.pgdg120+1)
-- Dumped by pg_dump version 16.3 (Debian 16.3-1.pgdg120+1)

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
-- Name: usertypes; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.usertypes AS ENUM (
    'admin',
    'client'
);


ALTER TYPE public.usertypes OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: alembic_version; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.alembic_version (
    version_num character varying(32) NOT NULL
);


ALTER TABLE public.alembic_version OWNER TO postgres;

--
-- Name: client; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.client (
    id integer NOT NULL,
    first_name character varying NOT NULL,
    second_name character varying NOT NULL,
    third_name character varying,
    email character varying NOT NULL,
    password character varying NOT NULL,
    type public.usertypes NOT NULL
);


ALTER TABLE public.client OWNER TO postgres;

--
-- Name: client_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.client_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.client_id_seq OWNER TO postgres;

--
-- Name: client_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.client_id_seq OWNED BY public.client.id;


--
-- Name: photo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.photo (
    id integer NOT NULL,
    obj character varying NOT NULL,
    obj_id integer NOT NULL,
    path character varying NOT NULL,
    "time" timestamp with time zone NOT NULL
);


ALTER TABLE public.photo OWNER TO postgres;

--
-- Name: photo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.photo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.photo_id_seq OWNER TO postgres;

--
-- Name: photo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.photo_id_seq OWNED BY public.photo.id;


--
-- Name: refresh_token_storage; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.refresh_token_storage (
    id integer NOT NULL,
    refresh_token character varying NOT NULL,
    expired timestamp with time zone NOT NULL
);


ALTER TABLE public.refresh_token_storage OWNER TO postgres;

--
-- Name: refresh_token_storage_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.refresh_token_storage_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.refresh_token_storage_id_seq OWNER TO postgres;

--
-- Name: refresh_token_storage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.refresh_token_storage_id_seq OWNED BY public.refresh_token_storage.id;


--
-- Name: weight; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.weight (
    id integer NOT NULL,
    user_id integer NOT NULL,
    weight double precision NOT NULL,
    create_dt timestamp with time zone
);


ALTER TABLE public.weight OWNER TO postgres;

--
-- Name: weight_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.weight_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.weight_id_seq OWNER TO postgres;

--
-- Name: weight_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.weight_id_seq OWNED BY public.weight.id;


--
-- Name: client id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client ALTER COLUMN id SET DEFAULT nextval('public.client_id_seq'::regclass);


--
-- Name: photo id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.photo ALTER COLUMN id SET DEFAULT nextval('public.photo_id_seq'::regclass);


--
-- Name: refresh_token_storage id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refresh_token_storage ALTER COLUMN id SET DEFAULT nextval('public.refresh_token_storage_id_seq'::regclass);


--
-- Name: weight id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.weight ALTER COLUMN id SET DEFAULT nextval('public.weight_id_seq'::regclass);


--
-- Data for Name: alembic_version; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.alembic_version (version_num) FROM stdin;
9fe8b0c054e3
\.


--
-- Data for Name: client; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.client (id, first_name, second_name, third_name, email, password, type) FROM stdin;
1	Денис	Кириенко	Олегович	kirden04@gmail.com	scrypt:32768:8:1$vdqvxDiDBaSzQEbQ$1295e62a9045942893ac6fbfc5bc4d4680f8384dde85f2893136cc739d392295f86a6946b8fe012bab6dd20c262094a885bc170d945340501a3d65b93078017d	client
\.


--
-- Data for Name: photo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.photo (id, obj, obj_id, path, "time") FROM stdin;
\.


--
-- Data for Name: refresh_token_storage; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.refresh_token_storage (id, refresh_token, expired) FROM stdin;
\.


--
-- Data for Name: weight; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.weight (id, user_id, weight, create_dt) FROM stdin;
\.


--
-- Name: client_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.client_id_seq', 1, true);


--
-- Name: photo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.photo_id_seq', 1, false);


--
-- Name: refresh_token_storage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.refresh_token_storage_id_seq', 1, false);


--
-- Name: weight_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.weight_id_seq', 1, false);


--
-- Name: alembic_version alembic_version_pkc; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);


--
-- Name: client client_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT client_pkey PRIMARY KEY (id);


--
-- Name: photo photo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.photo
    ADD CONSTRAINT photo_pkey PRIMARY KEY (id);


--
-- Name: refresh_token_storage refresh_token_storage_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.refresh_token_storage
    ADD CONSTRAINT refresh_token_storage_pkey PRIMARY KEY (id);


--
-- Name: weight weight_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.weight
    ADD CONSTRAINT weight_pkey PRIMARY KEY (id);


--
-- Name: weight weight_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.weight
    ADD CONSTRAINT weight_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.client(id);


--
-- PostgreSQL database dump complete
--


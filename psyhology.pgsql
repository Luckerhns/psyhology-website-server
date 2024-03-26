--
-- PostgreSQL database dump
--

-- Dumped from database version 14.8 (Homebrew)
-- Dumped by pg_dump version 14.8 (Homebrew)

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
-- Name: psyhology; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE psyhology WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'C';


ALTER DATABASE psyhology OWNER TO postgres;

\connect psyhology

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
-- Name: busyTimes; Type: TABLE; Schema: public; Owner: mamedov
--

CREATE TABLE public."busyTimes" (
    id integer NOT NULL,
    email character varying(255),
    firstname character varying(255),
    lastname character varying(255),
    patronymic character varying(255),
    phone character varying(255),
    "time" character varying(255),
    date character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."busyTimes" OWNER TO mamedov;

--
-- Name: busyTimes_id_seq; Type: SEQUENCE; Schema: public; Owner: mamedov
--

CREATE SEQUENCE public."busyTimes_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."busyTimes_id_seq" OWNER TO mamedov;

--
-- Name: busyTimes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mamedov
--

ALTER SEQUENCE public."busyTimes_id_seq" OWNED BY public."busyTimes".id;


--
-- Name: records; Type: TABLE; Schema: public; Owner: mamedov
--

CREATE TABLE public.records (
    id integer NOT NULL,
    record json DEFAULT '""'::json,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.records OWNER TO mamedov;

--
-- Name: records_id_seq; Type: SEQUENCE; Schema: public; Owner: mamedov
--

CREATE SEQUENCE public.records_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.records_id_seq OWNER TO mamedov;

--
-- Name: records_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mamedov
--

ALTER SEQUENCE public.records_id_seq OWNED BY public.records.id;


--
-- Name: tokens; Type: TABLE; Schema: public; Owner: mamedov
--

CREATE TABLE public.tokens (
    id integer NOT NULL,
    "refreshToken" character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.tokens OWNER TO mamedov;

--
-- Name: tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: mamedov
--

CREATE SEQUENCE public.tokens_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tokens_id_seq OWNER TO mamedov;

--
-- Name: tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mamedov
--

ALTER SEQUENCE public.tokens_id_seq OWNED BY public.tokens.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: mamedov
--

CREATE TABLE public.users (
    id integer NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    firstname character varying(255),
    lastname character varying(255),
    patronymic character varying(255),
    number character varying(255),
    address character varying(255),
    sale_sum double precision,
    discount double precision,
    "isActivated" boolean DEFAULT false,
    "activationLink" character varying(255),
    role character varying(255) DEFAULT 'USER'::character varying,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.users OWNER TO mamedov;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: mamedov
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO mamedov;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mamedov
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: busyTimes id; Type: DEFAULT; Schema: public; Owner: mamedov
--

ALTER TABLE ONLY public."busyTimes" ALTER COLUMN id SET DEFAULT nextval('public."busyTimes_id_seq"'::regclass);


--
-- Name: records id; Type: DEFAULT; Schema: public; Owner: mamedov
--

ALTER TABLE ONLY public.records ALTER COLUMN id SET DEFAULT nextval('public.records_id_seq'::regclass);


--
-- Name: tokens id; Type: DEFAULT; Schema: public; Owner: mamedov
--

ALTER TABLE ONLY public.tokens ALTER COLUMN id SET DEFAULT nextval('public.tokens_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: mamedov
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: busyTimes; Type: TABLE DATA; Schema: public; Owner: mamedov
--

COPY public."busyTimes" (id, email, firstname, lastname, patronymic, phone, "time", date, "createdAt", "updatedAt") FROM stdin;
1	Luckerhackerr@gmail.com	Mamed	Mamedov	Telmanovich	79933547260	14:00	2023-01-10	2024-03-02 01:30:46.702+03	2024-03-02 01:30:46.702+03
2	Luckerhackerr@gmail.com	Mamed	Mamedov	Telmanovich	79933547260	14:00	2023-01-10	2024-03-02 01:30:48.506+03	2024-03-02 01:30:48.506+03
3	Luckerhackerr@gmail.com	Mamed	Mamedov	Telmanovich	79933547260	14:00	2023-01-10	2024-03-02 01:30:57.605+03	2024-03-02 01:30:57.605+03
4	Luckerhackerr@gmail.com	Mamed	Mamedov	Telmanovich	79933547260	14:00	2023-01-10	2024-03-02 18:49:56.45+03	2024-03-02 18:49:56.45+03
5	Luckerhackerr@gmail.com	Mamed	Mamedov	Telmanovich	79933547260	14:00	2023-01-11	2024-03-02 18:50:38.064+03	2024-03-02 18:50:38.064+03
6	Luckerhackerr@gmail.com	Mamed	Mamedov	Telmanovich	79933547260	14:00	2023-01-11	2024-03-02 18:51:57.313+03	2024-03-02 18:51:57.313+03
7	Luckerhackerr@gmail.com	Mamed	Mamedov	Telmanovich	79933547260	14:00	2023-01-11	2024-03-02 18:52:34.869+03	2024-03-02 18:52:34.869+03
8	Luckerhackerr@gmail.com	Mamed	Mamedov	Telmanovich	79933547260	14:00	2023-01-11	2024-03-02 18:58:07.166+03	2024-03-02 18:58:07.166+03
\.


--
-- Data for Name: records; Type: TABLE DATA; Schema: public; Owner: mamedov
--

COPY public.records (id, record, "createdAt", "updatedAt") FROM stdin;
1	"[{\\"date\\":\\"2023-01-10\\",\\"username\\":\\"dsadsa\\",\\"freeTimes\\":[\\"12:00\\",\\"16:00\\",\\"18:00\\"],\\"busyTimes\\":[{\\"time\\":\\"14:00\\",\\"firstname\\":\\"Mamed\\",\\"lastname\\":\\"Mamedov\\",\\"patronymic\\":\\"Telmanovich\\",\\"phone\\":\\"79933547260\\",\\"email\\":\\"Luckerhackerr@gmail.com\\"},{\\"time\\":\\"14:00\\",\\"firstname\\":\\"Mamed\\",\\"lastname\\":\\"Mamedov\\",\\"patronymic\\":\\"Telmanovich\\",\\"phone\\":\\"79933547260\\",\\"email\\":\\"Luckerhackerr@gmail.com\\"},{\\"time\\":\\"14:00\\",\\"firstname\\":\\"Mamed\\",\\"lastname\\":\\"Mamedov\\",\\"patronymic\\":\\"Telmanovich\\",\\"phone\\":\\"79933547260\\",\\"email\\":\\"Luckerhackerr@gmail.com\\"},{\\"time\\":\\"14:00\\",\\"firstname\\":\\"Mamed\\",\\"lastname\\":\\"Mamedov\\",\\"patronymic\\":\\"Telmanovich\\",\\"phone\\":\\"79933547260\\",\\"email\\":\\"Luckerhackerr@gmail.com\\"}],\\"notSelectedTimes\\":[\\"10:00\\",\\"11:00\\",\\"13:00\\"]},{\\"date\\":\\"2023-01-12\\",\\"username\\":\\"\\",\\"freeTimes\\":[],\\"notSelectedTimes\\":[\\"11:00\\",\\"12:00\\",\\"13:00\\",\\"14:00\\",\\"15:00\\",\\"16:00\\",\\"17:00\\",\\"18:00\\",\\"19:00\\"],\\"busyTimes\\":[]},{\\"date\\":\\"2023-01-11\\",\\"username\\":\\"\\",\\"freeTimes\\":[\\"13:00\\",\\"14:00\\",\\"17:00\\"],\\"notSelectedTimes\\":[\\"11:00\\",\\"15:00\\"],\\"busyTimes\\":[{\\"time\\":\\"14:00\\",\\"firstname\\":\\"Mamed\\",\\"lastname\\":\\"Mamedov\\",\\"patronymic\\":\\"Telmanovich\\",\\"phone\\":\\"79933547260\\",\\"email\\":\\"Luckerhackerr@gmail.com\\"},{\\"time\\":\\"14:00\\",\\"firstname\\":\\"Mamed\\",\\"lastname\\":\\"Mamedov\\",\\"patronymic\\":\\"Telmanovich\\",\\"phone\\":\\"79933547260\\",\\"email\\":\\"Luckerhackerr@gmail.com\\"},{\\"time\\":\\"14:00\\",\\"firstname\\":\\"Mamed\\",\\"lastname\\":\\"Mamedov\\",\\"patronymic\\":\\"Telmanovich\\",\\"phone\\":\\"79933547260\\",\\"email\\":\\"Luckerhackerr@gmail.com\\"},{\\"time\\":\\"14:00\\",\\"firstname\\":\\"Mamed\\",\\"lastname\\":\\"Mamedov\\",\\"patronymic\\":\\"Telmanovich\\",\\"phone\\":\\"79933547260\\",\\"email\\":\\"Luckerhackerr@gmail.com\\"}]},{\\"date\\":\\"2023-01-25\\",\\"username\\":\\"\\",\\"freeTimes\\":[\\"12:00\\",\\"13:00\\",\\"15:00\\"],\\"notSelectedTimes\\":[\\"11:00\\",\\"14:00\\",\\"16:00\\",\\"17:00\\",\\"18:00\\",\\"19:00\\"],\\"busyTimes\\":[]},{\\"date\\":\\"2023-01-02\\",\\"username\\":\\"\\",\\"freeTimes\\":[],\\"notSelectedTimes\\":[\\"11:00\\",\\"12:00\\",\\"13:00\\",\\"14:00\\",\\"15:00\\",\\"16:00\\",\\"17:00\\",\\"18:00\\",\\"19:00\\"],\\"busyTimes\\":[]},{\\"date\\":\\"2023-01-05\\",\\"username\\":\\"\\",\\"freeTimes\\":[],\\"notSelectedTimes\\":[\\"11:00\\",\\"12:00\\",\\"13:00\\",\\"14:00\\",\\"15:00\\",\\"16:00\\",\\"17:00\\",\\"18:00\\",\\"19:00\\"],\\"busyTimes\\":[]},{\\"date\\":\\"2023-01-15\\",\\"username\\":\\"\\",\\"freeTimes\\":[],\\"notSelectedTimes\\":[\\"11:00\\",\\"12:00\\",\\"13:00\\",\\"14:00\\",\\"15:00\\",\\"16:00\\",\\"17:00\\",\\"18:00\\",\\"19:00\\"],\\"busyTimes\\":[]},{\\"date\\":\\"2023-01-16\\",\\"username\\":\\"\\",\\"freeTimes\\":[\\"13:00\\",\\"15:00\\",\\"18:00\\",\\"19:00\\"],\\"notSelectedTimes\\":[\\"11:00\\",\\"12:00\\",\\"14:00\\",\\"16:00\\",\\"17:00\\"],\\"busyTimes\\":[]}]"	2024-03-02 01:30:42.133+03	2024-03-11 02:56:56.379+03
\.


--
-- Data for Name: tokens; Type: TABLE DATA; Schema: public; Owner: mamedov
--

COPY public.tokens (id, "refreshToken", "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: mamedov
--

COPY public.users (id, email, password, firstname, lastname, patronymic, number, address, sale_sum, discount, "isActivated", "activationLink", role, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Name: busyTimes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mamedov
--

SELECT pg_catalog.setval('public."busyTimes_id_seq"', 8, true);


--
-- Name: records_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mamedov
--

SELECT pg_catalog.setval('public.records_id_seq', 1, true);


--
-- Name: tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mamedov
--

SELECT pg_catalog.setval('public.tokens_id_seq', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mamedov
--

SELECT pg_catalog.setval('public.users_id_seq', 1, false);


--
-- Name: busyTimes busyTimes_pkey; Type: CONSTRAINT; Schema: public; Owner: mamedov
--

ALTER TABLE ONLY public."busyTimes"
    ADD CONSTRAINT "busyTimes_pkey" PRIMARY KEY (id);


--
-- Name: records records_pkey; Type: CONSTRAINT; Schema: public; Owner: mamedov
--

ALTER TABLE ONLY public.records
    ADD CONSTRAINT records_pkey PRIMARY KEY (id);


--
-- Name: tokens tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: mamedov
--

ALTER TABLE ONLY public.tokens
    ADD CONSTRAINT tokens_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: mamedov
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--


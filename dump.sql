--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-0ubuntu0.20.04.1)

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
-- Name: listen; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.listen (
    id integer NOT NULL,
    phrase1 text NOT NULL,
    phrase2 text NOT NULL,
    phrase3 text NOT NULL,
    phrase4 text NOT NULL,
    phrase5 text NOT NULL,
    phrase6 text NOT NULL
);


--
-- Name: listen_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.listen_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: listen_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.listen_id_seq OWNED BY public.listen.id;


--
-- Name: personas; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.personas (
    id integer NOT NULL,
    name text NOT NULL,
    photo text NOT NULL,
    text text NOT NULL,
    listen_id integer NOT NULL,
    think_id integer NOT NULL,
    speak_id integer NOT NULL,
    see_id integer NOT NULL
);


--
-- Name: personas_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.personas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: personas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.personas_id_seq OWNED BY public.personas.id;


--
-- Name: see; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.see (
    id integer NOT NULL,
    phrase1 text NOT NULL,
    phrase2 text NOT NULL,
    phrase3 text NOT NULL,
    phrase4 text NOT NULL,
    phrase5 text NOT NULL,
    phrase6 text NOT NULL
);


--
-- Name: see_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.see_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: see_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.see_id_seq OWNED BY public.see.id;


--
-- Name: sessions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sessions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    token text NOT NULL
);


--
-- Name: sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sessions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sessions_id_seq OWNED BY public.sessions.id;


--
-- Name: speak; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.speak (
    id integer NOT NULL,
    phrase1 text NOT NULL,
    phrase2 text NOT NULL,
    phrase3 text NOT NULL,
    phrase4 text NOT NULL,
    phrase5 text NOT NULL,
    phrase6 text NOT NULL
);


--
-- Name: speak_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.speak_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: speak_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.speak_id_seq OWNED BY public.speak.id;


--
-- Name: think; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.think (
    id integer NOT NULL,
    phrase1 text NOT NULL,
    phrase2 text NOT NULL,
    phrase3 text NOT NULL,
    phrase4 text NOT NULL,
    phrase5 text NOT NULL,
    phrase6 text NOT NULL
);


--
-- Name: think_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.think_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: think_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.think_id_seq OWNED BY public.think.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    company character varying(255),
    "position" character varying(255),
    photo text NOT NULL
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: users_personas; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users_personas (
    id integer NOT NULL,
    user_id integer NOT NULL,
    persona_id integer NOT NULL,
    listen boolean DEFAULT false NOT NULL,
    speak boolean DEFAULT false NOT NULL,
    see boolean DEFAULT false NOT NULL,
    think boolean DEFAULT false NOT NULL
);


--
-- Name: users_personas_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_personas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_personas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_personas_id_seq OWNED BY public.users_personas.id;


--
-- Name: listen id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.listen ALTER COLUMN id SET DEFAULT nextval('public.listen_id_seq'::regclass);


--
-- Name: personas id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.personas ALTER COLUMN id SET DEFAULT nextval('public.personas_id_seq'::regclass);


--
-- Name: see id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.see ALTER COLUMN id SET DEFAULT nextval('public.see_id_seq'::regclass);


--
-- Name: sessions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions ALTER COLUMN id SET DEFAULT nextval('public.sessions_id_seq'::regclass);


--
-- Name: speak id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.speak ALTER COLUMN id SET DEFAULT nextval('public.speak_id_seq'::regclass);


--
-- Name: think id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.think ALTER COLUMN id SET DEFAULT nextval('public.think_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: users_personas id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users_personas ALTER COLUMN id SET DEFAULT nextval('public.users_personas_id_seq'::regclass);


--
-- Data for Name: listen; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: personas; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: see; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.sessions VALUES (1, 3, 'ea57c934-63d6-4652-95f6-84578a53c121');


--
-- Data for Name: speak; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: think; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users VALUES (3, 'Thiago', 'abc@test.com', '$2b$12$Kwl0pHqdMrmOPFiiNJFMnOwOd1DXN4Rm5qTQnlM2y/4UeFJ0PbAc6', 'XP', 'Gerente', 'https://static8.depositphotos.com/1003924/886/i/600/depositphotos_8868243-stock-photo-spectrum-multicolored-eye-macro.jpg');
INSERT INTO public.users VALUES (6, 'Thiago', 'teste@teste.com', '$2b$12$BnjRVjiG0K9DDRJQkO2BbuaQxhGFkT4BZItnyTIYhHv14cc8TDzDe', 'XP', 'Gerente', 'https://static8.depositphotos.com/1003924/886/i/600/depositphotos_8868243-stock-photo-spectrum-multicolored-eye-macro.jpg');
INSERT INTO public.users VALUES (7, 'eU', 'eu@eu.com', '$2b$12$4wXPWSUuhaNS3n6GQ6BEDep6jZL3.O5tA1L86LeEtfnZXAilv7RqG', 'XP', 'Gerente', 'https://static8.depositphotos.com/1003924/886/i/600/depositphotos_8868243-stock-photo-spectrum-multicolored-eye-macro.jpg');
INSERT INTO public.users VALUES (8, 'Gabi', 'gabi@gol.com', '$2b$12$kdpg76mdgkaZl/LuViqHCOFt5izbg7ufu/IMUKLTVXr3LNNysNGAm', 'Itau', 'Gerente', 'https://static8.depositphotos.com/1003924/886/i/600/depositphotos_8868243-stock-photo-spectrum-multicolored-eye-macro.jpg');


--
-- Data for Name: users_personas; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Name: listen_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.listen_id_seq', 1, false);


--
-- Name: personas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.personas_id_seq', 1, false);


--
-- Name: see_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.see_id_seq', 1, false);


--
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sessions_id_seq', 2, true);


--
-- Name: speak_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.speak_id_seq', 1, false);


--
-- Name: think_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.think_id_seq', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 8, true);


--
-- Name: users_personas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_personas_id_seq', 1, false);


--
-- Name: listen listen_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.listen
    ADD CONSTRAINT listen_pk PRIMARY KEY (id);


--
-- Name: personas personas_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.personas
    ADD CONSTRAINT personas_pk PRIMARY KEY (id);


--
-- Name: see see_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.see
    ADD CONSTRAINT see_pk PRIMARY KEY (id);


--
-- Name: sessions sessions_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pk PRIMARY KEY (id);


--
-- Name: speak speak_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.speak
    ADD CONSTRAINT speak_pk PRIMARY KEY (id);


--
-- Name: think think_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.think
    ADD CONSTRAINT think_pk PRIMARY KEY (id);


--
-- Name: users_personas users_personas_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users_personas
    ADD CONSTRAINT users_personas_pk PRIMARY KEY (id);


--
-- Name: users users_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pk PRIMARY KEY (id);


--
-- Name: personas personas_fk0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.personas
    ADD CONSTRAINT personas_fk0 FOREIGN KEY (listen_id) REFERENCES public.listen(id);


--
-- Name: personas personas_fk1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.personas
    ADD CONSTRAINT personas_fk1 FOREIGN KEY (think_id) REFERENCES public.think(id);


--
-- Name: personas personas_fk2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.personas
    ADD CONSTRAINT personas_fk2 FOREIGN KEY (speak_id) REFERENCES public.speak(id);


--
-- Name: personas personas_fk3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.personas
    ADD CONSTRAINT personas_fk3 FOREIGN KEY (see_id) REFERENCES public.see(id);


--
-- Name: sessions sessions_fk0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_fk0 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: users_personas users_personas_fk0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users_personas
    ADD CONSTRAINT users_personas_fk0 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: users_personas users_personas_fk1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users_personas
    ADD CONSTRAINT users_personas_fk1 FOREIGN KEY (persona_id) REFERENCES public.personas(id);


--
-- PostgreSQL database dump complete
--


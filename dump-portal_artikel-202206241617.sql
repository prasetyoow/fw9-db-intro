--
-- PostgreSQL database dump
--

-- Dumped from database version 14.3
-- Dumped by pg_dump version 14.3

-- Started on 2022-06-24 16:17:51

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

DROP DATABASE portal_artikel;
--
-- TOC entry 3361 (class 1262 OID 16449)
-- Name: portal_artikel; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE portal_artikel WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_Indonesia.1252';


ALTER DATABASE portal_artikel OWNER TO postgres;

\connect portal_artikel

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
-- TOC entry 3 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- TOC entry 3362 (class 0 OID 0)
-- Dependencies: 3
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- TOC entry 841 (class 1247 OID 16519)
-- Name: gender; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.gender AS ENUM (
    'pria',
    'wanita'
);


ALTER TYPE public.gender OWNER TO postgres;

--
-- TOC entry 850 (class 1247 OID 16536)
-- Name: gendermanusia; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.gendermanusia AS ENUM (
    'Pria',
    'Wanita'
);


ALTER TYPE public.gendermanusia OWNER TO postgres;

--
-- TOC entry 847 (class 1247 OID 16530)
-- Name: genders; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.genders AS ENUM (
    'pria',
    'wanita'
);


ALTER TYPE public.genders OWNER TO postgres;

--
-- TOC entry 844 (class 1247 OID 16524)
-- Name: kelamin; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.kelamin AS ENUM (
    'pria',
    'wanita'
);


ALTER TYPE public.kelamin OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 214 (class 1259 OID 16463)
-- Name: komentar; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.komentar (
    id integer NOT NULL,
    konten character varying NOT NULL,
    user_id integer NOT NULL,
    postingan_id integer NOT NULL
);


ALTER TABLE public.komentar OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 16462)
-- Name: komentar_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.komentar ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.komentar_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 216 (class 1259 OID 16469)
-- Name: postingan; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.postingan (
    id integer NOT NULL,
    judul character varying NOT NULL,
    waktu_dibuat timestamp without time zone NOT NULL,
    konten text NOT NULL,
    lokasi character varying NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.postingan OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16468)
-- Name: postingan_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.postingan ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.postingan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 212 (class 1259 OID 16457)
-- Name: profile; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.profile (
    id integer NOT NULL,
    gender public.genders NOT NULL,
    no_telp character varying NOT NULL,
    tanggal_lahir date NOT NULL,
    tempat_lahir character varying NOT NULL,
    bio character varying NOT NULL,
    user_id integer NOT NULL,
    saldo double precision NOT NULL
);


ALTER TABLE public.profile OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 16456)
-- Name: profile_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.profile ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.profile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 210 (class 1259 OID 16451)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    nik character varying NOT NULL,
    nama character varying NOT NULL,
    email character varying NOT NULL,
    password character varying NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 16450)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.users ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 3353 (class 0 OID 16463)
-- Dependencies: 214
-- Data for Name: komentar; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.komentar (id, konten, user_id, postingan_id) FROM stdin;
\.


--
-- TOC entry 3355 (class 0 OID 16469)
-- Dependencies: 216
-- Data for Name: postingan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.postingan (id, judul, waktu_dibuat, konten, lokasi, user_id) FROM stdin;
\.


--
-- TOC entry 3351 (class 0 OID 16457)
-- Dependencies: 212
-- Data for Name: profile; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.profile (id, gender, no_telp, tanggal_lahir, tempat_lahir, bio, user_id, saldo) FROM stdin;
\.


--
-- TOC entry 3349 (class 0 OID 16451)
-- Dependencies: 210
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, nik, nama, email, password) FROM stdin;
\.


--
-- TOC entry 3363 (class 0 OID 0)
-- Dependencies: 213
-- Name: komentar_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.komentar_id_seq', 1, false);


--
-- TOC entry 3364 (class 0 OID 0)
-- Dependencies: 215
-- Name: postingan_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.postingan_id_seq', 1, false);


--
-- TOC entry 3365 (class 0 OID 0)
-- Dependencies: 211
-- Name: profile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.profile_id_seq', 1, false);


--
-- TOC entry 3366 (class 0 OID 0)
-- Dependencies: 209
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 1, false);


--
-- TOC entry 3198 (class 2606 OID 16485)
-- Name: komentar komentar_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.komentar
    ADD CONSTRAINT komentar_pk PRIMARY KEY (id);


--
-- TOC entry 3200 (class 2606 OID 16487)
-- Name: komentar komentar_un; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.komentar
    ADD CONSTRAINT komentar_un UNIQUE (user_id, postingan_id);


--
-- TOC entry 3202 (class 2606 OID 16475)
-- Name: postingan postingan_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.postingan
    ADD CONSTRAINT postingan_pk PRIMARY KEY (id);


--
-- TOC entry 3204 (class 2606 OID 16477)
-- Name: postingan postingan_un; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.postingan
    ADD CONSTRAINT postingan_un UNIQUE (user_id);


--
-- TOC entry 3194 (class 2606 OID 16479)
-- Name: profile profile_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profile
    ADD CONSTRAINT profile_pk PRIMARY KEY (id);


--
-- TOC entry 3196 (class 2606 OID 16481)
-- Name: profile profile_un; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profile
    ADD CONSTRAINT profile_un UNIQUE (user_id);


--
-- TOC entry 3192 (class 2606 OID 16483)
-- Name: users users_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pk PRIMARY KEY (id);


--
-- TOC entry 3206 (class 2606 OID 16508)
-- Name: komentar komentar_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.komentar
    ADD CONSTRAINT komentar_fk FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 3207 (class 2606 OID 16513)
-- Name: komentar komentar_fk 2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.komentar
    ADD CONSTRAINT "komentar_fk 2" FOREIGN KEY (postingan_id) REFERENCES public.postingan(id);


--
-- TOC entry 3208 (class 2606 OID 16493)
-- Name: postingan postingan_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.postingan
    ADD CONSTRAINT postingan_fk FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 3205 (class 2606 OID 16488)
-- Name: profile profile_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profile
    ADD CONSTRAINT profile_fk FOREIGN KEY (user_id) REFERENCES public.users(id);


-- Completed on 2022-06-24 16:17:51

--
-- PostgreSQL database dump complete
--


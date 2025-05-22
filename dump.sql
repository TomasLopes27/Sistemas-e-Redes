--
-- PostgreSQL database dump
--

-- Dumped from database version 16.8
-- Dumped by pg_dump version 16.8

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
-- Name: comments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.comments (
    id integer NOT NULL,
    user_id integer,
    concert_id integer,
    content text NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.comments OWNER TO postgres;

--
-- Name: comments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.comments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.comments_id_seq OWNER TO postgres;

--
-- Name: comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.comments_id_seq OWNED BY public.comments.id;


--
-- Name: concerts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.concerts (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    url text NOT NULL,
    artist character varying(255),
    genre character varying(100),
    release_date date,
    image_url text
);


ALTER TABLE public.concerts OWNER TO postgres;

--
-- Name: concerts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.concerts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.concerts_id_seq OWNER TO postgres;

--
-- Name: concerts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.concerts_id_seq OWNED BY public.concerts.id;


--
-- Name: favorites; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.favorites (
    user_id integer NOT NULL,
    concert_id integer NOT NULL
);


ALTER TABLE public.favorites OWNER TO postgres;

--
-- Name: likes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.likes (
    user_id integer NOT NULL,
    concert_id integer NOT NULL
);


ALTER TABLE public.likes OWNER TO postgres;

--
-- Name: reports; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reports (
    id integer NOT NULL,
    user_id integer,
    concert_id integer,
    issue_type character varying(50) NOT NULL,
    description text,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.reports OWNER TO postgres;

--
-- Name: reports_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reports_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.reports_id_seq OWNER TO postgres;

--
-- Name: reports_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reports_id_seq OWNED BY public.reports.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    email character varying(150) NOT NULL,
    password character varying(128) NOT NULL,
    usertype integer,
    isactive boolean DEFAULT true,
    emailverified boolean DEFAULT false,
    profilepicture character varying(150),
    createdon timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    createdby integer,
    updatedon timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updatedby integer,
    version integer DEFAULT 1
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: usertype; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usertype (
    id integer NOT NULL,
    role character varying(100) NOT NULL
);


ALTER TABLE public.usertype OWNER TO postgres;

--
-- Name: usertype_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usertype_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.usertype_id_seq OWNER TO postgres;

--
-- Name: usertype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usertype_id_seq OWNED BY public.usertype.id;


--
-- Name: comments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments ALTER COLUMN id SET DEFAULT nextval('public.comments_id_seq'::regclass);


--
-- Name: concerts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.concerts ALTER COLUMN id SET DEFAULT nextval('public.concerts_id_seq'::regclass);


--
-- Name: reports id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reports ALTER COLUMN id SET DEFAULT nextval('public.reports_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: usertype id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usertype ALTER COLUMN id SET DEFAULT nextval('public.usertype_id_seq'::regclass);


--
-- Data for Name: comments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.comments (id, user_id, concert_id, content, created_at) FROM stdin;
2	6	7308	fantastico	2025-05-20 13:53:36.53874
3	5	7308	uau	2025-05-20 13:54:40.048602
\.


--
-- Data for Name: concerts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.concerts (id, title, url, artist, genre, release_date, image_url) FROM stdin;
7305	Saya Grayy: Tiny Desk Concert	https://www.youtube.com/watch?v=MQBuO2yWsFQ	Saya Gray	NORMAL	2025-03-05	https://i.ytimg.com/vi/MQBuO2yWsFQ/hqdefault.jpg
7306	Abel Selaocoe: Tiny Desk Concert	https://www.youtube.com/watch?v=GhY31ngpnWg	Abel Selaocoe	NORMAL	2025-03-03	https://i.ytimg.com/vi/GhY31ngpnWg/hqdefault.jpg
7307	Marvin Sapp: Tiny Desk Concert	https://www.youtube.com/watch?v=wVbZzgybaJ4	Marvin Sapp	NORMAL	2025-02-28	https://i.ytimg.com/vi/wVbZzgybaJ4/hqdefault.jpg
7308	Igmar Thomas' Revive Big Band: Tiny Desk Concert	https://www.youtube.com/watch?v=5X4z95Fqvf4	Igmar Thomas' Revive Big Band	NORMAL	2025-02-26	https://i.ytimg.com/vi/5X4z95Fqvf4/hqdefault.jpg
7309	Leon Thomas: Tiny Desk Concert	https://www.youtube.com/watch?v=jNnsTNZR2bU	Leon Thomas	NORMAL	2025-02-20	https://i.ytimg.com/vi/jNnsTNZR2bU/hqdefault.jpg
7310	girl in red: Tiny Desk Concert	https://www.youtube.com/watch?v=cXYgdCXkLMc	girl in red	NORMAL	2025-02-11	https://i.ytimg.com/vi/cXYgdCXkLMc/hqdefault.jpg
7311	Yasmin Williams: Tiny Desk Concert	https://www.youtube.com/watch?v=E6-z-Gqd30Q	Yasmin Williams	NORMAL	2025-02-07	https://i.ytimg.com/vi/E6-z-Gqd30Q/hqdefault.jpg
7312	Roberto Fonseca: Tiny Desk Concert	https://www.youtube.com/watch?v=vdph2l0iw74	Roberto Fonseca	NORMAL	2025-02-05	https://i.ytimg.com/vi/vdph2l0iw74/hqdefault.jpg
7313	Braxton Cook: Tiny Desk Concert	https://www.youtube.com/watch?v=l7OtKIZE7tE	Braxton Cook	NORMAL	2025-02-03	https://i.ytimg.com/vi/l7OtKIZE7tE/hqdefault.jpg
7314	Faye Webster: Tiny Desk Concert	https://www.youtube.com/watch?v=1ul9aWg0AQo	Faye Webster	NORMAL	2025-01-31	https://i.ytimg.com/vi/1ul9aWg0AQo/hqdefault.jpg
7315	MJ Lenderman: Tiny Desk Concert	https://www.youtube.com/watch?v=gAY74NyLMGs	MJ Lenderman	NORMAL	2025-01-29	https://i.ytimg.com/vi/gAY74NyLMGs/hqdefault.jpg
7316	Carminho: Tiny Desk Concert	https://www.youtube.com/watch?v=1zdcG5rUY3o	Carminho	NORMAL	2025-01-23	https://i.ytimg.com/vi/1zdcG5rUY3o/hqdefault.jpg
7317	Bilal: Tiny Desk Concert	https://www.youtube.com/watch?v=pePbXflDyRM	Bilal	NORMAL	2025-01-21	https://i.ytimg.com/vi/pePbXflDyRM/hqdefault.jpg
7318	The Red Clay Strays: Tiny Desk Concert	https://www.youtube.com/watch?v=uJ3Pusp6R_s	The Red Clay Strays	NORMAL	2025-01-17	https://i.ytimg.com/vi/uJ3Pusp6R_s/hqdefault.jpg
7319	From The Top: Tiny Desk Concert	https://www.youtube.com/watch?v=KY-27OC0B_0	From The Top	NORMAL	2025-01-15	https://i.ytimg.com/vi/KY-27OC0B_0/hqdefault.jpg
7320	Machel Montano: Tiny Desk Concert	https://www.youtube.com/watch?v=Y1f0WK9lsb0	Machel Montano	NORMAL	2025-01-13	https://i.ytimg.com/vi/Y1f0WK9lsb0/hqdefault.jpg
7321	Isata Kanneh-Mason: Tiny Desk Concert	https://www.youtube.com/watch?v=QFGWCRXkWns	Isata Kanneh-Mason	NORMAL	2025-01-07	https://i.ytimg.com/vi/QFGWCRXkWns/hqdefault.jpg
7322	Sabrina Carpenter: Tiny Desk Concert	https://www.youtube.com/watch?v=BEoGvTlJMyY	Sabrina Carpenter	NORMAL	2024-12-20	https://i.ytimg.com/vi/BEoGvTlJMyY/hqdefault.jpg
7323	Yo Gabba GabbaLand!: Tiny Desk Concert	https://www.youtube.com/watch?v=cHkS0uOfx9k	Yo Gabba GabbaLand!	NORMAL	2024-12-18	https://i.ytimg.com/vi/cHkS0uOfx9k/hqdefault.jpg
7324	Waxahatchee: Tiny Desk Concert	https://www.youtube.com/watch?v=ps1f7p720FA	Waxahatchee	NORMAL	2024-12-16	https://i.ytimg.com/vi/ps1f7p720FA/hqdefault.jpg
7325	Billie Eilish: Tiny Desk Concert	https://www.youtube.com/watch?v=fOAIrUZbOwo	Billie Eilish	NORMAL	2024-12-12	https://i.ytimg.com/vi/fOAIrUZbOwo/hqdefault.jpg
7326	Stereophonic: Tiny Desk Concert	https://www.youtube.com/watch?v=99raT9A1LW8	Stereophonic	NORMAL	2024-12-10	https://i.ytimg.com/vi/99raT9A1LW8/hqdefault.jpg
7327	Doechii: Tiny Desk Concert	https://www.youtube.com/watch?v=-91vymvIH0c	Doechii	NORMAL	2024-12-06	https://i.ytimg.com/vi/-91vymvIH0c/hqdefault.jpg
7328	Old Crow Medicine Show: Tiny Desk Concert	https://www.youtube.com/watch?v=Oxudnq20uRw	Old Crow Medicine Show	NORMAL	2024-12-04	https://i.ytimg.com/vi/Oxudnq20uRw/hqdefault.jpg
7329	Rosie Tucker: Tiny Desk Concert	https://www.youtube.com/watch?v=XyyzwrL4msk	Rosie Tucker	NORMAL	2024-12-02	https://i.ytimg.com/vi/XyyzwrL4msk/hqdefault.jpg
7330	TV On The Radio: Tiny Desk Concert	https://www.youtube.com/watch?v=zi_jOYpeCEM	TV On The Radio	NORMAL	2024-11-27	https://i.ytimg.com/vi/zi_jOYpeCEM/hqdefault.jpg
7331	Teedra Moses: Tiny Desk Concert	https://www.youtube.com/watch?v=iQTErSrzC64	Teedra Moses	NORMAL	2024-11-25	https://i.ytimg.com/vi/iQTErSrzC64/hqdefault.jpg
7332	Wyatt Flores: Tiny Desk Concert	https://www.youtube.com/watch?v=88mdzNcOHj4	Wyatt Flores	NORMAL	2024-11-22	https://i.ytimg.com/vi/88mdzNcOHj4/hqdefault.jpg
7333	The Magnetic Fields: Tiny Desk Concert	https://www.youtube.com/watch?v=wnFQn7GD1rg	The Magnetic Fields	NORMAL	2024-11-20	https://i.ytimg.com/vi/wnFQn7GD1rg/hqdefault.jpg
7334	Durand Jones: Tiny Desk Concert	https://www.youtube.com/watch?v=_Q8N8a7-Qwk	Durand Jones	NORMAL	2024-11-15	https://i.ytimg.com/vi/_Q8N8a7-Qwk/hqdefault.jpg
7335	Yunchan Lim: Tiny Desk Concert	https://www.youtube.com/watch?v=IRQR5foSUSI	Yunchan Lim	NORMAL	2024-11-13	https://i.ytimg.com/vi/IRQR5foSUSI/hqdefault.jpg
7336	Elmiene: Tiny Desk Concert	https://www.youtube.com/watch?v=mV5U5gWJSU4	Elmiene	NORMAL	2024-11-11	https://i.ytimg.com/vi/mV5U5gWJSU4/hqdefault.jpg
7337	LaRussell: Tiny Desk Concert	https://www.youtube.com/watch?v=w40XbPyotj8	LaRussell	NORMAL	2024-11-08	https://i.ytimg.com/vi/w40XbPyotj8/hqdefault.jpg
7338	Koshi Inaba: Tiny Desk Japan	https://www.youtube.com/watch?v=q-ne87XKlY0	Koshi Inaba	NORMAL	2024-11-06	https://i.ytimg.com/vi/q-ne87XKlY0/hqdefault.jpg
7339	Sheer Mag: Tiny Desk Concert	https://www.youtube.com/watch?v=eHMv0tUe5eE	Sheer Mag	NORMAL	2024-11-01	https://i.ytimg.com/vi/eHMv0tUe5eE/hqdefault.jpg
7340	Chelsea Wolfe: Tiny Desk Concert	https://www.youtube.com/watch?v=6Z1rdfucIUU	Chelsea Wolfe	NORMAL	2024-10-30	https://i.ytimg.com/vi/6Z1rdfucIUU/hqdefault.jpg
7341	Sylo: Tiny Desk Concert	https://www.youtube.com/watch?v=57H4UBO6B5k	Sylo	NORMAL	2024-10-28	https://i.ytimg.com/vi/57H4UBO6B5k/hqdefault.jpg
7342	Dua Lipa: Tiny Desk Concert	https://www.youtube.com/watch?v=y38qQRg3UDI	Dua Lipa	NORMAL	2024-10-25	https://i.ytimg.com/vi/y38qQRg3UDI/hqdefault.jpg
7343	The Baylor Project: Tiny Desk Concert	https://www.youtube.com/watch?v=PbM82phaaeg	The Baylor Project	NORMAL	2024-10-23	https://i.ytimg.com/vi/PbM82phaaeg/hqdefault.jpg
7344	Kamasi Washington: Tiny Desk Concert	https://www.youtube.com/watch?v=x8WTPgeVPjg	Kamasi Washington	NORMAL	2024-10-21	https://i.ytimg.com/vi/x8WTPgeVPjg/hqdefault.jpg
7345	Audrey Nuna: Tiny Desk Concert	https://www.youtube.com/watch?v=U0vBoAbZZy0	Audrey Nuna	NORMAL	2024-10-18	https://i.ytimg.com/vi/U0vBoAbZZy0/hqdefault.jpg
7346	John Holiday: Tiny Desk Concert	https://www.youtube.com/watch?v=PYcn36-k7lw	John Holiday	NORMAL	2024-10-16	https://i.ytimg.com/vi/PYcn36-k7lw/hqdefault.jpg
7347	Sheila E.: Tiny Desk Concert	https://www.youtube.com/watch?v=GjZ2XqYzPTI	Sheila E.	NORMAL	2024-10-11	https://i.ytimg.com/vi/GjZ2XqYzPTI/hqdefault.jpg
7348	The Mar├¡as: Tiny Desk Concert	https://www.youtube.com/watch?v=I067BonnW48	The Mar├¡as	NORMAL	2024-10-09	https://i.ytimg.com/vi/I067BonnW48/hqdefault.jpg
7349	Eladio Carrio╠ün: Tiny Desk Concert	https://www.youtube.com/watch?v=s9xYNeiSofM	Eladio Carrio╠ün	NORMAL	2024-10-07	https://i.ytimg.com/vi/s9xYNeiSofM/hqdefault.jpg
7350	Ca7riel & Paco Amoroso: Tiny Desk Concert	https://www.youtube.com/watch?v=9kqnsoY94L8	Ca7riel & Paco Amoroso	NORMAL	2024-10-04	https://i.ytimg.com/vi/9kqnsoY94L8/hqdefault.jpg
7351	Rita Pay├®s: Tiny Desk Concert	https://www.youtube.com/watch?v=ZVEeAxeyAPU	Rita Pay├®s	NORMAL	2024-10-02	https://i.ytimg.com/vi/ZVEeAxeyAPU/hqdefault.jpg
7352	Fabiola M├®ndez: Tiny Desk Concert	https://www.youtube.com/watch?v=1yJjALda0X4	Fabiola M├®ndez	NORMAL	2024-09-30	https://i.ytimg.com/vi/1yJjALda0X4/hqdefault.jpg
7353	Ivan Cornejo: Tiny Desk Concert	https://www.youtube.com/watch?v=vevgI9a18GQ	Ivan Cornejo	NORMAL	2024-09-26	https://i.ytimg.com/vi/vevgI9a18GQ/hqdefault.jpg
7354	OKAN: Tiny Desk Concert	https://www.youtube.com/watch?v=7DSVjIxZBjs	OKAN	NORMAL	2024-09-24	https://i.ytimg.com/vi/7DSVjIxZBjs/hqdefault.jpg
7355	Daniel, Me Est├ís Matando: Tiny Desk Concert	https://www.youtube.com/watch?v=wC6iA_C_KC8	Daniel, Me Est├ís Matando	NORMAL	2024-09-24	https://i.ytimg.com/vi/wC6iA_C_KC8/hqdefault.jpg
7356	Danny Ocean: Tiny Desk Concert	https://www.youtube.com/watch?v=ZfbX3MAnJUM	Danny Ocean	NORMAL	2024-09-24	https://i.ytimg.com/vi/ZfbX3MAnJUM/hqdefault.jpg
7357	Juanes: Tiny Desk Concert	https://www.youtube.com/watch?v=1Pt-nLSMONI	Juanes	NORMAL	2024-09-16	https://i.ytimg.com/vi/1Pt-nLSMONI/hqdefault.jpg
7358	Remi Wolf: Tiny Desk Concert	https://www.youtube.com/watch?v=X_myO7_7KKk	Remi Wolf	NORMAL	2024-09-12	https://i.ytimg.com/vi/X_myO7_7KKk/hqdefault.jpg
7359	Mdou Moctar: Tiny Desk Concert	https://www.youtube.com/watch?v=Pu0GsALW1w8	Mdou Moctar	NORMAL	2024-09-10	https://i.ytimg.com/vi/Pu0GsALW1w8/hqdefault.jpg
7360	Pygmy Lush: Tiny Desk Concert	https://www.youtube.com/watch?v=ranwgb7qkNk	Pygmy Lush	NORMAL	2024-08-30	https://i.ytimg.com/vi/ranwgb7qkNk/hqdefault.jpg
7361	Lainey Wilson: Tiny Desk Concert	https://www.youtube.com/watch?v=3ibSXC3vo8M	Lainey Wilson	NORMAL	2024-08-27	https://i.ytimg.com/vi/3ibSXC3vo8M/hqdefault.jpg
7362	Katy Kirby: Tiny Desk Concert	https://www.youtube.com/watch?v=yQ7E1c2ykeM	Katy Kirby	NORMAL	2024-08-26	https://i.ytimg.com/vi/yQ7E1c2ykeM/hqdefault.jpg
7363	Maxwell: Tiny Desk Concert	https://www.youtube.com/watch?v=Zig0cfRdqsE	Maxwell	NORMAL	2024-08-23	https://i.ytimg.com/vi/Zig0cfRdqsE/hqdefault.jpg
7364	Keyon Harrold: Tiny Desk Concert	https://www.youtube.com/watch?v=ipFtGz0_dAg	Keyon Harrold	NORMAL	2024-08-16	https://i.ytimg.com/vi/ipFtGz0_dAg/hqdefault.jpg
7365	Sierra Ferrell: Tiny Desk Concert	https://www.youtube.com/watch?v=OO6QUgGMp2A	Sierra Ferrell	NORMAL	2024-08-16	https://i.ytimg.com/vi/OO6QUgGMp2A/hqdefault.jpg
7366	Chucho Valde╠üs: Tiny Desk Concert	https://www.youtube.com/watch?v=wlsmFJx5vH0	Chucho Valde╠üs	NORMAL	2024-08-13	https://i.ytimg.com/vi/wlsmFJx5vH0/hqdefault.jpg
7367	DEVO: Tiny Desk Concert	https://www.youtube.com/watch?v=VKvYRDhPt_0	DEVO	NORMAL	2024-08-09	https://i.ytimg.com/vi/VKvYRDhPt_0/hqdefault.jpg
7368	Shae Universe: Tiny Desk Concert	https://www.youtube.com/watch?v=GYmYQvkGlro	Shae Universe	NORMAL	2024-08-06	https://i.ytimg.com/vi/GYmYQvkGlro/hqdefault.jpg
7369	Alana Springsteen: Tiny Desk Concert	https://www.youtube.com/watch?v=cMW779WaDXs	Alana Springsteen	NORMAL	2024-08-05	https://i.ytimg.com/vi/cMW779WaDXs/hqdefault.jpg
7370	The LOX: Tiny Desk Concert	https://www.youtube.com/watch?v=yUBvP_Rj-SY	The LOX	NORMAL	2024-08-02	https://i.ytimg.com/vi/yUBvP_Rj-SY/hqdefault.jpg
7371	Kehlani: Tiny Desk Concert	https://www.youtube.com/watch?v=BIY_lEg8kBA	Kehlani	NORMAL	2024-07-31	https://i.ytimg.com/vi/BIY_lEg8kBA/hqdefault.jpg
7372	Ryan Leslie: Tiny Desk Concert	https://www.youtube.com/watch?v=K8VetbXWbFM	Ryan Leslie	NORMAL	2024-07-26	https://i.ytimg.com/vi/K8VetbXWbFM/hqdefault.jpg
7373	Feist: Tiny Desk Concert	https://www.youtube.com/watch?v=kIBTww3U30M	Feist	NORMAL	2024-07-25	https://i.ytimg.com/vi/kIBTww3U30M/hqdefault.jpg
7374	Norah Jones: Tiny Desk Concert	https://www.youtube.com/watch?v=6jYtRQ2tHGg	Norah Jones	NORMAL	2024-07-25	https://i.ytimg.com/vi/6jYtRQ2tHGg/hqdefault.jpg
7375	├ülvaro D├¡az: Tiny Desk Concert	https://www.youtube.com/watch?v=PCgB07Yy6Xs	├ülvaro D├¡az	NORMAL	2024-07-19	https://i.ytimg.com/vi/PCgB07Yy6Xs/hqdefault.jpg
7376	Phish: Tiny Desk Concert	https://www.youtube.com/watch?v=ad8bvpdoEqE	Phish	NORMAL	2024-07-17	https://i.ytimg.com/vi/ad8bvpdoEqE/hqdefault.jpg
7377	Nathy Peluso: Tiny Desk Concert	https://www.youtube.com/watch?v=_1V_PGElOHs	Nathy Peluso	NORMAL	2024-07-15	https://i.ytimg.com/vi/_1V_PGElOHs/hqdefault.jpg
7378	The Wiz: Tiny Desk Concert	https://www.youtube.com/watch?v=XDNyVy-wGuY	The Wiz	NORMAL	2024-07-12	https://i.ytimg.com/vi/XDNyVy-wGuY/hqdefault.jpg
7379	Julius Rodriguez: Tiny Desk Concert	https://www.youtube.com/watch?v=xjVx3Wcoolo	Julius Rodriguez	NORMAL	2024-07-10	https://i.ytimg.com/vi/xjVx3Wcoolo/hqdefault.jpg
7380	Silvia P├®rez Cruz: Tiny Desk Concert	https://www.youtube.com/watch?v=zoAs0-nXPQM	Silvia P├®rez Cruz	NORMAL	2024-07-09	https://i.ytimg.com/vi/zoAs0-nXPQM/hqdefault.jpg
7381	Mar├¡a Jos├® Llergo: Tiny Desk Concert	https://www.youtube.com/watch?v=v1VLZnBEw_M	Mar├¡a Jos├® Llergo	NORMAL	2024-07-08	https://i.ytimg.com/vi/v1VLZnBEw_M/hqdefault.jpg
7382	Laura Jane Grace & the Mississippi Medicals: Tiny Desk Concert	https://www.youtube.com/watch?v=DYDLYlhvJho	Laura Jane Grace & the Mississippi Medicals	NORMAL	2024-07-03	https://i.ytimg.com/vi/DYDLYlhvJho/hqdefault.jpg
7383	SWV: Tiny Desk Concert	https://www.youtube.com/watch?v=Vrk2Q9AZrYI	SWV	NORMAL	2024-06-28	https://i.ytimg.com/vi/Vrk2Q9AZrYI/hqdefault.jpg
7384	Flo Milli: Tiny Desk Concert	https://www.youtube.com/watch?v=HSzoKlaD9Gs	Flo Milli	NORMAL	2024-06-26	https://i.ytimg.com/vi/HSzoKlaD9Gs/hqdefault.jpg
7385	Brittney Spencer: Tiny Desk Concert	https://www.youtube.com/watch?v=Ov882wRp12Y	Brittney Spencer	NORMAL	2024-06-21	https://i.ytimg.com/vi/Ov882wRp12Y/hqdefault.jpg
7386	Meshell Ndegeocello: Tiny Desk Concert	https://www.youtube.com/watch?v=XBuOd2MzdT4	Meshell Ndegeocello	NORMAL	2024-06-18	https://i.ytimg.com/vi/XBuOd2MzdT4/hqdefault.jpg
7387	Kierra Sheard: Tiny Desk Concert	https://www.youtube.com/watch?v=W9r2i8EjFVw	Kierra Sheard	NORMAL	2024-06-14	https://i.ytimg.com/vi/W9r2i8EjFVw/hqdefault.jpg
7388	Chaka Khan: Tiny Desk Concert	https://www.youtube.com/watch?v=Gse1LKXuV2M	Chaka Khan	NORMAL	2024-06-11	https://i.ytimg.com/vi/Gse1LKXuV2M/hqdefault.jpg
7389	Tierra Whack: Tiny Desk Concert	https://www.youtube.com/watch?v=uRG6IWYVazM	Tierra Whack	NORMAL	2024-06-07	https://i.ytimg.com/vi/uRG6IWYVazM/hqdefault.jpg
7390	Lakecia Benjamin: Tiny Desk Concert	https://www.youtube.com/watch?v=wrm0cN7bTOM	Lakecia Benjamin	NORMAL	2024-06-05	https://i.ytimg.com/vi/wrm0cN7bTOM/hqdefault.jpg
7391	Tems: Tiny Desk Concert	https://www.youtube.com/watch?v=YleSYAEYdrg	Tems	NORMAL	2024-06-03	https://i.ytimg.com/vi/YleSYAEYdrg/hqdefault.jpg
7392	Sean Paul: Tiny Desk Concert	https://www.youtube.com/watch?v=XyHkoKwPtaw	Sean Paul	NORMAL	2024-05-31	https://i.ytimg.com/vi/XyHkoKwPtaw/hqdefault.jpg
7393	The Philharmonik, 2024 Tiny Desk Contest Winner: Tiny Desk Concert	https://www.youtube.com/watch?v=sKHswNFsRww	The Philharmonik, 2024 Tiny Desk Contest Winner	NORMAL	2024-05-29	https://i.ytimg.com/vi/sKHswNFsRww/hqdefault.jpg
7394	Bob James: Tiny Desk Concert	https://www.youtube.com/watch?v=MMS4JAy9z0Y	Bob James	NORMAL	2024-05-27	https://i.ytimg.com/vi/MMS4JAy9z0Y/hqdefault.jpg
7395	Nelly Furtado: Tiny Desk Concert	https://www.youtube.com/watch?v=y-PLr-BPxKU	Nelly Furtado	NORMAL	2024-05-24	https://i.ytimg.com/vi/y-PLr-BPxKU/hqdefault.jpg
7396	The Staves: Tiny Desk Concert	https://www.youtube.com/watch?v=LNFfrhXxJDQ	The Staves	NORMAL	2024-05-23	https://i.ytimg.com/vi/LNFfrhXxJDQ/hqdefault.jpg
7397	Ana Tijoux: Tiny Desk Concert	https://www.youtube.com/watch?v=5G6q__7jQoU	Ana Tijoux	NORMAL	2024-05-22	https://i.ytimg.com/vi/5G6q__7jQoU/hqdefault.jpg
7398	Gary Bartz: Tiny Desk Concert	https://www.youtube.com/watch?v=hdMcKy93AZk	Gary Bartz	NORMAL	2024-05-20	https://i.ytimg.com/vi/hdMcKy93AZk/hqdefault.jpg
7399	Luciana Souza: Tiny Desk Concert	https://www.youtube.com/watch?v=49zIojl1CM4	Luciana Souza	NORMAL	2024-05-17	https://i.ytimg.com/vi/49zIojl1CM4/hqdefault.jpg
7400	Yasser Tejeda: Tiny Desk Concert	https://www.youtube.com/watch?v=tajoGudOj70	Yasser Tejeda	NORMAL	2024-05-15	https://i.ytimg.com/vi/tajoGudOj70/hqdefault.jpg
7401	Kiefer: Tiny Desk Concert	https://www.youtube.com/watch?v=asZZrUFeM_8	Kiefer	NORMAL	2024-05-13	https://i.ytimg.com/vi/asZZrUFeM_8/hqdefault.jpg
7402	Otoboke Beaver: Tiny Desk Concert	https://www.youtube.com/watch?v=wIfg-Ye0FVk	Otoboke Beaver	NORMAL	2024-05-10	https://i.ytimg.com/vi/wIfg-Ye0FVk/hqdefault.jpg
7403	Marty Stuart and His Fabulous Superlatives: Tiny Desk Concert	https://www.youtube.com/watch?v=z2nGMDs65tI	Marty Stuart and His Fabulous Superlatives	NORMAL	2024-05-06	https://i.ytimg.com/vi/z2nGMDs65tI/hqdefault.jpg
7404	WILLOW: Tiny Desk Concert	https://www.youtube.com/watch?v=DmC2QQESN6E	WILLOW	NORMAL	2024-05-01	https://i.ytimg.com/vi/DmC2QQESN6E/hqdefault.jpg
7405	Hot Chip: Tiny Desk Concert	https://www.youtube.com/watch?v=pHWum1ptOxs	Hot Chip	NORMAL	2024-04-29	https://i.ytimg.com/vi/pHWum1ptOxs/hqdefault.jpg
7406	Lise Davidsen: Tiny Desk Concert	https://www.youtube.com/watch?v=TR2hG7ke2YQ	Lise Davidsen	NORMAL	2024-04-26	https://i.ytimg.com/vi/TR2hG7ke2YQ/hqdefault.jpg
7407	Ne-Yo: Tiny Desk Concert	https://www.youtube.com/watch?v=vR6_ZVKEhJ4	Ne-Yo	NORMAL	2024-04-26	https://i.ytimg.com/vi/vR6_ZVKEhJ4/hqdefault.jpg
7408	Hauschka: Tiny Desk Concert	https://www.youtube.com/watch?v=qVh79v4nICo	Hauschka	NORMAL	2024-04-24	https://i.ytimg.com/vi/qVh79v4nICo/hqdefault.jpg
7409	Sleater-Kinney: Tiny Desk Concert	https://www.youtube.com/watch?v=bEyxy8S1MN8	Sleater-Kinney	NORMAL	2024-04-22	https://i.ytimg.com/vi/bEyxy8S1MN8/hqdefault.jpg
7410	Yaya Bey: Tiny Desk Concert	https://www.youtube.com/watch?v=ZYRwNwwFCSk	Yaya Bey	NORMAL	2024-04-17	https://i.ytimg.com/vi/ZYRwNwwFCSk/hqdefault.jpg
7411	Linda May Han Oh: Tiny Desk Concert	https://www.youtube.com/watch?v=RyWGBoU6dc8	Linda May Han Oh	NORMAL	2024-04-15	https://i.ytimg.com/vi/RyWGBoU6dc8/hqdefault.jpg
7412	Fujii Kaze: Tiny Desk Concerts JAPAN	https://www.youtube.com/watch?v=rGyQHyDMZZI	Fujii Kaze	NORMAL	2024-04-12	https://i.ytimg.com/vi/rGyQHyDMZZI/hqdefault.jpg
7413	El Laberinto del Coco: Tiny Desk x globalFEST	https://www.youtube.com/watch?v=R2_7ADO2Hlo	El Laberinto del Coco	NORMAL	2024-04-05	https://i.ytimg.com/vi/R2_7ADO2Hlo/hqdefault.jpg
7414	Tarta Relena: Tiny Desk x globalFEST	https://www.youtube.com/watch?v=3lwoczostI0	Tarta Relena	NORMAL	2024-04-03	https://i.ytimg.com/vi/3lwoczostI0/hqdefault.jpg
7415	Thandiswa Mazwai: Tiny Desk x globalFEST	https://www.youtube.com/watch?v=GR51MWK_o2M	Thandiswa Mazwai	NORMAL	2024-04-01	https://i.ytimg.com/vi/GR51MWK_o2M/hqdefault.jpg
7416	Soul Glo: Tiny Desk Concert	https://www.youtube.com/watch?v=uA5hf_94Ffc	Soul Glo	NORMAL	2024-03-29	https://i.ytimg.com/vi/uA5hf_94Ffc/hqdefault.jpg
7417	V├¡kingur ├ôlafsson: Tiny Desk Concert	https://www.youtube.com/watch?v=-n4BR0vUB80	V├¡kingur ├ôlafsson	NORMAL	2024-03-28	https://i.ytimg.com/vi/-n4BR0vUB80/hqdefault.jpg
7418	Big Sean: Tiny Desk Concert	https://www.youtube.com/watch?v=tPgSPOykA0M	Big Sean	NORMAL	2024-03-27	https://i.ytimg.com/vi/tPgSPOykA0M/hqdefault.jpg
7419	Chappell Roan: Tiny Desk Concert	https://www.youtube.com/watch?v=w4WiXKGCJhg	Chappell Roan	NORMAL	2024-03-21	https://i.ytimg.com/vi/w4WiXKGCJhg/hqdefault.jpg
7420	Jennifer Koh & Missy Mazzoli: Tiny Desk Concert	https://www.youtube.com/watch?v=PxZhSNla0U8	Jennifer Koh & Missy Mazzoli	NORMAL	2024-03-20	https://i.ytimg.com/vi/PxZhSNla0U8/hqdefault.jpg
7421	Justin Timberlake: Tiny Desk Concert	https://www.youtube.com/watch?v=cMIJsoaxRjk	Justin Timberlake	NORMAL	2024-03-15	https://i.ytimg.com/vi/cMIJsoaxRjk/hqdefault.jpg
7422	Squirrel Flower: Tiny Desk Concert	https://www.youtube.com/watch?v=V9h3pk2Nc0Q	Squirrel Flower	NORMAL	2024-03-13	https://i.ytimg.com/vi/V9h3pk2Nc0Q/hqdefault.jpg
7423	311: Tiny Desk Concert	https://www.youtube.com/watch?v=MgTDLlDY_yY	311	NORMAL	2024-03-11	https://i.ytimg.com/vi/MgTDLlDY_yY/hqdefault.jpg
7424	Wednesday: Tiny Desk Concert	https://www.youtube.com/watch?v=TeNMzwoCWSc	Wednesday	NORMAL	2024-03-08	https://i.ytimg.com/vi/TeNMzwoCWSc/hqdefault.jpg
7425	Butcher Brown: Tiny Desk Concert	https://www.youtube.com/watch?v=K8gnt2Zc9aI	Butcher Brown	NORMAL	2024-03-06	https://i.ytimg.com/vi/K8gnt2Zc9aI/hqdefault.jpg
7426	Irreversible Entanglements: Tiny Desk Concert	https://www.youtube.com/watch?v=YKnifgh9dEQ	Irreversible Entanglements	NORMAL	2024-02-26	https://i.ytimg.com/vi/YKnifgh9dEQ/hqdefault.jpg
7427	Kelela: Tiny Desk Concert	https://www.youtube.com/watch?v=3prk1I5ged0	Kelela	NORMAL	2024-02-24	https://i.ytimg.com/vi/3prk1I5ged0/hqdefault.jpg
7428	Cinder Well: Tiny Desk Concert	https://www.youtube.com/watch?v=BgQw-xNsQe8	Cinder Well	NORMAL	2024-02-23	https://i.ytimg.com/vi/BgQw-xNsQe8/hqdefault.jpg
7429	Jeezy: Tiny Desk Concert	https://www.youtube.com/watch?v=c9vtuEH-vfk	Jeezy	NORMAL	2024-02-21	https://i.ytimg.com/vi/c9vtuEH-vfk/hqdefault.jpg
7430	Tinashe: Tiny Desk Concert	https://www.youtube.com/watch?v=1IJjriRrOKg	Tinashe	NORMAL	2024-02-16	https://i.ytimg.com/vi/1IJjriRrOKg/hqdefault.jpg
7431	Berhana: Tiny Desk Concert	https://www.youtube.com/watch?v=h2YdwoZpVgE	Berhana	NORMAL	2024-02-14	https://i.ytimg.com/vi/h2YdwoZpVgE/hqdefault.jpg
7432	Carrtoons: Tiny Desk Concert	https://www.youtube.com/watch?v=yskw0JMXQaM	Carrtoons	NORMAL	2024-02-12	https://i.ytimg.com/vi/yskw0JMXQaM/hqdefault.jpg
7433	Joshua Redman: Tiny Desk Concert	https://www.youtube.com/watch?v=lqBEfjDRDHk	Joshua Redman	NORMAL	2024-02-09	https://i.ytimg.com/vi/lqBEfjDRDHk/hqdefault.jpg
7434	Timo Andres: Tiny Desk Concert	https://www.youtube.com/watch?v=5Zw0K4SlqHQ	Timo Andres	NORMAL	2024-02-07	https://i.ytimg.com/vi/5Zw0K4SlqHQ/hqdefault.jpg
7435	Katie Von Schleicher: Tiny Desk Concert	https://www.youtube.com/watch?v=TGU0-1PBW54	Katie Von Schleicher	NORMAL	2024-02-05	https://i.ytimg.com/vi/TGU0-1PBW54/hqdefault.jpg
7436	Thee Sacred Souls: Tiny Desk Concert	https://www.youtube.com/watch?v=-4J-f5lkCLo	Thee Sacred Souls	NORMAL	2024-02-02	https://i.ytimg.com/vi/-4J-f5lkCLo/hqdefault.jpg
7437	Hania Rani: Tiny Desk Concert	https://www.youtube.com/watch?v=4RcKtr5bGa4	Hania Rani	NORMAL	2024-01-29	https://i.ytimg.com/vi/4RcKtr5bGa4/hqdefault.jpg
7438	BLK ODYSSY: Tiny Desk Concert	https://www.youtube.com/watch?v=_pvzTlmSK0s	BLK ODYSSY	NORMAL	2024-01-25	https://i.ytimg.com/vi/_pvzTlmSK0s/hqdefault.jpg
7439	yMusic: Tiny Desk Concert	https://www.youtube.com/watch?v=fVRccRHfCxM	yMusic	NORMAL	2024-01-19	https://i.ytimg.com/vi/fVRccRHfCxM/hqdefault.jpg
7440	The Japanese House: Tiny Desk Concert	https://www.youtube.com/watch?v=h3gwRr_54cE	The Japanese House	NORMAL	2024-01-18	https://i.ytimg.com/vi/h3gwRr_54cE/hqdefault.jpg
7441	The Good Ones: Tiny Desk Concert	https://www.youtube.com/watch?v=l_P4UjbkSJk	The Good Ones	NORMAL	2024-01-17	https://i.ytimg.com/vi/l_P4UjbkSJk/hqdefault.jpg
7442	Sunny Jain's Wild Wild East: Tiny Desk Concert	https://www.youtube.com/watch?v=zIYIn7yTtTo	Sunny Jain's Wild Wild East	NORMAL	2024-01-12	https://i.ytimg.com/vi/zIYIn7yTtTo/hqdefault.jpg
7443	Kevin Kaarl: Tiny Desk Concert	https://www.youtube.com/watch?v=o4Iv7k0aQoc	Kevin Kaarl	NORMAL	2024-01-08	https://i.ytimg.com/vi/o4Iv7k0aQoc/hqdefault.jpg
7444	Sweeney Todd: Tiny Desk Concert	https://www.youtube.com/watch?v=Dj5Y5VwhfHs	Sweeney Todd	NORMAL	2023-12-22	https://i.ytimg.com/vi/Dj5Y5VwhfHs/hqdefault.jpg
7445	Louis Cato: Tiny Desk Concert	https://www.youtube.com/watch?v=xdOSi8E3FT0	Louis Cato	NORMAL	2023-12-20	https://i.ytimg.com/vi/xdOSi8E3FT0/hqdefault.jpg
7446	Scarface: Tiny Desk Concert	https://www.youtube.com/watch?v=ajNYTJcF6rE	Scarface	NORMAL	2023-12-18	https://i.ytimg.com/vi/ajNYTJcF6rE/hqdefault.jpg
7447	Alvvays: Tiny Desk Concert	https://www.youtube.com/watch?v=RBRQ8vR93_s	Alvvays	NORMAL	2023-12-15	https://i.ytimg.com/vi/RBRQ8vR93_s/hqdefault.jpg
7448	Laufey: Tiny Desk Concert	https://www.youtube.com/watch?v=avjI3_GIZBw	Laufey	NORMAL	2023-12-13	https://i.ytimg.com/vi/avjI3_GIZBw/hqdefault.jpg
7449	Olivia Rodrigo: Tiny Desk Concert	https://www.youtube.com/watch?v=jmh3iruf4RA	Olivia Rodrigo	NORMAL	2023-12-11	https://i.ytimg.com/vi/jmh3iruf4RA/hqdefault.jpg
7450	The LeeVees: Tiny Desk Concert	https://www.youtube.com/watch?v=3hYxLywvjms	The LeeVees	NORMAL	2023-12-07	https://i.ytimg.com/vi/3hYxLywvjms/hqdefault.jpg
7451	Philip Selway: Tiny Desk Concert	https://www.youtube.com/watch?v=x26X-N81wY0	Philip Selway	NORMAL	2023-12-04	https://i.ytimg.com/vi/x26X-N81wY0/hqdefault.jpg
7452	Aja Monet: Tiny Desk Concert	https://www.youtube.com/watch?v=_Y-X9CpSiQ0	Aja Monet	NORMAL	2023-12-01	https://i.ytimg.com/vi/_Y-X9CpSiQ0/hqdefault.jpg
7453	Sampha: Tiny Desk Concert	https://www.youtube.com/watch?v=WyXFfKYbtQU	Sampha	NORMAL	2023-11-29	https://i.ytimg.com/vi/WyXFfKYbtQU/hqdefault.jpg
7454	William Prince: Tiny Desk Concert	https://www.youtube.com/watch?v=fj3tpPKUFaA	William Prince	NORMAL	2023-11-22	https://i.ytimg.com/vi/fj3tpPKUFaA/hqdefault.jpg
7455	Shucked: Tiny Desk Concert	https://www.youtube.com/watch?v=lXd4EmgFozI	Shucked	NORMAL	2023-11-20	https://i.ytimg.com/vi/lXd4EmgFozI/hqdefault.jpg
7456	PJ Harvey: Tiny Desk Concert	https://www.youtube.com/watch?v=pSUgrhmtXIw	PJ Harvey	NORMAL	2023-11-17	https://i.ytimg.com/vi/pSUgrhmtXIw/hqdefault.jpg
7457	Marta Pereira da Costa: Tiny Desk Concert	https://www.youtube.com/watch?v=wzlZ68ts-IU	Marta Pereira da Costa	NORMAL	2023-11-15	https://i.ytimg.com/vi/wzlZ68ts-IU/hqdefault.jpg
7458	Hayden Pedigo: Tiny Desk Concert	https://www.youtube.com/watch?v=Xn5wfH_erZ0	Hayden Pedigo	NORMAL	2023-11-13	https://i.ytimg.com/vi/Xn5wfH_erZ0/hqdefault.jpg
7459	Noname: Tiny Desk Concert	https://www.youtube.com/watch?v=JtCB7vy1q2E	Noname	NORMAL	2023-11-10	https://i.ytimg.com/vi/JtCB7vy1q2E/hqdefault.jpg
7460	Samia: Tiny Desk Concert	https://www.youtube.com/watch?v=lCQAgRoVMCo	Samia	NORMAL	2023-11-08	https://i.ytimg.com/vi/lCQAgRoVMCo/hqdefault.jpg
7461	Emerson String Quartet: Tiny Desk Concert	https://www.youtube.com/watch?v=MQjo5pxpC88	Emerson String Quartet	NORMAL	2023-11-06	https://i.ytimg.com/vi/MQjo5pxpC88/hqdefault.jpg
7462	Conrad Tao And Caleb Teicher: Tiny Desk Concert	https://www.youtube.com/watch?v=61q6JoGLTc0	Conrad Tao And Caleb Teicher	NORMAL	2023-11-03	https://i.ytimg.com/vi/61q6JoGLTc0/hqdefault.jpg
7463	Arlo Parks: Tiny Desk Concert	https://www.youtube.com/watch?v=1acyepjN0OE	Arlo Parks	NORMAL	2023-11-01	https://i.ytimg.com/vi/1acyepjN0OE/hqdefault.jpg
7464	Shakti: Tiny Desk Concert	https://www.youtube.com/watch?v=Cx8AaSvH4EQ	Shakti	NORMAL	2023-10-30	https://i.ytimg.com/vi/Cx8AaSvH4EQ/hqdefault.jpg
7465	Nile Rodgers & CHIC: Tiny Desk Concert	https://www.youtube.com/watch?v=pRERgcQe-fQ	Nile Rodgers & CHIC	NORMAL	2023-10-26	https://i.ytimg.com/vi/pRERgcQe-fQ/hqdefault.jpg
7466	Nora Brown and Stephanie Coleman: Tiny Desk Concert	https://www.youtube.com/watch?v=qj_LkwXiAoM	Nora Brown and Stephanie Coleman	NORMAL	2023-10-24	https://i.ytimg.com/vi/qj_LkwXiAoM/hqdefault.jpg
7467	Jordan Ward: Tiny Desk Concert	https://www.youtube.com/watch?v=RcINbc0ye-o	Jordan Ward	NORMAL	2023-10-23	https://i.ytimg.com/vi/RcINbc0ye-o/hqdefault.jpg
7468	Maluma: Tiny Desk Concert	https://www.youtube.com/watch?v=P_yPDiMN3uk	Maluma	NORMAL	2023-10-20	https://i.ytimg.com/vi/P_yPDiMN3uk/hqdefault.jpg
7469	Smokey Robinson: Tiny Desk Concert	https://www.youtube.com/watch?v=5WG_-0Qh3kc	Smokey Robinson	NORMAL	2023-10-16	https://i.ytimg.com/vi/5WG_-0Qh3kc/hqdefault.jpg
7470	Becky G: Tiny Desk Concert	https://www.youtube.com/watch?v=FftvVi42U4o	Becky G	NORMAL	2023-10-13	https://i.ytimg.com/vi/FftvVi42U4o/hqdefault.jpg
7471	Ivy Queen: Tiny Desk Concert	https://www.youtube.com/watch?v=7EAM4pxxL4Y	Ivy Queen	NORMAL	2023-10-11	https://i.ytimg.com/vi/7EAM4pxxL4Y/hqdefault.jpg
7472	Caroline Polachek: Tiny Desk Concert	https://www.youtube.com/watch?v=JmnZHQNN5cc	Caroline Polachek	NORMAL	2023-10-10	https://i.ytimg.com/vi/JmnZHQNN5cc/hqdefault.jpg
7473	Villano Antillano: Tiny Desk Concert	https://www.youtube.com/watch?v=RxhleZbLF64	Villano Antillano	NORMAL	2023-10-06	https://i.ytimg.com/vi/RxhleZbLF64/hqdefault.jpg
7474	Alex Cuba: Tiny Desk Concert	https://www.youtube.com/watch?v=A3ThZptD8WY	Alex Cuba	NORMAL	2023-10-04	https://i.ytimg.com/vi/A3ThZptD8WY/hqdefault.jpg
7475	Sam Smith: Tiny Desk Concert	https://www.youtube.com/watch?v=L_BHC2l30pY	Sam Smith	NORMAL	2023-09-29	https://i.ytimg.com/vi/L_BHC2l30pY/hqdefault.jpg
7476	DannyLux: Tiny Desk Concert	https://www.youtube.com/watch?v=AynDvSkZ8og	DannyLux	NORMAL	2023-09-27	https://i.ytimg.com/vi/AynDvSkZ8og/hqdefault.jpg
7477	J Noa: Tiny Desk Concert	https://www.youtube.com/watch?v=LwDRLLPuOA4	J Noa	NORMAL	2023-09-22	https://i.ytimg.com/vi/LwDRLLPuOA4/hqdefault.jpg
7478	Wicked: Tiny Desk Concert	https://www.youtube.com/watch?v=AFgWCQZDoCI	Wicked	NORMAL	2023-09-21	https://i.ytimg.com/vi/AFgWCQZDoCI/hqdefault.jpg
7479	Rawayana: Tiny Desk Concert	https://www.youtube.com/watch?v=CbotsXwCbNE	Rawayana	NORMAL	2023-09-19	https://i.ytimg.com/vi/CbotsXwCbNE/hqdefault.jpg
7480	Indigo De Souza: Tiny Desk Concert	https://www.youtube.com/watch?v=k0zSUBzIWhc	Indigo De Souza	NORMAL	2023-09-13	https://i.ytimg.com/vi/k0zSUBzIWhc/hqdefault.jpg
7481	Hiromi: Tiny Desk Concert	https://www.youtube.com/watch?v=pnISpahN2dM	Hiromi	NORMAL	2023-09-08	https://i.ytimg.com/vi/pnISpahN2dM/hqdefault.jpg
7482	Anne Akiko Meyers: Tiny Desk Concert	https://www.youtube.com/watch?v=bRq66Rtwms0	Anne Akiko Meyers	NORMAL	2023-09-07	https://i.ytimg.com/vi/bRq66Rtwms0/hqdefault.jpg
7483	Chl├Âe: Tiny Desk Concert	https://www.youtube.com/watch?v=oIeqO2tyhcY	Chl├Âe	NORMAL	2023-09-05	https://i.ytimg.com/vi/oIeqO2tyhcY/hqdefault.jpg
7484	Speedy Ortiz: Tiny Desk Concert	https://www.youtube.com/watch?v=v-nHyMFnSmI	Speedy Ortiz	NORMAL	2023-08-31	https://i.ytimg.com/vi/v-nHyMFnSmI/hqdefault.jpg
7485	Christian McBride's New Jawn: Tiny Desk Concert	https://www.youtube.com/watch?v=xkWdU-WeGFw	Christian McBride's New Jawn	NORMAL	2023-08-30	https://i.ytimg.com/vi/xkWdU-WeGFw/hqdefault.jpg
7486	Yahritza y Su Esencia: Tiny Desk Concert	https://www.youtube.com/watch?v=jjA7vj3_Htk	Yahritza y Su Esencia	NORMAL	2023-08-24	https://i.ytimg.com/vi/jjA7vj3_Htk/hqdefault.jpg
7487	Sarah Cahill: Tiny Desk Concert	https://www.youtube.com/watch?v=Bm5anO_Yd2s	Sarah Cahill	NORMAL	2023-08-18	https://i.ytimg.com/vi/Bm5anO_Yd2s/hqdefault.jpg
7488	Omar Montes: Tiny Desk Concert	https://www.youtube.com/watch?v=Rmg040Su5R8	Omar Montes	NORMAL	2023-08-17	https://i.ytimg.com/vi/Rmg040Su5R8/hqdefault.jpg
7489	Post Malone: Tiny Desk Concert	https://www.youtube.com/watch?v=oCcks-fwq2c	Post Malone	NORMAL	2023-08-15	https://i.ytimg.com/vi/oCcks-fwq2c/hqdefault.jpg
7490	Little Dragon: Tiny Desk Concert	https://www.youtube.com/watch?v=Lti5hj6dyPc	Little Dragon	NORMAL	2023-08-11	https://i.ytimg.com/vi/Lti5hj6dyPc/hqdefault.jpg
7491	Action Bronson: Tiny Desk Concert	https://www.youtube.com/watch?v=CUN8pdgA0m8	Action Bronson	NORMAL	2023-08-08	https://i.ytimg.com/vi/CUN8pdgA0m8/hqdefault.jpg
7492	Gregorio Uribe: Tiny Desk Concert	https://www.youtube.com/watch?v=O0sUBp7ps8k	Gregorio Uribe	NORMAL	2023-08-04	https://i.ytimg.com/vi/O0sUBp7ps8k/hqdefault.jpg
7493	Obongjayar: Tiny Desk Concert	https://www.youtube.com/watch?v=ILOnnEW2iRg	Obongjayar	NORMAL	2023-08-02	https://i.ytimg.com/vi/ILOnnEW2iRg/hqdefault.jpg
7494	Peter One: Tiny Desk Concert	https://www.youtube.com/watch?v=ptMLdzijCrc	Peter One	NORMAL	2023-07-27	https://i.ytimg.com/vi/ptMLdzijCrc/hqdefault.jpg
7495	Kany Garc├¡a: Tiny Desk Concert	https://www.youtube.com/watch?v=LJdWpAFutYM	Kany Garc├¡a	NORMAL	2023-07-24	https://i.ytimg.com/vi/LJdWpAFutYM/hqdefault.jpg
7496	Cypress Hill: Tiny Desk Concert	https://www.youtube.com/watch?v=tUApO77uUUk	Cypress Hill	NORMAL	2023-07-20	https://i.ytimg.com/vi/tUApO77uUUk/hqdefault.jpg
7497	Sparks: Tiny Desk Concert	https://www.youtube.com/watch?v=YiBVIG9n-d8	Sparks	NORMAL	2023-07-18	https://i.ytimg.com/vi/YiBVIG9n-d8/hqdefault.jpg
7498	GWAR: Tiny Desk Concert	https://www.youtube.com/watch?v=6CNFF0Ql0ME	GWAR	NORMAL	2023-07-17	https://i.ytimg.com/vi/6CNFF0Ql0ME/hqdefault.jpg
7499	Alice Sara Ott: Tiny Desk Concert	https://www.youtube.com/watch?v=-XppUz4SkLk	Alice Sara Ott	NORMAL	2023-07-14	https://i.ytimg.com/vi/-XppUz4SkLk/hqdefault.jpg
7500	MARO: Tiny Desk Concert	https://www.youtube.com/watch?v=btiE3ASfUUE	MARO	NORMAL	2023-07-13	https://i.ytimg.com/vi/btiE3ASfUUE/hqdefault.jpg
7501	Lisa O'Neill: Tiny Desk Concert	https://www.youtube.com/watch?v=1hMxG92KTGE	Lisa O'Neill	NORMAL	2023-07-11	https://i.ytimg.com/vi/1hMxG92KTGE/hqdefault.jpg
7502	Meridian Brothers: Tiny Desk Concert	https://www.youtube.com/watch?v=m9jHZ_pa2PM	Meridian Brothers	NORMAL	2023-07-07	https://i.ytimg.com/vi/m9jHZ_pa2PM/hqdefault.jpg
7503	Omar Sosa & Seckou Keita SUBA Trio: Tiny Desk Concert	https://www.youtube.com/watch?v=KUm6f0QJ_FI	Omar Sosa & Seckou Keita SUBA Trio	NORMAL	2023-07-05	https://i.ytimg.com/vi/KUm6f0QJ_FI/hqdefault.jpg
7504	Juvenile: Tiny Desk Concert	https://www.youtube.com/watch?v=kes2P4IC2bQ	Juvenile	NORMAL	2023-06-30	https://i.ytimg.com/vi/kes2P4IC2bQ/hqdefault.jpg
7505	Brandee Younger: Tiny Desk Concert	https://www.youtube.com/watch?v=lW2cUz9Gz94	Brandee Younger	NORMAL	2023-06-28	https://i.ytimg.com/vi/lW2cUz9Gz94/hqdefault.jpg
7506	Wild Up: Tiny Desk Concert	https://www.youtube.com/watch?v=jhWkvi8OPkc	Wild Up	NORMAL	2023-06-26	https://i.ytimg.com/vi/jhWkvi8OPkc/hqdefault.jpg
7507	MUNA: Tiny Desk Concert	https://www.youtube.com/watch?v=C47H4mOq6Ho	MUNA	NORMAL	2023-06-23	https://i.ytimg.com/vi/C47H4mOq6Ho/hqdefault.jpg
7508	Amaarae: Tiny Desk Concert	https://www.youtube.com/watch?v=gGyP2VGUQMY	Amaarae	NORMAL	2023-06-22	https://i.ytimg.com/vi/gGyP2VGUQMY/hqdefault.jpg
7509	Ambr├®: Tiny Desk Concert	https://www.youtube.com/watch?v=kjJnal0XtN8	Ambr├®	NORMAL	2023-06-20	https://i.ytimg.com/vi/kjJnal0XtN8/hqdefault.jpg
7510	Adam Blackstone: Tiny Desk Concert	https://www.youtube.com/watch?v=1tKE6A3uA64	Adam Blackstone	NORMAL	2023-06-16	https://i.ytimg.com/vi/1tKE6A3uA64/hqdefault.jpg
7511	Tank: Tiny Desk Concert	https://www.youtube.com/watch?v=nmBxJ2VcUk0	Tank	NORMAL	2023-06-14	https://i.ytimg.com/vi/nmBxJ2VcUk0/hqdefault.jpg
7512	Babyface: Tiny Desk Concert	https://www.youtube.com/watch?v=3eHc0Xz_Hio	Babyface	NORMAL	2023-06-09	https://i.ytimg.com/vi/3eHc0Xz_Hio/hqdefault.jpg
7513	Charlie Wilson: Tiny Desk Concert	https://www.youtube.com/watch?v=J3jUEB7qmt8	Charlie Wilson	NORMAL	2023-06-05	https://i.ytimg.com/vi/J3jUEB7qmt8/hqdefault.jpg
7514	Unknown Mortal Orchestra: Tiny Desk Concert	https://www.youtube.com/watch?v=1Wg2huulil4	Unknown Mortal Orchestra	NORMAL	2023-06-02	https://i.ytimg.com/vi/1Wg2huulil4/hqdefault.jpg
7515	NIKI: Tiny Desk Concert	https://www.youtube.com/watch?v=G0ljnXV-q40	NIKI	NORMAL	2023-05-31	https://i.ytimg.com/vi/G0ljnXV-q40/hqdefault.jpg
7516	Little Moon, 2023 Tiny Desk Contest Winner: Tiny Desk Concert	https://www.youtube.com/watch?v=6PgYuit1BXw	Little Moon, 2023 Tiny Desk Contest Winner	NORMAL	2023-05-30	https://i.ytimg.com/vi/6PgYuit1BXw/hqdefault.jpg
7517	Anna Tivel: Tiny Desk Concert	https://www.youtube.com/watch?v=6bALUVyGZh0	Anna Tivel	NORMAL	2023-05-22	https://i.ytimg.com/vi/6bALUVyGZh0/hqdefault.jpg
7518	Kimberly Akimbo: Tiny Desk Concert	https://www.youtube.com/watch?v=ZRThiGArHxQ	Kimberly Akimbo	NORMAL	2023-05-19	https://i.ytimg.com/vi/ZRThiGArHxQ/hqdefault.jpg
7519	Lewis Capaldi: Tiny Desk Concert	https://www.youtube.com/watch?v=e4WrRKSgGI0	Lewis Capaldi	NORMAL	2023-05-17	https://i.ytimg.com/vi/e4WrRKSgGI0/hqdefault.jpg
7520	Karol G: Tiny Desk Concert	https://www.youtube.com/watch?v=D8UWsFMVj_Q	Karol G	NORMAL	2023-05-15	https://i.ytimg.com/vi/D8UWsFMVj_Q/hqdefault.jpg
7521	Arooj Aftab, Vijay Iyer, Shahzad Ismaily: Tiny Desk Concert	https://www.youtube.com/watch?v=z6QNNxCf-3s	Arooj Aftab, Vijay Iyer, Shahzad Ismaily	NORMAL	2023-05-12	https://i.ytimg.com/vi/z6QNNxCf-3s/hqdefault.jpg
7522	Sid Sriram: Tiny Desk Concert	https://www.youtube.com/watch?v=msdmQDNxsfw	Sid Sriram	NORMAL	2023-05-10	https://i.ytimg.com/vi/msdmQDNxsfw/hqdefault.jpg
7523	caroline: Tiny Desk Concert	https://www.youtube.com/watch?v=r_PNkXFdTog	caroline	NORMAL	2023-05-03	https://i.ytimg.com/vi/r_PNkXFdTog/hqdefault.jpg
7524	Kenny Garrett and Sounds From The Ancestors: Tiny Desk Concert	https://www.youtube.com/watch?v=8IcrlAYyA_o	Kenny Garrett and Sounds From The Ancestors	NORMAL	2023-05-02	https://i.ytimg.com/vi/8IcrlAYyA_o/hqdefault.jpg
7525	Cuco: Tiny Desk Concert	https://www.youtube.com/watch?v=oy-4I58Dru0	Cuco	NORMAL	2023-04-28	https://i.ytimg.com/vi/oy-4I58Dru0/hqdefault.jpg
7526	Bill Orcutt Guitar Quartet: Tiny Desk Concert	https://www.youtube.com/watch?v=Tu_PRf1tyjI	Bill Orcutt Guitar Quartet	NORMAL	2023-04-26	https://i.ytimg.com/vi/Tu_PRf1tyjI/hqdefault.jpg
7527	Lara Downes: Tiny Desk Concert	https://www.youtube.com/watch?v=vN7a3xGB0C0	Lara Downes	NORMAL	2023-04-21	https://i.ytimg.com/vi/vN7a3xGB0C0/hqdefault.jpg
7528	Claudia Acu├▒a: Tiny Desk Concert	https://www.youtube.com/watch?v=FCjsmZlwSzA	Claudia Acu├▒a	NORMAL	2023-04-17	https://i.ytimg.com/vi/FCjsmZlwSzA/hqdefault.jpg
7529	RAYE: Tiny Desk Concert	https://www.youtube.com/watch?v=DL1zyUjzwno	RAYE	NORMAL	2023-04-12	https://i.ytimg.com/vi/DL1zyUjzwno/hqdefault.jpg
7530	Fred again..: Tiny Desk Concert	https://www.youtube.com/watch?v=4iQmPv_dTI0	Fred again..	NORMAL	2023-04-10	https://i.ytimg.com/vi/4iQmPv_dTI0/hqdefault.jpg
7531	Trina: Tiny Desk Concert	https://www.youtube.com/watch?v=BvsPwwphxrg	Trina	NORMAL	2023-04-07	https://i.ytimg.com/vi/BvsPwwphxrg/hqdefault.jpg
7532	Kassa Overall: Tiny Desk Concert	https://www.youtube.com/watch?v=0kKct_AKz8s	Kassa Overall	NORMAL	2023-04-05	https://i.ytimg.com/vi/0kKct_AKz8s/hqdefault.jpg
7533	Durand Bernarr: Tiny Desk Concert	https://www.youtube.com/watch?v=klL7nY1HzaY	Durand Bernarr	NORMAL	2023-03-31	https://i.ytimg.com/vi/klL7nY1HzaY/hqdefault.jpg
7534	The Beths: Tiny Desk Concert	https://www.youtube.com/watch?v=vt0J3IEYkIg	The Beths	NORMAL	2023-03-28	https://i.ytimg.com/vi/vt0J3IEYkIg/hqdefault.jpg
7535	Ingrid Andress: Tiny Desk Concert	https://www.youtube.com/watch?v=sovwUwi5SFA	Ingrid Andress	NORMAL	2023-03-22	https://i.ytimg.com/vi/sovwUwi5SFA/hqdefault.jpg
7536	Tye Tribbett: Tiny Desk Concert	https://www.youtube.com/watch?v=tZWZ82Em-Q8	Tye Tribbett	NORMAL	2023-03-20	https://i.ytimg.com/vi/tZWZ82Em-Q8/hqdefault.jpg
7537	Bono and The Edge: Tiny Desk Concert	https://www.youtube.com/watch?v=oxo-loXdcH0	Bono and The Edge	NORMAL	2023-03-17	https://i.ytimg.com/vi/oxo-loXdcH0/hqdefault.jpg
7538	Andrew Combs: Tiny Desk Concert	https://www.youtube.com/watch?v=JsaqhRkKu1M	Andrew Combs	NORMAL	2023-03-15	https://i.ytimg.com/vi/JsaqhRkKu1M/hqdefault.jpg
7539	Selina Moon: Tiny Desk Concert	https://www.youtube.com/watch?v=JZyaHcYEsWM	Selina Moon	NORMAL	2023-03-09	https://i.ytimg.com/vi/JZyaHcYEsWM/hqdefault.jpg
7540	Mama's Broke: Tiny Desk Concert	https://www.youtube.com/watch?v=yeFcUbGW1gA	Mama's Broke	NORMAL	2023-03-08	https://i.ytimg.com/vi/yeFcUbGW1gA/hqdefault.jpg
7541	Jorge Glem and Sam Reider: Tiny Desk Concert	https://www.youtube.com/watch?v=JxEvAHLqryg	Jorge Glem and Sam Reider	NORMAL	2023-03-06	https://i.ytimg.com/vi/JxEvAHLqryg/hqdefault.jpg
7542	Antonio S├ínchez & Bad Hombre: Tiny Desk Concert	https://www.youtube.com/watch?v=Qafq8drD_L4	Antonio S├ínchez & Bad Hombre	NORMAL	2023-03-02	https://i.ytimg.com/vi/Qafq8drD_L4/hqdefault.jpg
7543	Omah Lay: Tiny Desk Concert	https://www.youtube.com/watch?v=DHjczZIxr_0	Omah Lay	NORMAL	2023-02-28	https://i.ytimg.com/vi/DHjczZIxr_0/hqdefault.jpg
7544	Charley Crockett: Tiny Desk Concert	https://www.youtube.com/watch?v=rPVQlQQgPLg	Charley Crockett	NORMAL	2023-02-24	https://i.ytimg.com/vi/rPVQlQQgPLg/hqdefault.jpg
7545	Ab-Soul: Tiny Desk Concert	https://www.youtube.com/watch?v=KgDPEW_ypj8	Ab-Soul	NORMAL	2023-02-23	https://i.ytimg.com/vi/KgDPEW_ypj8/hqdefault.jpg
7546	Tamela Mann: Tiny Desk Concert	https://www.youtube.com/watch?v=B20In-v-nDs	Tamela Mann	NORMAL	2023-02-21	https://i.ytimg.com/vi/B20In-v-nDs/hqdefault.jpg
7547	Theo Croker: Tiny Desk Concert	https://www.youtube.com/watch?v=kbvIoW5-b8E	Theo Croker	NORMAL	2023-02-17	https://i.ytimg.com/vi/kbvIoW5-b8E/hqdefault.jpg
7548	Foushe├®: Tiny Desk Concert	https://www.youtube.com/watch?v=Q7D61-XF3x4	Foushe├®	NORMAL	2023-02-15	https://i.ytimg.com/vi/Q7D61-XF3x4/hqdefault.jpg
7549	Kenny Beats: Tiny Desk Concert	https://www.youtube.com/watch?v=BPRVzA67Dbs	Kenny Beats	NORMAL	2023-02-13	https://i.ytimg.com/vi/BPRVzA67Dbs/hqdefault.jpg
7550	Lee Fields: Tiny Desk Concert	https://www.youtube.com/watch?v=_1_BRqBvvdM	Lee Fields	NORMAL	2023-02-10	https://i.ytimg.com/vi/_1_BRqBvvdM/hqdefault.jpg
7551	Indigo Girls: Tiny Desk Concert	https://www.youtube.com/watch?v=vw-DLcZBfq0	Indigo Girls	NORMAL	2023-02-07	https://i.ytimg.com/vi/vw-DLcZBfq0/hqdefault.jpg
7552	Lady Wray: Tiny Desk Concert	https://www.youtube.com/watch?v=0rXXdE6UFRc	Lady Wray	NORMAL	2023-02-01	https://i.ytimg.com/vi/0rXXdE6UFRc/hqdefault.jpg
7553	Hermanos Guti├®rrez: Tiny Desk Concert	https://www.youtube.com/watch?v=wTqCthvtL8k	Hermanos Guti├®rrez	NORMAL	2023-01-31	https://i.ytimg.com/vi/wTqCthvtL8k/hqdefault.jpg
7554	Soccer Mommy: Tiny Desk Concert	https://www.youtube.com/watch?v=a6_RFp5xlGA	Soccer Mommy	NORMAL	2023-01-18	https://i.ytimg.com/vi/a6_RFp5xlGA/hqdefault.jpg
7555	Marc Andre╠ü Hamelin: Tiny Desk Concert	https://www.youtube.com/watch?v=HlDgW6kU3cM	Marc Andre╠ü Hamelin	NORMAL	2023-01-12	https://i.ytimg.com/vi/HlDgW6kU3cM/hqdefault.jpg
7556	dodie: Tiny Desk Concert	https://www.youtube.com/watch?v=CG3XDu8aAf8	dodie	NORMAL	2023-01-10	https://i.ytimg.com/vi/CG3XDu8aAf8/hqdefault.jpg
7557	Jake Blount: Tiny Desk Concert	https://www.youtube.com/watch?v=uMPFEXq1eSU	Jake Blount	NORMAL	2023-01-06	https://i.ytimg.com/vi/uMPFEXq1eSU/hqdefault.jpg
7558	The Smile: Tiny Desk Concert	https://www.youtube.com/watch?v=Zm1VIGNmPxI	The Smile	NORMAL	2023-01-03	https://i.ytimg.com/vi/Zm1VIGNmPxI/hqdefault.jpg
7559	Westside Boogie: Tiny Desk Concert	https://www.youtube.com/watch?v=N6y5DdEHNYA	Westside Boogie	NORMAL	2022-12-14	https://i.ytimg.com/vi/N6y5DdEHNYA/hqdefault.jpg
7560	The Mavericks: Tiny Desk Concert	https://www.youtube.com/watch?v=M6Rh-CzEo24	The Mavericks	NORMAL	2022-12-12	https://i.ytimg.com/vi/M6Rh-CzEo24/hqdefault.jpg
7561	Eliane Elias: Tiny Desk Concert	https://www.youtube.com/watch?v=PxKHo8kiBG4	Eliane Elias	NORMAL	2022-12-09	https://i.ytimg.com/vi/PxKHo8kiBG4/hqdefault.jpg
7562	Alex G: Tiny Desk Concert	https://www.youtube.com/watch?v=qyPquozbCOQ	Alex G	NORMAL	2022-12-07	https://i.ytimg.com/vi/qyPquozbCOQ/hqdefault.jpg
7563	Stromae: Tiny Desk Concert	https://www.youtube.com/watch?v=6dkDepLX0rk	Stromae	NORMAL	2022-12-05	https://i.ytimg.com/vi/6dkDepLX0rk/hqdefault.jpg
7564	The A's: Tiny Desk Concert	https://www.youtube.com/watch?v=C3Y_thL0juU	The A's	NORMAL	2022-12-01	https://i.ytimg.com/vi/C3Y_thL0juU/hqdefault.jpg
7565	beabadoobee: Tiny Desk Concert	https://www.youtube.com/watch?v=qHNUeBK8k7Q	beabadoobee	NORMAL	2022-11-29	https://i.ytimg.com/vi/qHNUeBK8k7Q/hqdefault.jpg
7566	Santigold: Tiny Desk Concert	https://www.youtube.com/watch?v=IG76Rf28MQA	Santigold	NORMAL	2022-11-21	https://i.ytimg.com/vi/IG76Rf28MQA/hqdefault.jpg
7567	Sheku Kanneh-Mason: Tiny Desk Concert	https://www.youtube.com/watch?v=8Yu6CQcnQ_A	Sheku Kanneh-Mason	NORMAL	2022-11-15	https://i.ytimg.com/vi/8Yu6CQcnQ_A/hqdefault.jpg
7568	The Lion King: Tiny Desk Concert	https://www.youtube.com/watch?v=cx67TnQrqcg	The Lion King	NORMAL	2022-11-11	https://i.ytimg.com/vi/cx67TnQrqcg/hqdefault.jpg
7569	Ezra Collective: Tiny Desk Concert	https://www.youtube.com/watch?v=eAzClkn3zYw	Ezra Collective	NORMAL	2022-11-10	https://i.ytimg.com/vi/eAzClkn3zYw/hqdefault.jpg
7570	Lizzy McAlpine: Tiny Desk Concert	https://www.youtube.com/watch?v=7odxBDg-7JE	Lizzy McAlpine	NORMAL	2022-11-08	https://i.ytimg.com/vi/7odxBDg-7JE/hqdefault.jpg
7571	NoSo: Tiny Desk Concert	https://www.youtube.com/watch?v=u3axBzTe2-I	NoSo	NORMAL	2022-11-04	https://i.ytimg.com/vi/u3axBzTe2-I/hqdefault.jpg
7572	King Princess: Tiny Desk Concert	https://www.youtube.com/watch?v=2PQnfVlRzqE	King Princess	NORMAL	2022-11-02	https://i.ytimg.com/vi/2PQnfVlRzqE/hqdefault.jpg
7573	Symba: Tiny Desk Concert	https://www.youtube.com/watch?v=RKblHbJE1jI	Symba	NORMAL	2022-10-28	https://i.ytimg.com/vi/RKblHbJE1jI/hqdefault.jpg
7574	S.G. Goodman: Tiny Desk Concert	https://www.youtube.com/watch?v=71XmVyRCe4M	S.G. Goodman	NORMAL	2022-10-26	https://i.ytimg.com/vi/71XmVyRCe4M/hqdefault.jpg
7575	The Crossing: Tiny Desk Concert	https://www.youtube.com/watch?v=-vwiDF8pD1c	The Crossing	NORMAL	2022-10-24	https://i.ytimg.com/vi/-vwiDF8pD1c/hqdefault.jpg
7576	Leyla McCalla: Tiny Desk Concert	https://www.youtube.com/watch?v=2aX8svdJjZo	Leyla McCalla	NORMAL	2022-10-20	https://i.ytimg.com/vi/2aX8svdJjZo/hqdefault.jpg
7577	Joyce Wrice: Tiny Desk Concert	https://www.youtube.com/watch?v=4dd7WejIFi8	Joyce Wrice	NORMAL	2022-10-18	https://i.ytimg.com/vi/4dd7WejIFi8/hqdefault.jpg
7578	Farruko: Tiny Desk Concert	https://www.youtube.com/watch?v=xNm2JuN2WLQ	Farruko	NORMAL	2022-10-14	https://i.ytimg.com/vi/xNm2JuN2WLQ/hqdefault.jpg
7579	Tokischa: Tiny Desk Concert	https://www.youtube.com/watch?v=abb3ObvdBus	Tokischa	NORMAL	2022-10-12	https://i.ytimg.com/vi/abb3ObvdBus/hqdefault.jpg
7580	Carla Morrison: Tiny Desk Concert	https://www.youtube.com/watch?v=aKWV7b3j5P0	Carla Morrison	NORMAL	2022-10-07	https://i.ytimg.com/vi/aKWV7b3j5P0/hqdefault.jpg
7581	Jessie Reyez: Tiny Desk Concert	https://www.youtube.com/watch?v=wSl5_RDCfrQ	Jessie Reyez	NORMAL	2022-09-30	https://i.ytimg.com/vi/wSl5_RDCfrQ/hqdefault.jpg
7582	Girl Ultra: Tiny Desk Concert	https://www.youtube.com/watch?v=aQcXSoamCVA	Girl Ultra	NORMAL	2022-09-21	https://i.ytimg.com/vi/aQcXSoamCVA/hqdefault.jpg
7583	Omar Apollo: Tiny Desk Concert	https://www.youtube.com/watch?v=7p78XATPcyg	Omar Apollo	NORMAL	2022-09-15	https://i.ytimg.com/vi/7p78XATPcyg/hqdefault.jpg
7584	Allison Russell: Tiny Desk Concert	https://www.youtube.com/watch?v=Ffs7szmBmCU	Allison Russell	NORMAL	2022-09-15	https://i.ytimg.com/vi/Ffs7szmBmCU/hqdefault.jpg
7585	Ang├®lique Kidjo: Tiny Desk Concert	https://www.youtube.com/watch?v=7rzGNL28Js0	Ang├®lique Kidjo	NORMAL	2022-09-13	https://i.ytimg.com/vi/7rzGNL28Js0/hqdefault.jpg
7586	JID: Tiny Desk Concert	https://www.youtube.com/watch?v=gsaZRcL-OTQ	JID	NORMAL	2022-09-08	https://i.ytimg.com/vi/gsaZRcL-OTQ/hqdefault.jpg
7587	Randall Goosby: Tiny Desk Concert	https://www.youtube.com/watch?v=7io8CSHjN2E	Randall Goosby	NORMAL	2022-09-06	https://i.ytimg.com/vi/7io8CSHjN2E/hqdefault.jpg
7588	Juilliard Jazz Ensemble: Tiny Desk Concert	https://www.youtube.com/watch?v=McpF_s2wXcY	Juilliard Jazz Ensemble	NORMAL	2022-09-02	https://i.ytimg.com/vi/McpF_s2wXcY/hqdefault.jpg
7589	SIX The Musical: Tiny Desk Concert	https://www.youtube.com/watch?v=vkzlU2fDLs8	SIX The Musical	NORMAL	2022-09-01	https://i.ytimg.com/vi/vkzlU2fDLs8/hqdefault.jpg
7590	Isaiah J. Thompson Quartet: Tiny Desk Concert	https://www.youtube.com/watch?v=D9jEMdJGhs0	Isaiah J. Thompson Quartet	NORMAL	2022-08-31	https://i.ytimg.com/vi/D9jEMdJGhs0/hqdefault.jpg
7591	Endea Owens and The Cookout: Tiny Desk Concert	https://www.youtube.com/watch?v=KD3vTmbIZdU	Endea Owens and The Cookout	NORMAL	2022-09-01	https://i.ytimg.com/vi/KD3vTmbIZdU/hqdefault.jpg
7592	ADG7: Tiny Desk Concert	https://www.youtube.com/watch?v=sdaOtnuw-Ew	ADG7	NORMAL	2022-08-19	https://i.ytimg.com/vi/sdaOtnuw-Ew/hqdefault.jpg
7593	Andrew Bird and Iron & Wine: Tiny Desk Concert	https://www.youtube.com/watch?v=WVfbIWC7wmE	Andrew Bird and Iron & Wine	NORMAL	2022-08-12	https://i.ytimg.com/vi/WVfbIWC7wmE/hqdefault.jpg
7594	DOMi & JD BECK: Tiny Desk Concert	https://www.youtube.com/watch?v=ANPbOxaRIO0	DOMi & JD BECK	NORMAL	2022-08-10	https://i.ytimg.com/vi/ANPbOxaRIO0/hqdefault.jpg
7595	Regina Spektor: Tiny Desk Concert	https://www.youtube.com/watch?v=Eq5inG547JA	Regina Spektor	NORMAL	2022-08-05	https://i.ytimg.com/vi/Eq5inG547JA/hqdefault.jpg
7596	Madison Cunningham: Tiny Desk Concert	https://www.youtube.com/watch?v=3944VpVVKCI	Madison Cunningham	NORMAL	2022-08-03	https://i.ytimg.com/vi/3944VpVVKCI/hqdefault.jpg
7597	Pigeon Pit: Tiny Desk Concert	https://www.youtube.com/watch?v=3Wp99TlXu8U	Pigeon Pit	NORMAL	2022-07-28	https://i.ytimg.com/vi/3Wp99TlXu8U/hqdefault.jpg
7598	Mivos Quartet: Tiny Desk Concert	https://www.youtube.com/watch?v=va8ZaKj27Xk	Mivos Quartet	NORMAL	2022-07-19	https://i.ytimg.com/vi/va8ZaKj27Xk/hqdefault.jpg
7599	Ludovico Einaudi: Tiny Desk Concert	https://www.youtube.com/watch?v=2oyZ9OM-neM	Ludovico Einaudi	NORMAL	2022-07-15	https://i.ytimg.com/vi/2oyZ9OM-neM/hqdefault.jpg
7600	Belle and Sebastian: Tiny Desk Concert	https://www.youtube.com/watch?v=NWEqYj3OOoo	Belle and Sebastian	NORMAL	2022-07-08	https://i.ytimg.com/vi/NWEqYj3OOoo/hqdefault.jpg
7601	Essential Voices USA: Tiny Desk Concert	https://www.youtube.com/watch?v=D3XZg82Z52A	Essential Voices USA	NORMAL	2022-07-01	https://i.ytimg.com/vi/D3XZg82Z52A/hqdefault.jpg
7602	Usher: Tiny Desk Concert	https://www.youtube.com/watch?v=up8ODGFWgFg	Usher	NORMAL	2022-06-30	https://i.ytimg.com/vi/up8ODGFWgFg/hqdefault.jpg
7603	Denzel Curry: Tiny Desk Concert	https://www.youtube.com/watch?v=glHqWvkpRqo	Denzel Curry	NORMAL	2022-06-29	https://i.ytimg.com/vi/glHqWvkpRqo/hqdefault.jpg
7604	Maverick City Music: Tiny Desk Concert	https://www.youtube.com/watch?v=QKFjQbCKEgA	Maverick City Music	NORMAL	2022-06-23	https://i.ytimg.com/vi/QKFjQbCKEgA/hqdefault.jpg
7605	Ravyn Lenae: Tiny Desk Concert	https://www.youtube.com/watch?v=KsDT5Wa0hwI	Ravyn Lenae	NORMAL	2022-06-22	https://i.ytimg.com/vi/KsDT5Wa0hwI/hqdefault.jpg
7606	Alisa Amador, 2022 Tiny Desk Contest Winner: Tiny Desk Concert	https://www.youtube.com/watch?v=sN58k8tSFXg	Alisa Amador, 2022 Tiny Desk Contest Winner	NORMAL	2022-05-31	https://i.ytimg.com/vi/sN58k8tSFXg/hqdefault.jpg
7607	Neffy, 2021 Tiny Desk Contest Winner: Tiny Desk Concert	https://www.youtube.com/watch?v=l-JEdcOGuzQ	Neffy, 2021 Tiny Desk Contest Winner	NORMAL	2021-10-27	https://i.ytimg.com/vi/l-JEdcOGuzQ/hqdefault.jpg
7608	Yo La Tengo: NPR Music Tiny Desk Concert From The Archives	https://www.youtube.com/watch?v=dFiytMtU0Mw	Yo La Tengo	NORMAL	2022-10-26	https://i.ytimg.com/vi/dFiytMtU0Mw/hqdefault.jpg
7609	Novalima: NPR Music Tiny Desk Concert From The Archives	https://www.youtube.com/watch?v=aLavBHtwRX4	Novalima	NORMAL	2022-10-24	https://i.ytimg.com/vi/aLavBHtwRX4/hqdefault.jpg
7610	Grouplove: NPR Music Tiny Desk Concert From The Archives	https://www.youtube.com/watch?v=O7VbbXCvtTg	Grouplove	NORMAL	2022-10-24	https://i.ytimg.com/vi/O7VbbXCvtTg/hqdefault.jpg
7611	Julian Lage Trio: NPR Music Tiny Desk Concert From The Archives	https://www.youtube.com/watch?v=GXMRg2snp1g	Julian Lage Trio	NORMAL	2022-10-24	https://i.ytimg.com/vi/GXMRg2snp1g/hqdefault.jpg
7612	The Blind Boys of Alabama: NPR Music Tiny Desk Concert From The Archives	https://www.youtube.com/watch?v=Yu80GEBrYq4	The Blind Boys of Alabama	NORMAL	2022-10-24	https://i.ytimg.com/vi/Yu80GEBrYq4/hqdefault.jpg
7613	Jackie Evancho: NPR Music Tiny Desk Concert From The Archives	https://www.youtube.com/watch?v=Sy4msuC9GI8	Jackie Evancho	NORMAL	2022-10-24	https://i.ytimg.com/vi/Sy4msuC9GI8/hqdefault.jpg
7614	Low: NPR Music Tiny Desk Concert From The Archives	https://www.youtube.com/watch?v=5m06nMHTQ7U	Low	NORMAL	2022-10-24	https://i.ytimg.com/vi/5m06nMHTQ7U/hqdefault.jpg
7615	Future Islands: NPR Music Tiny Desk Concert From The Archives	https://www.youtube.com/watch?v=7IgdpEjO_X8	Future Islands	NORMAL	2022-10-24	https://i.ytimg.com/vi/7IgdpEjO_X8/hqdefault.jpg
7616	Basia Bulat: NPR Music Tiny Desk Concert From The Archives	https://www.youtube.com/watch?v=wh-FnjWFTJQ	Basia Bulat	NORMAL	2022-10-24	https://i.ytimg.com/vi/wh-FnjWFTJQ/hqdefault.jpg
7617	The Ghost Of A Saber Tooth Tiger: NPR Music Tiny Desk Concert From The Archives	https://www.youtube.com/watch?v=DXDwkzM7eMw	The Ghost Of A Saber Tooth Tiger	NORMAL	2022-10-24	https://i.ytimg.com/vi/DXDwkzM7eMw/hqdefault.jpg
7618	Nick Lowe: NPR Music Tiny Desk Concert From The Archives	https://www.youtube.com/watch?v=Ebs6uj2iMEo	Nick Lowe	NORMAL	2022-10-24	https://i.ytimg.com/vi/Ebs6uj2iMEo/hqdefault.jpg
7619	Seu Jorge: NPR Music Tiny Desk Concert From The Archives	https://www.youtube.com/watch?v=2Ws_5-hiqao	Seu Jorge	NORMAL	2022-10-24	https://i.ytimg.com/vi/2Ws_5-hiqao/hqdefault.jpg
7620	Lawrence Arabia: NPR Music Tiny Desk Concert From The Archives	https://www.youtube.com/watch?v=yyVW_j0VjeA	Lawrence Arabia	NORMAL	2022-10-24	https://i.ytimg.com/vi/yyVW_j0VjeA/hqdefault.jpg
7621	Frazey Ford: NPR Music Tiny Desk Concert From The Archives	https://www.youtube.com/watch?v=2M9JPJhu3XA	Frazey Ford	NORMAL	2022-10-24	https://i.ytimg.com/vi/2M9JPJhu3XA/hqdefault.jpg
7622	Mavis Staples: NPR Music Tiny Desk Concert From The Archives	https://www.youtube.com/watch?v=OuCF7BtGrEI	Mavis Staples	NORMAL	2022-10-24	https://i.ytimg.com/vi/OuCF7BtGrEI/hqdefault.jpg
7623	Bela Fleck, Edgar Meyer, Zakir Hussain: NPR Music Tiny Desk Concert From The Archives	https://www.youtube.com/watch?v=X7Z0QEVfR8c	Bela Fleck, Edgar Meyer, Zakir Hussain	NORMAL	2022-10-24	https://i.ytimg.com/vi/X7Z0QEVfR8c/hqdefault.jpg
7624	Jimmy Cliff: NPR Music Tiny Desk Concert From The Archives	https://www.youtube.com/watch?v=QYtIT6J7G10	Jimmy Cliff	NORMAL	2022-10-24	https://i.ytimg.com/vi/QYtIT6J7G10/hqdefault.jpg
7625	Gogol Bordello: NPR Music Tiny Desk Concert From The Archives	https://www.youtube.com/watch?v=IJGh50t6crw	Gogol Bordello	NORMAL	2022-10-24	https://i.ytimg.com/vi/IJGh50t6crw/hqdefault.jpg
7626	Sudan Archives: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=fFUbOnT2gCg	Sudan Archives	NORMAL	2020-06-24	https://i.ytimg.com/vi/fFUbOnT2gCg/hqdefault.jpg
7627	'Weird Al' Yankovic: NPR Music Tiny Desk Concert From The Archives	https://www.youtube.com/watch?v=6v9D1nf1p_Y	'Weird Al' Yankovic	NORMAL	2022-10-24	https://i.ytimg.com/vi/6v9D1nf1p_Y/hqdefault.jpg
7628	Alicia Keys: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=uwUt1fVLb3E	Alicia Keys	NORMAL	2020-06-17	https://i.ytimg.com/vi/uwUt1fVLb3E/hqdefault.jpg
7629	The Rock Bottom Remainders: NPR Music Tiny Desk Concert From The Archives	https://www.youtube.com/watch?v=o0Y3feR_WTw	The Rock Bottom Remainders	NORMAL	2022-10-24	https://i.ytimg.com/vi/o0Y3feR_WTw/hqdefault.jpg
7630	Hadestown: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=XKwDFDDr_VA	Hadestown	NORMAL	2020-06-01	https://i.ytimg.com/vi/XKwDFDDr_VA/hqdefault.jpg
7631	Wire: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=4qSYuOYHR8M	Wire	NORMAL	2020-05-27	https://i.ytimg.com/vi/4qSYuOYHR8M/hqdefault.jpg
7632	Bettye Lavette: NPR Music Tiny Desk Concert From The Archives	https://www.youtube.com/watch?v=k4YOIEg7U-c	Bettye Lavette	NORMAL	2022-10-24	https://i.ytimg.com/vi/k4YOIEg7U-c/hqdefault.jpg
7633	Lankum: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=kCLFShptAIA	Lankum	NORMAL	2020-05-18	https://i.ytimg.com/vi/kCLFShptAIA/hqdefault.jpg
7634	Lionel Loueke: NPR Music Tiny Desk Concert From The Archives	https://www.youtube.com/watch?v=7Wd5s78Lghw	Lionel Loueke	NORMAL	2022-10-24	https://i.ytimg.com/vi/7Wd5s78Lghw/hqdefault.jpg
7635	Frances Quinlan: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=kjXNLLlbnRc	Frances Quinlan	NORMAL	2020-05-13	https://i.ytimg.com/vi/kjXNLLlbnRc/hqdefault.jpg
7636	Augustin Hadelich: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=UGjWvL92_1s	Augustin Hadelich	NORMAL	2020-05-11	https://i.ytimg.com/vi/UGjWvL92_1s/hqdefault.jpg
7637	Jon Batiste: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=ze4xcmBFvaE	Jon Batiste	NORMAL	2020-05-04	https://i.ytimg.com/vi/ze4xcmBFvaE/hqdefault.jpg
7638	Laura Veirs: NPR Music Tiny Desk Concert From The Archives	https://www.youtube.com/watch?v=fym6Yxbmki8	Laura Veirs	NORMAL	2022-10-24	https://i.ytimg.com/vi/fym6Yxbmki8/hqdefault.jpg
7639	Daughter Of Swords: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=tMMowlS-i1s	Daughter Of Swords	NORMAL	2020-04-29	https://i.ytimg.com/vi/tMMowlS-i1s/hqdefault.jpg
7640	Mahan Esfahani: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=YMsTJo9yxGA	Mahan Esfahani	NORMAL	2020-04-28	https://i.ytimg.com/vi/YMsTJo9yxGA/hqdefault.jpg
7641	Abaji: NPR Music Tiny Desk Concert From The Archives	https://www.youtube.com/watch?v=ICBtVbDVinw	Abaji	NORMAL	2022-10-24	https://i.ytimg.com/vi/ICBtVbDVinw/hqdefault.jpg
7642	The Free Nationals Feat. Anderson .Paak, Chronixx & India Shawn: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=y1VKZUg8XZA	The Free Nationals Feat. Anderson .Paak, Chronixx & India Shawn	NORMAL	2020-04-22	https://i.ytimg.com/vi/y1VKZUg8XZA/hqdefault.jpg
7643	Dave Rawlings Machine and Gillian Welch: NPR Music Tiny Desk Concert From The Archives	https://www.youtube.com/watch?v=WR1BUVFToSE	Dave Rawlings Machine and Gillian Welch	NORMAL	2022-10-24	https://i.ytimg.com/vi/WR1BUVFToSE/hqdefault.jpg
7644	Angelica Garcia: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=JQTM86SZW2g	Angelica Garcia	NORMAL	2020-04-15	https://i.ytimg.com/vi/JQTM86SZW2g/hqdefault.jpg
7645	T┼ìth: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=0D0yLOK7z30	T┼ìth	NORMAL	2020-04-13	https://i.ytimg.com/vi/0D0yLOK7z30/hqdefault.jpg
7646	The Low Anthem: NPR Music Tiny Desk From The Archives	https://www.youtube.com/watch?v=UanRDr0m4IU	The Low Anthem	NORMAL	2022-10-24	https://i.ytimg.com/vi/UanRDr0m4IU/hqdefault.jpg
7647	The Lumineers: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=ysdjtyV_DuY	The Lumineers	NORMAL	2020-04-06	https://i.ytimg.com/vi/ysdjtyV_DuY/hqdefault.jpg
7648	Adam Arcuragi: NPR Music Tiny Desk Concert From The Archives	https://www.youtube.com/watch?v=4bE2gmxeeQo	Adam Arcuragi	NORMAL	2022-10-24	https://i.ytimg.com/vi/4bE2gmxeeQo/hqdefault.jpg
7649	Jesca Hoop: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=ahqSpH38xPo	Jesca Hoop	NORMAL	2020-04-03	https://i.ytimg.com/vi/ahqSpH38xPo/hqdefault.jpg
7650	Allen Stone: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=uMEnML6sY5Q	Allen Stone	NORMAL	2020-03-30	https://i.ytimg.com/vi/uMEnML6sY5Q/hqdefault.jpg
7651	The Mountain Goats: NPR Music Tiny Desk Concert From The Archives	https://www.youtube.com/watch?v=y5mhIHW-bL4	The Mountain Goats	NORMAL	2022-10-24	https://i.ytimg.com/vi/y5mhIHW-bL4/hqdefault.jpg
7652	The Black Crowes: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=d0GoWhQgxyQ	The Black Crowes	NORMAL	2020-03-23	https://i.ytimg.com/vi/d0GoWhQgxyQ/hqdefault.jpg
7653	Australian Chamber Orchestra: NPR Music Tiny Desk Concert From The Archives	https://www.youtube.com/watch?v=_1gUaOyE2dA	Australian Chamber Orchestra	NORMAL	2022-10-24	https://i.ytimg.com/vi/_1gUaOyE2dA/hqdefault.jpg
7654	Arthur Moon: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=4iEgxnmXkUU	Arthur Moon	NORMAL	2020-03-20	https://i.ytimg.com/vi/4iEgxnmXkUU/hqdefault.jpg
7655	Rex Orange County: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=Y8xGS9eJQRg	Rex Orange County	NORMAL	2020-03-18	https://i.ytimg.com/vi/Y8xGS9eJQRg/hqdefault.jpg
7656	Harry Styles: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=jIIuzB11dsA	Harry Styles	NORMAL	2020-03-16	https://i.ytimg.com/vi/jIIuzB11dsA/hqdefault.jpg
7657	Bowerbirds: NPR Music Tiny Desk Concert From The Archives	https://www.youtube.com/watch?v=dSAKavA0fbw	Bowerbirds	NORMAL	2022-10-24	https://i.ytimg.com/vi/dSAKavA0fbw/hqdefault.jpg
7658	Chika: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=-vLoM-EqWq8	Chika	NORMAL	2020-03-13	https://i.ytimg.com/vi/-vLoM-EqWq8/hqdefault.jpg
7659	Kirill Gerstein: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=zJferx79YyU	Kirill Gerstein	NORMAL	2020-03-12	https://i.ytimg.com/vi/zJferx79YyU/hqdefault.jpg
7660	Coldplay: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=j82L3pLjb_0	Coldplay	NORMAL	2020-03-12	https://i.ytimg.com/vi/j82L3pLjb_0/hqdefault.jpg
7661	Sondre Lerche: NPR Music Tiny Desk Concerts From The Archives	https://www.youtube.com/watch?v=bepALS8u1zM	Sondre Lerche	NORMAL	2022-10-24	https://i.ytimg.com/vi/bepALS8u1zM/hqdefault.jpg
7662	Taimane: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=tXUCJKto68Q	Taimane	NORMAL	2020-03-06	https://i.ytimg.com/vi/tXUCJKto68Q/hqdefault.jpg
7663	Terri Lyne Carrington + Social Science: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=qreeSgvYH3M	Terri Lyne Carrington + Social Science	NORMAL	2020-03-04	https://i.ytimg.com/vi/qreeSgvYH3M/hqdefault.jpg
7664	Mellotron Variations: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=B7XF3tINSyI	Mellotron Variations	NORMAL	2020-03-03	https://i.ytimg.com/vi/B7XF3tINSyI/hqdefault.jpg
7665	Bob Weir And Wolf Bros: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=4l_gUwdPrNY	Bob Weir And Wolf Bros	NORMAL	2020-03-02	https://i.ytimg.com/vi/4l_gUwdPrNY/hqdefault.jpg
7666	Sarah Siskind: NPR Music Tiny Desk Concert From the Archives	https://www.youtube.com/watch?v=6X1uocXxyQo	Sarah Siskind	NORMAL	2022-10-24	https://i.ytimg.com/vi/6X1uocXxyQo/hqdefault.jpg
7667	Cimafunk: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=auy9DFC2eOE	Cimafunk	NORMAL	2020-02-28	https://i.ytimg.com/vi/auy9DFC2eOE/hqdefault.jpg
7668	Indigo Sparke: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=K5QcBZt_SgY	Indigo Sparke	NORMAL	2020-02-26	https://i.ytimg.com/vi/K5QcBZt_SgY/hqdefault.jpg
7669	Jenny Lewis: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=TZvakUFEu04	Jenny Lewis	NORMAL	2020-02-24	https://i.ytimg.com/vi/TZvakUFEu04/hqdefault.jpg
7670	Maria Taylor: NPR Music Tiny Desk Concert From The Archives	https://www.youtube.com/watch?v=5dqqknz0ERg	Maria Taylor	NORMAL	2022-10-24	https://i.ytimg.com/vi/5dqqknz0ERg/hqdefault.jpg
7671	Chris Dave And The Drumhedz: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=NGv366y_UjQ	Chris Dave And The Drumhedz	NORMAL	2020-02-21	https://i.ytimg.com/vi/NGv366y_UjQ/hqdefault.jpg
7672	Elisapie: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=8XdGbFeuQHY	Elisapie	NORMAL	2020-02-21	https://i.ytimg.com/vi/8XdGbFeuQHY/hqdefault.jpg
7673	Snoh Aalegra: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=Qll7IHN0I4Q	Snoh Aalegra	NORMAL	2020-02-18	https://i.ytimg.com/vi/Qll7IHN0I4Q/hqdefault.jpg
7674	Andrew W.K.: NPR Music Tiny Desk Concert From The Archives	https://www.youtube.com/watch?v=6k7_B07IyCA	Andrew W.K.	NORMAL	2022-10-24	https://i.ytimg.com/vi/6k7_B07IyCA/hqdefault.jpg
7675	Laura Stevenson: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=HA1TBV6bq6k	Laura Stevenson	NORMAL	2020-02-14	https://i.ytimg.com/vi/HA1TBV6bq6k/hqdefault.jpg
7676	Mount Eerie With Julie Doiron: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=ZD87vLBHGWA	Mount Eerie With Julie Doiron	NORMAL	2020-02-12	https://i.ytimg.com/vi/ZD87vLBHGWA/hqdefault.jpg
7677	Baby Rose: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=5iFfh0H9iUM	Baby Rose	NORMAL	2020-02-10	https://i.ytimg.com/vi/5iFfh0H9iUM/hqdefault.jpg
7678	Jonathan Scales Fourchestra: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=qYPQ0EUmbTs	Jonathan Scales Fourchestra	NORMAL	2020-02-07	https://i.ytimg.com/vi/qYPQ0EUmbTs/hqdefault.jpg
7679	Another Sky: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=oi0uBhX9fxI	Another Sky	NORMAL	2020-02-05	https://i.ytimg.com/vi/oi0uBhX9fxI/hqdefault.jpg
7680	SiR: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=WSIb1ViLWDI	SiR	NORMAL	2020-02-04	https://i.ytimg.com/vi/WSIb1ViLWDI/hqdefault.jpg
7681	Rising Appalachia: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=vnQA-A2ZvE8	Rising Appalachia	NORMAL	2020-02-04	https://i.ytimg.com/vi/vnQA-A2ZvE8/hqdefault.jpg
7682	Jimmy Eat World: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=0p-X6zczdPA	Jimmy Eat World	NORMAL	2020-01-29	https://i.ytimg.com/vi/0p-X6zczdPA/hqdefault.jpg
7683	Koffee: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=0Cmzn8BIOdA	Koffee	NORMAL	2020-01-28	https://i.ytimg.com/vi/0Cmzn8BIOdA/hqdefault.jpg
7684	J.S. Ondara: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=0ME1pIEJjdM	J.S. Ondara	NORMAL	2020-01-30	https://i.ytimg.com/vi/0ME1pIEJjdM/hqdefault.jpg
7685	Max Richter: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=oNLDJp83YAQ	Max Richter	NORMAL	2020-01-23	https://i.ytimg.com/vi/oNLDJp83YAQ/hqdefault.jpg
7686	Yola: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=usDb7VDRzeM	Yola	NORMAL	2020-01-17	https://i.ytimg.com/vi/usDb7VDRzeM/hqdefault.jpg
7687	Wale: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=jVyb_yLGrHE	Wale	NORMAL	2020-01-21	https://i.ytimg.com/vi/jVyb_yLGrHE/hqdefault.jpg
7688	Joyce DiDonato: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=x4Al4EM0Ni4	Joyce DiDonato	NORMAL	2020-01-15	https://i.ytimg.com/vi/x4Al4EM0Ni4/hqdefault.jpg
7689	Jordan Rakei: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=JtBmUxz4GsM	Jordan Rakei	NORMAL	2020-01-16	https://i.ytimg.com/vi/JtBmUxz4GsM/hqdefault.jpg
7690	Brownout: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=2DyEjfb5hrA	Brownout	NORMAL	2020-01-10	https://i.ytimg.com/vi/2DyEjfb5hrA/hqdefault.jpg
7691	Bridget Kibbey: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=xaiCqYODMJM	Bridget Kibbey	NORMAL	2020-01-08	https://i.ytimg.com/vi/xaiCqYODMJM/hqdefault.jpg
7692	Spanglish Fly: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=yCCOq36BMe0	Spanglish Fly	NORMAL	2019-12-31	https://i.ytimg.com/vi/yCCOq36BMe0/hqdefault.jpg
7693	Bal├║n: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=YZ2iWUyT_DI	Bal├║n	NORMAL	2019-12-30	https://i.ytimg.com/vi/YZ2iWUyT_DI/hqdefault.jpg
7694	Los Lobos: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=oJxApTsm1YQ	Los Lobos	NORMAL	2019-12-17	https://i.ytimg.com/vi/oJxApTsm1YQ/hqdefault.jpg
7695	Moonchild: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=B_ymY0xG0LI	Moonchild	NORMAL	2019-12-16	https://i.ytimg.com/vi/B_ymY0xG0LI/hqdefault.jpg
7696	The Comet Is Coming: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=gpfpYTmohAk	The Comet Is Coming	NORMAL	2019-12-13	https://i.ytimg.com/vi/gpfpYTmohAk/hqdefault.jpg
7697	Weyes Blood: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=gLMG0AMQn3U	Weyes Blood	NORMAL	2019-12-11	https://i.ytimg.com/vi/gLMG0AMQn3U/hqdefault.jpg
7698	Raveena: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=pre9lE3Wa78	Raveena	NORMAL	2019-12-09	https://i.ytimg.com/vi/pre9lE3Wa78/hqdefault.jpg
7699	Freddie Gibbs And Madlib: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=1alXHOMDBN4	Freddie Gibbs And Madlib	NORMAL	2019-12-06	https://i.ytimg.com/vi/1alXHOMDBN4/hqdefault.jpg
7700	Raphael Saadiq: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=_KKjBeAfdPg	Raphael Saadiq	NORMAL	2019-12-05	https://i.ytimg.com/vi/_KKjBeAfdPg/hqdefault.jpg
7701	Sheryl Crow: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=kCcmk4-FZwY	Sheryl Crow	NORMAL	2019-12-03	https://i.ytimg.com/vi/kCcmk4-FZwY/hqdefault.jpg
7702	Megan Thee Stallion: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=GYJ03MIPoIk	Megan Thee Stallion	NORMAL	2019-11-25	https://i.ytimg.com/vi/GYJ03MIPoIk/hqdefault.jpg
7703	Black Uhuru: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=Qd2Zcj1flw8	Black Uhuru	NORMAL	2019-12-02	https://i.ytimg.com/vi/Qd2Zcj1flw8/hqdefault.jpg
7704	Mereba: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=8An3Mr3Sdzo	Mereba	NORMAL	2019-12-02	https://i.ytimg.com/vi/8An3Mr3Sdzo/hqdefault.jpg
7705	Carly Rae Jepsen: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=NGsgb8m0Yns	Carly Rae Jepsen	NORMAL	2019-11-25	https://i.ytimg.com/vi/NGsgb8m0Yns/hqdefault.jpg
7706	Igor Levit: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=HSyJNWyRZ8Y	Igor Levit	NORMAL	2019-11-22	https://i.ytimg.com/vi/HSyJNWyRZ8Y/hqdefault.jpg
7707	Snarky Puppy: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=vfzu33BfRHE	Snarky Puppy	NORMAL	2019-11-20	https://i.ytimg.com/vi/vfzu33BfRHE/hqdefault.jpg
7708	Leslie Odom Jr.: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=n9O9JC14wEw	Leslie Odom Jr.	NORMAL	2021-06-18	https://i.ytimg.com/vi/n9O9JC14wEw/hqdefault.jpg
7709	Dave: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=s_TgmrNNHXA	Dave	NORMAL	2021-05-21	https://i.ytimg.com/vi/s_TgmrNNHXA/hqdefault.jpg
7710	Rio Mira: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=G1jq_2-l6wA	Rio Mira	NORMAL	2021-11-17	https://i.ytimg.com/vi/G1jq_2-l6wA/hqdefault.jpg
7711	Jovino Santos Neto Trio: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=-kfrmkseMAI	Jovino Santos Neto Trio	NORMAL	2021-11-17	https://i.ytimg.com/vi/-kfrmkseMAI/hqdefault.jpg
7712	Taylor Swift: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=FvVnP8G6ITs	Taylor Swift	NORMAL	2019-10-28	https://i.ytimg.com/vi/FvVnP8G6ITs/hqdefault.jpg
7713	Summer Walker: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=xnS2tbgcTc0	Summer Walker	NORMAL	2022-10-26	https://i.ytimg.com/vi/xnS2tbgcTc0/hqdefault.jpg
7714	Brittany Howard: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=XyW5Zz0w1zg	Brittany Howard	NORMAL	2021-09-24	https://i.ytimg.com/vi/XyW5Zz0w1zg/hqdefault.jpg
7715	Charly Bliss: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=sc6WMuTSP1Q	Charly Bliss	NORMAL	2019-10-09	https://i.ytimg.com/vi/sc6WMuTSP1Q/hqdefault.jpg
7716	Sharon Van Etten: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=eztrJeHyP_8	Sharon Van Etten	NORMAL	2019-10-07	https://i.ytimg.com/vi/eztrJeHyP_8/hqdefault.jpg
7717	Molly Sarl├®: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=L16H-lAhoNs	Molly Sarl├®	NORMAL	2019-10-04	https://i.ytimg.com/vi/L16H-lAhoNs/hqdefault.jpg
7718	Jonas Brothers: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=GrmZKTnlOFw	Jonas Brothers	NORMAL	2019-09-30	https://i.ytimg.com/vi/GrmZKTnlOFw/hqdefault.jpg
7719	Josh Ritter With Amanda Shires And Jason Isbell: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=ShR6wGxzyu4	Josh Ritter With Amanda Shires And Jason Isbell	NORMAL	2019-09-30	https://i.ytimg.com/vi/ShR6wGxzyu4/hqdefault.jpg
7720	Ari Lennox: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=D7Ti9DRLZEU	Ari Lennox	NORMAL	2019-09-25	https://i.ytimg.com/vi/D7Ti9DRLZEU/hqdefault.jpg
7721	Rosanne Cash: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=F0Za2ZHmVNI	Rosanne Cash	NORMAL	2019-09-24	https://i.ytimg.com/vi/F0Za2ZHmVNI/hqdefault.jpg
7722	Y La Bamba: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=au-mBoepJUA	Y La Bamba	NORMAL	2019-09-23	https://i.ytimg.com/vi/au-mBoepJUA/hqdefault.jpg
7723	Nil├╝fer Yanya: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=bWvpvSmD3bM	Nil├╝fer Yanya	NORMAL	2019-09-18	https://i.ytimg.com/vi/bWvpvSmD3bM/hqdefault.jpg
7724	Rhiannon Giddens: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=q0fIdFx3pbY	Rhiannon Giddens	NORMAL	2019-09-16	https://i.ytimg.com/vi/q0fIdFx3pbY/hqdefault.jpg
7725	Come From Away: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=AW_IeElzPDQ	Come From Away	NORMAL	2019-09-11	https://i.ytimg.com/vi/AW_IeElzPDQ/hqdefault.jpg
7726	Damian 'Jr. Gong' Marley: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=id28fCyYgIU	Damian 'Jr. Gong' Marley	NORMAL	2019-09-09	https://i.ytimg.com/vi/id28fCyYgIU/hqdefault.jpg
7727	The Tallest Man On Earth: NPR Music Tiny Desk Concert (2019)	https://www.youtube.com/watch?v=3WWdzDr4f0Q	The Tallest Man On Earth	NORMAL	2019-09-09	https://i.ytimg.com/vi/3WWdzDr4f0Q/hqdefault.jpg
7728	A-WA: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=nbt-fm5DcQ0	A-WA	NORMAL	2019-09-03	https://i.ytimg.com/vi/nbt-fm5DcQ0/hqdefault.jpg
7729	The-Dream: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=7bEu7Q-dLXk	The-Dream	NORMAL	2019-08-30	https://i.ytimg.com/vi/7bEu7Q-dLXk/hqdefault.jpg
7730	Dan Tepfer: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=SaadsrHBygc	Dan Tepfer	NORMAL	2019-08-29	https://i.ytimg.com/vi/SaadsrHBygc/hqdefault.jpg
7731	47SOUL: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=5SVP6oxjWZk	47SOUL	NORMAL	2019-08-26	https://i.ytimg.com/vi/5SVP6oxjWZk/hqdefault.jpg
7732	Mandolin Orange: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=k2QjEgOtCAA	Mandolin Orange	NORMAL	2019-08-23	https://i.ytimg.com/vi/k2QjEgOtCAA/hqdefault.jpg
7733	Nicole Bus: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=5dzTxC_Zbm0	Nicole Bus	NORMAL	2019-08-21	https://i.ytimg.com/vi/5dzTxC_Zbm0/hqdefault.jpg
7734	Tobe Nwigwe: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=V71cl130ARg	Tobe Nwigwe	NORMAL	2019-08-19	https://i.ytimg.com/vi/V71cl130ARg/hqdefault.jpg
7735	Kian Soltani: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=jCJcQUi-ncU	Kian Soltani	NORMAL	2019-08-16	https://i.ytimg.com/vi/jCJcQUi-ncU/hqdefault.jpg
7736	halfÔÇóalive: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=5MZvMEfqxGo	halfÔÇóalive	NORMAL	2019-08-12	https://i.ytimg.com/vi/5MZvMEfqxGo/hqdefault.jpg
7737	Among Authors: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=j0uhEHIU6Sk	Among Authors	NORMAL	2019-08-12	https://i.ytimg.com/vi/j0uhEHIU6Sk/hqdefault.jpg
7738	David Crosby & The Lighthouse Band: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=-ZZYXlJ8-k0	David Crosby & The Lighthouse Band	NORMAL	2019-08-07	https://i.ytimg.com/vi/-ZZYXlJ8-k0/hqdefault.jpg
7739	iLe: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=rZjRU5ElGrk	iLe	NORMAL	2019-08-02	https://i.ytimg.com/vi/rZjRU5ElGrk/hqdefault.jpg
7740	Ty Dolla $ign Pays Tribute To Mac Miller At The Tiny Desk	https://www.youtube.com/watch?v=Mz1ZSoujzcs	Ty Dolla $ign Pays Tribute To Mac Miller At The Tiny Desk	NORMAL	2019-08-07	https://i.ytimg.com/vi/Mz1ZSoujzcs/hqdefault.jpg
7741	Bas: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=m0bOq-sm-m8	Bas	NORMAL	2019-08-05	https://i.ytimg.com/vi/m0bOq-sm-m8/hqdefault.jpg
7742	Lizzo: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=DFiLdByWIDY	Lizzo	NORMAL	2019-07-29	https://i.ytimg.com/vi/DFiLdByWIDY/hqdefault.jpg
7743	Calexico And Iron & Wine: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=lonTMlvxhQA	Calexico And Iron & Wine	NORMAL	2019-08-01	https://i.ytimg.com/vi/lonTMlvxhQA/hqdefault.jpg
7744	Tamino: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=nu5p2DMQGIk	Tamino	NORMAL	2019-07-30	https://i.ytimg.com/vi/nu5p2DMQGIk/hqdefault.jpg
7745	Jacob Collier: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=vPBirt1YhuM	Jacob Collier	NORMAL	2019-07-23	https://i.ytimg.com/vi/vPBirt1YhuM/hqdefault.jpg
7746	Priests: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=kgZ1YRDyohs	Priests	NORMAL	2019-07-23	https://i.ytimg.com/vi/kgZ1YRDyohs/hqdefault.jpg
7747	Masego: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=K6tzeZLjUNE	Masego	NORMAL	2019-07-23	https://i.ytimg.com/vi/K6tzeZLjUNE/hqdefault.jpg
7748	Erin Rae: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=fRAC14k_-_4	Erin Rae	NORMAL	2019-07-12	https://i.ytimg.com/vi/fRAC14k_-_4/hqdefault.jpg
7749	Sting And Shaggy: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=bdneye4pzMw	Sting And Shaggy	NORMAL	2019-07-10	https://i.ytimg.com/vi/bdneye4pzMw/hqdefault.jpg
7750	American Football: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=XjCGI4Sgb7k	American Football	NORMAL	2019-07-08	https://i.ytimg.com/vi/XjCGI4Sgb7k/hqdefault.jpg
7751	Miya Folick: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=McnYR186yMw	Miya Folick	NORMAL	2019-07-08	https://i.ytimg.com/vi/McnYR186yMw/hqdefault.jpg
7752	Saint Sister: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=JNNnk0tdY3w	Saint Sister	NORMAL	2019-07-03	https://i.ytimg.com/vi/JNNnk0tdY3w/hqdefault.jpg
7753	Be More Chill: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=QNtlNvR-5_o	Be More Chill	NORMAL	2019-07-01	https://i.ytimg.com/vi/QNtlNvR-5_o/hqdefault.jpg
7754	Betty Who: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=3AaXv14akQc	Betty Who	NORMAL	2019-06-26	https://i.ytimg.com/vi/3AaXv14akQc/hqdefault.jpg
7755	Tasha Cobbs Leonard: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=dKjvdOzPi7o	Tasha Cobbs Leonard	NORMAL	2019-06-24	https://i.ytimg.com/vi/dKjvdOzPi7o/hqdefault.jpg
7756	Imogen Heap: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=3QtklTXbKUQ	Imogen Heap	NORMAL	2019-06-20	https://i.ytimg.com/vi/3QtklTXbKUQ/hqdefault.jpg
7757	IDLES: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=wMehItNQKAA	IDLES	NORMAL	2019-06-19	https://i.ytimg.com/vi/wMehItNQKAA/hqdefault.jpg
7758	Sesame Street: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=gMp0SlkVU8w	Sesame Street	NORMAL	2019-06-08	https://i.ytimg.com/vi/gMp0SlkVU8w/hqdefault.jpg
7759	Foxing: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=Jo3XEdt1Yhs	Foxing	NORMAL	2019-06-12	https://i.ytimg.com/vi/Jo3XEdt1Yhs/hqdefault.jpg
7760	Tomberlin: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=NyK9DbPzReo	Tomberlin	NORMAL	2019-06-07	https://i.ytimg.com/vi/NyK9DbPzReo/hqdefault.jpg
7761	Quinn Christopherson: NPR Music Tiny Desk Contest Winner 2019	https://www.youtube.com/watch?v=wzyR_MWEGBU	Quinn Christopherson	NORMAL	2019-06-04	https://i.ytimg.com/vi/wzyR_MWEGBU/hqdefault.jpg
7762	LADAMA: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=LIP7efANp0E	LADAMA	NORMAL	2019-05-30	https://i.ytimg.com/vi/LIP7efANp0E/hqdefault.jpg
7763	Lucky Daye: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=nsM_d4eb3XM	Lucky Daye	NORMAL	2019-05-28	https://i.ytimg.com/vi/nsM_d4eb3XM/hqdefault.jpg
7764	Jeremy Dutcher: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=HF6CfGndHH8	Jeremy Dutcher	NORMAL	2019-05-22	https://i.ytimg.com/vi/HF6CfGndHH8/hqdefault.jpg
7765	Magos Herrera and Brooklyn Rider: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=BVnSJ4SL7sI	Magos Herrera and Brooklyn Rider	NORMAL	2019-05-16	https://i.ytimg.com/vi/BVnSJ4SL7sI/hqdefault.jpg
7766	Ensemble Signal Plays Jonny Greenwood: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=jd99SAKuun8	Ensemble Signal Plays Jonny Greenwood	NORMAL	2019-05-18	https://i.ytimg.com/vi/jd99SAKuun8/hqdefault.jpg
7767	Ohmme: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=LB96pjoQrtM	Ohmme	NORMAL	2019-05-13	https://i.ytimg.com/vi/LB96pjoQrtM/hqdefault.jpg
7768	Thou: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=IUVYgCwpv7Y	Thou	NORMAL	2019-05-07	https://i.ytimg.com/vi/IUVYgCwpv7Y/hqdefault.jpg
7769	Laraaji: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=apUE3nAeszw	Laraaji	NORMAL	2019-04-22	https://i.ytimg.com/vi/apUE3nAeszw/hqdefault.jpg
7770	Toro y Moi: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=hYnC7FCsNO8	Toro y Moi	NORMAL	2019-04-22	https://i.ytimg.com/vi/hYnC7FCsNO8/hqdefault.jpg
7771	The Calidore String Quartet: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=ucV-erYqy8U	The Calidore String Quartet	NORMAL	2019-04-22	https://i.ytimg.com/vi/ucV-erYqy8U/hqdefault.jpg
7772	Better Oblivion Community Center: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=j1Yz-NyLV90	Better Oblivion Community Center	NORMAL	2019-04-29	https://i.ytimg.com/vi/j1Yz-NyLV90/hqdefault.jpg
7773	Theodore: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=yNG0ZoWjrJM	Theodore	NORMAL	2019-04-17	https://i.ytimg.com/vi/yNG0ZoWjrJM/hqdefault.jpg
7774	Gary Clark Jr.: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=SjFo6l4c-oc	Gary Clark Jr.	NORMAL	2019-04-16	https://i.ytimg.com/vi/SjFo6l4c-oc/hqdefault.jpg
7775	Karine Polwart Trio: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=qoyc83-56EY	Karine Polwart Trio	NORMAL	2019-04-10	https://i.ytimg.com/vi/qoyc83-56EY/hqdefault.jpg
7776	Georgia Anne Muldrow: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=8Otlu-H_5to	Georgia Anne Muldrow	NORMAL	2019-04-08	https://i.ytimg.com/vi/8Otlu-H_5to/hqdefault.jpg
7777	Courtney Marie Andrews: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=-pRkWrQgTWI	Courtney Marie Andrews	NORMAL	2019-04-03	https://i.ytimg.com/vi/-pRkWrQgTWI/hqdefault.jpg
7778	Weezer: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=t8UKQJZsv4o	Weezer	NORMAL	2019-04-01	https://i.ytimg.com/vi/t8UKQJZsv4o/hqdefault.jpg
7779	Andrea Cruz: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=HN4Mk3LWWC4	Andrea Cruz	NORMAL	2019-03-27	https://i.ytimg.com/vi/HN4Mk3LWWC4/hqdefault.jpg
7780	&More (Chill Moody & Donn T): NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=jxIK19PQngA	&More (Chill Moody & Donn T)	NORMAL	2019-03-25	https://i.ytimg.com/vi/jxIK19PQngA/hqdefault.jpg
7781	Alejandro Escovedo: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=YxUaLKJ_978	Alejandro Escovedo	NORMAL	2019-03-20	https://i.ytimg.com/vi/YxUaLKJ_978/hqdefault.jpg
7782	Nao: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=xdGLK_sOWb0	Nao	NORMAL	2019-03-19	https://i.ytimg.com/vi/xdGLK_sOWb0/hqdefault.jpg
7783	Kaia Kater: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=jmvz0ZdVphg	Kaia Kater	NORMAL	2019-03-14	https://i.ytimg.com/vi/jmvz0ZdVphg/hqdefault.jpg
7784	Leikeli47: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=AB-S8wL-AKY	Leikeli47	NORMAL	2019-03-11	https://i.ytimg.com/vi/AB-S8wL-AKY/hqdefault.jpg
7785	Meg Myers: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=vSMt8qbhu0w	Meg Myers	NORMAL	2019-03-06	https://i.ytimg.com/vi/vSMt8qbhu0w/hqdefault.jpg
7786	Phony Ppl: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=5gP0-sDkFS8	Phony Ppl	NORMAL	2019-03-04	https://i.ytimg.com/vi/5gP0-sDkFS8/hqdefault.jpg
7787	Zaytoven: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=1JuiNySKc1w	Zaytoven	NORMAL	2019-02-28	https://i.ytimg.com/vi/1JuiNySKc1w/hqdefault.jpg
7788	Natalie Prass: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=9pTEygixKGY	Natalie Prass	NORMAL	2019-02-25	https://i.ytimg.com/vi/9pTEygixKGY/hqdefault.jpg
7789	The Pedrito Martinez Group: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=GP3jS_gFs-g	The Pedrito Martinez Group	NORMAL	2019-02-21	https://i.ytimg.com/vi/GP3jS_gFs-g/hqdefault.jpg
7790	Scott Mulvahill: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=HwgV6MJneR8	Scott Mulvahill	NORMAL	2019-02-21	https://i.ytimg.com/vi/HwgV6MJneR8/hqdefault.jpg
7791	Mountain Man: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=wcj2jJOlWls	Mountain Man	NORMAL	2019-02-14	https://i.ytimg.com/vi/wcj2jJOlWls/hqdefault.jpg
7792	Lau Noah: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=o4Abt48WxkA	Lau Noah	NORMAL	2019-02-11	https://i.ytimg.com/vi/o4Abt48WxkA/hqdefault.jpg
7793	Kurt Vile: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=HPpjFtNPnAc	Kurt Vile	NORMAL	2019-02-06	https://i.ytimg.com/vi/HPpjFtNPnAc/hqdefault.jpg
7794	Cat Power: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=BX2bCSoMOOc	Cat Power	NORMAL	2019-02-04	https://i.ytimg.com/vi/BX2bCSoMOOc/hqdefault.jpg
7795	Blood Orange: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=0wZpheK98Gc	Blood Orange	NORMAL	2019-01-30	https://i.ytimg.com/vi/0wZpheK98Gc/hqdefault.jpg
7796	Stella Donnelly: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=pbSvaHuDYKA	Stella Donnelly	NORMAL	2019-01-23	https://i.ytimg.com/vi/pbSvaHuDYKA/hqdefault.jpg
7797	Nate Wood - fOUR: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=HQrZmIm64NM	Nate Wood - fOUR	NORMAL	2019-01-16	https://i.ytimg.com/vi/HQrZmIm64NM/hqdefault.jpg
7798	Aaron Lee Tasjan: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=YSrJ4amfO84	Aaron Lee Tasjan	NORMAL	2019-01-15	https://i.ytimg.com/vi/YSrJ4amfO84/hqdefault.jpg
7799	Carolina Eyck and Clarice Jensen: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=SA09W7orJCE	Carolina Eyck and Clarice Jensen	NORMAL	2019-01-14	https://i.ytimg.com/vi/SA09W7orJCE/hqdefault.jpg
7800	Buddy: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=UU5a8xIiuWc	Buddy	NORMAL	2019-01-10	https://i.ytimg.com/vi/UU5a8xIiuWc/hqdefault.jpg
7801	Miguel Zen├│n feat. Spektral Quartet: Tiny Desk Concert	https://www.youtube.com/watch?v=AxFYZQQdJCg	Miguel Zen├│n feat. Spektral Quartet	NORMAL	2019-01-07	https://i.ytimg.com/vi/AxFYZQQdJCg/hqdefault.jpg
7802	Amy Grant: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=DcnMDkX1PZg	Amy Grant	NORMAL	2018-12-17	https://i.ytimg.com/vi/DcnMDkX1PZg/hqdefault.jpg
7803	Harold Lo╠üpez-Nussa Trio: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=0pzIzOgIGyg	Harold Lo╠üpez-Nussa Trio	NORMAL	2018-12-14	https://i.ytimg.com/vi/0pzIzOgIGyg/hqdefault.jpg
7804	H.E.R.: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=hxxcEzM8r-4	H.E.R.	NORMAL	2018-12-12	https://i.ytimg.com/vi/hxxcEzM8r-4/hqdefault.jpg
7805	Wu-Tang Clan: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=ALUKDkOxVPo	Wu-Tang Clan	NORMAL	2018-12-05	https://i.ytimg.com/vi/ALUKDkOxVPo/hqdefault.jpg
7806	Dirty Projectors: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=cfhzD3QWipU	Dirty Projectors	NORMAL	2022-10-26	https://i.ytimg.com/vi/cfhzD3QWipU/hqdefault.jpg
7807	Joey Alexander: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=_NIFz8wRvMs	Joey Alexander	NORMAL	2018-11-30	https://i.ytimg.com/vi/_NIFz8wRvMs/hqdefault.jpg
7808	The Innocence Mission: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=_RT5tZtCAD0	The Innocence Mission	NORMAL	2018-11-29	https://i.ytimg.com/vi/_RT5tZtCAD0/hqdefault.jpg
7809	dvsn: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=4ORnkWCeplg	dvsn	NORMAL	2018-11-26	https://i.ytimg.com/vi/4ORnkWCeplg/hqdefault.jpg
7810	boygenius: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=OS48Lp34Zic	boygenius	NORMAL	2018-11-26	https://i.ytimg.com/vi/OS48Lp34Zic/hqdefault.jpg
7811	Bernie And The Believers Feat. Essence: Tiny Desk Concert	https://www.youtube.com/watch?v=UPQsEoYHekg	Bernie And The Believers Feat. Essence	NORMAL	2018-11-13	https://i.ytimg.com/vi/UPQsEoYHekg/hqdefault.jpg
7812	Half Waif: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=vGQrBz4YqzI	Half Waif	NORMAL	2018-11-09	https://i.ytimg.com/vi/vGQrBz4YqzI/hqdefault.jpg
7813	Pedro The Lion: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=C3z7edMwGao	Pedro The Lion	NORMAL	2018-11-08	https://i.ytimg.com/vi/C3z7edMwGao/hqdefault.jpg
7814	Nicholas Payton Trio: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=f_dSlxgD2Fo	Nicholas Payton Trio	NORMAL	2018-11-02	https://i.ytimg.com/vi/f_dSlxgD2Fo/hqdefault.jpg
7815	Liniker e os Caramelows: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=tCrLnfwX088	Liniker e os Caramelows	NORMAL	2021-11-12	https://i.ytimg.com/vi/tCrLnfwX088/hqdefault.jpg
7816	Jim James: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=KfDY0eodPMU	Jim James	NORMAL	2018-10-29	https://i.ytimg.com/vi/KfDY0eodPMU/hqdefault.jpg
7817	Cautious Clay: Tiny Desk Concert	https://www.youtube.com/watch?v=VERVVrzLSuo	Cautious Clay	NORMAL	2018-10-24	https://i.ytimg.com/vi/VERVVrzLSuo/hqdefault.jpg
7818	Chromeo: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=UlAa0dc-E4w	Chromeo	NORMAL	2018-10-22	https://i.ytimg.com/vi/UlAa0dc-E4w/hqdefault.jpg
7819	Alfredo Rodr├¡guez Trio: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=qOxCOMtJbC8	Alfredo Rodr├¡guez Trio	NORMAL	2018-10-22	https://i.ytimg.com/vi/qOxCOMtJbC8/hqdefault.jpg
7820	Florence + the Machine: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=EkPrXL-H5Qc	Florence + the Machine	NORMAL	2018-10-16	https://i.ytimg.com/vi/EkPrXL-H5Qc/hqdefault.jpg
7821	Caf├® Tacvba: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=O70s9aV_9_Q	Caf├® Tacvba	NORMAL	2018-10-15	https://i.ytimg.com/vi/O70s9aV_9_Q/hqdefault.jpg
7822	Big Boi: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=BdmgKq4Mw48	Big Boi	NORMAL	2018-10-10	https://i.ytimg.com/vi/BdmgKq4Mw48/hqdefault.jpg
7823	Cory Henry & The Funk Apostles: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=6m0lk3M3_Ts	Cory Henry & The Funk Apostles	NORMAL	2018-10-05	https://i.ytimg.com/vi/6m0lk3M3_Ts/hqdefault.jpg
7824	Saba: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=LTzmjU8aOR4	Saba	NORMAL	2018-10-01	https://i.ytimg.com/vi/LTzmjU8aOR4/hqdefault.jpg
7825	C├®cile McLorin Salvant: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=NkmGue2WQyg	C├®cile McLorin Salvant	NORMAL	2018-09-25	https://i.ytimg.com/vi/NkmGue2WQyg/hqdefault.jpg
7826	Anthony Roth Costanzo: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=ZLqXimltxsg	Anthony Roth Costanzo	NORMAL	2018-09-21	https://i.ytimg.com/vi/ZLqXimltxsg/hqdefault.jpg
7827	Julie Byrne: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=9dc9kbRlwB8	Julie Byrne	NORMAL	2018-09-19	https://i.ytimg.com/vi/9dc9kbRlwB8/hqdefault.jpg
7828	Smif-N-Wessun: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=m_bOjWb0KeI	Smif-N-Wessun	NORMAL	2018-09-17	https://i.ytimg.com/vi/m_bOjWb0KeI/hqdefault.jpg
7829	GoGo Penguin: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=47XlUL6sRow	GoGo Penguin	NORMAL	2018-09-17	https://i.ytimg.com/vi/47XlUL6sRow/hqdefault.jpg
7830	Hobo Johnson and The Lovemakers: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=A8a2EosJIbM	Hobo Johnson and The Lovemakers	NORMAL	2018-09-12	https://i.ytimg.com/vi/A8a2EosJIbM/hqdefault.jpg
7831	Jupiter & Okwess: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=-RnRAtMwOEY	Jupiter & Okwess	NORMAL	2018-09-10	https://i.ytimg.com/vi/-RnRAtMwOEY/hqdefault.jpg
7832	Kalbells: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=l5OBuqmErPI	Kalbells	NORMAL	2018-09-05	https://i.ytimg.com/vi/l5OBuqmErPI/hqdefault.jpg
7833	George Li: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=0b6gSb8ZKX4	George Li	NORMAL	2018-09-04	https://i.ytimg.com/vi/0b6gSb8ZKX4/hqdefault.jpg
7834	Tech N9ne Feat. Krizz Kaliko: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=Y-9ZQCS3Pb0	Tech N9ne Feat. Krizz Kaliko	NORMAL	2018-08-29	https://i.ytimg.com/vi/Y-9ZQCS3Pb0/hqdefault.jpg
7835	T.I.: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=0Oob3oFJ0Ec	T.I.	NORMAL	2018-08-27	https://i.ytimg.com/vi/0Oob3oFJ0Ec/hqdefault.jpg
7836	Dermot Kennedy: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=JYGmDy7o2H0	Dermot Kennedy	NORMAL	2018-08-24	https://i.ytimg.com/vi/JYGmDy7o2H0/hqdefault.jpg
7837	Camp Cope: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=qZkGpj2w0XE	Camp Cope	NORMAL	2022-10-26	https://i.ytimg.com/vi/qZkGpj2w0XE/hqdefault.jpg
7838	Yo-Yo Ma: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=3uiUHvET_jg	Yo-Yo Ma	NORMAL	2018-08-17	https://i.ytimg.com/vi/3uiUHvET_jg/hqdefault.jpg
7839	Erykah Badu: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=4cfmEgpOOZk	Erykah Badu	NORMAL	2018-08-15	https://i.ytimg.com/vi/4cfmEgpOOZk/hqdefault.jpg
7840	Tower of Power: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=IDksWTzZQ2c	Tower of Power	NORMAL	2018-08-13	https://i.ytimg.com/vi/IDksWTzZQ2c/hqdefault.jpg
7841	DAWN: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=S_noXwzjavs	DAWN	NORMAL	2018-08-10	https://i.ytimg.com/vi/S_noXwzjavs/hqdefault.jpg
7842	Haley Heynderickx: Tiny Desk Concert	https://www.youtube.com/watch?v=Mub2i2BoHpM	Haley Heynderickx	NORMAL	2018-08-03	https://i.ytimg.com/vi/Mub2i2BoHpM/hqdefault.jpg
7843	Mac Miller: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=QrR_gm6RqCo	Mac Miller	NORMAL	2018-08-06	https://i.ytimg.com/vi/QrR_gm6RqCo/hqdefault.jpg
7844	Del McCoury Band: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=4kPRyzb9Z44	Del McCoury Band	NORMAL	2018-08-01	https://i.ytimg.com/vi/4kPRyzb9Z44/hqdefault.jpg
7845	Flasher: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=qV3QhRG3KwY	Flasher	NORMAL	2018-07-31	https://i.ytimg.com/vi/qV3QhRG3KwY/hqdefault.jpg
7846	Lalah Hathaway: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=NoPz80SCCg0	Lalah Hathaway	NORMAL	2018-07-25	https://i.ytimg.com/vi/NoPz80SCCg0/hqdefault.jpg
7847	The King's Singers: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=38AYaRYfLqQ	The King's Singers	NORMAL	2018-07-23	https://i.ytimg.com/vi/38AYaRYfLqQ/hqdefault.jpg
7848	├ôlafur Arnalds: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=TpO_8tk6yNQ	├ôlafur Arnalds	NORMAL	2018-07-19	https://i.ytimg.com/vi/TpO_8tk6yNQ/hqdefault.jpg
7849	The Midnight Hour: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=1PYNStp9jY0	The Midnight Hour	NORMAL	2018-07-18	https://i.ytimg.com/vi/1PYNStp9jY0/hqdefault.jpg
7850	Mumu Fresh Feat. Black Thought & DJ Dummy: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=ivR988qCPik	Mumu Fresh Feat. Black Thought & DJ Dummy	NORMAL	2018-07-11	https://i.ytimg.com/vi/ivR988qCPik/hqdefault.jpg
7851	Rev. Sekou And The Seal Breakers: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=4Majbw74o1I	Rev. Sekou And The Seal Breakers	NORMAL	2018-07-10	https://i.ytimg.com/vi/4Majbw74o1I/hqdefault.jpg
7852	Fr├®d├®ric Yonnet With Special Guest Dave Chappelle: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=qMMO4xhe-xA	Fr├®d├®ric Yonnet With Special Guest Dave Chappelle	NORMAL	2018-07-09	https://i.ytimg.com/vi/qMMO4xhe-xA/hqdefault.jpg
7853	PJ Morton: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=SZxnLj2cSzY	PJ Morton	NORMAL	2018-07-02	https://i.ytimg.com/vi/SZxnLj2cSzY/hqdefault.jpg
7854	Golden Dawn Arkestra: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=yVoa4sxIqGs	Golden Dawn Arkestra	NORMAL	2018-06-29	https://i.ytimg.com/vi/yVoa4sxIqGs/hqdefault.jpg
7855	Rakim: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=iU0_cYjm8HE	Rakim	NORMAL	2018-06-28	https://i.ytimg.com/vi/iU0_cYjm8HE/hqdefault.jpg
7856	Dave Matthews: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=ieoiAeL-uow	Dave Matthews	NORMAL	2018-06-27	https://i.ytimg.com/vi/ieoiAeL-uow/hqdefault.jpg
7857	From The Top: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=Q5kvsLnHJDY	From The Top	NORMAL	2018-06-22	https://i.ytimg.com/vi/Q5kvsLnHJDY/hqdefault.jpg
7858	The Messthetics: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=86LSRQUrCjw	The Messthetics	NORMAL	2018-06-20	https://i.ytimg.com/vi/86LSRQUrCjw/hqdefault.jpg
7859	Yissy Garc├¡a & Bandancha: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=Y1Kv_sFZHqI	Yissy Garc├¡a & Bandancha	NORMAL	2018-06-18	https://i.ytimg.com/vi/Y1Kv_sFZHqI/hqdefault.jpg
7860	Khalid: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=19dIwTQk0GU	Khalid	NORMAL	2018-06-18	https://i.ytimg.com/vi/19dIwTQk0GU/hqdefault.jpg
7861	GoldLink: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=B76B_akQJuM	GoldLink	NORMAL	2018-06-13	https://i.ytimg.com/vi/B76B_akQJuM/hqdefault.jpg
7862	MILCK: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=9C55DOhatXc	MILCK	NORMAL	2018-06-08	https://i.ytimg.com/vi/9C55DOhatXc/hqdefault.jpg
7863	Jorja Smith: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=yXrlhebkpIQ	Jorja Smith	NORMAL	2018-06-12	https://i.ytimg.com/vi/yXrlhebkpIQ/hqdefault.jpg
7864	Grace VanderWaal: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=SBziTI8VfAQ	Grace VanderWaal	NORMAL	2018-06-06	https://i.ytimg.com/vi/SBziTI8VfAQ/hqdefault.jpg
7865	Daniel Caesar: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=PBKa-AAy_vo	Daniel Caesar	NORMAL	2018-06-04	https://i.ytimg.com/vi/PBKa-AAy_vo/hqdefault.jpg
7866	Tom Misch: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=IUMTaAQ43lY	Tom Misch	NORMAL	2018-06-01	https://i.ytimg.com/vi/IUMTaAQ43lY/hqdefault.jpg
7867	Trouble Funk: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=592crJUBgGc	Trouble Funk	NORMAL	2018-05-30	https://i.ytimg.com/vi/592crJUBgGc/hqdefault.jpg
7868	Third Coast Percussion: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=9QT_A0HHjUA	Third Coast Percussion	NORMAL	2018-05-30	https://i.ytimg.com/vi/9QT_A0HHjUA/hqdefault.jpg
7869	Ill Camille: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=OXPfeg09IOE	Ill Camille	NORMAL	2018-05-30	https://i.ytimg.com/vi/OXPfeg09IOE/hqdefault.jpg
7870	Juanes & Mon Laferte: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=aWjihS2LHLs	Juanes & Mon Laferte	NORMAL	2018-05-30	https://i.ytimg.com/vi/aWjihS2LHLs/hqdefault.jpg
7871	The Band's Visit: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=sWlclUJhJx8	The Band's Visit	NORMAL	2018-05-21	https://i.ytimg.com/vi/sWlclUJhJx8/hqdefault.jpg
7872	Khruangbin: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=vWLJeqLPfSU	Khruangbin	NORMAL	2018-05-16	https://i.ytimg.com/vi/vWLJeqLPfSU/hqdefault.jpg
7873	Partner: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=rW0o-tXJXW0	Partner	NORMAL	2018-05-18	https://i.ytimg.com/vi/rW0o-tXJXW0/hqdefault.jpg
7874	Bela Fleck And Abigail Washburn: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=BfNlkqX7hlc	Bela Fleck And Abigail Washburn	NORMAL	2018-05-11	https://i.ytimg.com/vi/BfNlkqX7hlc/hqdefault.jpg
7875	Naia Izumi: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=42MiCMJ6DJU	Naia Izumi	NORMAL	2018-05-14	https://i.ytimg.com/vi/42MiCMJ6DJU/hqdefault.jpg
7876	Gordi: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=Oon_lSONbB0	Gordi	NORMAL	2018-05-07	https://i.ytimg.com/vi/Oon_lSONbB0/hqdefault.jpg
7877	Darlingside: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=I8sHrD48zPU	Darlingside	NORMAL	2018-05-04	https://i.ytimg.com/vi/I8sHrD48zPU/hqdefault.jpg
7878	GZA & The Soul Rebels: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=Eqme6GKr57U	GZA & The Soul Rebels	NORMAL	2018-05-02	https://i.ytimg.com/vi/Eqme6GKr57U/hqdefault.jpg
7879	Bedouine: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=DDu4jk2_R_k	Bedouine	NORMAL	2018-04-30	https://i.ytimg.com/vi/DDu4jk2_R_k/hqdefault.jpg
7880	├îF├ë: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=Q6s_ZL8b3GE	├îF├ë	NORMAL	2018-04-27	https://i.ytimg.com/vi/Q6s_ZL8b3GE/hqdefault.jpg
7881	Superorganism: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=2K49QKVR0p0	Superorganism	NORMAL	2018-04-25	https://i.ytimg.com/vi/2K49QKVR0p0/hqdefault.jpg
7882	Logan Richardson: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=9UmWZEZakXQ	Logan Richardson	NORMAL	2018-04-23	https://i.ytimg.com/vi/9UmWZEZakXQ/hqdefault.jpg
7883	John Moreland: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=cniD94MqoCg	John Moreland	NORMAL	2018-04-20	https://i.ytimg.com/vi/cniD94MqoCg/hqdefault.jpg
7884	O.C.: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=05EW61wUoLU	O.C.	NORMAL	2018-04-19	https://i.ytimg.com/vi/05EW61wUoLU/hqdefault.jpg
7885	The Breeders: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=CHMZW9kLpg0	The Breeders	NORMAL	2018-04-16	https://i.ytimg.com/vi/CHMZW9kLpg0/hqdefault.jpg
7886	Jorge Drexler: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=qn6rgisZm1M	Jorge Drexler	NORMAL	2018-04-16	https://i.ytimg.com/vi/qn6rgisZm1M/hqdefault.jpg
7887	Tyler Childers: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=lkDYKk9k-2E	Tyler Childers	NORMAL	2018-04-11	https://i.ytimg.com/vi/lkDYKk9k-2E/hqdefault.jpg
7888	Lara Bello: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=9-0f3bKQyAw	Lara Bello	NORMAL	2018-04-10	https://i.ytimg.com/vi/9-0f3bKQyAw/hqdefault.jpg
7889	Rhye: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=YkkKUARRpeU	Rhye	NORMAL	2018-04-09	https://i.ytimg.com/vi/YkkKUARRpeU/hqdefault.jpg
7890	Dan Auerbach: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=xkBeytzAHy0	Dan Auerbach	NORMAL	2018-04-04	https://i.ytimg.com/vi/xkBeytzAHy0/hqdefault.jpg
7891	Dee Dee Bridgewater: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=nXdC5D2PqoU	Dee Dee Bridgewater	NORMAL	2018-04-02	https://i.ytimg.com/vi/nXdC5D2PqoU/hqdefault.jpg
7892	Masta Ace: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=3CxvB0d5VF0	Masta Ace	NORMAL	2018-04-02	https://i.ytimg.com/vi/3CxvB0d5VF0/hqdefault.jpg
7893	I'm With Her: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=7WNmrsbu-hc	I'm With Her	NORMAL	2018-03-28	https://i.ytimg.com/vi/7WNmrsbu-hc/hqdefault.jpg
7894	Jenny and the Mexicats: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=yng5CTT8Ogk	Jenny and the Mexicats	NORMAL	2018-03-26	https://i.ytimg.com/vi/yng5CTT8Ogk/hqdefault.jpg
7895	Robin Olson: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=uQAQg7F89DY	Robin Olson	NORMAL	2018-03-27	https://i.ytimg.com/vi/uQAQg7F89DY/hqdefault.jpg
7896	V├ñsen: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=hrAILI4-25M	V├ñsen	NORMAL	2018-03-23	https://i.ytimg.com/vi/hrAILI4-25M/hqdefault.jpg
7897	Cornelius: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=1gxm_5cShUw	Cornelius	NORMAL	2018-03-19	https://i.ytimg.com/vi/1gxm_5cShUw/hqdefault.jpg
7898	Raul Mid├│n: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=x9qEmmPSHs8	Raul Mid├│n	NORMAL	2018-03-15	https://i.ytimg.com/vi/x9qEmmPSHs8/hqdefault.jpg
7899	John Prine: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=sOg7mAkrKJw	John Prine	NORMAL	2018-03-12	https://i.ytimg.com/vi/sOg7mAkrKJw/hqdefault.jpg
7900	Kuinka: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=kWg2nMJkO5Y	Kuinka	NORMAL	2018-03-12	https://i.ytimg.com/vi/kWg2nMJkO5Y/hqdefault.jpg
7901	Alex Clare: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=Y2N9R9CDEZk	Alex Clare	NORMAL	2018-03-07	https://i.ytimg.com/vi/Y2N9R9CDEZk/hqdefault.jpg
7902	Big K.R.I.T.: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=_8xj2qp6yls	Big K.R.I.T.	NORMAL	2018-03-05	https://i.ytimg.com/vi/_8xj2qp6yls/hqdefault.jpg
7903	Anna Meredith: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=36FNJiP8GWk	Anna Meredith	NORMAL	2018-03-02	https://i.ytimg.com/vi/36FNJiP8GWk/hqdefault.jpg
7904	Roy Ayers: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=CghK8iVUHBs	Roy Ayers	NORMAL	2018-03-01	https://i.ytimg.com/vi/CghK8iVUHBs/hqdefault.jpg
7905	Lee Ann Womack: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=kDRd0CEneOU	Lee Ann Womack	NORMAL	2018-02-27	https://i.ytimg.com/vi/kDRd0CEneOU/hqdefault.jpg
7906	Vagabon: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=ZPuU39-PYjQ	Vagabon	NORMAL	2018-02-23	https://i.ytimg.com/vi/ZPuU39-PYjQ/hqdefault.jpg
7907	August Greene (Common, Robert Glasper, Karriem Riggins): NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=y5p8Bmv0NSQ	August Greene (Common, Robert Glasper, Karriem Riggins)	NORMAL	2018-02-22	https://i.ytimg.com/vi/y5p8Bmv0NSQ/hqdefault.jpg
7908	Big Daddy Kane: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=p8Uw1cl4xjg	Big Daddy Kane	NORMAL	2018-02-15	https://i.ytimg.com/vi/p8Uw1cl4xjg/hqdefault.jpg
7909	Betsayda Machado y Parranda El Clavo: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=W8SnRPbiGH8	Betsayda Machado y Parranda El Clavo	NORMAL	2018-02-22	https://i.ytimg.com/vi/W8SnRPbiGH8/hqdefault.jpg
7910	Nick Hakim: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=N83D8KUeCqs	Nick Hakim	NORMAL	2018-02-14	https://i.ytimg.com/vi/N83D8KUeCqs/hqdefault.jpg
7911	Marlon Williams: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=Ab8YnmHB6tE	Marlon Williams	NORMAL	2017-10-12	https://i.ytimg.com/vi/Ab8YnmHB6tE/hqdefault.jpg
7912	The Crossrhodes: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=5KmvqS56jSU	The Crossrhodes	NORMAL	2018-02-09	https://i.ytimg.com/vi/5KmvqS56jSU/hqdefault.jpg
7913	Ibeyi: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=GeApLkyH8jg	Ibeyi	NORMAL	2018-02-07	https://i.ytimg.com/vi/GeApLkyH8jg/hqdefault.jpg
7914	Announcing The 2018 Tiny Desk Contest: Meet HDHG	https://www.youtube.com/watch?v=K2Pf41N5Rqo	Announcing The 2018 Tiny Desk Contest	NORMAL	2018-02-13	https://i.ytimg.com/vi/K2Pf41N5Rqo/hqdefault.jpg
7915	Hurray For the Riff Raff: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=T7di55eTFDE	Hurray For the Riff Raff	NORMAL	2018-02-05	https://i.ytimg.com/vi/T7di55eTFDE/hqdefault.jpg
7916	Vicente Garc├¡a: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=haK0DUXIre0	Vicente Garc├¡a	NORMAL	2018-02-02	https://i.ytimg.com/vi/haK0DUXIre0/hqdefault.jpg
7917	Alice Smith: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=-ZOW4CvYAZ4	Alice Smith	NORMAL	2018-01-30	https://i.ytimg.com/vi/-ZOW4CvYAZ4/hqdefault.jpg
7918	Jamila Woods: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=NbpRu-yzNfs	Jamila Woods	NORMAL	2018-01-29	https://i.ytimg.com/vi/NbpRu-yzNfs/hqdefault.jpg
7919	Barbara Hannigan: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=jKkb2q9EbSg	Barbara Hannigan	NORMAL	2018-01-26	https://i.ytimg.com/vi/jKkb2q9EbSg/hqdefault.jpg
7920	George Clinton & The P-Funk All Stars: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=IxAcW7zgAD4	George Clinton & The P-Funk All Stars	NORMAL	2018-01-24	https://i.ytimg.com/vi/IxAcW7zgAD4/hqdefault.jpg
7921	St. Vincent: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=BfYJt1O8ZjY	St. Vincent	NORMAL	2018-01-19	https://i.ytimg.com/vi/BfYJt1O8ZjY/hqdefault.jpg
7922	Amadou and Mariam: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=hcAKsXR51HQ	Amadou and Mariam	NORMAL	2018-01-19	https://i.ytimg.com/vi/hcAKsXR51HQ/hqdefault.jpg
7923	The Lemon Twigs: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=AzDZywUp-mQ	The Lemon Twigs	NORMAL	2018-01-16	https://i.ytimg.com/vi/AzDZywUp-mQ/hqdefault.jpg
7924	AHI: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=gUd7z9g8vGY	AHI	NORMAL	2018-01-11	https://i.ytimg.com/vi/gUd7z9g8vGY/hqdefault.jpg
7925	The Artists From The "Take Me to the River" Tour: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=-T6b-obgmlc	The Artists From The "Take Me to the River" Tour	NORMAL	2018-01-16	https://i.ytimg.com/vi/-T6b-obgmlc/hqdefault.jpg
7926	Daniil Trifonov: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=W23gEiUwne0	Daniil Trifonov	NORMAL	2018-01-11	https://i.ytimg.com/vi/W23gEiUwne0/hqdefault.jpg
7927	Julien Baker: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=XZdnq5tN5vI	Julien Baker	NORMAL	2018-01-10	https://i.ytimg.com/vi/XZdnq5tN5vI/hqdefault.jpg
7928	The Weather Station: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=6uXG6bReqXY	The Weather Station	NORMAL	2018-01-05	https://i.ytimg.com/vi/6uXG6bReqXY/hqdefault.jpg
7929	Lo Moon: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=BVnUddPsVRk	Lo Moon	NORMAL	2018-01-03	https://i.ytimg.com/vi/BVnUddPsVRk/hqdefault.jpg
7930	Open Mike Eagle: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=it3DnfTZIM0	Open Mike Eagle	NORMAL	2018-01-02	https://i.ytimg.com/vi/it3DnfTZIM0/hqdefault.jpg
7931	This Is The Kit: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=XMafp_ykmVk	This Is The Kit	NORMAL	2017-12-12	https://i.ytimg.com/vi/XMafp_ykmVk/hqdefault.jpg
7932	Hanson: NPR Music Holiday Tiny Desk Concert	https://www.youtube.com/watch?v=i0F-z13-vHQ	Hanson	NORMAL	2017-12-12	https://i.ytimg.com/vi/i0F-z13-vHQ/hqdefault.jpg
7933	Cigarettes After Sex: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=HcAxgErAkTw	Cigarettes After Sex	NORMAL	2017-12-13	https://i.ytimg.com/vi/HcAxgErAkTw/hqdefault.jpg
7934	Courtney Barnett and Kurt Vile: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=JQs5XagfheI	Courtney Barnett and Kurt Vile	NORMAL	2017-12-08	https://i.ytimg.com/vi/JQs5XagfheI/hqdefault.jpg
7935	Tyler, The Creator: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=N1w-hDiJ4dM	Tyler, The Creator	NORMAL	2017-12-13	https://i.ytimg.com/vi/N1w-hDiJ4dM/hqdefault.jpg
7936	King Krule: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=LL_iUj-mQfg	King Krule	NORMAL	2017-12-05	https://i.ytimg.com/vi/LL_iUj-mQfg/hqdefault.jpg
7937	Ted Leo: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=BbP1AzDf7T0	Ted Leo	NORMAL	2017-12-04	https://i.ytimg.com/vi/BbP1AzDf7T0/hqdefault.jpg
7938	Walter Martin: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=gwQiH8lmIeU	Walter Martin	NORMAL	2017-12-01	https://i.ytimg.com/vi/gwQiH8lmIeU/hqdefault.jpg
7939	Moses Sumney: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=C4-0Q8W8Nb0	Moses Sumney	NORMAL	2017-11-28	https://i.ytimg.com/vi/C4-0Q8W8Nb0/hqdefault.jpg
7940	Phoebe Bridgers: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=-hLJNZSIwP8	Phoebe Bridgers	NORMAL	2017-11-21	https://i.ytimg.com/vi/-hLJNZSIwP8/hqdefault.jpg
7941	David Greilsammer: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=JeRXCjZQAHM	David Greilsammer	NORMAL	2017-11-20	https://i.ytimg.com/vi/JeRXCjZQAHM/hqdefault.jpg
7942	Ledisi: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=23kmzrsjmCU	Ledisi	NORMAL	2017-11-20	https://i.ytimg.com/vi/23kmzrsjmCU/hqdefault.jpg
7943	Billy Corgan: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=oaSN_bHjyIw	Billy Corgan	NORMAL	2017-11-17	https://i.ytimg.com/vi/oaSN_bHjyIw/hqdefault.jpg
7944	Benjamin Booker: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=I48camns7KY	Benjamin Booker	NORMAL	2017-11-17	https://i.ytimg.com/vi/I48camns7KY/hqdefault.jpg
7945	Now, Now: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=-jVqp8SvZHE	Now, Now	NORMAL	2017-11-14	https://i.ytimg.com/vi/-jVqp8SvZHE/hqdefault.jpg
7946	Amin├®: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=l0MqlDbZ_as	Amin├®	NORMAL	2017-11-13	https://i.ytimg.com/vi/l0MqlDbZ_as/hqdefault.jpg
7947	Mynabirds: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=kp-I1dEH3Uw	Mynabirds	NORMAL	2017-11-09	https://i.ytimg.com/vi/kp-I1dEH3Uw/hqdefault.jpg
7948	Ani DiFranco: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=T7xWl50pKyo	Ani DiFranco	NORMAL	2017-11-07	https://i.ytimg.com/vi/T7xWl50pKyo/hqdefault.jpg
7949	Wyclef Jean: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=EhnLJwmEy_k	Wyclef Jean	NORMAL	2017-11-02	https://i.ytimg.com/vi/EhnLJwmEy_k/hqdefault.jpg
7950	Nate Smith + KINFOLK: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=peYcNm3JTe8	Nate Smith + KINFOLK	NORMAL	2017-11-06	https://i.ytimg.com/vi/peYcNm3JTe8/hqdefault.jpg
7951	Gracie and Rachel: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=sNAil6VlchE	Gracie and Rachel	NORMAL	2017-10-31	https://i.ytimg.com/vi/sNAil6VlchE/hqdefault.jpg
7952	The Roots feat. Bilal: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=eB4oFu4BtQ8	The Roots feat. Bilal	NORMAL	2017-10-30	https://i.ytimg.com/vi/eB4oFu4BtQ8/hqdefault.jpg
7953	Natalia Lafourcade: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=JODaYjDyjyQ	Natalia Lafourcade	NORMAL	2017-10-26	https://i.ytimg.com/vi/JODaYjDyjyQ/hqdefault.jpg
7954	Japanese Breakfast: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=tK4gaJwXw_4	Japanese Breakfast	NORMAL	2017-10-24	https://i.ytimg.com/vi/tK4gaJwXw_4/hqdefault.jpg
7955	Shabazz Palaces: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=4wQUv87URYU	Shabazz Palaces	NORMAL	2017-10-23	https://i.ytimg.com/vi/4wQUv87URYU/hqdefault.jpg
7956	The Perceptionists: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=GkUY-aVuNQo	The Perceptionists	NORMAL	2017-10-20	https://i.ytimg.com/vi/GkUY-aVuNQo/hqdefault.jpg
7957	Thundercat: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=zhVgbZdMdb0	Thundercat	NORMAL	2017-10-16	https://i.ytimg.com/vi/zhVgbZdMdb0/hqdefault.jpg
7958	Hanson: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=rb4tXqPI7NU	Hanson	NORMAL	2017-10-13	https://i.ytimg.com/vi/rb4tXqPI7NU/hqdefault.jpg
7959	Randy Newman: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=1wFWR5qCB2k	Randy Newman	NORMAL	2017-10-05	https://i.ytimg.com/vi/1wFWR5qCB2k/hqdefault.jpg
7960	Landlady: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=WEzNvKpMyvg	Landlady	NORMAL	2017-10-05	https://i.ytimg.com/vi/WEzNvKpMyvg/hqdefault.jpg
7961	Paramore: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=_t-nRXwAL1k	Paramore	NORMAL	2017-09-29	https://i.ytimg.com/vi/_t-nRXwAL1k/hqdefault.jpg
7962	Dawg Yawp: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=8jubZRUcPjA	Dawg Yawp	NORMAL	2017-09-28	https://i.ytimg.com/vi/8jubZRUcPjA/hqdefault.jpg
7963	Chronixx: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=tFdebIZJah8	Chronixx	NORMAL	2017-09-26	https://i.ytimg.com/vi/tFdebIZJah8/hqdefault.jpg
7964	Steve Martin and the Steep Canyon Rangers: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=ZyHipL45pwM	Steve Martin and the Steep Canyon Rangers	NORMAL	2017-09-22	https://i.ytimg.com/vi/ZyHipL45pwM/hqdefault.jpg
7965	Bomba Estereo: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=3oY-GQVzAX8	Bomba Estereo	NORMAL	2017-09-21	https://i.ytimg.com/vi/3oY-GQVzAX8/hqdefault.jpg
7966	SsingSsing: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=QLRxO9AmNNo	SsingSsing	NORMAL	2017-09-21	https://i.ytimg.com/vi/QLRxO9AmNNo/hqdefault.jpg
7967	Snail Mail: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=21ix1OwPoY8	Snail Mail	NORMAL	2017-09-13	https://i.ytimg.com/vi/21ix1OwPoY8/hqdefault.jpg
7968	L.A. Salami: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=JpYCCcWlxNo	L.A. Salami	NORMAL	2017-09-12	https://i.ytimg.com/vi/JpYCCcWlxNo/hqdefault.jpg
7969	Bleachers: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=QCtkkX2f18M	Bleachers	NORMAL	2017-09-12	https://i.ytimg.com/vi/QCtkkX2f18M/hqdefault.jpg
7970	Frances Cone: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=NPlZQ5L8yUY	Frances Cone	NORMAL	2017-09-05	https://i.ytimg.com/vi/NPlZQ5L8yUY/hqdefault.jpg
7971	Jidenna: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=h-_YEiac55s	Jidenna	NORMAL	2017-08-30	https://i.ytimg.com/vi/h-_YEiac55s/hqdefault.jpg
7972	Jason Isbell: Tiny Desk Concert	https://www.youtube.com/watch?v=djUh1eHdepE	Jason Isbell	NORMAL	2017-09-06	https://i.ytimg.com/vi/djUh1eHdepE/hqdefault.jpg
7973	DJ Premier & The Badder Band: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=Pvn20PjBa3k	DJ Premier & The Badder Band	NORMAL	2017-08-17	https://i.ytimg.com/vi/Pvn20PjBa3k/hqdefault.jpg
7974	ALA.NI: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=9Oy3pyPxRo0	ALA.NI	NORMAL	2017-08-17	https://i.ytimg.com/vi/9Oy3pyPxRo0/hqdefault.jpg
7975	Maggie Rogers: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=SqPtIkxSxI0	Maggie Rogers	NORMAL	2017-08-04	https://i.ytimg.com/vi/SqPtIkxSxI0/hqdefault.jpg
7976	Diet Cig: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=B-oxSercnbQ	Diet Cig	NORMAL	2017-08-07	https://i.ytimg.com/vi/B-oxSercnbQ/hqdefault.jpg
7977	Aldous Harding: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=U6ToeaeuOQo	Aldous Harding	NORMAL	2017-08-03	https://i.ytimg.com/vi/U6ToeaeuOQo/hqdefault.jpg
7978	The Shins: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=Tid0nlwfvAI	The Shins	NORMAL	2017-08-03	https://i.ytimg.com/vi/Tid0nlwfvAI/hqdefault.jpg
7979	Albin Lee Meldau: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=kc2i9pwSSqE	Albin Lee Meldau	NORMAL	2017-08-03	https://i.ytimg.com/vi/kc2i9pwSSqE/hqdefault.jpg
7980	Rare Essence: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=ysGErZcZRGY	Rare Essence	NORMAL	2017-07-27	https://i.ytimg.com/vi/ysGErZcZRGY/hqdefault.jpg
7981	Fragile Rock: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=X_BzysUbsYw	Fragile Rock	NORMAL	2017-07-25	https://i.ytimg.com/vi/X_BzysUbsYw/hqdefault.jpg
7982	Tuxedo: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=0WyqHfJOj-I	Tuxedo	NORMAL	2017-07-24	https://i.ytimg.com/vi/0WyqHfJOj-I/hqdefault.jpg
7983	Jay Som: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=rDJeYMel81Y	Jay Som	NORMAL	2017-07-13	https://i.ytimg.com/vi/rDJeYMel81Y/hqdefault.jpg
7984	Chance The Rapper: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=-kWbZvVU-e0	Chance The Rapper	NORMAL	2017-07-14	https://i.ytimg.com/vi/-kWbZvVU-e0/hqdefault.jpg
7985	Helado Negro: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=p0x3aKmEu7M	Helado Negro	NORMAL	2017-07-06	https://i.ytimg.com/vi/p0x3aKmEu7M/hqdefault.jpg
7986	Ravi Coltrane Quartet: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=NEUD2CkKn8o	Ravi Coltrane Quartet	NORMAL	2017-06-29	https://i.ytimg.com/vi/NEUD2CkKn8o/hqdefault.jpg
7987	Holly Macve: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=5q-cdf4170A	Holly Macve	NORMAL	2017-06-29	https://i.ytimg.com/vi/5q-cdf4170A/hqdefault.jpg
7988	Tigers Jaw: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=OX-gMWH9qTQ	Tigers Jaw	NORMAL	2017-06-29	https://i.ytimg.com/vi/OX-gMWH9qTQ/hqdefault.jpg
7989	Penguin Cafe: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=ILrIEKaC450	Penguin Cafe	NORMAL	2017-06-23	https://i.ytimg.com/vi/ILrIEKaC450/hqdefault.jpg
7990	Perfume Genius: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=O7x79AtDKEw	Perfume Genius	NORMAL	2017-06-19	https://i.ytimg.com/vi/O7x79AtDKEw/hqdefault.jpg
7991	Violents & Monica Martin: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=gvQ_9JDpAuU	Violents & Monica Martin	NORMAL	2017-06-09	https://i.ytimg.com/vi/gvQ_9JDpAuU/hqdefault.jpg
7992	Nick Grant: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=gFIMU4vzi2Q	Nick Grant	NORMAL	2017-06-02	https://i.ytimg.com/vi/gFIMU4vzi2Q/hqdefault.jpg
7993	Royal Thunder: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=8Zpkw5oEnvo	Royal Thunder	NORMAL	2017-06-02	https://i.ytimg.com/vi/8Zpkw5oEnvo/hqdefault.jpg
7994	Gabriel Garz├│n-Montano: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=oEFqsWkkxvo	Gabriel Garz├│n-Montano	NORMAL	2017-06-02	https://i.ytimg.com/vi/oEFqsWkkxvo/hqdefault.jpg
7995	Julia Jacklin: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=f7-3kiK6F_Q	Julia Jacklin	NORMAL	2017-05-26	https://i.ytimg.com/vi/f7-3kiK6F_Q/hqdefault.jpg
7996	Troker: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=HdFP4P8ZkjA	Troker	NORMAL	2017-05-25	https://i.ytimg.com/vi/HdFP4P8ZkjA/hqdefault.jpg
7997	Tim Darcy: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=d4f9X-SC_xk	Tim Darcy	NORMAL	2017-05-22	https://i.ytimg.com/vi/d4f9X-SC_xk/hqdefault.jpg
7998	Danilo Brito: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=FdBwOOwcwTU	Danilo Brito	NORMAL	2017-05-19	https://i.ytimg.com/vi/FdBwOOwcwTU/hqdefault.jpg
7999	Aimee Mann: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=XgYT7zB3w5M	Aimee Mann	NORMAL	2017-05-10	https://i.ytimg.com/vi/XgYT7zB3w5M/hqdefault.jpg
8000	Peter Silberman: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=4X-362AhbRQ	Peter Silberman	NORMAL	2017-05-05	https://i.ytimg.com/vi/4X-362AhbRQ/hqdefault.jpg
8001	Avery*Sunshine: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=xNEhfztkCdc	Avery*Sunshine	NORMAL	2017-05-01	https://i.ytimg.com/vi/xNEhfztkCdc/hqdefault.jpg
8002	Antonio Lizana: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=3WocuIycshM	Antonio Lizana	NORMAL	2017-05-01	https://i.ytimg.com/vi/3WocuIycshM/hqdefault.jpg
8003	alt-J: Tiny Desk Concert	https://www.youtube.com/watch?v=8zHdLF3-coA	alt-J	NORMAL	2017-04-25	https://i.ytimg.com/vi/8zHdLF3-coA/hqdefault.jpg
8004	Chicano Batman: Tiny Desk Concert	https://www.youtube.com/watch?v=gOwpqDhko3c	Chicano Batman	NORMAL	2017-04-18	https://i.ytimg.com/vi/gOwpqDhko3c/hqdefault.jpg
8005	Ljova And The Kontraband: Tiny Desk Concert	https://www.youtube.com/watch?v=3N7a7bDEqMo	Ljova And The Kontraband	NORMAL	2017-04-21	https://i.ytimg.com/vi/3N7a7bDEqMo/hqdefault.jpg
8006	Sinkane: Tiny Desk Concert	https://www.youtube.com/watch?v=0SMTWfLCi8g	Sinkane	NORMAL	2017-04-14	https://i.ytimg.com/vi/0SMTWfLCi8g/hqdefault.jpg
8007	Tash Sultana: Tiny Desk Concert	https://www.youtube.com/watch?v=GVDJ8O3lPBA	Tash Sultana	NORMAL	2017-04-17	https://i.ytimg.com/vi/GVDJ8O3lPBA/hqdefault.jpg
8008	Noname: Tiny Desk Concert	https://www.youtube.com/watch?v=K58JYXhb4YA	Noname	NORMAL	2017-04-07	https://i.ytimg.com/vi/K58JYXhb4YA/hqdefault.jpg
8009	Overcoats: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=pXtAhfQhEG4	Overcoats	NORMAL	2017-04-03	https://i.ytimg.com/vi/pXtAhfQhEG4/hqdefault.jpg
8010	Delicate Steve: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=57vvhrq2SNQ	Delicate Steve	NORMAL	2017-03-27	https://i.ytimg.com/vi/57vvhrq2SNQ/hqdefault.jpg
8011	Sampha: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=fnIu25lXXY8	Sampha	NORMAL	2017-03-27	https://i.ytimg.com/vi/fnIu25lXXY8/hqdefault.jpg
8012	Tank And The Bangas: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=QKzobTCIRDw	Tank And The Bangas	NORMAL	2017-03-16	https://i.ytimg.com/vi/QKzobTCIRDw/hqdefault.jpg
8013	Red Baraat: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=lgmw41CY1Fo	Red Baraat	NORMAL	2017-03-16	https://i.ytimg.com/vi/lgmw41CY1Fo/hqdefault.jpg
8014	Maren Morris: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=zM1o4OQaIEc	Maren Morris	NORMAL	2017-03-10	https://i.ytimg.com/vi/zM1o4OQaIEc/hqdefault.jpg
8015	Ninet: Tiny Desk Concert	https://www.youtube.com/watch?v=0plnzlNBxnA	Ninet	NORMAL	2017-03-08	https://i.ytimg.com/vi/0plnzlNBxnA/hqdefault.jpg
8016	Dirty Dozen Brass Band: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=HXr3nrd33U0	Dirty Dozen Brass Band	NORMAL	2017-02-28	https://i.ytimg.com/vi/HXr3nrd33U0/hqdefault.jpg
8017	Little Simz: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=O5_IAndUG7g	Little Simz	NORMAL	2017-02-21	https://i.ytimg.com/vi/O5_IAndUG7g/hqdefault.jpg
8018	Agnes Obel: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=MAqIrCjOxws	Agnes Obel	NORMAL	2017-02-17	https://i.ytimg.com/vi/MAqIrCjOxws/hqdefault.jpg
8019	Esm├® Patterson: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=0MYcKEi8zZs	Esm├® Patterson	NORMAL	2017-02-14	https://i.ytimg.com/vi/0MYcKEi8zZs/hqdefault.jpg
8020	Run The Jewels: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=u-syZXHPcJE	Run The Jewels	NORMAL	2017-02-10	https://i.ytimg.com/vi/u-syZXHPcJE/hqdefault.jpg
8021	D.R.A.M.: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=NwjN3UCBW14	D.R.A.M.	NORMAL	2017-01-30	https://i.ytimg.com/vi/NwjN3UCBW14/hqdefault.jpg
8022	Miramar: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=4Nr7mq74gD0	Miramar	NORMAL	2017-02-06	https://i.ytimg.com/vi/4Nr7mq74gD0/hqdefault.jpg
8023	Gallant: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=BGpmIANN5Lg	Gallant	NORMAL	2017-01-30	https://i.ytimg.com/vi/BGpmIANN5Lg/hqdefault.jpg
8024	BADBADNOTGOOD: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=Ap4DtvUu7Bk	BADBADNOTGOOD	NORMAL	2017-01-26	https://i.ytimg.com/vi/Ap4DtvUu7Bk/hqdefault.jpg
8025	Brent Cobb: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=wuOJF8ecoY8	Brent Cobb	NORMAL	2017-01-23	https://i.ytimg.com/vi/wuOJF8ecoY8/hqdefault.jpg
8026	Lila Downs: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=hU3P6dlNaB4	Lila Downs	NORMAL	2017-01-17	https://i.ytimg.com/vi/hU3P6dlNaB4/hqdefault.jpg
8027	Donny McCaslin: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=oIbFjfH0erI	Donny McCaslin	NORMAL	2017-01-12	https://i.ytimg.com/vi/oIbFjfH0erI/hqdefault.jpg
8028	Declan McKenna: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=Ea43VkCiyFo	Declan McKenna	NORMAL	2016-12-21	https://i.ytimg.com/vi/Ea43VkCiyFo/hqdefault.jpg
8029	Derek Gripper: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=55QnOlXckOk	Derek Gripper	NORMAL	2016-12-19	https://i.ytimg.com/vi/55QnOlXckOk/hqdefault.jpg
8030	The Oh Hellos: NPR Music Holiday Tiny Desk Concert	https://www.youtube.com/watch?v=hJykCRucbBM	The Oh Hellos	NORMAL	2016-12-19	https://i.ytimg.com/vi/hJykCRucbBM/hqdefault.jpg
8031	Gucci Mane: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=wlFQjExxD4U	Gucci Mane	NORMAL	2016-12-19	https://i.ytimg.com/vi/wlFQjExxD4U/hqdefault.jpg
8032	Alsarah & The Nubatones: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=daXGLo4aeFQ	Alsarah & The Nubatones	NORMAL	2016-12-16	https://i.ytimg.com/vi/daXGLo4aeFQ/hqdefault.jpg
8033	Ro James: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=fKVZEfxDvcM	Ro James	NORMAL	2016-12-09	https://i.ytimg.com/vi/fKVZEfxDvcM/hqdefault.jpg
8034	Pinegrove: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=weL8HTY1NJU	Pinegrove	NORMAL	2016-12-05	https://i.ytimg.com/vi/weL8HTY1NJU/hqdefault.jpg
8035	Margo Price: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=S9bLHMCnCAk	Margo Price	NORMAL	2016-12-01	https://i.ytimg.com/vi/S9bLHMCnCAk/hqdefault.jpg
8036	Tegan And Sara: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=1djpZqRRA7U	Tegan And Sara	NORMAL	2016-11-23	https://i.ytimg.com/vi/1djpZqRRA7U/hqdefault.jpg
8037	Attacca Quartet: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=CXgO7xI7ElQ	Attacca Quartet	NORMAL	2016-11-23	https://i.ytimg.com/vi/CXgO7xI7ElQ/hqdefault.jpg
8038	John Paul White: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=mBIAnpOrJB8	John Paul White	NORMAL	2016-11-16	https://i.ytimg.com/vi/mBIAnpOrJB8/hqdefault.jpg
8039	Adam Torres: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=NIsUeV_zmA0	Adam Torres	NORMAL	2016-11-16	https://i.ytimg.com/vi/NIsUeV_zmA0/hqdefault.jpg
8040	Ta-ku & Wafia: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=eXs09v4vzio	Ta-ku & Wafia	NORMAL	2016-11-10	https://i.ytimg.com/vi/eXs09v4vzio/hqdefault.jpg
8041	The Westerlies: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=69QYjqkAIwI	The Westerlies	NORMAL	2016-11-08	https://i.ytimg.com/vi/69QYjqkAIwI/hqdefault.jpg
8042	Joseph: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=TeDh-3IKwgc	Joseph	NORMAL	2016-11-03	https://i.ytimg.com/vi/TeDh-3IKwgc/hqdefault.jpg
8043	Drive-By Truckers: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=ewLgmWXQsqU	Drive-By Truckers	NORMAL	2016-11-01	https://i.ytimg.com/vi/ewLgmWXQsqU/hqdefault.jpg
8044	Blind Pilot: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=xIZR52eKgUA	Blind Pilot	NORMAL	2022-10-26	https://i.ytimg.com/vi/xIZR52eKgUA/hqdefault.jpg
8045	Billy Bragg & Joe Henry: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=oE9T-ubu45Y	Billy Bragg & Joe Henry	NORMAL	2016-10-21	https://i.ytimg.com/vi/oE9T-ubu45Y/hqdefault.jpg
8046	RDGLDGRN: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=oVVGZd2oH7Y	RDGLDGRN	NORMAL	2016-10-20	https://i.ytimg.com/vi/oVVGZd2oH7Y/hqdefault.jpg
8047	Haley Bonar: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=SjsziZFxupM	Haley Bonar	NORMAL	2016-10-14	https://i.ytimg.com/vi/SjsziZFxupM/hqdefault.jpg
8048	Common At The White House: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=2AChGszRGwI	Common At The White House	NORMAL	2016-10-11	https://i.ytimg.com/vi/2AChGszRGwI/hqdefault.jpg
8049	Joshua Bell & Jeremy Denk: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=vArST0dVOl4	Joshua Bell & Jeremy Denk	NORMAL	2016-10-05	https://i.ytimg.com/vi/vArST0dVOl4/hqdefault.jpg
8050	Blue Man Group: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=qTJfITfbYNA	Blue Man Group	NORMAL	2016-09-29	https://i.ytimg.com/vi/qTJfITfbYNA/hqdefault.jpg
8051	Corinne Bailey Rae: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=h--fvyPu5e4	Corinne Bailey Rae	NORMAL	2016-09-26	https://i.ytimg.com/vi/h--fvyPu5e4/hqdefault.jpg
8052	Saul Williams: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=eXfVIPqcF9I	Saul Williams	NORMAL	2016-09-22	https://i.ytimg.com/vi/eXfVIPqcF9I/hqdefault.jpg
8053	Blue Man Group Is Coming To The Tiny Desk!	https://www.youtube.com/watch?v=Qj8yFyOojNo	Blue Man Group Is Coming To The Tiny Desk!	NORMAL	2016-09-21	https://i.ytimg.com/vi/Qj8yFyOojNo/hqdefault.jpg
8054	The Secret Sisters: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=NsEQbJGZcbM	The Secret Sisters	NORMAL	2016-09-15	https://i.ytimg.com/vi/NsEQbJGZcbM/hqdefault.jpg
8055	William Bell: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=vXUznxv0qF0	William Bell	NORMAL	2016-09-07	https://i.ytimg.com/vi/vXUznxv0qF0/hqdefault.jpg
8056	Big Thief: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=D0E5vMkDfOI	Big Thief	NORMAL	2016-08-29	https://i.ytimg.com/vi/D0E5vMkDfOI/hqdefault.jpg
8057	Nina Diaz: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=3q3z_KvLUNI	Nina Diaz	NORMAL	2016-08-29	https://i.ytimg.com/vi/3q3z_KvLUNI/hqdefault.jpg
8058	Margaret Glaspy: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=uxglzsJkBJg	Margaret Glaspy	NORMAL	2016-08-25	https://i.ytimg.com/vi/uxglzsJkBJg/hqdefault.jpg
8059	Eddie Palmieri: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=oUGukMLPQJs	Eddie Palmieri	NORMAL	2016-08-24	https://i.ytimg.com/vi/oUGukMLPQJs/hqdefault.jpg
8060	Anderson .Paak & The Free Nationals: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=ferZnZ0_rSM	Anderson .Paak & The Free Nationals	NORMAL	2016-08-22	https://i.ytimg.com/vi/ferZnZ0_rSM/hqdefault.jpg
8061	Ren├® Marie: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=XnNCJI_LUhg	Ren├® Marie	NORMAL	2016-08-11	https://i.ytimg.com/vi/XnNCJI_LUhg/hqdefault.jpg
8062	The Jayhawks: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=Q5XmnmEyaKQ	The Jayhawks	NORMAL	2016-08-08	https://i.ytimg.com/vi/Q5XmnmEyaKQ/hqdefault.jpg
8063	Rachel Barton Pine: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=gSZzJu67EJc	Rachel Barton Pine	NORMAL	2016-08-02	https://i.ytimg.com/vi/gSZzJu67EJc/hqdefault.jpg
8064	Kevin Morby: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=AKOlC7TAQ80	Kevin Morby	NORMAL	2016-08-01	https://i.ytimg.com/vi/AKOlC7TAQ80/hqdefault.jpg
8065	Lucy Dacus: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=xLFeeOVrNlI	Lucy Dacus	NORMAL	2016-07-28	https://i.ytimg.com/vi/xLFeeOVrNlI/hqdefault.jpg
8066	Xenia Rubinos: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=4KbPdFZ24F4	Xenia Rubinos	NORMAL	2016-07-25	https://i.ytimg.com/vi/4KbPdFZ24F4/hqdefault.jpg
8067	John Congleton And The Nighty Nite: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=DouAiv06tMY	John Congleton And The Nighty Nite	NORMAL	2016-07-21	https://i.ytimg.com/vi/DouAiv06tMY/hqdefault.jpg
8068	Gregory Porter: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=sNJUzwBNbxo	Gregory Porter	NORMAL	2016-07-18	https://i.ytimg.com/vi/sNJUzwBNbxo/hqdefault.jpg
8069	Chris Forsyth & The Solar Motel Band: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=ZHbkzeVym_0	Chris Forsyth & The Solar Motel Band	NORMAL	2016-07-14	https://i.ytimg.com/vi/ZHbkzeVym_0/hqdefault.jpg
8070	Jane Bunnett and Maqueque: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=2yxU-_md2hE	Jane Bunnett and Maqueque	NORMAL	2016-07-11	https://i.ytimg.com/vi/2yxU-_md2hE/hqdefault.jpg
8071	Valley Queen: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=T3dkJZS3n9A	Valley Queen	NORMAL	2016-07-07	https://i.ytimg.com/vi/T3dkJZS3n9A/hqdefault.jpg
8072	Los Hacheros: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=bWdZP2Qj6wA	Los Hacheros	NORMAL	2016-07-05	https://i.ytimg.com/vi/bWdZP2Qj6wA/hqdefault.jpg
8073	Adia Victoria: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=LaCjgtH4zac	Adia Victoria	NORMAL	2016-06-29	https://i.ytimg.com/vi/LaCjgtH4zac/hqdefault.jpg
8074	Charles Lloyd & Jason Moran: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=sKqnfdBfaEw	Charles Lloyd & Jason Moran	NORMAL	2016-06-28	https://i.ytimg.com/vi/sKqnfdBfaEw/hqdefault.jpg
8075	Mashrou' Leila: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=pfPvgAtgTNM	Mashrou' Leila	NORMAL	2016-06-23	https://i.ytimg.com/vi/pfPvgAtgTNM/hqdefault.jpg
8076	Brandy Clark: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=2BZSvAsmMXg	Brandy Clark	NORMAL	2016-06-20	https://i.ytimg.com/vi/2BZSvAsmMXg/hqdefault.jpg
8077	Alessio Bax: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=bmWBDs-5z3c	Alessio Bax	NORMAL	2016-06-16	https://i.ytimg.com/vi/bmWBDs-5z3c/hqdefault.jpg
8078	A Band From Beirut Speaks To Tragedy In Orlando	https://www.youtube.com/watch?v=zWckUls1wVE	A Band From Beirut Speaks To Tragedy In Orlando	NORMAL	2016-06-15	https://i.ytimg.com/vi/zWckUls1wVE/hqdefault.jpg
8079	Chick Corea & Gary Burton: Tiny Desk Concert	https://www.youtube.com/watch?v=15IHNYq6stw	Chick Corea & Gary Burton	NORMAL	2016-06-13	https://i.ytimg.com/vi/15IHNYq6stw/hqdefault.jpg
8080	Weaves: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=faGzVf9ySmY	Weaves	NORMAL	2016-06-09	https://i.ytimg.com/vi/faGzVf9ySmY/hqdefault.jpg
8081	Sam Beam & Jesca Hoop: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=syxhhSFNe-c	Sam Beam & Jesca Hoop	NORMAL	2016-06-06	https://i.ytimg.com/vi/syxhhSFNe-c/hqdefault.jpg
8082	Barry Douglas: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=P6H3jeut9jw	Barry Douglas	NORMAL	2016-06-02	https://i.ytimg.com/vi/P6H3jeut9jw/hqdefault.jpg
8083	Andrew Bird: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=QGAzPtwUJJU	Andrew Bird	NORMAL	2016-05-31	https://i.ytimg.com/vi/QGAzPtwUJJU/hqdefault.jpg
8084	Carrie Rodriguez: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=tWWxWpfkzR0	Carrie Rodriguez	NORMAL	2016-05-25	https://i.ytimg.com/vi/tWWxWpfkzR0/hqdefault.jpg
8085	Robert Ellis: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=snJ_lTsMKlM	Robert Ellis	NORMAL	2016-05-23	https://i.ytimg.com/vi/snJ_lTsMKlM/hqdefault.jpg
8086	Andy Shauf: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=QcGs8rBynL0	Andy Shauf	NORMAL	2016-05-18	https://i.ytimg.com/vi/QcGs8rBynL0/hqdefault.jpg
8087	Steve Kimock: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=YvKVs-q1oZU	Steve Kimock	NORMAL	2016-05-16	https://i.ytimg.com/vi/YvKVs-q1oZU/hqdefault.jpg
8088	Daym├® Arocena: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=tKTQAGYo5hE	Daym├® Arocena	NORMAL	2016-05-12	https://i.ytimg.com/vi/tKTQAGYo5hE/hqdefault.jpg
8089	Lara St. John: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=NvHPuggkDpU	Lara St. John	NORMAL	2016-05-09	https://i.ytimg.com/vi/NvHPuggkDpU/hqdefault.jpg
8090	Monika: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=CEayGhxI0gk	Monika	NORMAL	2016-05-06	https://i.ytimg.com/vi/CEayGhxI0gk/hqdefault.jpg
8091	eighth blackbird: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=wVpfyWhon3M	eighth blackbird	NORMAL	2016-05-02	https://i.ytimg.com/vi/wVpfyWhon3M/hqdefault.jpg
8092	Florist: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=WbyyxIZ02Zs	Florist	NORMAL	2016-04-28	https://i.ytimg.com/vi/WbyyxIZ02Zs/hqdefault.jpg
8093	Peter Frampton: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=9GLIZrSwFWk	Peter Frampton	NORMAL	2016-04-27	https://i.ytimg.com/vi/9GLIZrSwFWk/hqdefault.jpg
8094	Sister Sparrow & The Dirty Birds: Tiny Desk Concert	https://www.youtube.com/watch?v=Xpb8L4qlrYw	Sister Sparrow & The Dirty Birds	NORMAL	2016-04-20	https://i.ytimg.com/vi/Xpb8L4qlrYw/hqdefault.jpg
8095	Julia Holter: Tiny Desk Concert	https://www.youtube.com/watch?v=pVGCIH54W9g	Julia Holter	NORMAL	2016-04-21	https://i.ytimg.com/vi/pVGCIH54W9g/hqdefault.jpg
8096	Benjamin Clementine: Tiny Desk Concert	https://www.youtube.com/watch?v=00yQGeJ6AOM	Benjamin Clementine	NORMAL	2016-04-18	https://i.ytimg.com/vi/00yQGeJ6AOM/hqdefault.jpg
8097	Seratones: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=uSgJbqaYS74	Seratones	NORMAL	2016-04-14	https://i.ytimg.com/vi/uSgJbqaYS74/hqdefault.jpg
8098	Palehound: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=YjIvKvXjhas	Palehound	NORMAL	2016-04-11	https://i.ytimg.com/vi/YjIvKvXjhas/hqdefault.jpg
8099	Mothers: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=TFLy8mwJWRU	Mothers	NORMAL	2016-04-07	https://i.ytimg.com/vi/TFLy8mwJWRU/hqdefault.jpg
8100	PWR BTTM: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=ji-EdRtL9qU	PWR BTTM	NORMAL	2016-04-04	https://i.ytimg.com/vi/ji-EdRtL9qU/hqdefault.jpg
8101	Ane Brun: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=UaTONcmNotI	Ane Brun	NORMAL	2016-03-31	https://i.ytimg.com/vi/UaTONcmNotI/hqdefault.jpg
8102	Anthony Hamilton: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=C3lcprigQ0E	Anthony Hamilton	NORMAL	2016-03-28	https://i.ytimg.com/vi/C3lcprigQ0E/hqdefault.jpg
8103	Tedeschi Trucks Band: Tiny Desk Concert	https://www.youtube.com/watch?v=RRipadkd6wk	Tedeschi Trucks Band	NORMAL	2016-03-24	https://i.ytimg.com/vi/RRipadkd6wk/hqdefault.jpg
8104	Graham Nash: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=GTXqKSMv8Lc	Graham Nash	NORMAL	2016-03-10	https://i.ytimg.com/vi/GTXqKSMv8Lc/hqdefault.jpg
8105	Gaelynn Lea: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=n6oSeODGmoQ	Gaelynn Lea	NORMAL	2016-03-11	https://i.ytimg.com/vi/n6oSeODGmoQ/hqdefault.jpg
8106	Julien Baker: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=tADWPTqR_4A	Julien Baker	NORMAL	2016-03-04	https://i.ytimg.com/vi/tADWPTqR_4A/hqdefault.jpg
8107	Monsieur Perin├®: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=JGL-eQAAxGs	Monsieur Perin├®	NORMAL	2016-03-03	https://i.ytimg.com/vi/JGL-eQAAxGs/hqdefault.jpg
8108	Lake Street Dive: Tiny Desk Concert	https://www.youtube.com/watch?v=gdRAcoD5Gt0	Lake Street Dive	NORMAL	2016-02-29	https://i.ytimg.com/vi/gdRAcoD5Gt0/hqdefault.jpg
8109	Brushy One String: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=rFtP7Xc_Fbo	Brushy One String	NORMAL	2016-02-26	https://i.ytimg.com/vi/rFtP7Xc_Fbo/hqdefault.jpg
8110	Behind The Scenes At The Tiny Desk in 360╦Ü: Wilco	https://www.youtube.com/watch?v=R2osJjSNxTE	Behind The Scenes At The Tiny Desk in 360╦Ü	NORMAL	2016-02-25	https://i.ytimg.com/vi/R2osJjSNxTE/hqdefault.jpg
8111	Wilco: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=KMQQqa21ZVs	Wilco	NORMAL	2016-02-23	https://i.ytimg.com/vi/KMQQqa21ZVs/hqdefault.jpg
8112	Ben Folds: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=VNMms_zGbnI	Ben Folds	NORMAL	2016-02-16	https://i.ytimg.com/vi/VNMms_zGbnI/hqdefault.jpg
8113	Chelsea Wolfe: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=jiNvJKF-pks	Chelsea Wolfe	NORMAL	2016-02-11	https://i.ytimg.com/vi/jiNvJKF-pks/hqdefault.jpg
8114	Car Seat Headrest: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=RZZHTVr-r-g	Car Seat Headrest	NORMAL	2016-02-08	https://i.ytimg.com/vi/RZZHTVr-r-g/hqdefault.jpg
8115	EL VY: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=C5EjS_ZEE_I	EL VY	NORMAL	2016-01-28	https://i.ytimg.com/vi/C5EjS_ZEE_I/hqdefault.jpg
8116	The Arcs: NPR Tiny Desk Concert	https://www.youtube.com/watch?v=4W0f7FmcJyg	The Arcs	NORMAL	2016-01-25	https://i.ytimg.com/vi/4W0f7FmcJyg/hqdefault.jpg
8117	Wolf Alice: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=nYN2SDjnNW8	Wolf Alice	NORMAL	2016-01-25	https://i.ytimg.com/vi/nYN2SDjnNW8/hqdefault.jpg
8118	River Whyless: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=Iyzf1EKNyno	River Whyless	NORMAL	2016-01-19	https://i.ytimg.com/vi/Iyzf1EKNyno/hqdefault.jpg
8119	Benny Sings: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=9jVn_JCjpT4	Benny Sings	NORMAL	2016-01-15	https://i.ytimg.com/vi/9jVn_JCjpT4/hqdefault.jpg
8120	Natalie Merchant: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=iOdsAE8Mq7I	Natalie Merchant	NORMAL	2016-01-12	https://i.ytimg.com/vi/iOdsAE8Mq7I/hqdefault.jpg
8121	Mariachi Flor De Toloache: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=-rl26QKPHtE	Mariachi Flor De Toloache	NORMAL	2016-01-11	https://i.ytimg.com/vi/-rl26QKPHtE/hqdefault.jpg
8122	Rapsody: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=7d2mC9zDkKE	Rapsody	NORMAL	2016-01-05	https://i.ytimg.com/vi/7d2mC9zDkKE/hqdefault.jpg
8123	Sharon Jones & The Dap-Kings: Tiny Desk Concert	https://www.youtube.com/watch?v=iRENaUQc5No	Sharon Jones & The Dap-Kings	NORMAL	2015-12-21	https://i.ytimg.com/vi/iRENaUQc5No/hqdefault.jpg
8124	Son Little: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=q9xLciMB1RA	Son Little	NORMAL	2015-12-21	https://i.ytimg.com/vi/q9xLciMB1RA/hqdefault.jpg
8125	Shakey Graves: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=TtYtyz8KE74	Shakey Graves	NORMAL	2015-12-15	https://i.ytimg.com/vi/TtYtyz8KE74/hqdefault.jpg
8126	Land Lines: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=p8cHEKNu1V4	Land Lines	NORMAL	2015-12-11	https://i.ytimg.com/vi/p8cHEKNu1V4/hqdefault.jpg
8127	Sharon Jones & The Dap Kings, '8 Days (Of Hanukkah)' (Tiny Desk Version)	https://www.youtube.com/watch?v=PSzo2bbvnTQ	Sharon Jones & The Dap Kings, '8 Days (Of Hanukkah)' (Tiny Desk Version)	NORMAL	2015-12-10	https://i.ytimg.com/vi/PSzo2bbvnTQ/hqdefault.jpg
8128	The Oh Hellos: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=rwvCEWWWt7Q	The Oh Hellos	NORMAL	2015-12-07	https://i.ytimg.com/vi/rwvCEWWWt7Q/hqdefault.jpg
8129	Protomartyr: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=bEeCz5scUZs	Protomartyr	NORMAL	2015-12-04	https://i.ytimg.com/vi/bEeCz5scUZs/hqdefault.jpg
8130	Teddy Abrams: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=A4CnP6RPugo	Teddy Abrams	NORMAL	2015-11-25	https://i.ytimg.com/vi/A4CnP6RPugo/hqdefault.jpg
8131	Youth Lagoon NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=20XhDSMmalA	Youth Lagoon NPR Music Tiny Desk Concert	NORMAL	2015-11-23	https://i.ytimg.com/vi/20XhDSMmalA/hqdefault.jpg
8132	The Wild Reeds: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=0TiEO149Ydc	The Wild Reeds	NORMAL	2015-11-20	https://i.ytimg.com/vi/0TiEO149Ydc/hqdefault.jpg
8133	Nathaniel Rateliff & The Night Sweats: NPR Music Tiny Desk Concerts	https://www.youtube.com/watch?v=8KUV2TFTpGo	Nathaniel Rateliff & The Night Sweats	NORMAL	2015-11-16	https://i.ytimg.com/vi/8KUV2TFTpGo/hqdefault.jpg
8134	Rahim AlHaj NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=osf1gckzf70	Rahim AlHaj NPR Music Tiny Desk Concert	NORMAL	2015-11-12	https://i.ytimg.com/vi/osf1gckzf70/hqdefault.jpg
8135	My Bubba: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=uzzVdi3HOfU	My Bubba	NORMAL	2015-11-12	https://i.ytimg.com/vi/uzzVdi3HOfU/hqdefault.jpg
8136	Aurora: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=evBgLWQwAFA	Aurora	NORMAL	2015-11-09	https://i.ytimg.com/vi/evBgLWQwAFA/hqdefault.jpg
8137	Diane Coffee: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=nRnPD-KW-0M	Diane Coffee	NORMAL	2015-11-02	https://i.ytimg.com/vi/nRnPD-KW-0M/hqdefault.jpg
8138	The Suffers: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=RM3hj-6F1pk	The Suffers	NORMAL	2015-10-27	https://i.ytimg.com/vi/RM3hj-6F1pk/hqdefault.jpg
8139	Beauty Pill: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=Q-AJMUh2_Ug	Beauty Pill	NORMAL	2015-10-22	https://i.ytimg.com/vi/Q-AJMUh2_Ug/hqdefault.jpg
8140	Paolo Angeli: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=A805D9CVAr0	Paolo Angeli	NORMAL	2015-10-20	https://i.ytimg.com/vi/A805D9CVAr0/hqdefault.jpg
8141	Christian Scott aTunde Adjuah: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=mVJjmyFfuts	Christian Scott aTunde Adjuah	NORMAL	2015-10-20	https://i.ytimg.com/vi/mVJjmyFfuts/hqdefault.jpg
8142	Oh Pep!: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=yhSjdfE07u8	Oh Pep!	NORMAL	2015-10-16	https://i.ytimg.com/vi/yhSjdfE07u8/hqdefault.jpg
8143	Andra Day: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=W3MaEAhXESs	Andra Day	NORMAL	2015-10-13	https://i.ytimg.com/vi/W3MaEAhXESs/hqdefault.jpg
8144	Deqn Sue: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=GeZ_gq7DdsY	Deqn Sue	NORMAL	2015-10-05	https://i.ytimg.com/vi/GeZ_gq7DdsY/hqdefault.jpg
8145	Lianne La Havas: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=9HUV5a7MgS4	Lianne La Havas	NORMAL	2015-10-02	https://i.ytimg.com/vi/9HUV5a7MgS4/hqdefault.jpg
8146	The Internet: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=F6j49uzPugA	The Internet	NORMAL	2015-09-28	https://i.ytimg.com/vi/F6j49uzPugA/hqdefault.jpg
8147	Joan Shelley: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=VATGBUBkrUc	Joan Shelley	NORMAL	2015-09-24	https://i.ytimg.com/vi/VATGBUBkrUc/hqdefault.jpg
8148	Gina Chavez: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=sRZi4QQEGBI	Gina Chavez	NORMAL	2015-09-21	https://i.ytimg.com/vi/sRZi4QQEGBI/hqdefault.jpg
8149	Watkins Family Hour: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=qQ4PZVj66ac	Watkins Family Hour	NORMAL	2015-09-18	https://i.ytimg.com/vi/qQ4PZVj66ac/hqdefault.jpg
8150	Chris Stapleton: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=YcHL0kUFPhw	Chris Stapleton	NORMAL	2015-09-14	https://i.ytimg.com/vi/YcHL0kUFPhw/hqdefault.jpg
8151	Sam Lee: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=x1mSr92dBfg	Sam Lee	NORMAL	2015-09-10	https://i.ytimg.com/vi/x1mSr92dBfg/hqdefault.jpg
8152	Leon Bridges: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=C_oACPWGvM4	Leon Bridges	NORMAL	2015-09-08	https://i.ytimg.com/vi/C_oACPWGvM4/hqdefault.jpg
8153	Happyness: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=Y-8cvt3y-NM	Happyness	NORMAL	2015-09-03	https://i.ytimg.com/vi/Y-8cvt3y-NM/hqdefault.jpg
8154	Mitski: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=0lNFHD0lUAQ	Mitski	NORMAL	2015-08-31	https://i.ytimg.com/vi/0lNFHD0lUAQ/hqdefault.jpg
8155	Eskimeaux: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=Xmal7_hGOz0	Eskimeaux	NORMAL	2015-08-28	https://i.ytimg.com/vi/Xmal7_hGOz0/hqdefault.jpg
8156	Caroline Rose: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=EnYBuPmwXuc	Caroline Rose	NORMAL	2015-08-24	https://i.ytimg.com/vi/EnYBuPmwXuc/hqdefault.jpg
8157	Son Lux: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=7R35_SvWFKY	Son Lux	NORMAL	2015-08-21	https://i.ytimg.com/vi/7R35_SvWFKY/hqdefault.jpg
8158	Restorations: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=w1hiwVawMb4	Restorations	NORMAL	2015-08-13	https://i.ytimg.com/vi/w1hiwVawMb4/hqdefault.jpg
8159	Torres: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=Q4awAmiZj50	Torres	NORMAL	2015-08-10	https://i.ytimg.com/vi/Q4awAmiZj50/hqdefault.jpg
8160	Terence Blanchard: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=hNw5kna518E	Terence Blanchard	NORMAL	2015-08-07	https://i.ytimg.com/vi/hNw5kna518E/hqdefault.jpg
8161	SOAK: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=saT8AUI7RyU	SOAK	NORMAL	2015-07-31	https://i.ytimg.com/vi/saT8AUI7RyU/hqdefault.jpg
8162	Shamir: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=2fIJPxCjlPk	Shamir	NORMAL	2015-07-30	https://i.ytimg.com/vi/2fIJPxCjlPk/hqdefault.jpg
8163	Paul Weller: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=HaVsSRXBH78	Paul Weller	NORMAL	2015-07-27	https://i.ytimg.com/vi/HaVsSRXBH78/hqdefault.jpg
8164	Kate Tempest: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=Xqd86is7y54	Kate Tempest	NORMAL	2015-07-20	https://i.ytimg.com/vi/Xqd86is7y54/hqdefault.jpg
8165	Songhoy Blues: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=pCGUsORIHhM	Songhoy Blues	NORMAL	2015-07-17	https://i.ytimg.com/vi/pCGUsORIHhM/hqdefault.jpg
8166	Girlpool: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=VNM8Tg9pvDU	Girlpool	NORMAL	2015-07-09	https://i.ytimg.com/vi/VNM8Tg9pvDU/hqdefault.jpg
8167	Christopher Paul Stelling: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=Sn9aOq9aJ3w	Christopher Paul Stelling	NORMAL	2015-07-07	https://i.ytimg.com/vi/Sn9aOq9aJ3w/hqdefault.jpg
8168	And The Kids: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=qM1Mtz35bmU	And The Kids	NORMAL	2015-06-30	https://i.ytimg.com/vi/qM1Mtz35bmU/hqdefault.jpg
8169	Oddisee: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=88_jAJ-MduU	Oddisee	NORMAL	2015-06-26	https://i.ytimg.com/vi/88_jAJ-MduU/hqdefault.jpg
8170	Hop Along: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=iFGnkbZ3fLE	Hop Along	NORMAL	2015-06-22	https://i.ytimg.com/vi/iFGnkbZ3fLE/hqdefault.jpg
8171	Strand Of Oaks: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=6I7u1bcE_MM	Strand Of Oaks	NORMAL	2015-06-18	https://i.ytimg.com/vi/6I7u1bcE_MM/hqdefault.jpg
8172	The Prettiots: NPR Music Tiny Desk Concerts	https://www.youtube.com/watch?v=PtlDvF6f1sQ	The Prettiots	NORMAL	2015-06-15	https://i.ytimg.com/vi/PtlDvF6f1sQ/hqdefault.jpg
8173	Anna & Elizabeth: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=mA3Qw3KiEtk	Anna & Elizabeth	NORMAL	2015-06-05	https://i.ytimg.com/vi/mA3Qw3KiEtk/hqdefault.jpg
8174	Genevieve: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=EZ4Hum70sTk	Genevieve	NORMAL	2015-06-02	https://i.ytimg.com/vi/EZ4Hum70sTk/hqdefault.jpg
8175	Frank Fairfield: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=4-v1CKP4khE	Frank Fairfield	NORMAL	2015-05-31	https://i.ytimg.com/vi/4-v1CKP4khE/hqdefault.jpg
8176	Madisen Ward And The Mama Bear: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=k0nyFpcQl-Y	Madisen Ward And The Mama Bear	NORMAL	2015-05-28	https://i.ytimg.com/vi/k0nyFpcQl-Y/hqdefault.jpg
8177	Jason Vieaux And Yolanda Kondonassis: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=v-xghWkpqmU	Jason Vieaux And Yolanda Kondonassis	NORMAL	2015-05-26	https://i.ytimg.com/vi/v-xghWkpqmU/hqdefault.jpg
8178	Young Fathers: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=HGQzhcEOl4M	Young Fathers	NORMAL	2015-05-19	https://i.ytimg.com/vi/HGQzhcEOl4M/hqdefault.jpg
8179	Caman├®: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=BDUwGCHA2b0	Caman├®	NORMAL	2015-05-14	https://i.ytimg.com/vi/BDUwGCHA2b0/hqdefault.jpg
8180	Bellows: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=6e3bV26nRF0	Bellows	NORMAL	2015-05-11	https://i.ytimg.com/vi/6e3bV26nRF0/hqdefault.jpg
8181	Eskmo: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=j-Oc7NQqEjI	Eskmo	NORMAL	2015-05-08	https://i.ytimg.com/vi/j-Oc7NQqEjI/hqdefault.jpg
8182	Vijay Iyer Trio: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=SiDBiIsFiqU	Vijay Iyer Trio	NORMAL	2015-05-04	https://i.ytimg.com/vi/SiDBiIsFiqU/hqdefault.jpg
8183	Diego El Cigala: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=-Q9uIhuvUKc	Diego El Cigala	NORMAL	2015-05-01	https://i.ytimg.com/vi/-Q9uIhuvUKc/hqdefault.jpg
8184	Jos├® Gonz├ílez: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=Ag-OIlEN00M	Jos├® Gonz├ílez	NORMAL	2015-04-29	https://i.ytimg.com/vi/Ag-OIlEN00M/hqdefault.jpg
8185	DakhaBrakha: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=hsNKSbTNd5I	DakhaBrakha	NORMAL	2015-04-25	https://i.ytimg.com/vi/hsNKSbTNd5I/hqdefault.jpg
8186	Jessie Ware: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=YJ-efUsAhc8	Jessie Ware	NORMAL	2015-04-21	https://i.ytimg.com/vi/YJ-efUsAhc8/hqdefault.jpg
8187	Rosa D├¡az: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=a86HDx0h768	Rosa D├¡az	NORMAL	2015-04-20	https://i.ytimg.com/vi/a86HDx0h768/hqdefault.jpg
8188	Chadwick Stokes: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=29ZbS5ItylM	Chadwick Stokes	NORMAL	2015-04-14	https://i.ytimg.com/vi/29ZbS5ItylM/hqdefault.jpg
8189	Beach Slang: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=FA1TsteS7z0	Beach Slang	NORMAL	2015-04-10	https://i.ytimg.com/vi/FA1TsteS7z0/hqdefault.jpg
8190	Death Cab For Cutie: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=mi6uRT7PxTQ	Death Cab For Cutie	NORMAL	2015-04-07	https://i.ytimg.com/vi/mi6uRT7PxTQ/hqdefault.jpg
8191	Sylvan Esso: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=mhyD2qchkEw	Sylvan Esso	NORMAL	2015-03-30	https://i.ytimg.com/vi/mhyD2qchkEw/hqdefault.jpg
8192	Anonymous 4 With Bruce Molsky: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=RWQChDfEJpI	Anonymous 4 With Bruce Molsky	NORMAL	2015-03-30	https://i.ytimg.com/vi/RWQChDfEJpI/hqdefault.jpg
8193	Punch Brothers: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=iXE_K2Kpoqc	Punch Brothers	NORMAL	2015-03-16	https://i.ytimg.com/vi/iXE_K2Kpoqc/hqdefault.jpg
8194	Matt Haimovitz & Christopher O'Riley: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=KPw-UZBnOO0	Matt Haimovitz & Christopher O'Riley	NORMAL	2015-03-16	https://i.ytimg.com/vi/KPw-UZBnOO0/hqdefault.jpg
8195	Aurelio Martinez: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=iNqkT54EDBM	Aurelio Martinez	NORMAL	2015-03-10	https://i.ytimg.com/vi/iNqkT54EDBM/hqdefault.jpg
8196	Fantastic Negrito: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=ymYjwsFz8iM	Fantastic Negrito	NORMAL	2015-03-09	https://i.ytimg.com/vi/ymYjwsFz8iM/hqdefault.jpg
8197	Phox: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=INcwU-Xk0M4	Phox	NORMAL	2015-03-02	https://i.ytimg.com/vi/INcwU-Xk0M4/hqdefault.jpg
8198	Dan Deacon: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=heFRwLfjVXI	Dan Deacon	NORMAL	2015-02-26	https://i.ytimg.com/vi/heFRwLfjVXI/hqdefault.jpg
8199	Zola Jesus: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=fMiIZC8EFsI	Zola Jesus	NORMAL	2015-02-24	https://i.ytimg.com/vi/fMiIZC8EFsI/hqdefault.jpg
8200	Until The Ribbon Breaks: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=tQ8a6hBoiFQ	Until The Ribbon Breaks	NORMAL	2015-02-19	https://i.ytimg.com/vi/tQ8a6hBoiFQ/hqdefault.jpg
8201	Mucca Pazza: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=Zw7DfFVga5Y	Mucca Pazza	NORMAL	2015-02-10	https://i.ytimg.com/vi/Zw7DfFVga5Y/hqdefault.jpg
8202	John Reilly & Friends: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=f2rkstacMlg	John Reilly & Friends	NORMAL	2015-02-04	https://i.ytimg.com/vi/f2rkstacMlg/hqdefault.jpg
8203	Bobby Bare Jr.: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=QiR3qnG4Bf0	Bobby Bare Jr.	NORMAL	2015-01-27	https://i.ytimg.com/vi/QiR3qnG4Bf0/hqdefault.jpg
8204	Rubblebucket: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=OEVpAefIrU0	Rubblebucket	NORMAL	2015-01-21	https://i.ytimg.com/vi/OEVpAefIrU0/hqdefault.jpg
8205	Daniel Lanois: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=KUnUv_395vY	Daniel Lanois	NORMAL	2015-01-14	https://i.ytimg.com/vi/KUnUv_395vY/hqdefault.jpg
8206	Trey Anastasio: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=dYOXPzcoPeA	Trey Anastasio	NORMAL	2015-01-08	https://i.ytimg.com/vi/dYOXPzcoPeA/hqdefault.jpg
8207	HMSTR: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=4bFlkyWkhqA	HMSTR	NORMAL	2014-12-24	https://i.ytimg.com/vi/4bFlkyWkhqA/hqdefault.jpg
8208	Lucinda Williams: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=mTu4cXW9H_Q	Lucinda Williams	NORMAL	2014-12-22	https://i.ytimg.com/vi/mTu4cXW9H_Q/hqdefault.jpg
8209	Yusuf/Cat Stevens: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=FoPoI1IwcTw	Yusuf/Cat Stevens	NORMAL	2014-12-15	https://i.ytimg.com/vi/FoPoI1IwcTw/hqdefault.jpg
8210	Dublin Guitar Quartet: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=8Lh1IWgUvpU	Dublin Guitar Quartet	NORMAL	2014-12-08	https://i.ytimg.com/vi/8Lh1IWgUvpU/hqdefault.jpg
8211	St. Paul And The Broken Bones: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=6vpXX5BjltM	St. Paul And The Broken Bones	NORMAL	2014-12-06	https://i.ytimg.com/vi/6vpXX5BjltM/hqdefault.jpg
8212	Sam Amidon & Bill Frisell: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=Fw2X9dMtDmc	Sam Amidon & Bill Frisell	NORMAL	2014-12-02	https://i.ytimg.com/vi/Fw2X9dMtDmc/hqdefault.jpg
8213	Pat Benatar & Neil Giraldo: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=yxteG1thK5I	Pat Benatar & Neil Giraldo	NORMAL	2014-11-25	https://i.ytimg.com/vi/yxteG1thK5I/hqdefault.jpg
8214	J Mascis: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=ubSZKWXyu04	J Mascis	NORMAL	2014-11-24	https://i.ytimg.com/vi/ubSZKWXyu04/hqdefault.jpg
8215	Dav├¡d Garza: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=JPcqESmvTTY	Dav├¡d Garza	NORMAL	2014-11-18	https://i.ytimg.com/vi/JPcqESmvTTY/hqdefault.jpg
8216	Roomful Of Teeth: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=iKuFujJq6zU	Roomful Of Teeth	NORMAL	2014-11-12	https://i.ytimg.com/vi/iKuFujJq6zU/hqdefault.jpg
8217	Making Movies: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=-jWBOgn8xJQ	Making Movies	NORMAL	2014-11-10	https://i.ytimg.com/vi/-jWBOgn8xJQ/hqdefault.jpg
8218	Sun Ra Arkestra: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=H1ToFXHW5pg	Sun Ra Arkestra	NORMAL	2022-10-26	https://i.ytimg.com/vi/H1ToFXHW5pg/hqdefault.jpg
8219	Banks: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=AbwPwWqA-QQ	Banks	NORMAL	2014-11-04	https://i.ytimg.com/vi/AbwPwWqA-QQ/hqdefault.jpg
8220	Danish String Quartet: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=cfuEIHEZobc	Danish String Quartet	NORMAL	2014-11-04	https://i.ytimg.com/vi/cfuEIHEZobc/hqdefault.jpg
8221	T-Pain: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=CIjXUg1s5gc	T-Pain	NORMAL	2014-10-29	https://i.ytimg.com/vi/CIjXUg1s5gc/hqdefault.jpg
8222	Anthony D'Amato: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=LiGTTICtewQ	Anthony D'Amato	NORMAL	2014-10-20	https://i.ytimg.com/vi/LiGTTICtewQ/hqdefault.jpg
8223	├üsgeir: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=gxlA6JB3Z6w	├üsgeir	NORMAL	2014-10-20	https://i.ytimg.com/vi/gxlA6JB3Z6w/hqdefault.jpg
8224	The Bots: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=LAAY4eSmSZs	The Bots	NORMAL	2014-10-14	https://i.ytimg.com/vi/LAAY4eSmSZs/hqdefault.jpg
8225	Raquel Sofia: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=B6DLS5tahlM	Raquel Sofia	NORMAL	2014-10-14	https://i.ytimg.com/vi/B6DLS5tahlM/hqdefault.jpg
8226	Jackson Browne: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=11HHue911Tg	Jackson Browne	NORMAL	2014-10-07	https://i.ytimg.com/vi/11HHue911Tg/hqdefault.jpg
8227	Ryan Keberle & Catharsis: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=cU7ClSwoTp4	Ryan Keberle & Catharsis	NORMAL	2014-10-07	https://i.ytimg.com/vi/cU7ClSwoTp4/hqdefault.jpg
8228	Bio Ritmo: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=n_4EMO8e-1Y	Bio Ritmo	NORMAL	2014-09-29	https://i.ytimg.com/vi/n_4EMO8e-1Y/hqdefault.jpg
8229	Tweedy: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=iH7j8ZzW8QY	Tweedy	NORMAL	2014-09-22	https://i.ytimg.com/vi/iH7j8ZzW8QY/hqdefault.jpg
8230	Luluc: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=c8a-7Yv3ktk	Luluc	NORMAL	2014-09-11	https://i.ytimg.com/vi/c8a-7Yv3ktk/hqdefault.jpg
8231	Justin Townes Earle: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=lnOHHywkTCs	Justin Townes Earle	NORMAL	2014-09-08	https://i.ytimg.com/vi/lnOHHywkTCs/hqdefault.jpg
8232	Jessica Lea Mayfield: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=0kgySblHsVI	Jessica Lea Mayfield	NORMAL	2014-09-08	https://i.ytimg.com/vi/0kgySblHsVI/hqdefault.jpg
8233	Trampled By Turtles: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=PcoPedyXJVc	Trampled By Turtles	NORMAL	2014-09-02	https://i.ytimg.com/vi/PcoPedyXJVc/hqdefault.jpg
8234	Sturgill Simpson: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=w5cMqD0WqYE	Sturgill Simpson	NORMAL	2014-08-29	https://i.ytimg.com/vi/w5cMqD0WqYE/hqdefault.jpg
8235	Nickel Creek: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=jFycqnOpifQ	Nickel Creek	NORMAL	2014-08-25	https://i.ytimg.com/vi/jFycqnOpifQ/hqdefault.jpg
8236	Rodrigo Amarante: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=ppDcuEyNoIU	Rodrigo Amarante	NORMAL	2014-08-22	https://i.ytimg.com/vi/ppDcuEyNoIU/hqdefault.jpg
8237	Pacifica Quartet: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=v57WNW-JsgY	Pacifica Quartet	NORMAL	2014-08-15	https://i.ytimg.com/vi/v57WNW-JsgY/hqdefault.jpg
8238	Ernest Ranglin: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=CsbWsKvyQTU	Ernest Ranglin	NORMAL	2014-08-18	https://i.ytimg.com/vi/CsbWsKvyQTU/hqdefault.jpg
8239	Bob Mould: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=JROLUd6uRhA	Bob Mould	NORMAL	2014-08-08	https://i.ytimg.com/vi/JROLUd6uRhA/hqdefault.jpg
8240	Irene Diaz: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=KhpxH2QZ0-Q	Irene Diaz	NORMAL	2014-08-08	https://i.ytimg.com/vi/KhpxH2QZ0-Q/hqdefault.jpg
8241	The Family Crest: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=3OTnUlUox-U	The Family Crest	NORMAL	2014-07-31	https://i.ytimg.com/vi/3OTnUlUox-U/hqdefault.jpg
8242	Quetzal: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=uu5laJPLn7g	Quetzal	NORMAL	2014-07-31	https://i.ytimg.com/vi/uu5laJPLn7g/hqdefault.jpg
8243	Saintseneca: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=X8hnp9M4JCo	Saintseneca	NORMAL	2014-07-29	https://i.ytimg.com/vi/X8hnp9M4JCo/hqdefault.jpg
8244	Highasakite: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=taEcgisSiNs	Highasakite	NORMAL	2014-07-25	https://i.ytimg.com/vi/taEcgisSiNs/hqdefault.jpg
8245	Hamilton Leithauser: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=iPJlmxnjnOc	Hamilton Leithauser	NORMAL	2014-07-21	https://i.ytimg.com/vi/iPJlmxnjnOc/hqdefault.jpg
8246	Marisa Anderson: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=2JiLsYfbWD8	Marisa Anderson	NORMAL	2014-07-18	https://i.ytimg.com/vi/2JiLsYfbWD8/hqdefault.jpg
8247	Holly Williams: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=3h8Y3cZi66Y	Holly Williams	NORMAL	2014-07-14	https://i.ytimg.com/vi/3h8Y3cZi66Y/hqdefault.jpg
8248	John Grant: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=YYdAE6a0ZH0	John Grant	NORMAL	2014-07-11	https://i.ytimg.com/vi/YYdAE6a0ZH0/hqdefault.jpg
8249	Moon Hooch: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=wwBhxBBa7tE	Moon Hooch	NORMAL	2014-07-07	https://i.ytimg.com/vi/wwBhxBBa7tE/hqdefault.jpg
8250	The Foreign Exchange: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=Bnq9rz8SHC0	The Foreign Exchange	NORMAL	2014-07-03	https://i.ytimg.com/vi/Bnq9rz8SHC0/hqdefault.jpg
8251	Lydia Loveless: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=3XyKhTwk9X8	Lydia Loveless	NORMAL	2014-07-01	https://i.ytimg.com/vi/3XyKhTwk9X8/hqdefault.jpg
8252	Tracy Silverman: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=vDcs3N__VJc	Tracy Silverman	NORMAL	2014-07-01	https://i.ytimg.com/vi/vDcs3N__VJc/hqdefault.jpg
8253	Conor Oberst: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=NIfTCmwgIbY	Conor Oberst	NORMAL	2014-06-23	https://i.ytimg.com/vi/NIfTCmwgIbY/hqdefault.jpg
8254	Mali Music: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=xm6Bf7dkp6E	Mali Music	NORMAL	2014-06-20	https://i.ytimg.com/vi/xm6Bf7dkp6E/hqdefault.jpg
8255	Rodney Crowell: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=KjqQLTCU5fU	Rodney Crowell	NORMAL	2014-06-10	https://i.ytimg.com/vi/KjqQLTCU5fU/hqdefault.jpg
8256	Eliot Fisk & Paco Pe├▒a: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=PDdudDaWdqY	Eliot Fisk & Paco Pe├▒a	NORMAL	2014-06-16	https://i.ytimg.com/vi/PDdudDaWdqY/hqdefault.jpg
8257	Marian McLaughlin: NPR Tiny Desk Concert	https://www.youtube.com/watch?v=f3Y55KWAhjs	Marian McLaughlin	NORMAL	2014-06-05	https://i.ytimg.com/vi/f3Y55KWAhjs/hqdefault.jpg
8258	Simone Dinnerstein: NPR Tiny Desk Concert	https://www.youtube.com/watch?v=HbMXaZrdcNY	Simone Dinnerstein	NORMAL	2014-06-04	https://i.ytimg.com/vi/HbMXaZrdcNY/hqdefault.jpg
8259	Juana Molina: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=he-eAyHRfFg	Juana Molina	NORMAL	2014-06-02	https://i.ytimg.com/vi/he-eAyHRfFg/hqdefault.jpg
8260	Hozier: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=oLgZo6Qi3Uo	Hozier	NORMAL	2014-05-28	https://i.ytimg.com/vi/oLgZo6Qi3Uo/hqdefault.jpg
8261	Yasmine Hamdan: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=TylWetspLXg	Yasmine Hamdan	NORMAL	2014-05-28	https://i.ytimg.com/vi/TylWetspLXg/hqdefault.jpg
8262	Ages And Ages: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=PwEFg6xEVR8	Ages And Ages	NORMAL	2022-10-26	https://i.ytimg.com/vi/PwEFg6xEVR8/hqdefault.jpg
8263	Iestyn Davies: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=YuwvUoD3Og8	Iestyn Davies	NORMAL	2014-05-19	https://i.ytimg.com/vi/YuwvUoD3Og8/hqdefault.jpg
8264	Chvrches: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=haunJARHPm4	Chvrches	NORMAL	2014-05-12	https://i.ytimg.com/vi/haunJARHPm4/hqdefault.jpg
8265	Timber Timbre: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=cSl4AZNwI94	Timber Timbre	NORMAL	2014-05-12	https://i.ytimg.com/vi/cSl4AZNwI94/hqdefault.jpg
8266	Public Service Broadcasting: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=UuSpXmGYw3c	Public Service Broadcasting	NORMAL	2014-05-05	https://i.ytimg.com/vi/UuSpXmGYw3c/hqdefault.jpg
8267	Cian Nugent: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=YVzjKyzX8kA	Cian Nugent	NORMAL	2014-05-05	https://i.ytimg.com/vi/YVzjKyzX8kA/hqdefault.jpg
8268	Johnnyswim: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=l0f6KGsrt-4	Johnnyswim	NORMAL	2014-04-28	https://i.ytimg.com/vi/l0f6KGsrt-4/hqdefault.jpg
8269	Quilt: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=TQ0qy5isP6A	Quilt	NORMAL	2014-04-25	https://i.ytimg.com/vi/TQ0qy5isP6A/hqdefault.jpg
8270	Federico Aubele: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=1lc8mAiOUPA	Federico Aubele	NORMAL	2014-04-21	https://i.ytimg.com/vi/1lc8mAiOUPA/hqdefault.jpg
8271	Usman Riaz: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=_Qd6hYjR3j8	Usman Riaz	NORMAL	2014-04-21	https://i.ytimg.com/vi/_Qd6hYjR3j8/hqdefault.jpg
8272	Courtney Barnett: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=Xv-FOSJIwrU	Courtney Barnett	NORMAL	2014-04-14	https://i.ytimg.com/vi/Xv-FOSJIwrU/hqdefault.jpg
8273	Tom Brosseau: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=Pd2wNvTlfE0	Tom Brosseau	NORMAL	2014-04-14	https://i.ytimg.com/vi/Pd2wNvTlfE0/hqdefault.jpg
8274	The Both: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=nivz7x_TMK4	The Both	NORMAL	2014-04-14	https://i.ytimg.com/vi/nivz7x_TMK4/hqdefault.jpg
8275	The Haden Triplets: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=7NBTwmjqUrY	The Haden Triplets	NORMAL	2014-03-31	https://i.ytimg.com/vi/7NBTwmjqUrY/hqdefault.jpg
8276	Joseph Calleja: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=b9sBFoufLd8	Joseph Calleja	NORMAL	2014-03-24	https://i.ytimg.com/vi/b9sBFoufLd8/hqdefault.jpg
8277	Diane Cluck: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=SyETsd-rKP8	Diane Cluck	NORMAL	2014-03-19	https://i.ytimg.com/vi/SyETsd-rKP8/hqdefault.jpg
8278	Jake Bugg: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=jfHxncKnUuQ	Jake Bugg	NORMAL	2014-03-11	https://i.ytimg.com/vi/jfHxncKnUuQ/hqdefault.jpg
8279	Lowland Hum: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=l9coJQW9f4E	Lowland Hum	NORMAL	2014-03-11	https://i.ytimg.com/vi/l9coJQW9f4E/hqdefault.jpg
8280	Asaf Avidan: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=JRVDNBCdMFM	Asaf Avidan	NORMAL	2014-03-04	https://i.ytimg.com/vi/JRVDNBCdMFM/hqdefault.jpg
8281	Brass Bed: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=e8IyZHwtsc0	Brass Bed	NORMAL	2014-02-21	https://i.ytimg.com/vi/e8IyZHwtsc0/hqdefault.jpg
8282	Sofia Rei: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=eKSjxfYbxzc	Sofia Rei	NORMAL	2021-11-17	https://i.ytimg.com/vi/eKSjxfYbxzc/hqdefault.jpg
8283	Cate Le Bon: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=PFEhLCP6jzs	Cate Le Bon	NORMAL	2014-02-19	https://i.ytimg.com/vi/PFEhLCP6jzs/hqdefault.jpg
8284	Suzanne Vega: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=AndEMO__p2U	Suzanne Vega	NORMAL	2014-02-11	https://i.ytimg.com/vi/AndEMO__p2U/hqdefault.jpg
8285	Fanfare Ciocarlia: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=2mHFjJszcpU	Fanfare Ciocarlia	NORMAL	2014-02-04	https://i.ytimg.com/vi/2mHFjJszcpU/hqdefault.jpg
8286	Pixies: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=OcFHOGZ-6aM	Pixies	NORMAL	2014-02-04	https://i.ytimg.com/vi/OcFHOGZ-6aM/hqdefault.jpg
8287	Angel Olsen: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=G7NapIZ1xGE	Angel Olsen	NORMAL	2014-01-27	https://i.ytimg.com/vi/G7NapIZ1xGE/hqdefault.jpg
8288	Robert Glasper Experiment: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=oGTVoX7AaRc	Robert Glasper Experiment	NORMAL	2014-01-27	https://i.ytimg.com/vi/oGTVoX7AaRc/hqdefault.jpg
8289	Afro Blue: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=PF0yNKroigk	Afro Blue	NORMAL	2014-01-27	https://i.ytimg.com/vi/PF0yNKroigk/hqdefault.jpg
8290	Lily & Madeleine: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=8XxFbJcswQk	Lily & Madeleine	NORMAL	2014-01-27	https://i.ytimg.com/vi/8XxFbJcswQk/hqdefault.jpg
8291	Van-Anh Vanessa Vo: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=8y02Rv8sQzw	Van-Anh Vanessa Vo	NORMAL	2014-01-06	https://i.ytimg.com/vi/8y02Rv8sQzw/hqdefault.jpg
8292	Preservation Hall Jazz Band: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=iYqZg-YQWH0	Preservation Hall Jazz Band	NORMAL	2013-12-28	https://i.ytimg.com/vi/iYqZg-YQWH0/hqdefault.jpg
8293	La Santa Cecilia: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=iT3YnNdorCg	La Santa Cecilia	NORMAL	2013-12-18	https://i.ytimg.com/vi/iT3YnNdorCg/hqdefault.jpg
8294	Christine Salem: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=b2Eylm6_9_w	Christine Salem	NORMAL	2013-12-18	https://i.ytimg.com/vi/b2Eylm6_9_w/hqdefault.jpg
8295	Dessa: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=GwN-WixHkAw	Dessa	NORMAL	2013-12-10	https://i.ytimg.com/vi/GwN-WixHkAw/hqdefault.jpg
8296	Sarah Jarosz: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=VxpuB10FaSE	Sarah Jarosz	NORMAL	2013-12-10	https://i.ytimg.com/vi/VxpuB10FaSE/hqdefault.jpg
8297	The Dismemberment Plan: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=HnffuUtUkAA	The Dismemberment Plan	NORMAL	2013-12-03	https://i.ytimg.com/vi/HnffuUtUkAA/hqdefault.jpg
8298	Kronos Quartet: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=7PQYF4-BbrE	Kronos Quartet	NORMAL	2013-12-02	https://i.ytimg.com/vi/7PQYF4-BbrE/hqdefault.jpg
8299	Waxahatchee: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=3ZngH2T395A	Waxahatchee	NORMAL	2013-12-02	https://i.ytimg.com/vi/3ZngH2T395A/hqdefault.jpg
8300	John Legend: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=onQLAEEeta8	John Legend	NORMAL	2013-11-18	https://i.ytimg.com/vi/onQLAEEeta8/hqdefault.jpg
8301	Debashish Bhattacharya: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=q8WWNKhdy-w	Debashish Bhattacharya	NORMAL	2013-11-13	https://i.ytimg.com/vi/q8WWNKhdy-w/hqdefault.jpg
8302	Gary Burton: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=fXjfvEcAV6w	Gary Burton	NORMAL	2013-11-11	https://i.ytimg.com/vi/fXjfvEcAV6w/hqdefault.jpg
8303	Ashley Monroe: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=xoMzPhYYIsM	Ashley Monroe	NORMAL	2013-11-11	https://i.ytimg.com/vi/xoMzPhYYIsM/hqdefault.jpg
8304	Neko Case: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=FwRcPEg1MyE	Neko Case	NORMAL	2013-11-01	https://i.ytimg.com/vi/FwRcPEg1MyE/hqdefault.jpg
8305	Typhoon: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=nDdO60XcqPQ	Typhoon	NORMAL	2013-10-29	https://i.ytimg.com/vi/nDdO60XcqPQ/hqdefault.jpg
8306	San Fermin: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=2K9gjhbT7xs	San Fermin	NORMAL	2013-10-29	https://i.ytimg.com/vi/2K9gjhbT7xs/hqdefault.jpg
8307	Daughter: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=s-OoG1aGYO0	Daughter	NORMAL	2013-10-22	https://i.ytimg.com/vi/s-OoG1aGYO0/hqdefault.jpg
8308	Matt Ulery's Loom: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=Vs80WYJmVaw	Matt Ulery's Loom	NORMAL	2013-10-22	https://i.ytimg.com/vi/Vs80WYJmVaw/hqdefault.jpg
8309	Okkervil River: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=iGZzuAatKHI	Okkervil River	NORMAL	2013-10-22	https://i.ytimg.com/vi/iGZzuAatKHI/hqdefault.jpg
8310	Valerie June: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=iBDrTHCSWDc	Valerie June	NORMAL	2013-10-15	https://i.ytimg.com/vi/iBDrTHCSWDc/hqdefault.jpg
8311	Superchunk: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=Pvw42EIZxLU	Superchunk	NORMAL	2013-10-07	https://i.ytimg.com/vi/Pvw42EIZxLU/hqdefault.jpg
8312	Lawrence Brownlee: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=HNY2u53wUbU	Lawrence Brownlee	NORMAL	2013-10-07	https://i.ytimg.com/vi/HNY2u53wUbU/hqdefault.jpg
8313	Oliver "Tuku" Mtukudzi: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=11po9xKBsbw	Oliver "Tuku" Mtukudzi	NORMAL	2013-10-07	https://i.ytimg.com/vi/11po9xKBsbw/hqdefault.jpg
8314	Hem: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=Ma9X4_PKctk	Hem	NORMAL	2013-10-07	https://i.ytimg.com/vi/Ma9X4_PKctk/hqdefault.jpg
8315	Cristina Pato: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=TX8QPtpLOfA	Cristina Pato	NORMAL	2013-10-07	https://i.ytimg.com/vi/TX8QPtpLOfA/hqdefault.jpg
8316	Shovels & Rope: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=LbVD8k9qA6k	Shovels & Rope	NORMAL	2013-09-20	https://i.ytimg.com/vi/LbVD8k9qA6k/hqdefault.jpg
8317	Arturo O'Farrill: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=UhMRD7lw5zs	Arturo O'Farrill	NORMAL	2013-09-20	https://i.ytimg.com/vi/UhMRD7lw5zs/hqdefault.jpg
8318	The 1975: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=5bIlkpQRyTM	The 1975	NORMAL	2013-09-20	https://i.ytimg.com/vi/5bIlkpQRyTM/hqdefault.jpg
8319	Bombino: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=A7My5IpEzVM	Bombino	NORMAL	2013-07-18	https://i.ytimg.com/vi/A7My5IpEzVM/hqdefault.jpg
8320	Baths: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=gkYnVE5jsAo	Baths	NORMAL	2013-09-09	https://i.ytimg.com/vi/gkYnVE5jsAo/hqdefault.jpg
8321	Steve Gunn: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=2bMVMjOMRkU	Steve Gunn	NORMAL	2013-09-09	https://i.ytimg.com/vi/2bMVMjOMRkU/hqdefault.jpg
8322	Buika: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=-qryg2q3lUs	Buika	NORMAL	2013-08-26	https://i.ytimg.com/vi/-qryg2q3lUs/hqdefault.jpg
8323	The Front Bottoms: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=pc8U2VP92Vg	The Front Bottoms	NORMAL	2013-08-23	https://i.ytimg.com/vi/pc8U2VP92Vg/hqdefault.jpg
8324	Mother Falcon: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=JaoUMbHvsc0	Mother Falcon	NORMAL	2013-08-23	https://i.ytimg.com/vi/JaoUMbHvsc0/hqdefault.jpg
8325	Alpine: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=ukz2JXvGR5w	Alpine	NORMAL	2013-08-12	https://i.ytimg.com/vi/ukz2JXvGR5w/hqdefault.jpg
8326	Jim Guthrie: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=7_qK8l4tDog	Jim Guthrie	NORMAL	2013-08-12	https://i.ytimg.com/vi/7_qK8l4tDog/hqdefault.jpg
8327	Time For Three: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=34bgjdQRjIM	Time For Three	NORMAL	2013-08-06	https://i.ytimg.com/vi/34bgjdQRjIM/hqdefault.jpg
8328	Dana Falconberry: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=FowAzrMU0GU	Dana Falconberry	NORMAL	2013-07-18	https://i.ytimg.com/vi/FowAzrMU0GU/hqdefault.jpg
8329	Keaton Henson: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=RZNrWmf4xH0	Keaton Henson	NORMAL	2013-08-06	https://i.ytimg.com/vi/RZNrWmf4xH0/hqdefault.jpg
8330	Guards: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=2-1aLFQWOvs	Guards	NORMAL	2013-07-18	https://i.ytimg.com/vi/2-1aLFQWOvs/hqdefault.jpg
8331	Cheyenne Mize: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=fS9uUDslHso	Cheyenne Mize	NORMAL	2013-08-12	https://i.ytimg.com/vi/fS9uUDslHso/hqdefault.jpg
8332	Alice Russell: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=5xNy40dQCNQ	Alice Russell	NORMAL	2013-07-15	https://i.ytimg.com/vi/5xNy40dQCNQ/hqdefault.jpg
8333	Frank Turner: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=nF3U_t3yjic	Frank Turner	NORMAL	2013-07-15	https://i.ytimg.com/vi/nF3U_t3yjic/hqdefault.jpg
8334	Skinny Lister: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=WV0xX1hAJok	Skinny Lister	NORMAL	2013-07-08	https://i.ytimg.com/vi/WV0xX1hAJok/hqdefault.jpg
8335	Laura Mvula: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=eT5DJ33-Fbg	Laura Mvula	NORMAL	2013-07-08	https://i.ytimg.com/vi/eT5DJ33-Fbg/hqdefault.jpg
8336	Cheick Hamala Diabate: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=ykEnSrhinvs	Cheick Hamala Diabate	NORMAL	2013-07-05	https://i.ytimg.com/vi/ykEnSrhinvs/hqdefault.jpg
8337	Maya Beiser: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=UO0kGdxeQvU	Maya Beiser	NORMAL	2013-07-08	https://i.ytimg.com/vi/UO0kGdxeQvU/hqdefault.jpg
8338	Patty Griffin: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=B1gPVKJ7msI	Patty Griffin	NORMAL	2013-06-25	https://i.ytimg.com/vi/B1gPVKJ7msI/hqdefault.jpg
8339	Billy Bragg: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=q2OnQR6VMwU	Billy Bragg	NORMAL	2013-06-18	https://i.ytimg.com/vi/q2OnQR6VMwU/hqdefault.jpg
8340	No BS! Brass Band: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=MEjNggZsWow	No BS! Brass Band	NORMAL	2013-06-17	https://i.ytimg.com/vi/MEjNggZsWow/hqdefault.jpg
8341	The National: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=TdFCD3oXMZo	The National	NORMAL	2013-06-17	https://i.ytimg.com/vi/TdFCD3oXMZo/hqdefault.jpg
8342	OK Go: An NPR Tiny Desk Concert In 223 Takes	https://www.youtube.com/watch?v=Wm63LibDiFk	OK Go	NORMAL	2013-06-03	https://i.ytimg.com/vi/Wm63LibDiFk/hqdefault.jpg
8343	Mohammad Reza Shajarian: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=GnI4R9Bdl3g	Mohammad Reza Shajarian	NORMAL	2013-05-23	https://i.ytimg.com/vi/GnI4R9Bdl3g/hqdefault.jpg
8344	Buddy Miller & Jim Lauderdale: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=ggIwlQ5u0a4	Buddy Miller & Jim Lauderdale	NORMAL	2013-05-28	https://i.ytimg.com/vi/ggIwlQ5u0a4/hqdefault.jpg
8345	Nicola Benedetti: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=m1-Si874NWw	Nicola Benedetti	NORMAL	2013-05-06	https://i.ytimg.com/vi/m1-Si874NWw/hqdefault.jpg
8346	Father Figures: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=Z64OB3NiXFQ	Father Figures	NORMAL	2013-05-03	https://i.ytimg.com/vi/Z64OB3NiXFQ/hqdefault.jpg
8347	Omar Sosa & Paolo Fresu: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=RJMQkye_YTw	Omar Sosa & Paolo Fresu	NORMAL	2013-05-03	https://i.ytimg.com/vi/RJMQkye_YTw/hqdefault.jpg
8348	Efterklang: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=Gbjo5-lxzIs	Efterklang	NORMAL	2013-05-03	https://i.ytimg.com/vi/Gbjo5-lxzIs/hqdefault.jpg
8349	Martin Hayes & Dennis Cahill: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=o5hg3iuoJoM	Martin Hayes & Dennis Cahill	NORMAL	2013-05-03	https://i.ytimg.com/vi/o5hg3iuoJoM/hqdefault.jpg
8350	The Lone Bellow: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=zJyf5NqiMNE	The Lone Bellow	NORMAL	2013-05-03	https://i.ytimg.com/vi/zJyf5NqiMNE/hqdefault.jpg
8351	Mary Halvorson Quintet: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=xJwyBBcP51A	Mary Halvorson Quintet	NORMAL	2013-02-28	https://i.ytimg.com/vi/xJwyBBcP51A/hqdefault.jpg
8352	Night Beds: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=wlQEPlj5JAA	Night Beds	NORMAL	2013-02-28	https://i.ytimg.com/vi/wlQEPlj5JAA/hqdefault.jpg
8353	Cantus: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=6I0Dk8cdfCA	Cantus	NORMAL	2013-02-28	https://i.ytimg.com/vi/6I0Dk8cdfCA/hqdefault.jpg
8354	The xx: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=3-03z36Is6M	The xx	NORMAL	2013-02-18	https://i.ytimg.com/vi/3-03z36Is6M/hqdefault.jpg
8355	Of Montreal: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=_rf7Gw0mj7I	Of Montreal	NORMAL	2013-02-05	https://i.ytimg.com/vi/_rf7Gw0mj7I/hqdefault.jpg
8356	Black Prairie: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=0mzjL5147i4	Black Prairie	NORMAL	2013-02-05	https://i.ytimg.com/vi/0mzjL5147i4/hqdefault.jpg
8357	Lucius: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=8Pk_2dVPjms	Lucius	NORMAL	2013-01-07	https://i.ytimg.com/vi/8Pk_2dVPjms/hqdefault.jpg
8358	Miguel: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=n7w0-KgZMdY	Miguel	NORMAL	2013-01-07	https://i.ytimg.com/vi/n7w0-KgZMdY/hqdefault.jpg
8359	The Polyphonic Spree: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=6D5r_7UW8eA	The Polyphonic Spree	NORMAL	2012-12-21	https://i.ytimg.com/vi/6D5r_7UW8eA/hqdefault.jpg
8360	Alt-J: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=xKdp5uI8AC0	Alt-J	NORMAL	2012-12-17	https://i.ytimg.com/vi/xKdp5uI8AC0/hqdefault.jpg
8361	Lyle Lovett: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=LFs3XUqJvNg	Lyle Lovett	NORMAL	2012-12-10	https://i.ytimg.com/vi/LFs3XUqJvNg/hqdefault.jpg
8362	Daniel Bachman: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=LKvFhPF0xYA	Daniel Bachman	NORMAL	2012-12-10	https://i.ytimg.com/vi/LKvFhPF0xYA/hqdefault.jpg
8363	Anais Mitchell: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=Shr47LVcA5I	Anais Mitchell	NORMAL	2012-12-07	https://i.ytimg.com/vi/Shr47LVcA5I/hqdefault.jpg
8364	Macklemore & Ryan Lewis: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=JrEJmvuKSwo	Macklemore & Ryan Lewis	NORMAL	2012-12-03	https://i.ytimg.com/vi/JrEJmvuKSwo/hqdefault.jpg
8365	Taken By Trees: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=c_RLDyJRWaI	Taken By Trees	NORMAL	2012-11-29	https://i.ytimg.com/vi/c_RLDyJRWaI/hqdefault.jpg
8366	Martha Wainwright: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=1h_biu6oRTY	Martha Wainwright	NORMAL	2012-11-26	https://i.ytimg.com/vi/1h_biu6oRTY/hqdefault.jpg
8367	Ben Gibbard: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=wMj-Ai9NOjY	Ben Gibbard	NORMAL	2012-11-26	https://i.ytimg.com/vi/wMj-Ai9NOjY/hqdefault.jpg
8368	Flaco Jimenez: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=gOMRNSmwa3U	Flaco Jimenez	NORMAL	2012-11-12	https://i.ytimg.com/vi/gOMRNSmwa3U/hqdefault.jpg
8369	Jason Lytle: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=FZF13DJf13k	Jason Lytle	NORMAL	2012-11-05	https://i.ytimg.com/vi/FZF13DJf13k/hqdefault.jpg
8370	Passion Pit: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=Er4q34P5Pxs	Passion Pit	NORMAL	2012-11-01	https://i.ytimg.com/vi/Er4q34P5Pxs/hqdefault.jpg
8371	Lord Huron: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=W9eiq-ctKDY	Lord Huron	NORMAL	2012-11-01	https://i.ytimg.com/vi/W9eiq-ctKDY/hqdefault.jpg
8372	Robert Cray: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=fEjzBKo-sxI	Robert Cray	NORMAL	2012-10-24	https://i.ytimg.com/vi/fEjzBKo-sxI/hqdefault.jpg
8373	Dirty Three: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=z1Lh06y6Z1Q	Dirty Three	NORMAL	2012-10-24	https://i.ytimg.com/vi/z1Lh06y6Z1Q/hqdefault.jpg
8374	Spirit Family Reunion: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=sefX1Ievnog	Spirit Family Reunion	NORMAL	2012-10-24	https://i.ytimg.com/vi/sefX1Ievnog/hqdefault.jpg
8375	Antibalas: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=IIlgjOCxhLQ	Antibalas	NORMAL	2012-10-24	https://i.ytimg.com/vi/IIlgjOCxhLQ/hqdefault.jpg
8376	Yva Las Vegass: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=P19YL-fy3Vk	Yva Las Vegass	NORMAL	2012-10-24	https://i.ytimg.com/vi/P19YL-fy3Vk/hqdefault.jpg
8377	Amanda Palmer And The Grand Theft Orchestra: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=LRix5o2-fiU	Amanda Palmer And The Grand Theft Orchestra	NORMAL	2022-10-24	https://i.ytimg.com/vi/LRix5o2-fiU/hqdefault.jpg
8378	Kat Edmonson: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=HnwQ4gOgnXA	Kat Edmonson	NORMAL	2012-10-24	https://i.ytimg.com/vi/HnwQ4gOgnXA/hqdefault.jpg
8379	Avi Avital: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=S19Q4e4Q4Kk	Avi Avital	NORMAL	2012-10-24	https://i.ytimg.com/vi/S19Q4e4Q4Kk/hqdefault.jpg
8380	Renaud Garcia-Fons: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=2ZNKLUHeJtg	Renaud Garcia-Fons	NORMAL	2012-10-24	https://i.ytimg.com/vi/2ZNKLUHeJtg/hqdefault.jpg
8381	Rufus Wainwright: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=xCmcvsCxfng	Rufus Wainwright	NORMAL	2012-10-24	https://i.ytimg.com/vi/xCmcvsCxfng/hqdefault.jpg
8382	The Zombies: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=NrpX8HgQxOw	The Zombies	NORMAL	2012-10-24	https://i.ytimg.com/vi/NrpX8HgQxOw/hqdefault.jpg
8383	Beth Orton: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=hZ2lMzQf19U	Beth Orton	NORMAL	2012-10-24	https://i.ytimg.com/vi/hZ2lMzQf19U/hqdefault.jpg
8384	The Walkmen: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=nHAPJaeacGE	The Walkmen	NORMAL	2012-10-24	https://i.ytimg.com/vi/nHAPJaeacGE/hqdefault.jpg
8385	Janet Feder: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=xa0P41jRrUM	Janet Feder	NORMAL	2012-10-24	https://i.ytimg.com/vi/xa0P41jRrUM/hqdefault.jpg
8386	Souad Massi: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=so9Xt6eYoSI	Souad Massi	NORMAL	2012-10-24	https://i.ytimg.com/vi/so9Xt6eYoSI/hqdefault.jpg
8387	The Milk Carton Kids: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=fp0xjVzmKxY	The Milk Carton Kids	NORMAL	2012-10-24	https://i.ytimg.com/vi/fp0xjVzmKxY/hqdefault.jpg
8388	Brandi Carlile: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=_ajWFc2VqWo	Brandi Carlile	NORMAL	2012-10-24	https://i.ytimg.com/vi/_ajWFc2VqWo/hqdefault.jpg
8389	Laura Marling: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=k4Ed6vT6a94	Laura Marling	NORMAL	2012-10-24	https://i.ytimg.com/vi/k4Ed6vT6a94/hqdefault.jpg
8390	Exitmusic: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=EwnrkPo4eRQ	Exitmusic	NORMAL	2012-10-24	https://i.ytimg.com/vi/EwnrkPo4eRQ/hqdefault.jpg
8391	Reggie Watts: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=dRmRr3Z8Zv8	Reggie Watts	NORMAL	2012-10-24	https://i.ytimg.com/vi/dRmRr3Z8Zv8/hqdefault.jpg
8392	Mariachi El Bronx: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=d8IMf7dBLuw	Mariachi El Bronx	NORMAL	2012-10-24	https://i.ytimg.com/vi/d8IMf7dBLuw/hqdefault.jpg
8393	Glen Hansard: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=IFlMFVwgIQI	Glen Hansard	NORMAL	2012-10-24	https://i.ytimg.com/vi/IFlMFVwgIQI/hqdefault.jpg
8394	Daniel Johnston: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=3OvWFurOBk8	Daniel Johnston	NORMAL	2012-06-11	https://i.ytimg.com/vi/3OvWFurOBk8/hqdefault.jpg
8395	Allison Miller's Boom Tic Boom: Tiny Desk Concert	https://www.youtube.com/watch?v=5M9EJOTekxA	Allison Miller's Boom Tic Boom	NORMAL	2012-06-10	https://i.ytimg.com/vi/5M9EJOTekxA/hqdefault.jpg
8396	Kelly Hogan: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=3zCFPqGfNic	Kelly Hogan	NORMAL	2012-06-04	https://i.ytimg.com/vi/3zCFPqGfNic/hqdefault.jpg
8397	Patrick Watson: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=b1DUKfmNuSs	Patrick Watson	NORMAL	2012-05-31	https://i.ytimg.com/vi/b1DUKfmNuSs/hqdefault.jpg
8398	Canadian Brass: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=-l-E3kyNcag	Canadian Brass	NORMAL	2012-05-31	https://i.ytimg.com/vi/-l-E3kyNcag/hqdefault.jpg
8399	Yann Tiersen: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=fgcheDWN5B8	Yann Tiersen	NORMAL	2012-05-21	https://i.ytimg.com/vi/fgcheDWN5B8/hqdefault.jpg
8400	Arborea: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=7c_KKh1rmso	Arborea	NORMAL	2012-05-21	https://i.ytimg.com/vi/7c_KKh1rmso/hqdefault.jpg
8401	Hospitality: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=L9Ug2jsFQII	Hospitality	NORMAL	2012-05-17	https://i.ytimg.com/vi/L9Ug2jsFQII/hqdefault.jpg
8402	Pedro Soler and Gaspar Claus: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=ZpnEn0A4ogc	Pedro Soler and Gaspar Claus	NORMAL	2012-05-17	https://i.ytimg.com/vi/ZpnEn0A4ogc/hqdefault.jpg
8403	Endangered Blood: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=3rHD1_kUC5E	Endangered Blood	NORMAL	2012-05-17	https://i.ytimg.com/vi/3rHD1_kUC5E/hqdefault.jpg
8404	Kishi Bashi: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=BgqAmZHkkTg	Kishi Bashi	NORMAL	2012-05-10	https://i.ytimg.com/vi/BgqAmZHkkTg/hqdefault.jpg
8405	Nathan Salsburg: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=ZNIpnL204f4	Nathan Salsburg	NORMAL	2022-10-24	https://i.ytimg.com/vi/ZNIpnL204f4/hqdefault.jpg
8406	Jolie Holland: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=4ul6kP887xA	Jolie Holland	NORMAL	2012-04-30	https://i.ytimg.com/vi/4ul6kP887xA/hqdefault.jpg
8407	Cowboy Junkies: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=1URQ0_9-Zyw	Cowboy Junkies	NORMAL	2012-04-30	https://i.ytimg.com/vi/1URQ0_9-Zyw/hqdefault.jpg
8408	Soweto Gospel Choir: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=niHNuc0uxIE	Soweto Gospel Choir	NORMAL	2012-04-30	https://i.ytimg.com/vi/niHNuc0uxIE/hqdefault.jpg
8409	Caveman: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=BYbSJfd870Q	Caveman	NORMAL	2012-04-10	https://i.ytimg.com/vi/BYbSJfd870Q/hqdefault.jpg
8410	Kathleen Edwards: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=kW6WICBscx4	Kathleen Edwards	NORMAL	2012-04-10	https://i.ytimg.com/vi/kW6WICBscx4/hqdefault.jpg
8411	So Percussion: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=3EDGt5l5_20	So Percussion	NORMAL	2012-04-05	https://i.ytimg.com/vi/3EDGt5l5_20/hqdefault.jpg
8412	First Aid Kit: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=Jtx7q7_IUXc	First Aid Kit	NORMAL	2012-04-02	https://i.ytimg.com/vi/Jtx7q7_IUXc/hqdefault.jpg
8413	Kayhan Kalhor: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=jMEjPKBvhzE	Kayhan Kalhor	NORMAL	2012-04-02	https://i.ytimg.com/vi/jMEjPKBvhzE/hqdefault.jpg
8414	Real Estate: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=jE6R7yglXpU	Real Estate	NORMAL	2012-04-02	https://i.ytimg.com/vi/jE6R7yglXpU/hqdefault.jpg
8415	Rudresh Mahanthappa: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=58KepbLWzus	Rudresh Mahanthappa	NORMAL	2012-04-02	https://i.ytimg.com/vi/58KepbLWzus/hqdefault.jpg
8416	Laura Gibson: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=jhxi64JvhGw	Laura Gibson	NORMAL	2012-03-26	https://i.ytimg.com/vi/jhxi64JvhGw/hqdefault.jpg
8417	Pistolera: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=9_FL_Vc3yZU	Pistolera	NORMAL	2012-03-05	https://i.ytimg.com/vi/9_FL_Vc3yZU/hqdefault.jpg
8418	MIlagres: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=R3mKyzJRCUo	MIlagres	NORMAL	2012-03-04	https://i.ytimg.com/vi/R3mKyzJRCUo/hqdefault.jpg
8419	The Cranberries: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=hxsJvKYyVyg	The Cranberries	NORMAL	2012-03-02	https://i.ytimg.com/vi/hxsJvKYyVyg/hqdefault.jpg
8420	Joyce El Khoury and Brian Jagde: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=SEkdTyBYha0	Joyce El Khoury and Brian Jagde	NORMAL	2012-03-02	https://i.ytimg.com/vi/SEkdTyBYha0/hqdefault.jpg
8421	Joan Soriano: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=XnCyyJhJCc0	Joan Soriano	NORMAL	2012-02-16	https://i.ytimg.com/vi/XnCyyJhJCc0/hqdefault.jpg
8422	Red Baraat: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=0kQD1P0_KUs	Red Baraat	NORMAL	2012-02-14	https://i.ytimg.com/vi/0kQD1P0_KUs/hqdefault.jpg
8423	The Creole Choir Of Cuba: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=pJSv2hoH5ro	The Creole Choir Of Cuba	NORMAL	2012-02-14	https://i.ytimg.com/vi/pJSv2hoH5ro/hqdefault.jpg
8424	Craig Finn: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=J8QBpfCSlLE	Craig Finn	NORMAL	2012-02-14	https://i.ytimg.com/vi/J8QBpfCSlLE/hqdefault.jpg
8425	Bill Frisell: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=NO-1Euq2RBk	Bill Frisell	NORMAL	2012-02-04	https://i.ytimg.com/vi/NO-1Euq2RBk/hqdefault.jpg
8426	Girl In A Coma: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=je2HSRcRruI	Girl In A Coma	NORMAL	2012-02-04	https://i.ytimg.com/vi/je2HSRcRruI/hqdefault.jpg
8427	Anna Calvi: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=EScw2XrUHFY	Anna Calvi	NORMAL	2012-02-01	https://i.ytimg.com/vi/EScw2XrUHFY/hqdefault.jpg
8428	Glenn Jones: NPR Music Tiny Desk Concerts	https://www.youtube.com/watch?v=uPXk1ElmzGs	Glenn Jones	NORMAL	2012-01-23	https://i.ytimg.com/vi/uPXk1ElmzGs/hqdefault.jpg
8429	Jake Schepps' Expedition Quartet: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=4CP2ur8IJxo	Jake Schepps' Expedition Quartet	NORMAL	2012-01-23	https://i.ytimg.com/vi/4CP2ur8IJxo/hqdefault.jpg
8430	Screaming Females: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=EPn9rgccqqw	Screaming Females	NORMAL	2012-01-23	https://i.ytimg.com/vi/EPn9rgccqqw/hqdefault.jpg
8431	Le Butcherettes: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=19FnFxiQmKc	Le Butcherettes	NORMAL	2021-11-15	https://i.ytimg.com/vi/19FnFxiQmKc/hqdefault.jpg
8432	Tinariwen: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=IdbBmqOUPlY	Tinariwen	NORMAL	2012-01-05	https://i.ytimg.com/vi/IdbBmqOUPlY/hqdefault.jpg
8433	The MusicTapes: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=h7PsGipAraQ	The MusicTapes	NORMAL	2011-12-28	https://i.ytimg.com/vi/h7PsGipAraQ/hqdefault.jpg
8434	Maria Volonte: Tiny Desk Concert	https://www.youtube.com/watch?v=hXy9_xjOrb8	Maria Volonte	NORMAL	2011-12-28	https://i.ytimg.com/vi/hXy9_xjOrb8/hqdefault.jpg
8435	Gem Club: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=0HK1KhJgUs4	Gem Club	NORMAL	2011-12-28	https://i.ytimg.com/vi/0HK1KhJgUs4/hqdefault.jpg
8436	JEFF The Brotherhood: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=PsMqTDxboJE	JEFF The Brotherhood	NORMAL	2011-12-14	https://i.ytimg.com/vi/PsMqTDxboJE/hqdefault.jpg
8437	I Wayne: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=jaaQSxUOwC0	I Wayne	NORMAL	2011-12-14	https://i.ytimg.com/vi/jaaQSxUOwC0/hqdefault.jpg
8438	Mates of State: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=3gP3XrKpy1k	Mates of State	NORMAL	2011-12-14	https://i.ytimg.com/vi/3gP3XrKpy1k/hqdefault.jpg
8439	tUne-yArDs: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=c8FML8QhcZo	tUne-yArDs	NORMAL	2011-12-12	https://i.ytimg.com/vi/c8FML8QhcZo/hqdefault.jpg
8440	Hospital Ships: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=Z3LKrXt7570	Hospital Ships	NORMAL	2011-11-30	https://i.ytimg.com/vi/Z3LKrXt7570/hqdefault.jpg
8441	Joe Henry: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=MA--dI19Lfc	Joe Henry	NORMAL	2011-11-30	https://i.ytimg.com/vi/MA--dI19Lfc/hqdefault.jpg
8442	Yo-Yo Ma, Edgar Meyer, Chris Thile And Stuart Duncan: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=O7EcT5YzKhQ	Yo-Yo Ma, Edgar Meyer, Chris Thile And Stuart Duncan	NORMAL	2011-11-29	https://i.ytimg.com/vi/O7EcT5YzKhQ/hqdefault.jpg
8443	Marketa Irglova: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=4cwIj0tzPr4	Marketa Irglova	NORMAL	2011-11-28	https://i.ytimg.com/vi/4cwIj0tzPr4/hqdefault.jpg
8444	Jens Lekman: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=wftQvpqo6Rg	Jens Lekman	NORMAL	2011-11-07	https://i.ytimg.com/vi/wftQvpqo6Rg/hqdefault.jpg
8445	Juanes: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=TG6NqII3Zuw	Juanes	NORMAL	2011-11-03	https://i.ytimg.com/vi/TG6NqII3Zuw/hqdefault.jpg
8446	Lisa Hannigan: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=r-B_fkZfWjk	Lisa Hannigan	NORMAL	2011-10-31	https://i.ytimg.com/vi/r-B_fkZfWjk/hqdefault.jpg
8447	Ben Williams, NPR Tiny Desk Concert	https://www.youtube.com/watch?v=rsMLQVRS3ho	Ben Williams, NPR Tiny Desk Concert	NORMAL	2011-10-24	https://i.ytimg.com/vi/rsMLQVRS3ho/hqdefault.jpg
8448	Hilary Hahn: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=cBNTDlI1-nQ	Hilary Hahn	NORMAL	2011-10-24	https://i.ytimg.com/vi/cBNTDlI1-nQ/hqdefault.jpg
8449	Wilco: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=UZAKTCeE70Y	Wilco	NORMAL	2011-10-18	https://i.ytimg.com/vi/UZAKTCeE70Y/hqdefault.jpg
8450	Chris Bathgate: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=WRJXePSFApU	Chris Bathgate	NORMAL	2011-10-18	https://i.ytimg.com/vi/WRJXePSFApU/hqdefault.jpg
8451	Fountains Of Wayne: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=nIO1tXMnt4E	Fountains Of Wayne	NORMAL	2011-10-06	https://i.ytimg.com/vi/nIO1tXMnt4E/hqdefault.jpg
8452	Trombone Shorty: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=cwYAeUpH1NM	Trombone Shorty	NORMAL	2011-10-03	https://i.ytimg.com/vi/cwYAeUpH1NM/hqdefault.jpg
8453	The Klezmatics: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=w4AC_-MoqMM	The Klezmatics	NORMAL	2011-10-03	https://i.ytimg.com/vi/w4AC_-MoqMM/hqdefault.jpg
8454	Jenny Lin: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=p1i28p_gyFI	Jenny Lin	NORMAL	2011-10-03	https://i.ytimg.com/vi/p1i28p_gyFI/hqdefault.jpg
8455	Beirut: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=Z0UISCEe52Y	Beirut	NORMAL	2011-09-22	https://i.ytimg.com/vi/Z0UISCEe52Y/hqdefault.jpg
8456	Jeremy Messersmith: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=X-RVUGjCfug	Jeremy Messersmith	NORMAL	2011-09-19	https://i.ytimg.com/vi/X-RVUGjCfug/hqdefault.jpg
8457	Sean Rowe: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=mTkmIgrj1CA	Sean Rowe	NORMAL	2011-09-19	https://i.ytimg.com/vi/mTkmIgrj1CA/hqdefault.jpg
8458	Diego Garcia: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=DjmHpDI89v8	Diego Garcia	NORMAL	2011-09-19	https://i.ytimg.com/vi/DjmHpDI89v8/hqdefault.jpg
8459	Foster The People: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=kMnDHUKGMWs	Foster The People	NORMAL	2011-09-13	https://i.ytimg.com/vi/kMnDHUKGMWs/hqdefault.jpg
8460	King Creosote And Jon Hopkins: NPR Music Tiny Desk Concerts	https://www.youtube.com/watch?v=ej8vMh28SJY	King Creosote And Jon Hopkins	NORMAL	2011-09-06	https://i.ytimg.com/vi/ej8vMh28SJY/hqdefault.jpg
8461	Phosphorescent: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=S8m_Oek-Xec	Phosphorescent	NORMAL	2011-09-01	https://i.ytimg.com/vi/S8m_Oek-Xec/hqdefault.jpg
8462	CALLmeKAT: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=tOXCEV4V8Ks	CALLmeKAT	NORMAL	2011-08-29	https://i.ytimg.com/vi/tOXCEV4V8Ks/hqdefault.jpg
8463	James Vincent McMorrow: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=F-u3SOPjN38	James Vincent McMorrow	NORMAL	2011-08-25	https://i.ytimg.com/vi/F-u3SOPjN38/hqdefault.jpg
8464	Other Lives: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=zdX9TmoUid4	Other Lives	NORMAL	2011-08-22	https://i.ytimg.com/vi/zdX9TmoUid4/hqdefault.jpg
8465	Gaby Moreno: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=sIdRsY5HJGw	Gaby Moreno	NORMAL	2011-08-22	https://i.ytimg.com/vi/sIdRsY5HJGw/hqdefault.jpg
8466	Paul Jacobs: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=TlW29RhUkDc	Paul Jacobs	NORMAL	2011-08-15	https://i.ytimg.com/vi/TlW29RhUkDc/hqdefault.jpg
8467	Noah And The Whale: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=efiBs11W1Ps	Noah And The Whale	NORMAL	2011-08-10	https://i.ytimg.com/vi/efiBs11W1Ps/hqdefault.jpg
8468	Amanda Shires: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=ybBK0N0mCl4	Amanda Shires	NORMAL	2022-10-24	https://i.ytimg.com/vi/ybBK0N0mCl4/hqdefault.jpg
8469	They Might Be Giants: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=52tp2B4YR_c	They Might Be Giants	NORMAL	2022-10-24	https://i.ytimg.com/vi/52tp2B4YR_c/hqdefault.jpg
8470	Givers: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=uNA3v08ygu8	Givers	NORMAL	2022-10-24	https://i.ytimg.com/vi/uNA3v08ygu8/hqdefault.jpg
8471	Joe Boyd And Robyn Hitchcock: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=-XwZf3zpAH8	Joe Boyd And Robyn Hitchcock	NORMAL	2022-10-24	https://i.ytimg.com/vi/-XwZf3zpAH8/hqdefault.jpg
8472	Ben Sollee: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=xf29sAchQAw	Ben Sollee	NORMAL	2022-10-24	https://i.ytimg.com/vi/xf29sAchQAw/hqdefault.jpg
8473	Milos: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=EQ603gAMQvE	Milos	NORMAL	2022-10-24	https://i.ytimg.com/vi/EQ603gAMQvE/hqdefault.jpg
8474	The Civil Wars: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=HamYmjllE6A	The Civil Wars	NORMAL	2022-10-24	https://i.ytimg.com/vi/HamYmjllE6A/hqdefault.jpg
8475	YACHT: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=EwRHWqlRFy4	YACHT	NORMAL	2022-10-24	https://i.ytimg.com/vi/EwRHWqlRFy4/hqdefault.jpg
8476	The Decemberists: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=VHdsoNewFdU	The Decemberists	NORMAL	2022-10-24	https://i.ytimg.com/vi/VHdsoNewFdU/hqdefault.jpg
8477	Charlie Siem: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=stvyyjwQH3w	Charlie Siem	NORMAL	2022-10-24	https://i.ytimg.com/vi/stvyyjwQH3w/hqdefault.jpg
8478	The Black Angels: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=T-h4_t_wE4Y	The Black Angels	NORMAL	2022-10-24	https://i.ytimg.com/vi/T-h4_t_wE4Y/hqdefault.jpg
8479	Chris Thile and Michael Daves: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=F_CKeb2gPQ8	Chris Thile and Michael Daves	NORMAL	2022-10-24	https://i.ytimg.com/vi/F_CKeb2gPQ8/hqdefault.jpg
8480	Kopecky Family Band: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=SZTUQwI9rLI	Kopecky Family Band	NORMAL	2022-10-24	https://i.ytimg.com/vi/SZTUQwI9rLI/hqdefault.jpg
8481	Neil Innes: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=woqgI7loyo4	Neil Innes	NORMAL	2022-10-24	https://i.ytimg.com/vi/woqgI7loyo4/hqdefault.jpg
8482	Julieta Venegas: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=-lLnpEv_9dw	Julieta Venegas	NORMAL	2021-11-12	https://i.ytimg.com/vi/-lLnpEv_9dw/hqdefault.jpg
8483	Booker T. Jones: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=rh9KDzNkpSI	Booker T. Jones	NORMAL	2022-10-24	https://i.ytimg.com/vi/rh9KDzNkpSI/hqdefault.jpg
8484	Wu Man: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=Rg_iZhUlyRE	Wu Man	NORMAL	2022-10-24	https://i.ytimg.com/vi/Rg_iZhUlyRE/hqdefault.jpg
8485	Steve Earle: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=onxGMaIDxi0	Steve Earle	NORMAL	2022-10-24	https://i.ytimg.com/vi/onxGMaIDxi0/hqdefault.jpg
8486	Pokey LaFarge: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=seKAfbWFWCM	Pokey LaFarge	NORMAL	2022-10-24	https://i.ytimg.com/vi/seKAfbWFWCM/hqdefault.jpg
8487	Mount Kimbie: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=n1htNKK_6hQ	Mount Kimbie	NORMAL	2022-10-24	https://i.ytimg.com/vi/n1htNKK_6hQ/hqdefault.jpg
8488	Otis Taylor: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=am4GcbBrdMA	Otis Taylor	NORMAL	2022-10-24	https://i.ytimg.com/vi/am4GcbBrdMA/hqdefault.jpg
8489	Josh Ritter: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=4Quq7OdPQsU	Josh Ritter	NORMAL	2022-10-24	https://i.ytimg.com/vi/4Quq7OdPQsU/hqdefault.jpg
8490	Sierra Leone's Refugee All Stars: NPR Music Tiny Desk Concert:	https://www.youtube.com/watch?v=uZJscRYBmIg	Sierra Leone's Refugee All Stars	NORMAL	2022-10-24	https://i.ytimg.com/vi/uZJscRYBmIg/hqdefault.jpg
8491	Nellie McKay: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=cCIG6Jldl24	Nellie McKay	NORMAL	2022-10-24	https://i.ytimg.com/vi/cCIG6Jldl24/hqdefault.jpg
8492	Lizz Wright: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=_I9Mh317tYc	Lizz Wright	NORMAL	2022-10-24	https://i.ytimg.com/vi/_I9Mh317tYc/hqdefault.jpg
8493	Steve Riley And The Mamou Playboys" NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=6PNFkWfZDR8	Steve Riley And The Mamou Playboys" NPR Music Tiny Desk Concert	NORMAL	2022-10-24	https://i.ytimg.com/vi/6PNFkWfZDR8/hqdefault.jpg
8494	Local Natives: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=FoyjUYtk30s	Local Natives	NORMAL	2022-10-24	https://i.ytimg.com/vi/FoyjUYtk30s/hqdefault.jpg
8495	Damien Jurado: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=jLiZ0jCzpdA	Damien Jurado	NORMAL	2022-10-24	https://i.ytimg.com/vi/jLiZ0jCzpdA/hqdefault.jpg
8496	Turtle Island Quartet: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=NacFvfTlX1c	Turtle Island Quartet	NORMAL	2022-10-24	https://i.ytimg.com/vi/NacFvfTlX1c/hqdefault.jpg
8497	Adele: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=XfzpYcwiUrA	Adele	NORMAL	2022-10-24	https://i.ytimg.com/vi/XfzpYcwiUrA/hqdefault.jpg
8498	Ivan And Alyosha: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=CJvKxdcoHBE	Ivan And Alyosha	NORMAL	2022-10-24	https://i.ytimg.com/vi/CJvKxdcoHBE/hqdefault.jpg
8499	Stars: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=Dz3ajUhTwXQ	Stars	NORMAL	2022-10-24	https://i.ytimg.com/vi/Dz3ajUhTwXQ/hqdefault.jpg
8500	Richard Thompson: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=1tcNmAuVU5A	Richard Thompson	NORMAL	2022-10-24	https://i.ytimg.com/vi/1tcNmAuVU5A/hqdefault.jpg
8501	Iron And Wine: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=6nT911jkWEo	Iron And Wine	NORMAL	2022-10-24	https://i.ytimg.com/vi/6nT911jkWEo/hqdefault.jpg
8502	Buke And Gass: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=-wQv60dxAUU	Buke And Gass	NORMAL	2022-10-24	https://i.ytimg.com/vi/-wQv60dxAUU/hqdefault.jpg
8503	Ballake Sissoko And Vincent Segal: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=QtiTfejYpgs	Ballake Sissoko And Vincent Segal	NORMAL	2022-10-24	https://i.ytimg.com/vi/QtiTfejYpgs/hqdefault.jpg
8504	Abigail Washburn: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=oj_WIqZc9KA	Abigail Washburn	NORMAL	2022-10-24	https://i.ytimg.com/vi/oj_WIqZc9KA/hqdefault.jpg
8505	Khaira Arby: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=cdpNQ90gGXQ	Khaira Arby	NORMAL	2022-10-24	https://i.ytimg.com/vi/cdpNQ90gGXQ/hqdefault.jpg
8506	David Wax Museum: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=IrJVebOJqIw	David Wax Museum	NORMAL	2022-10-24	https://i.ytimg.com/vi/IrJVebOJqIw/hqdefault.jpg
8507	The Red River: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=qKiZB_ltXM0	The Red River	NORMAL	2022-10-24	https://i.ytimg.com/vi/qKiZB_ltXM0/hqdefault.jpg
8508	Gyptian: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=fz7NoHyviUU	Gyptian	NORMAL	2022-10-24	https://i.ytimg.com/vi/fz7NoHyviUU/hqdefault.jpg
8509	Luisa Maita: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=wqFlSNLF3YE	Luisa Maita	NORMAL	2021-11-17	https://i.ytimg.com/vi/wqFlSNLF3YE/hqdefault.jpg
8510	Matt Wilson's Christmas Tree-O: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=Q7tz0MPz2QE	Matt Wilson's Christmas Tree-O	NORMAL	2022-10-24	https://i.ytimg.com/vi/Q7tz0MPz2QE/hqdefault.jpg
8511	The Heligoats: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=gtnY_HxqCJQ	The Heligoats	NORMAL	2022-10-24	https://i.ytimg.com/vi/gtnY_HxqCJQ/hqdefault.jpg
8512	Yolanda Kondonassis: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=CHym8Xt41E8	Yolanda Kondonassis	NORMAL	2022-10-24	https://i.ytimg.com/vi/CHym8Xt41E8/hqdefault.jpg
8513	Olof Arnalds: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=41wtK-V46VY	Olof Arnalds	NORMAL	2022-10-24	https://i.ytimg.com/vi/41wtK-V46VY/hqdefault.jpg
8514	Sharon Van Etten: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=ECVEVDES3Js	Sharon Van Etten	NORMAL	2022-10-24	https://i.ytimg.com/vi/ECVEVDES3Js/hqdefault.jpg
8515	Rana Santacruz: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=zq1T0P7zotA	Rana Santacruz	NORMAL	2021-11-17	https://i.ytimg.com/vi/zq1T0P7zotA/hqdefault.jpg
8516	Black Dub: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=86N4lNuVz_8	Black Dub	NORMAL	2022-10-24	https://i.ytimg.com/vi/86N4lNuVz_8/hqdefault.jpg
8517	Stile Antico: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=Kmhba4QoH3s	Stile Antico	NORMAL	2022-10-24	https://i.ytimg.com/vi/Kmhba4QoH3s/hqdefault.jpg
8518	Hey Marseilles: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=zvYuiJVkc5g	Hey Marseilles	NORMAL	2022-10-24	https://i.ytimg.com/vi/zvYuiJVkc5g/hqdefault.jpg
8519	Esperanza Spalding: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=sBZa7-2bG2I	Esperanza Spalding	NORMAL	2022-10-24	https://i.ytimg.com/vi/sBZa7-2bG2I/hqdefault.jpg
8520	Lost In The Trees: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=QkEjJpuZbog	Lost In The Trees	NORMAL	2022-10-24	https://i.ytimg.com/vi/QkEjJpuZbog/hqdefault.jpg
8521	Lower Dens: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=M0UWi5W_B4E	Lower Dens	NORMAL	2022-10-24	https://i.ytimg.com/vi/M0UWi5W_B4E/hqdefault.jpg
8522	Eef Barzelay of Clem Snide: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=YX6vj6ni9ic	Eef Barzelay of Clem Snide	NORMAL	2022-10-24	https://i.ytimg.com/vi/YX6vj6ni9ic/hqdefault.jpg
8523	Tom Tom Club: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=mKJG57qnYdc	Tom Tom Club	NORMAL	2022-10-24	https://i.ytimg.com/vi/mKJG57qnYdc/hqdefault.jpg
8524	Chuck Brown: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=9ZjeheDR3tA	Chuck Brown	NORMAL	2022-10-24	https://i.ytimg.com/vi/9ZjeheDR3tA/hqdefault.jpg
8525	Alisa Weilerstein: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=kuiQ5tt0iI8	Alisa Weilerstein	NORMAL	2022-10-24	https://i.ytimg.com/vi/kuiQ5tt0iI8/hqdefault.jpg
8526	The Nels Cline Singers: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=BOb3Crrlfh0	The Nels Cline Singers	NORMAL	2022-10-24	https://i.ytimg.com/vi/BOb3Crrlfh0/hqdefault.jpg
8527	Ana Tijoux: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=jsCO_M0Nnwk	Ana Tijoux	NORMAL	2021-11-17	https://i.ytimg.com/vi/jsCO_M0Nnwk/hqdefault.jpg
8528	Brian Courtney Wilson: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=LpMlfxA9kco	Brian Courtney Wilson	NORMAL	2022-10-24	https://i.ytimg.com/vi/LpMlfxA9kco/hqdefault.jpg
8529	Peter Wolf Crier: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=gTyY3BCp3pk	Peter Wolf Crier	NORMAL	2022-10-24	https://i.ytimg.com/vi/gTyY3BCp3pk/hqdefault.jpg
8530	Los Campesinos!: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=qPEeYKJ6im0	Los Campesinos!	NORMAL	2022-10-24	https://i.ytimg.com/vi/qPEeYKJ6im0/hqdefault.jpg
8531	The Holmes Brothers: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=9knSWR3chAI	The Holmes Brothers	NORMAL	2022-10-24	https://i.ytimg.com/vi/9knSWR3chAI/hqdefault.jpg
8532	Villagers: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=RB1sfcBbczs	Villagers	NORMAL	2022-10-24	https://i.ytimg.com/vi/RB1sfcBbczs/hqdefault.jpg
8533	The Mynabirds: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=hGCQo2RFNxg	The Mynabirds	NORMAL	2022-10-24	https://i.ytimg.com/vi/hGCQo2RFNxg/hqdefault.jpg
8534	Zuill Bailey: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=5EkdIaEDOt0	Zuill Bailey	NORMAL	2022-10-24	https://i.ytimg.com/vi/5EkdIaEDOt0/hqdefault.jpg
8535	Phoenix: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=w0BPaY6_9hs	Phoenix	NORMAL	2022-10-24	https://i.ytimg.com/vi/w0BPaY6_9hs/hqdefault.jpg
8536	Regina Carter: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=fAVEuYk5qiw	Regina Carter	NORMAL	2022-10-24	https://i.ytimg.com/vi/fAVEuYk5qiw/hqdefault.jpg
8537	Moby: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=C7Gtp8YhmoI	Moby	NORMAL	2022-10-24	https://i.ytimg.com/vi/C7Gtp8YhmoI/hqdefault.jpg
8538	Fredrik: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=ycyazyUe9lA	Fredrik	NORMAL	2022-10-24	https://i.ytimg.com/vi/ycyazyUe9lA/hqdefault.jpg
8539	David Russell: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=ANcC5sCCVEc	David Russell	NORMAL	2022-10-24	https://i.ytimg.com/vi/ANcC5sCCVEc/hqdefault.jpg
8540	Jakob Dylan: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=NC0-L6C-kmo	Jakob Dylan	NORMAL	2022-10-24	https://i.ytimg.com/vi/NC0-L6C-kmo/hqdefault.jpg
8541	Brooklyn Rider: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=bWrVuKWs5Nw	Brooklyn Rider	NORMAL	2022-10-24	https://i.ytimg.com/vi/bWrVuKWs5Nw/hqdefault.jpg
8542	Edmar Castaneda: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=0SNhAKyXtC8	Edmar Castaneda	NORMAL	2021-02-10	https://i.ytimg.com/vi/0SNhAKyXtC8/hqdefault.jpg
8543	Alec Ounsworth: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=XG_o-sGQ3xo	Alec Ounsworth	NORMAL	2022-10-24	https://i.ytimg.com/vi/XG_o-sGQ3xo/hqdefault.jpg
8544	Omara Portuondo: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=e3blQ3I3GRQ	Omara Portuondo	NORMAL	2021-11-17	https://i.ytimg.com/vi/e3blQ3I3GRQ/hqdefault.jpg
8545	Fanfarlo: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=9xEviApg1HY	Fanfarlo	NORMAL	2022-10-24	https://i.ytimg.com/vi/9xEviApg1HY/hqdefault.jpg
8546	Lightning Dust: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=ErnSsJRKNJ0	Lightning Dust	NORMAL	2022-10-24	https://i.ytimg.com/vi/ErnSsJRKNJ0/hqdefault.jpg
8547	Zee Avi: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=WkYCtvy8CQw	Zee Avi	NORMAL	2022-10-24	https://i.ytimg.com/vi/WkYCtvy8CQw/hqdefault.jpg
8548	K'Naan: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=AE-YaL0Y3bo	K'Naan	NORMAL	2022-10-24	https://i.ytimg.com/vi/AE-YaL0Y3bo/hqdefault.jpg
8549	Edward Sharpe And The Magnetic Zeroes: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=XWIvfE01J0k	Edward Sharpe And The Magnetic Zeroes	NORMAL	2022-10-24	https://i.ytimg.com/vi/XWIvfE01J0k/hqdefault.jpg
8550	Rodrigo y Gabriela: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=wKd0HNg1kFQ	Rodrigo y Gabriela	NORMAL	2015-05-04	https://i.ytimg.com/vi/wKd0HNg1kFQ/hqdefault.jpg
8551	Ralph Stanley: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=ca7JCI5Jjhk	Ralph Stanley	NORMAL	2022-10-24	https://i.ytimg.com/vi/ca7JCI5Jjhk/hqdefault.jpg
8552	John Vanderslice: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=QxVzchD0Xh4	John Vanderslice	NORMAL	2022-10-24	https://i.ytimg.com/vi/QxVzchD0Xh4/hqdefault.jpg
8553	Telekinesis: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=ZRAHI8x3S28	Telekinesis	NORMAL	2022-10-24	https://i.ytimg.com/vi/ZRAHI8x3S28/hqdefault.jpg
8554	Tallest Man on Earth: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=JLRTleMY_mc	Tallest Man on Earth	NORMAL	2022-10-24	https://i.ytimg.com/vi/JLRTleMY_mc/hqdefault.jpg
8555	Dark Meat: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=MrW0w2Bq53U	Dark Meat	NORMAL	2022-10-24	https://i.ytimg.com/vi/MrW0w2Bq53U/hqdefault.jpg
8556	The Swell Season: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=crS5ti-Py7Q	The Swell Season	NORMAL	2022-10-24	https://i.ytimg.com/vi/crS5ti-Py7Q/hqdefault.jpg
8557	Dave Douglas Brass Ecstasy: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=2_EW2O_1qAc	Dave Douglas Brass Ecstasy	NORMAL	2022-10-24	https://i.ytimg.com/vi/2_EW2O_1qAc/hqdefault.jpg
8558	Bill Callahan: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=MHVNUrcyJy8	Bill Callahan	NORMAL	2022-10-24	https://i.ytimg.com/vi/MHVNUrcyJy8/hqdefault.jpg
8559	Julie Doiron: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=jbun-mjH-bw	Julie Doiron	NORMAL	2022-10-24	https://i.ytimg.com/vi/jbun-mjH-bw/hqdefault.jpg
8560	The Avett Brothers: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=abQRt6p8T7g	The Avett Brothers	NORMAL	2022-10-24	https://i.ytimg.com/vi/abQRt6p8T7g/hqdefault.jpg
8561	The Antlers | NPR MUSIC LIVE	https://www.youtube.com/watch?v=R4v2AyU4HAo	The Antlers | NPR MUSIC LIVE	NORMAL	2022-10-24	https://i.ytimg.com/vi/R4v2AyU4HAo/hqdefault.jpg
8562	Jason Vieaux Tiny Desk Concert at NPR Music	https://www.youtube.com/watch?v=Kf_Lolpumi4	Jason Vieaux Tiny Desk Concert at NPR Music	NORMAL	2022-10-24	https://i.ytimg.com/vi/Kf_Lolpumi4/hqdefault.jpg
8563	Great Lake Swimmers: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=DEr_si0Aqdk	Great Lake Swimmers	NORMAL	2022-10-24	https://i.ytimg.com/vi/DEr_si0Aqdk/hqdefault.jpg
8564	Benjy Ferree: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=3sjttfJagIs	Benjy Ferree	NORMAL	2022-10-24	https://i.ytimg.com/vi/3sjttfJagIs/hqdefault.jpg
8565	Horse Feathers: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=QSDpSUB6YjA	Horse Feathers	NORMAL	2022-10-24	https://i.ytimg.com/vi/QSDpSUB6YjA/hqdefault.jpg
8566	Sera Cahoone: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=UaAYjdHvw4I	Sera Cahoone	NORMAL	2022-10-24	https://i.ytimg.com/vi/UaAYjdHvw4I/hqdefault.jpg
8567	Jim White: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=sPZc74_1IiM	Jim White	NORMAL	2022-10-24	https://i.ytimg.com/vi/sPZc74_1IiM/hqdefault.jpg
8568	Super XX Man: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=NRE_qJfFMxA	Super XX Man	NORMAL	2022-10-24	https://i.ytimg.com/vi/NRE_qJfFMxA/hqdefault.jpg
8569	Woven Hand: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=zSfhXPA3V9A	Woven Hand	NORMAL	2022-10-24	https://i.ytimg.com/vi/zSfhXPA3V9A/hqdefault.jpg
8570	Dave Dondero: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=ie1vkOlK8xc	Dave Dondero	NORMAL	2022-10-24	https://i.ytimg.com/vi/ie1vkOlK8xc/hqdefault.jpg
8571	Sam Phillips: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=ANOrllutAhs	Sam Phillips	NORMAL	2022-10-24	https://i.ytimg.com/vi/ANOrllutAhs/hqdefault.jpg
8572	Lambchop's Kurt Wagner: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=IG_uM5th6Fo	Lambchop's Kurt Wagner	NORMAL	2022-10-24	https://i.ytimg.com/vi/IG_uM5th6Fo/hqdefault.jpg
8573	Shearwater: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=WZoezkHVXL4	Shearwater	NORMAL	2022-10-24	https://i.ytimg.com/vi/WZoezkHVXL4/hqdefault.jpg
8574	Thao Nguyen: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=QXXc25vtuxk	Thao Nguyen	NORMAL	2022-10-24	https://i.ytimg.com/vi/QXXc25vtuxk/hqdefault.jpg
8575	Dr. Dog: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=jzmvzcDWZjI	Dr. Dog	NORMAL	2022-10-24	https://i.ytimg.com/vi/jzmvzcDWZjI/hqdefault.jpg
8576	Vic Chesnutt: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=a8vsSQEAGnA	Vic Chesnutt	NORMAL	2022-10-24	https://i.ytimg.com/vi/a8vsSQEAGnA/hqdefault.jpg
8577	Laura Gibson: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=G1Az1xWhdl0	Laura Gibson	NORMAL	2022-10-24	https://i.ytimg.com/vi/G1Az1xWhdl0/hqdefault.jpg
8578	Tom Jones: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=118zckalkJ0	Tom Jones	NORMAL	2022-10-24	https://i.ytimg.com/vi/118zckalkJ0/hqdefault.jpg
8579	Milton Nascimento & esperanza spalding: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=jFUhTmOSdGQ	Milton Nascimento & esperanza spalding	HOME	2024-08-07	https://i.ytimg.com/vi/jFUhTmOSdGQ/hqdefault.jpg
8580	Jay Park: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=YA6D6WmclMc	Jay Park	HOME	2023-05-26	https://i.ytimg.com/vi/YA6D6WmclMc/hqdefault.jpg
8581	The Bad Ends: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=TcGJtLNZxYE	The Bad Ends	HOME	2023-03-24	https://i.ytimg.com/vi/TcGJtLNZxYE/hqdefault.jpg
8582	RM of BTS: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=CKg3FV5gwMc	RM of BTS	HOME	2022-12-02	https://i.ytimg.com/vi/CKg3FV5gwMc/hqdefault.jpg
8583	Horace Andy: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=RfkXW0Gm3eQ	Horace Andy	HOME	2022-11-18	https://i.ytimg.com/vi/RfkXW0Gm3eQ/hqdefault.jpg
8584	Trueno: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=2C-WmZQABLQ	Trueno	HOME	2022-09-27	https://i.ytimg.com/vi/2C-WmZQABLQ/hqdefault.jpg
8585	Carin Le├│n: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=ug25yQSEub0	Carin Le├│n	HOME	2022-09-21	https://i.ytimg.com/vi/ug25yQSEub0/hqdefault.jpg
8586	SFJAZZ Collective: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=0VvdSqp69Lc	SFJAZZ Collective	HOME	2022-08-11	https://i.ytimg.com/vi/0VvdSqp69Lc/hqdefault.jpg
8587	Big Thief: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=TCsFgJsJ5Uc	Big Thief	HOME	2022-07-20	https://i.ytimg.com/vi/TCsFgJsJ5Uc/hqdefault.jpg
8588	Curse Of Lono: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=Wl9j4OP9DKc	Curse Of Lono	HOME	2022-12-07	https://i.ytimg.com/vi/Wl9j4OP9DKc/hqdefault.jpg
8589	Animal Collective: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=JvIllmsp1J4	Animal Collective	HOME	2022-12-07	https://i.ytimg.com/vi/JvIllmsp1J4/hqdefault.jpg
8590	FKJ: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=PwV1-wZzT1Y	FKJ	HOME	2022-12-07	https://i.ytimg.com/vi/PwV1-wZzT1Y/hqdefault.jpg
8591	Maylee Todd: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=QR7_RDHan3M	Maylee Todd	HOME	2022-12-07	https://i.ytimg.com/vi/QR7_RDHan3M/hqdefault.jpg
8592	J'Nai Bridges: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=de3nUQIQIYY	J'Nai Bridges	HOME	2022-12-07	https://i.ytimg.com/vi/de3nUQIQIYY/hqdefault.jpg
8593	Monica: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=jJ2rPTG1G9U	Monica	HOME	2022-12-07	https://i.ytimg.com/vi/jJ2rPTG1G9U/hqdefault.jpg
8594	Larry June: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=F8SjbnDxCy8	Larry June	HOME	2022-12-07	https://i.ytimg.com/vi/F8SjbnDxCy8/hqdefault.jpg
8595	FKA twigs: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=NNodeNnXWy0	FKA twigs	HOME	2022-12-07	https://i.ytimg.com/vi/NNodeNnXWy0/hqdefault.jpg
8596	Naira Marley: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=kZ4C3xNMyI0	Naira Marley	HOME	2022-12-07	https://i.ytimg.com/vi/kZ4C3xNMyI0/hqdefault.jpg
8597	James Francies: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=sVskXNb2PIM	James Francies	HOME	2022-12-07	https://i.ytimg.com/vi/sVskXNb2PIM/hqdefault.jpg
8598	Adekunle Gold: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=r-gkSte4QdA	Adekunle Gold	HOME	2022-12-07	https://i.ytimg.com/vi/r-gkSte4QdA/hqdefault.jpg
8599	Svaneborg Kardyb: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=M1mg0yLDzvU	Svaneborg Kardyb	HOME	2022-12-07	https://i.ytimg.com/vi/M1mg0yLDzvU/hqdefault.jpg
8600	Ada Lea: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=JgOWuWchf88	Ada Lea	HOME	2022-12-07	https://i.ytimg.com/vi/JgOWuWchf88/hqdefault.jpg
8601	pH-1, Mndsgn and Audrey Nuna: AAPI Heritage Month Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=O2Twk386qm4	pH-1, Mndsgn and Audrey Nuna	HOME	2022-05-20	https://i.ytimg.com/vi/O2Twk386qm4/hqdefault.jpg
8602	IDK: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=o63dR6rEs70	IDK	HOME	2022-12-07	https://i.ytimg.com/vi/o63dR6rEs70/hqdefault.jpg
8603	Fontaines D.C.: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=mgMwGBtt4rE	Fontaines D.C.	HOME	2022-12-07	https://i.ytimg.com/vi/mgMwGBtt4rE/hqdefault.jpg
8604	Buffy Sainte-Marie: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=MAisFnH3Vro	Buffy Sainte-Marie	HOME	2022-12-07	https://i.ytimg.com/vi/MAisFnH3Vro/hqdefault.jpg
8605	ARC Ensemble: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=qXibG3pG4zM	ARC Ensemble	HOME	2022-12-07	https://i.ytimg.com/vi/qXibG3pG4zM/hqdefault.jpg
8606	Aoife O'Donovan: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=HJDx_8PIqxk	Aoife O'Donovan	HOME	2022-12-07	https://i.ytimg.com/vi/HJDx_8PIqxk/hqdefault.jpg
8607	Little Shop of Horrors: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=ymqKPz5kRXE	Little Shop of Horrors	HOME	2022-12-07	https://i.ytimg.com/vi/ymqKPz5kRXE/hqdefault.jpg
8608	Ron Carter: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=9ix2DCAzDp0	Ron Carter	HOME	2022-12-07	https://i.ytimg.com/vi/9ix2DCAzDp0/hqdefault.jpg
8609	Thee Sinseers: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=lsg1BCISPNU	Thee Sinseers	HOME	2022-12-07	https://i.ytimg.com/vi/lsg1BCISPNU/hqdefault.jpg
8610	Roger Eno: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=gnKRe1-zF28	Roger Eno	HOME	2022-12-07	https://i.ytimg.com/vi/gnKRe1-zF28/hqdefault.jpg
8611	A Strange Loop: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=ObD7Qjai55Y	A Strange Loop	HOME	2022-12-07	https://i.ytimg.com/vi/ObD7Qjai55Y/hqdefault.jpg
8612	Feid: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=UJMhvIlADYc	Feid	HOME	2022-12-07	https://i.ytimg.com/vi/UJMhvIlADYc/hqdefault.jpg
8613	S. Carey: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=mpdZZhRBnOg	S. Carey	HOME	2022-12-07	https://i.ytimg.com/vi/mpdZZhRBnOg/hqdefault.jpg
8614	Curren$y: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=izyBoVzC0Wk	Curren$y	HOME	2022-12-07	https://i.ytimg.com/vi/izyBoVzC0Wk/hqdefault.jpg
8615	Samora Pinderhughes: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=ICUoG54pIW0	Samora Pinderhughes	HOME	2022-12-07	https://i.ytimg.com/vi/ICUoG54pIW0/hqdefault.jpg
8616	mehro: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=Vz0wwYOV3PM	mehro	HOME	2022-12-07	https://i.ytimg.com/vi/Vz0wwYOV3PM/hqdefault.jpg
8617	Brittany Davis: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=E4hevWAjUZI	Brittany Davis	HOME	2022-12-07	https://i.ytimg.com/vi/E4hevWAjUZI/hqdefault.jpg
8618	The Linda Lindas: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=USdiumz1ZFM	The Linda Lindas	HOME	2022-12-07	https://i.ytimg.com/vi/USdiumz1ZFM/hqdefault.jpg
8619	Leif Ove Andsnes: Tiny Desk (home) Concert	https://www.youtube.com/watch?v=6hpERoSmq74	Leif Ove Andsnes	HOME	2022-12-07	https://i.ytimg.com/vi/6hpERoSmq74/hqdefault.jpg
8620	Maren Morris: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=iYAnixLQno4	Maren Morris	HOME	2022-04-04	https://i.ytimg.com/vi/iYAnixLQno4/hqdefault.jpg
8621	Madi Diaz: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=ZT8nSsHrUf0	Madi Diaz	HOME	2022-12-07	https://i.ytimg.com/vi/ZT8nSsHrUf0/hqdefault.jpg
8622	Tiny Desk Meets SXSW: Maxo Kream	https://www.youtube.com/watch?v=5de8UjLRZBI	Tiny Desk Meets SXSW	HOME	2022-03-24	https://i.ytimg.com/vi/5de8UjLRZBI/hqdefault.jpg
8623	Tiny Desk Meets SXSW: Pom Pom Squad	https://www.youtube.com/watch?v=ZJe0JcKLWaE	Tiny Desk Meets SXSW	HOME	2022-03-23	https://i.ytimg.com/vi/ZJe0JcKLWaE/hqdefault.jpg
8624	Tiny Desk Meets SXSW: KAINA	https://www.youtube.com/watch?v=jSK5fJpqs5I	Tiny Desk Meets SXSW	HOME	2022-03-22	https://i.ytimg.com/vi/jSK5fJpqs5I/hqdefault.jpg
8625	Tiny Desk Meets SXSW: Yard Act	https://www.youtube.com/watch?v=Id-t3IVNREo	Tiny Desk Meets SXSW	HOME	2022-03-21	https://i.ytimg.com/vi/Id-t3IVNREo/hqdefault.jpg
8626	Daniel Hope: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=hjKXtAbYbSQ	Daniel Hope	HOME	2022-03-17	https://i.ytimg.com/vi/hjKXtAbYbSQ/hqdefault.jpg
8627	Camilo: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=FlZuFh0KUvc	Camilo	HOME	2022-03-11	https://i.ytimg.com/vi/FlZuFh0KUvc/hqdefault.jpg
8628	Abdullah Ibrahim: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=L5i4stj4M30	Abdullah Ibrahim	HOME	2022-03-09	https://i.ytimg.com/vi/L5i4stj4M30/hqdefault.jpg
8629	Patricia Kopatchinskaja: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=L1l69tA5oCs	Patricia Kopatchinskaja	HOME	2022-03-08	https://i.ytimg.com/vi/L1l69tA5oCs/hqdefault.jpg
8630	Fireboy DML: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=NjwA9i_o3pU	Fireboy DML	HOME	2022-03-03	https://i.ytimg.com/vi/NjwA9i_o3pU/hqdefault.jpg
8631	Shirley Caesar: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=p3wLRo9zE5w	Shirley Caesar	HOME	2022-02-25	https://i.ytimg.com/vi/p3wLRo9zE5w/hqdefault.jpg
8632	Patti LaBelle: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=iX_ubL2-sfs	Patti LaBelle	HOME	2022-02-23	https://i.ytimg.com/vi/iX_ubL2-sfs/hqdefault.jpg
8633	Buffalo Nichols: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=FrXXLcx4dCw	Buffalo Nichols	HOME	2022-02-22	https://i.ytimg.com/vi/FrXXLcx4dCw/hqdefault.jpg
8634	Too $hort: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=cnrSu6sH-Ug	Too $hort	HOME	2022-02-17	https://i.ytimg.com/vi/cnrSu6sH-Ug/hqdefault.jpg
8635	Anthony Roth Costanzo and Justin Vivian Bond: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=qX9WE9-Pt2U	Anthony Roth Costanzo and Justin Vivian Bond	HOME	2022-02-15	https://i.ytimg.com/vi/qX9WE9-Pt2U/hqdefault.jpg
8636	Catherine Russell: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=vvTXMeexv5Y	Catherine Russell	HOME	2022-02-14	https://i.ytimg.com/vi/vvTXMeexv5Y/hqdefault.jpg
8637	El DeBarge: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=M9UMzNFJxhY	El DeBarge	HOME	2022-02-04	https://i.ytimg.com/vi/M9UMzNFJxhY/hqdefault.jpg
8638	Fatoumata Diawara: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=zxfFYV4Lfek	Fatoumata Diawara	HOME	2022-02-03	https://i.ytimg.com/vi/zxfFYV4Lfek/hqdefault.jpg
8639	Tori Amos: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=SufUZu4h_m8	Tori Amos	HOME	2022-02-02	https://i.ytimg.com/vi/SufUZu4h_m8/hqdefault.jpg
8640	Amber Mark: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=1D-QXrC3U0I	Amber Mark	HOME	2022-01-31	https://i.ytimg.com/vi/1D-QXrC3U0I/hqdefault.jpg
8641	Tufan Derince: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=jHdCIBDsniI	Tufan Derince	HOME	2022-01-30	https://i.ytimg.com/vi/jHdCIBDsniI/hqdefault.jpg
8642	Kiran Ahluwalia: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=e04Ar0KQjZY	Kiran Ahluwalia	HOME	2022-01-29	https://i.ytimg.com/vi/e04Ar0KQjZY/hqdefault.jpg
8643	Al Bilali Soudan: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=mLeFgJ9JJHY	Al Bilali Soudan	HOME	2022-01-29	https://i.ytimg.com/vi/mLeFgJ9JJHY/hqdefault.jpg
8644	Northern Cree: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=maDO3z41wXA	Northern Cree	HOME	2022-01-28	https://i.ytimg.com/vi/maDO3z41wXA/hqdefault.jpg
8645	Kombilesa M├¡: Tiny Desk Meets globalFEST	https://www.youtube.com/watch?v=H-cCTeVD3MM	Kombilesa M├¡	HOME	2022-01-28	https://i.ytimg.com/vi/H-cCTeVD3MM/hqdefault.jpg
8646	ADG7: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=7OfULrhVASI	ADG7	HOME	2022-01-28	https://i.ytimg.com/vi/7OfULrhVASI/hqdefault.jpg
8647	Bedouin Burger: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=XoRFGTt9B20	Bedouin Burger	HOME	2022-01-27	https://i.ytimg.com/vi/XoRFGTt9B20/hqdefault.jpg
8648	Suistamon S├ñhk├Â: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=fvqhf7X7vLA	Suistamon S├ñhk├Â	HOME	2022-01-27	https://i.ytimg.com/vi/fvqhf7X7vLA/hqdefault.jpg
8649	Jake Xerxes Fussell: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=SB6jTKPOjMY	Jake Xerxes Fussell	HOME	2022-01-25	https://i.ytimg.com/vi/SB6jTKPOjMY/hqdefault.jpg
8650	Cordae: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=u5puSWxPNyA	Cordae	HOME	2022-01-14	https://i.ytimg.com/vi/u5puSWxPNyA/hqdefault.jpg
8651	Mon Laferte: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=Dy4pEFFbFsA	Mon Laferte	HOME	2022-01-12	https://i.ytimg.com/vi/Dy4pEFFbFsA/hqdefault.jpg
8652	esperanza spalding: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=2arc30068Wk	esperanza spalding	HOME	2022-01-07	https://i.ytimg.com/vi/2arc30068Wk/hqdefault.jpg
8653	Turnstile: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=XfJkMTVWu3U	Turnstile	HOME	2022-01-05	https://i.ytimg.com/vi/XfJkMTVWu3U/hqdefault.jpg
8654	Jonathan McReynolds and Mali Music: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=8ta8ftzNvek	Jonathan McReynolds and Mali Music	HOME	2021-12-21	https://i.ytimg.com/vi/8ta8ftzNvek/hqdefault.jpg
8655	Insecure Takeover Part 2: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=C2BxIBlJUAE	Insecure Takeover Part 2	HOME	2021-12-17	https://i.ytimg.com/vi/C2BxIBlJUAE/hqdefault.jpg
8656	Robert Plant and Alison Krauss: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=srn5Cd9yR3Y	Robert Plant and Alison Krauss	HOME	2021-12-13	https://i.ytimg.com/vi/srn5Cd9yR3Y/hqdefault.jpg
8657	Mick Jenkins: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=IT9sB1e61BA	Mick Jenkins	HOME	2021-12-10	https://i.ytimg.com/vi/IT9sB1e61BA/hqdefault.jpg
8658	Arooj Aftab: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=ZUYJ8_tBSSQ	Arooj Aftab	HOME	2021-12-08	https://i.ytimg.com/vi/ZUYJ8_tBSSQ/hqdefault.jpg
8659	Olivia Rodrigo: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=KGczofguB0c	Olivia Rodrigo	HOME	2021-12-06	https://i.ytimg.com/vi/KGczofguB0c/hqdefault.jpg
8660	Wet Leg: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=bJUUnXZVIfY	Wet Leg	HOME	2021-12-01	https://i.ytimg.com/vi/bJUUnXZVIfY/hqdefault.jpg
8661	Sloppy Jane: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=-MefNjyFer8	Sloppy Jane	HOME	2021-11-17	https://i.ytimg.com/vi/-MefNjyFer8/hqdefault.jpg
8662	Company: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=SrYSpLGuKwo	Company	HOME	2021-11-15	https://i.ytimg.com/vi/SrYSpLGuKwo/hqdefault.jpg
8663	Raye Zaragoza: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=K6NR9DYiEqc	Raye Zaragoza	HOME	2021-11-10	https://i.ytimg.com/vi/K6NR9DYiEqc/hqdefault.jpg
8664	Ya Tseen: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=GatQYthTUKs	Ya Tseen	HOME	2021-11-09	https://i.ytimg.com/vi/GatQYthTUKs/hqdefault.jpg
8665	William Prince: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=sJT5nBmKaZc	William Prince	HOME	2021-11-08	https://i.ytimg.com/vi/sJT5nBmKaZc/hqdefault.jpg
8666	Tems: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=yXI7NP7TDCw	Tems	HOME	2021-11-04	https://i.ytimg.com/vi/yXI7NP7TDCw/hqdefault.jpg
8667	Joss Favela: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=l4c4PUNkawc	Joss Favela	HOME	2021-11-03	https://i.ytimg.com/vi/l4c4PUNkawc/hqdefault.jpg
8668	The War On Drugs: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=SKJ5JyuP7WY	The War On Drugs	HOME	2021-11-01	https://i.ytimg.com/vi/SKJ5JyuP7WY/hqdefault.jpg
8669	Ed Sheeran: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=4MsoqUv5gv4	Ed Sheeran	HOME	2021-10-27	https://i.ytimg.com/vi/4MsoqUv5gv4/hqdefault.jpg
8670	Circuit des Yeux: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=WEkXiSfnZpE	Circuit des Yeux	HOME	2021-10-25	https://i.ytimg.com/vi/WEkXiSfnZpE/hqdefault.jpg
8671	Jagged Little Pill: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=1OVXpy4Rws4	Jagged Little Pill	HOME	2021-10-21	https://i.ytimg.com/vi/1OVXpy4Rws4/hqdefault.jpg
8672	Yasmin Williams: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=nKDoVuG7uZ0	Yasmin Williams	HOME	2021-10-19	https://i.ytimg.com/vi/nKDoVuG7uZ0/hqdefault.jpg
8673	Cha Wa: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=nMlnt85iysY	Cha Wa	HOME	2021-10-18	https://i.ytimg.com/vi/nMlnt85iysY/hqdefault.jpg
8674	Camila Cabello: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=F7wIRxQEetc	Camila Cabello	HOME	2021-10-15	https://i.ytimg.com/vi/F7wIRxQEetc/hqdefault.jpg
8675	Nicki Nicole: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=RG6O-Qq79G0	Nicki Nicole	HOME	2021-10-13	https://i.ytimg.com/vi/RG6O-Qq79G0/hqdefault.jpg
8676	YEðÿDRY: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=h_a5zbizXCw	YEðÿDRY	HOME	2021-10-08	https://i.ytimg.com/vi/h_a5zbizXCw/hqdefault.jpg
8677	Prince Royce: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=-jLebs9xraI	Prince Royce	HOME	2021-10-06	https://i.ytimg.com/vi/-jLebs9xraI/hqdefault.jpg
8678	Sech: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=jdHPotMqv1M	Sech	HOME	2021-10-04	https://i.ytimg.com/vi/jdHPotMqv1M/hqdefault.jpg
8679	Eme Alfonso: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=fJNSgPqQ1yw	Eme Alfonso	HOME	2021-09-29	https://i.ytimg.com/vi/fJNSgPqQ1yw/hqdefault.jpg
8680	Silvana Estrada: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=S52_XxBwbJg	Silvana Estrada	HOME	2021-09-27	https://i.ytimg.com/vi/S52_XxBwbJg/hqdefault.jpg
8681	maye: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=2nkWKhcG-Zg	maye	HOME	2021-09-22	https://i.ytimg.com/vi/2nkWKhcG-Zg/hqdefault.jpg
8682	Diamante El├®ctrico: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=4J5zTLnIqMY	Diamante El├®ctrico	HOME	2021-09-17	https://i.ytimg.com/vi/4J5zTLnIqMY/hqdefault.jpg
8683	J Balvin: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=coMyNfnNBs4	J Balvin	HOME	2021-09-16	https://i.ytimg.com/vi/coMyNfnNBs4/hqdefault.jpg
8684	Royce 5'9": Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=ywicdvAo5AQ	Royce 5'9"	HOME	2021-09-10	https://i.ytimg.com/vi/ywicdvAo5AQ/hqdefault.jpg
8685	Pastor T.L. Barrett & the Royal Voices Of Life: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=2nFGD1-cmns	Pastor T.L. Barrett & the Royal Voices Of Life	HOME	2021-09-09	https://i.ytimg.com/vi/2nFGD1-cmns/hqdefault.jpg
8686	Yebba: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=aBMGvHHkr9Y	Yebba	HOME	2021-09-08	https://i.ytimg.com/vi/aBMGvHHkr9Y/hqdefault.jpg
8687	Rico Nasty: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=z3ZFoo4-TdU	Rico Nasty	HOME	2021-09-03	https://i.ytimg.com/vi/z3ZFoo4-TdU/hqdefault.jpg
8688	The Staves: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=tCwDzyLidAw	The Staves	HOME	2021-09-01	https://i.ytimg.com/vi/tCwDzyLidAw/hqdefault.jpg
8689	Little Simz: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=Nkt93coQzqg	Little Simz	HOME	2021-08-31	https://i.ytimg.com/vi/Nkt93coQzqg/hqdefault.jpg
8690	Migos: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=DIjOxmU6-ew	Migos	HOME	2021-08-25	https://i.ytimg.com/vi/DIjOxmU6-ew/hqdefault.jpg
8691	Joy Oladokun: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=Ea9_egtJYMg	Joy Oladokun	HOME	2021-08-20	https://i.ytimg.com/vi/Ea9_egtJYMg/hqdefault.jpg
8692	The Isley Brothers: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=uQvdcfosF5A	The Isley Brothers	HOME	2021-08-18	https://i.ytimg.com/vi/uQvdcfosF5A/hqdefault.jpg
8693	Flock of Dimes: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=pF2ga0O2dN4	Flock of Dimes	HOME	2021-08-10	https://i.ytimg.com/vi/pF2ga0O2dN4/hqdefault.jpg
8694	Ben Howard: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=5VHlrsZbgBI	Ben Howard	HOME	2021-08-09	https://i.ytimg.com/vi/5VHlrsZbgBI/hqdefault.jpg
8695	Hiatus Kaiyote: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=eCK1QnrTXvA	Hiatus Kaiyote	HOME	2021-08-04	https://i.ytimg.com/vi/eCK1QnrTXvA/hqdefault.jpg
8696	Dinosaur Jr.: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=MxbGf_JyvVs	Dinosaur Jr.	HOME	2021-08-03	https://i.ytimg.com/vi/MxbGf_JyvVs/hqdefault.jpg
8697	Shame: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=dYlX_R9opns	Shame	HOME	2021-07-30	https://i.ytimg.com/vi/dYlX_R9opns/hqdefault.jpg
8698	Anna B Savage: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=6uMyPRYjIYw	Anna B Savage	HOME	2021-07-28	https://i.ytimg.com/vi/6uMyPRYjIYw/hqdefault.jpg
8699	Young Thug: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=SAROJPnd_s8	Young Thug	HOME	2021-07-27	https://i.ytimg.com/vi/SAROJPnd_s8/hqdefault.jpg
8700	Vince Staples: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=yN0I5xTjaGo	Vince Staples	HOME	2021-07-23	https://i.ytimg.com/vi/yN0I5xTjaGo/hqdefault.jpg
8701	Maple Glider: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=DHvPWoMeDtE	Maple Glider	HOME	2021-07-21	https://i.ytimg.com/vi/DHvPWoMeDtE/hqdefault.jpg
8702	The Weather Station: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=p6Fj-Uq6Q4s	The Weather Station	HOME	2021-07-20	https://i.ytimg.com/vi/p6Fj-Uq6Q4s/hqdefault.jpg
8703	Lucy Dacus: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=-4FyRybGiBc	Lucy Dacus	HOME	2021-07-15	https://i.ytimg.com/vi/-4FyRybGiBc/hqdefault.jpg
8704	Bleachers: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=vvgTV5NEpu4	Bleachers	HOME	2021-07-12	https://i.ytimg.com/vi/vvgTV5NEpu4/hqdefault.jpg
8705	JAMBINAI: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=wEk0YlYEJAE	JAMBINAI	HOME	2021-07-09	https://i.ytimg.com/vi/wEk0YlYEJAE/hqdefault.jpg
8706	Black Motion: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=plMNAPdAyPY	Black Motion	HOME	2021-07-08	https://i.ytimg.com/vi/plMNAPdAyPY/hqdefault.jpg
8707	Dry Cleaning: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=Xdv9whWY-ZY	Dry Cleaning	HOME	2021-07-06	https://i.ytimg.com/vi/Xdv9whWY-ZY/hqdefault.jpg
8708	Sleater-Kinney: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=emPobfT6kOk	Sleater-Kinney	HOME	2021-07-01	https://i.ytimg.com/vi/emPobfT6kOk/hqdefault.jpg
8709	From The Top: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=sLFDCyqqBsQ	From The Top	HOME	2021-06-30	https://i.ytimg.com/vi/sLFDCyqqBsQ/hqdefault.jpg
8710	Carrtoons, Kaelin Ellis, Kiefer and The Kount: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=vXWcUdV9AsY	Carrtoons, Kaelin Ellis, Kiefer and The Kount	HOME	2021-06-28	https://i.ytimg.com/vi/vXWcUdV9AsY/hqdefault.jpg
8711	Mahani Teave: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=R9gdI7TbLY0	Mahani Teave	HOME	2021-06-24	https://i.ytimg.com/vi/R9gdI7TbLY0/hqdefault.jpg
8712	Liz Phair: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=NOG49BTdJLQ	Liz Phair	HOME	2021-06-23	https://i.ytimg.com/vi/NOG49BTdJLQ/hqdefault.jpg
8713	Jack Ingram, Miranda Lambert, Jon Randall: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=AKK5FV6zPkY	Jack Ingram, Miranda Lambert, Jon Randall	HOME	2021-06-21	https://i.ytimg.com/vi/AKK5FV6zPkY/hqdefault.jpg
8714	Pino Palladino + Blake Mills: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=a-V77_moZYw	Pino Palladino + Blake Mills	HOME	2021-06-17	https://i.ytimg.com/vi/a-V77_moZYw/hqdefault.jpg
8715	Men I Trust: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=wp7qctyVU2s	Men I Trust	HOME	2021-06-16	https://i.ytimg.com/vi/wp7qctyVU2s/hqdefault.jpg
8716	Joseph Keckler: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=HObS9FWpTNI	Joseph Keckler	HOME	2021-06-14	https://i.ytimg.com/vi/HObS9FWpTNI/hqdefault.jpg
8717	Merry Clayton: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=eHod4ZPzfLc	Merry Clayton	HOME	2021-06-09	https://i.ytimg.com/vi/eHod4ZPzfLc/hqdefault.jpg
8718	Rostam: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=X8LTs6EZF-Y	Rostam	HOME	2021-06-08	https://i.ytimg.com/vi/X8LTs6EZF-Y/hqdefault.jpg
8719	Tom Jones: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=3Qfw6pon9tA	Tom Jones	HOME	2021-06-07	https://i.ytimg.com/vi/3Qfw6pon9tA/hqdefault.jpg
8720	The Hold Steady: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=U0S-FysDePE	The Hold Steady	HOME	2021-06-03	https://i.ytimg.com/vi/U0S-FysDePE/hqdefault.jpg
8721	Buzzy Lee: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=cRUvdNsOdVY	Buzzy Lee	HOME	2021-06-02	https://i.ytimg.com/vi/cRUvdNsOdVY/hqdefault.jpg
8722	Fat Joe: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=tJKwzmJSpN8	Fat Joe	HOME	2021-06-01	https://i.ytimg.com/vi/tJKwzmJSpN8/hqdefault.jpg
8723	Karol G: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=MQSos6YvrKk	Karol G	HOME	2021-05-27	https://i.ytimg.com/vi/MQSos6YvrKk/hqdefault.jpg
8724	Brothers Osborne: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=YN3SNoTrLY4	Brothers Osborne	HOME	2021-05-26	https://i.ytimg.com/vi/YN3SNoTrLY4/hqdefault.jpg
8725	Deep Sea Diver: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=0pq_xv1PB28	Deep Sea Diver	HOME	2021-05-25	https://i.ytimg.com/vi/0pq_xv1PB28/hqdefault.jpg
8726	Mdou Moctar: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=khUmz4d2Hv8	Mdou Moctar	HOME	2021-05-24	https://i.ytimg.com/vi/khUmz4d2Hv8/hqdefault.jpg
8727	Laurie Anderson: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=ABjmQCxA7UU	Laurie Anderson	HOME	2021-05-20	https://i.ytimg.com/vi/ABjmQCxA7UU/hqdefault.jpg
8728	Kathleen Edwards: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=ecZNktlc-CE	Kathleen Edwards	HOME	2021-05-19	https://i.ytimg.com/vi/ecZNktlc-CE/hqdefault.jpg
8729	Palberta: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=yBEWlarv8Tk	Palberta	HOME	2021-05-18	https://i.ytimg.com/vi/yBEWlarv8Tk/hqdefault.jpg
8730	Sara Watkins: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=1aq9WjdCUik	Sara Watkins	HOME	2021-05-13	https://i.ytimg.com/vi/1aq9WjdCUik/hqdefault.jpg
8731	Ani DiFranco: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=iFS4_4Ji_-E	Ani DiFranco	HOME	2021-05-10	https://i.ytimg.com/vi/iFS4_4Ji_-E/hqdefault.jpg
8732	Moses Boyd: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=m26N10wCwss	Moses Boyd	HOME	2021-05-07	https://i.ytimg.com/vi/m26N10wCwss/hqdefault.jpg
8733	Negativland: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=CajCimN0hf8	Negativland	HOME	2021-05-06	https://i.ytimg.com/vi/CajCimN0hf8/hqdefault.jpg
8734	Cande y Paulo: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=ZoxKkGpRbtk	Cande y Paulo	HOME	2021-05-05	https://i.ytimg.com/vi/ZoxKkGpRbtk/hqdefault.jpg
8735	Tiny Desk Meets AFROPUNK: Calma Carmona	https://www.youtube.com/watch?v=rr5gRttagmU	Tiny Desk Meets AFROPUNK	HOME	2021-05-03	https://i.ytimg.com/vi/rr5gRttagmU/hqdefault.jpg
8736	Tiny Desk Meets AFROPUNK: Luedji Luna	https://www.youtube.com/watch?v=CM_ARaGik3o	Tiny Desk Meets AFROPUNK	HOME	2021-05-02	https://i.ytimg.com/vi/CM_ARaGik3o/hqdefault.jpg
8737	Tiny Desk Meets AFROPUNK: NENNY	https://www.youtube.com/watch?v=IdqnNo1mqko	Tiny Desk Meets AFROPUNK	HOME	2021-05-01	https://i.ytimg.com/vi/IdqnNo1mqko/hqdefault.jpg
8738	Rod Wave: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=sR7JdLO_y5s	Rod Wave	HOME	2021-04-29	https://i.ytimg.com/vi/sR7JdLO_y5s/hqdefault.jpg
8739	Son Lux: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=Lr3T3BxxSVA	Son Lux	HOME	2021-04-28	https://i.ytimg.com/vi/Lr3T3BxxSVA/hqdefault.jpg
8740	Lake Street Dive: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=N_t55quR7x8	Lake Street Dive	HOME	2021-04-27	https://i.ytimg.com/vi/N_t55quR7x8/hqdefault.jpg
8741	Shelley FKA DRAM: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=6xzmBkhyGxQ	Shelley FKA DRAM	HOME	2021-04-26	https://i.ytimg.com/vi/6xzmBkhyGxQ/hqdefault.jpg
8742	Tiny Desk Meets AFROPUNK: ChocQuibTown	https://www.youtube.com/watch?v=mkYN0mzY_2E	Tiny Desk Meets AFROPUNK	HOME	2021-04-25	https://i.ytimg.com/vi/mkYN0mzY_2E/hqdefault.jpg
8743	Tiny Desk Meets AFROPUNK	https://www.youtube.com/watch?v=Oj9nUXIPPYM	Tiny Desk Meets AFROPUNK	HOME	2021-04-21	https://i.ytimg.com/vi/Oj9nUXIPPYM/hqdefault.jpg
8744	Butcher Brown: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=ZfqmSZ-6Cgo	Butcher Brown	HOME	2021-04-21	https://i.ytimg.com/vi/ZfqmSZ-6Cgo/hqdefault.jpg
8745	C. Tangana: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=SW6L_lTrIFg	C. Tangana	HOME	2021-04-20	https://i.ytimg.com/vi/SW6L_lTrIFg/hqdefault.jpg
8746	Rina Sawayama: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=85_uFm1R5TA	Rina Sawayama	HOME	2021-04-19	https://i.ytimg.com/vi/85_uFm1R5TA/hqdefault.jpg
8747	CARM: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=DN1Y-tbCHvA	CARM	HOME	2021-04-15	https://i.ytimg.com/vi/DN1Y-tbCHvA/hqdefault.jpg
8748	Demi Lovato: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=Ehw07lXL1AY	Demi Lovato	HOME	2021-04-14	https://i.ytimg.com/vi/Ehw07lXL1AY/hqdefault.jpg
8749	Nathaniel Rateliff: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=Q3p7JxooncM	Nathaniel Rateliff	HOME	2021-04-12	https://i.ytimg.com/vi/Q3p7JxooncM/hqdefault.jpg
8750	Tiny Desk Meets SXSW: clipping.	https://www.youtube.com/watch?v=Fn6S9NTpPvk	Tiny Desk Meets SXSW	HOME	2021-04-08	https://i.ytimg.com/vi/Fn6S9NTpPvk/hqdefault.jpg
8751	Tiny Desk Meets SXSW: DUCKWRTH	https://www.youtube.com/watch?v=0-PlG-SU8sc	Tiny Desk Meets SXSW	HOME	2021-04-07	https://i.ytimg.com/vi/0-PlG-SU8sc/hqdefault.jpg
8752	Tiny Desk Meets SXSW: Yasser Tejeda & Palotr├®	https://www.youtube.com/watch?v=C9fMzxICTjU	Tiny Desk Meets SXSW	HOME	2021-04-07	https://i.ytimg.com/vi/C9fMzxICTjU/hqdefault.jpg
8753	Tiny Desk Meets SXSW: Steady Holiday	https://www.youtube.com/watch?v=wNy-HJXcFho	Tiny Desk Meets SXSW	HOME	2021-04-05	https://i.ytimg.com/vi/wNy-HJXcFho/hqdefault.jpg
8754	Tiny Desk (Home) Concert: Kacy & Clayton and Marlon Williams	https://www.youtube.com/watch?v=e0zFkeH9PAM	Tiny Desk (Home) Concert	HOME	2021-03-29	https://i.ytimg.com/vi/e0zFkeH9PAM/hqdefault.jpg
8755	Buck Meek: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=bOf3tD0sMxQ	Buck Meek	HOME	2021-03-25	https://i.ytimg.com/vi/bOf3tD0sMxQ/hqdefault.jpg
8756	Liam Bailey: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=FGWUGkSvyKM	Liam Bailey	HOME	2021-03-23	https://i.ytimg.com/vi/FGWUGkSvyKM/hqdefault.jpg
8757	Sting: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=87_1W4P1F2A	Sting	HOME	2021-03-22	https://i.ytimg.com/vi/87_1W4P1F2A/hqdefault.jpg
8758	Justin Bieber: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=Su6kidaGW_8	Justin Bieber	HOME	2021-03-17	https://i.ytimg.com/vi/Su6kidaGW_8/hqdefault.jpg
8759	Xavier Om├ñr: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=zD9hyjbTuF0	Xavier Om├ñr	HOME	2021-03-15	https://i.ytimg.com/vi/zD9hyjbTuF0/hqdefault.jpg
8760	Black Coffee: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=npORmybcPdk	Black Coffee	HOME	2021-03-11	https://i.ytimg.com/vi/npORmybcPdk/hqdefault.jpg
8761	Coming 2 America ÔÇö Sounds of Zamunda: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=8NqSBqTQIq4	Coming 2 America ÔÇö Sounds of Zamunda	HOME	2021-03-10	https://i.ytimg.com/vi/8NqSBqTQIq4/hqdefault.jpg
8762	Fleet Foxes: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=Ko5yZHAiKTU	Fleet Foxes	HOME	2021-03-09	https://i.ytimg.com/vi/Ko5yZHAiKTU/hqdefault.jpg
8763	├ôlafur Arnalds: Tiny Desk (Home) Concerts	https://www.youtube.com/watch?v=yB2p5Oaa5Js	├ôlafur Arnalds	HOME	2021-03-04	https://i.ytimg.com/vi/yB2p5Oaa5Js/hqdefault.jpg
8764	Jack Harlow: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=GNrerhak_pY	Jack Harlow	HOME	2021-03-09	https://i.ytimg.com/vi/GNrerhak_pY/hqdefault.jpg
8765	Kirk Franklin: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=wRwId2RfmfA	Kirk Franklin	HOME	2021-02-25	https://i.ytimg.com/vi/wRwId2RfmfA/hqdefault.jpg
8766	Davido: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=nSS4FiOY8P0	Davido	HOME	2021-02-23	https://i.ytimg.com/vi/nSS4FiOY8P0/hqdefault.jpg
8767	Sampa The Great: Tiny Desk (Home) Concerts	https://www.youtube.com/watch?v=svxhRbzGpMU	Sampa The Great	HOME	2021-02-23	https://i.ytimg.com/vi/svxhRbzGpMU/hqdefault.jpg
8768	Bartees Strange: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=8xoYo-rU_Xs	Bartees Strange	HOME	2021-02-22	https://i.ytimg.com/vi/8xoYo-rU_Xs/hqdefault.jpg
8769	Rae Khalil: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=vDZBjxj-QAU	Rae Khalil	HOME	2021-02-18	https://i.ytimg.com/vi/vDZBjxj-QAU/hqdefault.jpg
8770	2 Chainz: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=3ZLP8QMVse8	2 Chainz	HOME	2021-02-17	https://i.ytimg.com/vi/3ZLP8QMVse8/hqdefault.jpg
8771	Rick Ross: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=A7dobkCQj74	Rick Ross	HOME	2021-02-15	https://i.ytimg.com/vi/A7dobkCQj74/hqdefault.jpg
8772	GIV─ÆON: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=dh3MiwuLntA	GIV─ÆON	HOME	2021-02-08	https://i.ytimg.com/vi/dh3MiwuLntA/hqdefault.jpg
8773	Immanuel Wilkins: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=aRgJlYnlJCM	Immanuel Wilkins	HOME	2021-02-03	https://i.ytimg.com/vi/aRgJlYnlJCM/hqdefault.jpg
8774	JLCO Septet with Wynton Marsalis: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=vWQTzN_Nj1A	JLCO Septet with Wynton Marsalis	HOME	2021-02-02	https://i.ytimg.com/vi/vWQTzN_Nj1A/hqdefault.jpg
8775	Muzz: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=nIiR7Tsypo4	Muzz	HOME	2021-01-29	https://i.ytimg.com/vi/nIiR7Tsypo4/hqdefault.jpg
8776	Miley Cyrus: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=W5-yezpcZNU	Miley Cyrus	HOME	2021-01-28	https://i.ytimg.com/vi/W5-yezpcZNU/hqdefault.jpg
8777	Lous and The Yakuza: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=dzgEjZyN9ec	Lous and The Yakuza	HOME	2021-01-26	https://i.ytimg.com/vi/dzgEjZyN9ec/hqdefault.jpg
8778	Sevana: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=LMQp9x3hkMc	Sevana	HOME	2021-01-26	https://i.ytimg.com/vi/LMQp9x3hkMc/hqdefault.jpg
8779	Future Islands: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=A8fbjYgGouM	Future Islands	HOME	2021-01-25	https://i.ytimg.com/vi/A8fbjYgGouM/hqdefault.jpg
8780	Rokia Traor├®: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=bpY060dYQgM	Rokia Traor├®	HOME	2021-01-26	https://i.ytimg.com/vi/bpY060dYQgM/hqdefault.jpg
8781	Elisapie: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=OZHSCZRs1LI	Elisapie	HOME	2021-01-26	https://i.ytimg.com/vi/OZHSCZRs1LI/hqdefault.jpg
8782	Edwin Perez: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=S77KlsGlbCI	Edwin Perez	HOME	2021-01-26	https://i.ytimg.com/vi/S77KlsGlbCI/hqdefault.jpg
8783	Martha Redbone: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=Olv2wcDxslo	Martha Redbone	HOME	2021-01-26	https://i.ytimg.com/vi/Olv2wcDxslo/hqdefault.jpg
8784	Rachele Andrioli: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=KoCk1krAX2M	Rachele Andrioli	HOME	2021-01-26	https://i.ytimg.com/vi/KoCk1krAX2M/hqdefault.jpg
8785	Aditya Prakash Ensemble: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=-dW6ksJVWXY	Aditya Prakash Ensemble	HOME	2021-01-26	https://i.ytimg.com/vi/-dW6ksJVWXY/hqdefault.jpg
8786	Vox Sambou: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=_hSLiT0q7qY	Vox Sambou	HOME	2021-01-26	https://i.ytimg.com/vi/_hSLiT0q7qY/hqdefault.jpg
8787	Max Richter: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=blPehZQd6Ms	Max Richter	HOME	2021-01-22	https://i.ytimg.com/vi/blPehZQd6Ms/hqdefault.jpg
8788	PUP: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=yzvMnB4wfww	PUP	HOME	2021-01-21	https://i.ytimg.com/vi/yzvMnB4wfww/hqdefault.jpg
8789	Nora Brown: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=GxjyFQS2nIY	Nora Brown	HOME	2021-01-26	https://i.ytimg.com/vi/GxjyFQS2nIY/hqdefault.jpg
8790	Nora Brown: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=GxjyFQS2nIY	Nora Brown	HOME	2021-01-19	https://i.ytimg.com/vi/GxjyFQS2nIY/hqdefault.jpg
8791	Gabriel Garz├│n-Montano: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=bMN99gLK424	Gabriel Garz├│n-Montano	HOME	2021-01-19	https://i.ytimg.com/vi/bMN99gLK424/hqdefault.jpg
8792	TH1RT3EN: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=gUaAOpVvbVY	TH1RT3EN	HOME	2021-01-19	https://i.ytimg.com/vi/gUaAOpVvbVY/hqdefault.jpg
8793	Emel: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=nJnEN7RlR0Q	Emel	HOME	2021-01-26	https://i.ytimg.com/vi/nJnEN7RlR0Q/hqdefault.jpg
8794	Emel: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=nJnEN7RlR0Q	Emel	HOME	2021-01-19	https://i.ytimg.com/vi/nJnEN7RlR0Q/hqdefault.jpg
8795	Natu Camara: Tiny Desk (Home) Concerts	https://www.youtube.com/watch?v=VF411hFXtI0	Natu Camara	HOME	2021-01-26	https://i.ytimg.com/vi/VF411hFXtI0/hqdefault.jpg
8796	Natu Camara: Tiny Desk (Home) Concerts	https://www.youtube.com/watch?v=VF411hFXtI0	Natu Camara	HOME	2021-01-19	https://i.ytimg.com/vi/VF411hFXtI0/hqdefault.jpg
8797	Hit La Rosa: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=A3fxj5CoyfU	Hit La Rosa	HOME	2021-01-26	https://i.ytimg.com/vi/A3fxj5CoyfU/hqdefault.jpg
8798	Hit La Rosa: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=A3fxj5CoyfU	Hit La Rosa	HOME	2021-01-19	https://i.ytimg.com/vi/A3fxj5CoyfU/hqdefault.jpg
8799	Minyo Crusaders: Tiny Desk (Home) Concerts	https://www.youtube.com/watch?v=mc1QgsEl6zI	Minyo Crusaders	HOME	2021-01-26	https://i.ytimg.com/vi/mc1QgsEl6zI/hqdefault.jpg
8800	Minyo Crusaders: Tiny Desk (Home) Concerts	https://www.youtube.com/watch?v=mc1QgsEl6zI	Minyo Crusaders	HOME	2021-01-19	https://i.ytimg.com/vi/mc1QgsEl6zI/hqdefault.jpg
8801	DakhaBrakha: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=cX8dyBKGGD4	DakhaBrakha	HOME	2021-01-26	https://i.ytimg.com/vi/cX8dyBKGGD4/hqdefault.jpg
8802	DakhaBrakha: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=cX8dyBKGGD4	DakhaBrakha	HOME	2021-01-19	https://i.ytimg.com/vi/cX8dyBKGGD4/hqdefault.jpg
8803	Sofia Rei: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=6cQUKZXoHlE	Sofia Rei	HOME	2021-01-26	https://i.ytimg.com/vi/6cQUKZXoHlE/hqdefault.jpg
8804	Sofia Rei: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=6cQUKZXoHlE	Sofia Rei	HOME	2021-01-19	https://i.ytimg.com/vi/6cQUKZXoHlE/hqdefault.jpg
8805	Labess: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=Sgi1i2z-zys	Labess	HOME	2021-01-26	https://i.ytimg.com/vi/Sgi1i2z-zys/hqdefault.jpg
8806	Labess: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=Sgi1i2z-zys	Labess	HOME	2021-01-19	https://i.ytimg.com/vi/Sgi1i2z-zys/hqdefault.jpg
8807	Dedicated Men Of Zion: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=h_5bneT_Omc	Dedicated Men Of Zion	HOME	2021-01-26	https://i.ytimg.com/vi/h_5bneT_Omc/hqdefault.jpg
8808	Dedicated Men Of Zion: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=h_5bneT_Omc	Dedicated Men Of Zion	HOME	2021-01-19	https://i.ytimg.com/vi/h_5bneT_Omc/hqdefault.jpg
8809	mxmtoon: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=UH1lce2Wzmc	mxmtoon	HOME	2021-01-15	https://i.ytimg.com/vi/UH1lce2Wzmc/hqdefault.jpg
8810	Tiny Desk Meets globalFEST: Edwin Perez, Elisapie, Nora Brown, Rokia Traor├®	https://www.youtube.com/watch?v=PG3kd3_v6js	Tiny Desk Meets globalFEST	HOME	2021-01-14	https://i.ytimg.com/vi/PG3kd3_v6js/hqdefault.jpg
8811	Tiny Desk Meets globalFEST: Vox Sambou, Aditya Prakash Ensemble, Rachele Andrioli, Martha Redbone	https://www.youtube.com/watch?v=1sdOIpRJuvE	Tiny Desk Meets globalFEST	HOME	2021-01-14	https://i.ytimg.com/vi/1sdOIpRJuvE/hqdefault.jpg
8812	Tiny Desk Meets globalFEST: Minyo Crusaders, Hit La Rosa, Natu Camara, Emel	https://www.youtube.com/watch?v=RyBMNprEeQM	Tiny Desk Meets globalFEST	HOME	2021-01-12	https://i.ytimg.com/vi/RyBMNprEeQM/hqdefault.jpg
8813	Tiny Desk Meets globalFEST: Dedicated Men Of Zion, Labess, Sofia Rei & DakhaBrakha	https://www.youtube.com/watch?v=rUF2yr7CC4w	Tiny Desk Meets globalFEST	HOME	2021-01-11	https://i.ytimg.com/vi/rUF2yr7CC4w/hqdefault.jpg
8814	Jazmine Sullivan: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=KgrCYvVYSRE	Jazmine Sullivan	HOME	2021-01-08	https://i.ytimg.com/vi/KgrCYvVYSRE/hqdefault.jpg
8815	Active Child: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=e9hZFjbOsWg	Active Child	HOME	2021-01-06	https://i.ytimg.com/vi/e9hZFjbOsWg/hqdefault.jpg
8816	Sevdaliza: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=2o-4iD-ZNFc	Sevdaliza	HOME	2021-01-05	https://i.ytimg.com/vi/2o-4iD-ZNFc/hqdefault.jpg
8817	Cory Henry: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=Ql02rtW62Os	Cory Henry	HOME	2020-12-21	https://i.ytimg.com/vi/Ql02rtW62Os/hqdefault.jpg
8818	Jan Vogler And Alessio Bax: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=1d24-TN19bQ	Jan Vogler And Alessio Bax	HOME	2020-12-16	https://i.ytimg.com/vi/1d24-TN19bQ/hqdefault.jpg
8819	Borromeo String Quartet: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=8UdN8uWJRqM	Borromeo String Quartet	HOME	2020-12-15	https://i.ytimg.com/vi/8UdN8uWJRqM/hqdefault.jpg
8820	Jonathan Biss: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=99jaKJvtRBY	Jonathan Biss	HOME	2020-12-14	https://i.ytimg.com/vi/99jaKJvtRBY/hqdefault.jpg
8821	Ashley Ray: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=ujDMZENuwwE	Ashley Ray	HOME	2020-12-11	https://i.ytimg.com/vi/ujDMZENuwwE/hqdefault.jpg
8822	Hayley Williams: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=ZknTE5DPlAA	Hayley Williams	HOME	2020-12-09	https://i.ytimg.com/vi/ZknTE5DPlAA/hqdefault.jpg
8823	Chloe x Halle: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=KTNZR82fVHw	Chloe x Halle	HOME	2020-12-07	https://i.ytimg.com/vi/KTNZR82fVHw/hqdefault.jpg
8824	Black Pumas: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=TKfRm6uNx7I	Black Pumas	HOME	2020-12-07	https://i.ytimg.com/vi/TKfRm6uNx7I/hqdefault.jpg
8825	Dua Lipa: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=F4neLJQC1_E	Dua Lipa	HOME	2020-12-03	https://i.ytimg.com/vi/F4neLJQC1_E/hqdefault.jpg
8826	PJ Morton: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=YyK2H0G4jrE	PJ Morton	HOME	2020-12-01	https://i.ytimg.com/vi/YyK2H0G4jrE/hqdefault.jpg
8827	Julia Bullock: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=pyJsiO6SbAY	Julia Bullock	HOME	2020-11-30	https://i.ytimg.com/vi/pyJsiO6SbAY/hqdefault.jpg
8828	Mac Ayres: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=nABC-s1uBCk	Mac Ayres	HOME	2020-11-25	https://i.ytimg.com/vi/nABC-s1uBCk/hqdefault.jpg
8829	Latto: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=iZZv2BDtP50	Latto	HOME	2020-11-20	https://i.ytimg.com/vi/iZZv2BDtP50/hqdefault.jpg
8830	Don Bryant: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=T8o7k1GCM0c	Don Bryant	HOME	2020-11-20	https://i.ytimg.com/vi/T8o7k1GCM0c/hqdefault.jpg
8831	KEM: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=MrDA0ajZuWU	KEM	HOME	2020-11-20	https://i.ytimg.com/vi/MrDA0ajZuWU/hqdefault.jpg
8832	Adrianne Lenker: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=TKcQyUszdhw	Adrianne Lenker	HOME	2020-11-17	https://i.ytimg.com/vi/TKcQyUszdhw/hqdefault.jpg
8833	Owen Pallett: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=R0_JKdTkjus	Owen Pallett	HOME	2020-11-17	https://i.ytimg.com/vi/R0_JKdTkjus/hqdefault.jpg
8834	Michael Kiwanuka: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=bhKMsubj3bg	Michael Kiwanuka	HOME	2020-11-16	https://i.ytimg.com/vi/bhKMsubj3bg/hqdefault.jpg
8835	Copland House: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=AndHtmw36GU	Copland House	HOME	2020-11-13	https://i.ytimg.com/vi/AndHtmw36GU/hqdefault.jpg
8836	Tigran Hamasyan: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=PSgPYBn4yyE	Tigran Hamasyan	HOME	2020-11-10	https://i.ytimg.com/vi/PSgPYBn4yyE/hqdefault.jpg
8837	Shirley Collins: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=n8SdsHsiZ7k	Shirley Collins	HOME	2020-11-09	https://i.ytimg.com/vi/n8SdsHsiZ7k/hqdefault.jpg
8838	Mickey Guyton: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=bnbJCEBGvHU	Mickey Guyton	HOME	2020-11-06	https://i.ytimg.com/vi/bnbJCEBGvHU/hqdefault.jpg
8839	Tiana Major9: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=lzYBAe-Af-Y	Tiana Major9	HOME	2020-11-04	https://i.ytimg.com/vi/lzYBAe-Af-Y/hqdefault.jpg
8840	Polo G: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=mt8-QwG8dXM	Polo G	HOME	2020-11-03	https://i.ytimg.com/vi/mt8-QwG8dXM/hqdefault.jpg
8841	Sad13: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=YIguSzBUo8o	Sad13	HOME	2020-10-29	https://i.ytimg.com/vi/YIguSzBUo8o/hqdefault.jpg
8842	Ty Dolla $ign: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=Y_-I2y1YPsM	Ty Dolla $ign	HOME	2020-10-27	https://i.ytimg.com/vi/Y_-I2y1YPsM/hqdefault.jpg
8843	GroundUP Music with Becca Stevens, Bokant├®, Alina Engibaryan And More: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=1jUVHWe09GQ	GroundUP Music with Becca Stevens, Bokant├®, Alina Engibaryan And More	HOME	2020-10-26	https://i.ytimg.com/vi/1jUVHWe09GQ/hqdefault.jpg
8844	Katie Pruitt: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=QDJWmG7d0AM	Katie Pruitt	HOME	2020-10-23	https://i.ytimg.com/vi/QDJWmG7d0AM/hqdefault.jpg
8845	Spillage Village: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=_76wT1NMgUY	Spillage Village	HOME	2020-10-22	https://i.ytimg.com/vi/_76wT1NMgUY/hqdefault.jpg
8846	Leo Kottke and Mike Gordon: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=gBCV3RFWCAA	Leo Kottke and Mike Gordon	HOME	2020-10-20	https://i.ytimg.com/vi/gBCV3RFWCAA/hqdefault.jpg
8847	Kingfish: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=nmDSzmiys1g	Kingfish	HOME	2020-10-19	https://i.ytimg.com/vi/nmDSzmiys1g/hqdefault.jpg
8848	Gracie and Rachel: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=6_tzgvTDNds	Gracie and Rachel	HOME	2020-10-15	https://i.ytimg.com/vi/6_tzgvTDNds/hqdefault.jpg
8849	Ozuna: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=iK1uBBv83M0	Ozuna	HOME	2020-10-15	https://i.ytimg.com/vi/iK1uBBv83M0/hqdefault.jpg
8850	Bebel Gilberto: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=uEK-6cHmmZI	Bebel Gilberto	HOME	2020-10-14	https://i.ytimg.com/vi/uEK-6cHmmZI/hqdefault.jpg
8851	Carlos Vives: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=RvVqaCs-K_8	Carlos Vives	HOME	2020-10-09	https://i.ytimg.com/vi/RvVqaCs-K_8/hqdefault.jpg
8852	Lido Pimienta: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=YEnY43csEG0	Lido Pimienta	HOME	2020-10-08	https://i.ytimg.com/vi/YEnY43csEG0/hqdefault.jpg
8853	The Flaming Lips: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=MkKYLILiSDo	The Flaming Lips	HOME	2020-10-06	https://i.ytimg.com/vi/MkKYLILiSDo/hqdefault.jpg
8854	Angel Olsen: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=4RL4mk38wwI	Angel Olsen	HOME	2020-10-02	https://i.ytimg.com/vi/4RL4mk38wwI/hqdefault.jpg
8855	Little Big Town: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=3Cu67zSVl-U	Little Big Town	HOME	2020-10-01	https://i.ytimg.com/vi/3Cu67zSVl-U/hqdefault.jpg
8856	Linda Diaz, 2020 Tiny Desk Contest Winner: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=MYiP0WO6yzA	Linda Diaz, 2020 Tiny Desk Contest Winner	HOME	2020-10-01	https://i.ytimg.com/vi/MYiP0WO6yzA/hqdefault.jpg
8857	Jhen├® Aiko: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=XVMJXZYgNfc	Jhen├® Aiko	HOME	2020-09-30	https://i.ytimg.com/vi/XVMJXZYgNfc/hqdefault.jpg
8858	Jason Isbell and Amanda Shires: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=dJm_RW8Rm10	Jason Isbell and Amanda Shires	HOME	2020-09-29	https://i.ytimg.com/vi/dJm_RW8Rm10/hqdefault.jpg
8859	The Good Ones: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=0luknWYSQNA	The Good Ones	HOME	2020-09-28	https://i.ytimg.com/vi/0luknWYSQNA/hqdefault.jpg
8860	Bright Eyes: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=HJvIQv9xZqg	Bright Eyes	HOME	2020-09-24	https://i.ytimg.com/vi/HJvIQv9xZqg/hqdefault.jpg
8861	Conway The Machine: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=xctyRJC3bZQ	Conway The Machine	HOME	2020-09-22	https://i.ytimg.com/vi/xctyRJC3bZQ/hqdefault.jpg
8862	Oddisee: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=HJgyQ47qABI	Oddisee	HOME	2020-09-21	https://i.ytimg.com/vi/HJgyQ47qABI/hqdefault.jpg
8863	BTS: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=gFYAXsa7pe8	BTS	HOME	2020-09-17	https://i.ytimg.com/vi/gFYAXsa7pe8/hqdefault.jpg
8864	Nubya Garcia: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=DTIZikaOTDE	Nubya Garcia	HOME	2020-09-15	https://i.ytimg.com/vi/DTIZikaOTDE/hqdefault.jpg
8865	Arlo Parks: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=wdYEZGchdiA	Arlo Parks	HOME	2020-09-14	https://i.ytimg.com/vi/wdYEZGchdiA/hqdefault.jpg
8866	Declan McKenna: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=2FblAep81Cc	Declan McKenna	HOME	2020-09-11	https://i.ytimg.com/vi/2FblAep81Cc/hqdefault.jpg
8867	Phoebe Bridgers: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=2bOigld3D1k	Phoebe Bridgers	HOME	2020-09-09	https://i.ytimg.com/vi/2bOigld3D1k/hqdefault.jpg
8868	Bill Callahan: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=9EBGxX5je0E	Bill Callahan	HOME	2020-09-08	https://i.ytimg.com/vi/9EBGxX5je0E/hqdefault.jpg
8869	Protoje: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=CMyNMITOjro	Protoje	HOME	2020-09-04	https://i.ytimg.com/vi/CMyNMITOjro/hqdefault.jpg
8870	Burt Bacharach & Daniel Tashian: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=tthPY0gAGeU	Burt Bacharach & Daniel Tashian	HOME	2020-09-02	https://i.ytimg.com/vi/tthPY0gAGeU/hqdefault.jpg
8871	Anat Cohen and Marcello Gon├ºalves: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=vhfsae_nv-4	Anat Cohen and Marcello Gon├ºalves	HOME	2020-08-31	https://i.ytimg.com/vi/vhfsae_nv-4/hqdefault.jpg
8872	Yo-Yo Ma, Stuart Duncan, Edgar Meyer and Chris Thile: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=-yiQbeB7Bk8	Yo-Yo Ma, Stuart Duncan, Edgar Meyer and Chris Thile	HOME	2020-08-31	https://i.ytimg.com/vi/-yiQbeB7Bk8/hqdefault.jpg
8873	Tiwa Savage: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=9S53BdCfsjw	Tiwa Savage	HOME	2020-08-28	https://i.ytimg.com/vi/9S53BdCfsjw/hqdefault.jpg
8874	Billie Eilish: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=4sZ2_aGsLKU	Billie Eilish	HOME	2020-08-25	https://i.ytimg.com/vi/4sZ2_aGsLKU/hqdefault.jpg
8875	Yola: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=YJVStI_aC9s	Yola	HOME	2020-08-24	https://i.ytimg.com/vi/YJVStI_aC9s/hqdefault.jpg
8876	Tame Impala: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=C24hUt18RWY	Tame Impala	HOME	2020-08-21	https://i.ytimg.com/vi/C24hUt18RWY/hqdefault.jpg
8877	Courtney Marie Andrews: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=JGafVApCHpg	Courtney Marie Andrews	HOME	2020-08-18	https://i.ytimg.com/vi/JGafVApCHpg/hqdefault.jpg
8878	Lila Ik├®: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=mbPa0QH_zxA	Lila Ik├®	HOME	2020-08-18	https://i.ytimg.com/vi/mbPa0QH_zxA/hqdefault.jpg
8879	Buscabulla: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=zvDmr_REr5w	Buscabulla	HOME	2020-08-14	https://i.ytimg.com/vi/zvDmr_REr5w/hqdefault.jpg
8880	Norah Jones: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=o0ZnzboaDSg	Norah Jones	HOME	2020-08-17	https://i.ytimg.com/vi/o0ZnzboaDSg/hqdefault.jpg
8881	Flatbush Zombies: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=riz2_MQoF1Q	Flatbush Zombies	HOME	2020-08-12	https://i.ytimg.com/vi/riz2_MQoF1Q/hqdefault.jpg
8882	V├¡kingur ├ôlafsson: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=HdKkRs6H8jE	V├¡kingur ├ôlafsson	HOME	2020-08-11	https://i.ytimg.com/vi/HdKkRs6H8jE/hqdefault.jpg
8883	Becca Mancari: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=V7swrM4dfuo	Becca Mancari	HOME	2020-08-10	https://i.ytimg.com/vi/V7swrM4dfuo/hqdefault.jpg
8884	Melanie Faye: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=oWQcp2_HTPw	Melanie Faye	HOME	2020-07-29	https://i.ytimg.com/vi/oWQcp2_HTPw/hqdefault.jpg
8885	Kate Davis: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=68hXtA9odvs	Kate Davis	HOME	2020-07-29	https://i.ytimg.com/vi/68hXtA9odvs/hqdefault.jpg
8886	John Legend: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=tFxQbPYe_ZA	John Legend	HOME	2020-07-29	https://i.ytimg.com/vi/tFxQbPYe_ZA/hqdefault.jpg
8887	Lyric Jones: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=ZzOKewL7m_M	Lyric Jones	HOME	2020-07-28	https://i.ytimg.com/vi/ZzOKewL7m_M/hqdefault.jpg
8888	Thao Nguyen: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=2ooC7TOr5m0	Thao Nguyen	HOME	2020-07-27	https://i.ytimg.com/vi/2ooC7TOr5m0/hqdefault.jpg
8889	Lucinda Williams: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=w8e9sy02AS0	Lucinda Williams	HOME	2020-07-24	https://i.ytimg.com/vi/w8e9sy02AS0/hqdefault.jpg
8890	Nil├╝fer Yanya: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=bfY1i-XONxo	Nil├╝fer Yanya	HOME	2020-07-21	https://i.ytimg.com/vi/bfY1i-XONxo/hqdefault.jpg
8891	Tom Adams: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=TZUdt79HNsI	Tom Adams	HOME	2020-07-17	https://i.ytimg.com/vi/TZUdt79HNsI/hqdefault.jpg
8892	Lenny Kravitz: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=17mKFPut4FI	Lenny Kravitz	HOME	2020-07-17	https://i.ytimg.com/vi/17mKFPut4FI/hqdefault.jpg
8893	Diana Gordon: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=6Zf5dB6HFp4	Diana Gordon	HOME	2020-07-14	https://i.ytimg.com/vi/6Zf5dB6HFp4/hqdefault.jpg
8894	Benny Sings: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=m4vnYGgoYBQ	Benny Sings	HOME	2020-07-13	https://i.ytimg.com/vi/m4vnYGgoYBQ/hqdefault.jpg
8895	Tom Misch and Yussef Dayes: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=2eXGtT7E5aU	Tom Misch and Yussef Dayes	HOME	2020-07-13	https://i.ytimg.com/vi/2eXGtT7E5aU/hqdefault.jpg
8896	Jacob Collier: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=mJR6XSSKi-g	Jacob Collier	HOME	2020-07-08	https://i.ytimg.com/vi/mJR6XSSKi-g/hqdefault.jpg
8897	Roddy Ricch: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=KC0pfCv4A0Y	Roddy Ricch	HOME	2020-07-07	https://i.ytimg.com/vi/KC0pfCv4A0Y/hqdefault.jpg
8898	Chicano Batman: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=hARU2pnprX4	Chicano Batman	HOME	2020-07-06	https://i.ytimg.com/vi/hARU2pnprX4/hqdefault.jpg
8899	Dirty Projectors: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=DSgJ_6sOBB8	Dirty Projectors	HOME	2020-07-02	https://i.ytimg.com/vi/DSgJ_6sOBB8/hqdefault.jpg
8900	Trupa Trupa: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=_S80LFnceaE	Trupa Trupa	HOME	2020-07-02	https://i.ytimg.com/vi/_S80LFnceaE/hqdefault.jpg
8901	Fabiano do Nascimento: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=M4iukkBmDGg	Fabiano do Nascimento	HOME	2020-07-01	https://i.ytimg.com/vi/M4iukkBmDGg/hqdefault.jpg
8902	Malawi Mouse Boys: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=EfyZ5U7PBKQ	Malawi Mouse Boys	HOME	2020-06-30	https://i.ytimg.com/vi/EfyZ5U7PBKQ/hqdefault.jpg
8903	Coreyah: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=1ZhAz6-Cgdg	Coreyah	HOME	2020-06-29	https://i.ytimg.com/vi/1ZhAz6-Cgdg/hqdefault.jpg
8904	BEAM: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=Uz5Kgcjiasc	BEAM	HOME	2020-06-25	https://i.ytimg.com/vi/Uz5Kgcjiasc/hqdefault.jpg
8905	M. Ward: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=zBzeyUvkmCE	M. Ward	HOME	2020-06-24	https://i.ytimg.com/vi/zBzeyUvkmCE/hqdefault.jpg
8906	Madame Gandhi: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=7Sc34WvNxp8	Madame Gandhi	HOME	2020-06-22	https://i.ytimg.com/vi/7Sc34WvNxp8/hqdefault.jpg
8907	Hamilton Leithauser & Family: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=VAb6wEdum0I	Hamilton Leithauser & Family	HOME	2020-06-18	https://i.ytimg.com/vi/VAb6wEdum0I/hqdefault.jpg
8908	Benny The Butcher: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=rbEmFl1CN5U	Benny The Butcher	HOME	2020-06-18	https://i.ytimg.com/vi/rbEmFl1CN5U/hqdefault.jpg
8909	Little Dragon: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=koveFxBb3FU	Little Dragon	HOME	2020-06-17	https://i.ytimg.com/vi/koveFxBb3FU/hqdefault.jpg
8910	Haim: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=Svv3IX8exP8	Haim	HOME	2020-06-16	https://i.ytimg.com/vi/Svv3IX8exP8/hqdefault.jpg
8911	PJ: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=EdsmANgmegA	PJ	HOME	2020-06-12	https://i.ytimg.com/vi/EdsmANgmegA/hqdefault.jpg
8912	KIRBY: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=TOrp6OrtVFs	KIRBY	HOME	2020-06-11	https://i.ytimg.com/vi/TOrp6OrtVFs/hqdefault.jpg
8913	Baby Rose: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=zdD3UsAemq0	Baby Rose	HOME	2020-06-10	https://i.ytimg.com/vi/zdD3UsAemq0/hqdefault.jpg
8914	Sa-Roc: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=k51uMl8rhp0	Sa-Roc	HOME	2020-06-03	https://i.ytimg.com/vi/k51uMl8rhp0/hqdefault.jpg
8915	Lara Downes: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=lwSBAS2Pp-U	Lara Downes	HOME	2020-05-30	https://i.ytimg.com/vi/lwSBAS2Pp-U/hqdefault.jpg
8916	D Smoke: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=XYZdxSJLg-M	D Smoke	HOME	2020-05-28	https://i.ytimg.com/vi/XYZdxSJLg-M/hqdefault.jpg
8917	Rhiannon Giddens: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=h4luI94cSi8	Rhiannon Giddens	HOME	2020-05-27	https://i.ytimg.com/vi/h4luI94cSi8/hqdefault.jpg
8918	Clem Snide with Scott Avett: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=meebIY77RI8	Clem Snide with Scott Avett	HOME	2020-05-22	https://i.ytimg.com/vi/meebIY77RI8/hqdefault.jpg
8919	Buddy and Kent Jamz: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=vNi82rhiIiE	Buddy and Kent Jamz	HOME	2020-05-21	https://i.ytimg.com/vi/vNi82rhiIiE/hqdefault.jpg
8920	Sylvan Esso: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=1ZJ9ynWJY78	Sylvan Esso	HOME	2020-05-20	https://i.ytimg.com/vi/1ZJ9ynWJY78/hqdefault.jpg
8921	Raul Mid├│n: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=sRUoNXE8cT0	Raul Mid├│n	HOME	2020-05-15	https://i.ytimg.com/vi/sRUoNXE8cT0/hqdefault.jpg
8922	Alex Isley: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=TIWWV4fLBjw	Alex Isley	HOME	2020-05-14	https://i.ytimg.com/vi/TIWWV4fLBjw/hqdefault.jpg
8923	Ashley McBryde: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=1sddHHMsGTE	Ashley McBryde	HOME	2020-05-13	https://i.ytimg.com/vi/1sddHHMsGTE/hqdefault.jpg
8924	Braxton Cook: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=BUWpIou5yO0	Braxton Cook	HOME	2020-05-07	https://i.ytimg.com/vi/BUWpIou5yO0/hqdefault.jpg
8925	MILCK: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=pqh0kU-Fwt0	MILCK	HOME	2020-05-06	https://i.ytimg.com/vi/pqh0kU-Fwt0/hqdefault.jpg
8926	Lianne La Havas: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=qso4MRfidrw	Lianne La Havas	HOME	2020-05-04	https://i.ytimg.com/vi/qso4MRfidrw/hqdefault.jpg
8927	Buck Curran: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=GbADcl9ljwE	Buck Curran	HOME	2020-05-01	https://i.ytimg.com/vi/GbADcl9ljwE/hqdefault.jpg
8928	Jeru The Damaja: Tiny Desk Home Concert	https://www.youtube.com/watch?v=L6gK3eZ1m_U	Jeru The Damaja	HOME	2020-04-29	https://i.ytimg.com/vi/L6gK3eZ1m_U/hqdefault.jpg
8929	Rodrigo y Gabriela: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=PMpGjox3TBs	Rodrigo y Gabriela	HOME	2020-04-27	https://i.ytimg.com/vi/PMpGjox3TBs/hqdefault.jpg
8930	Fogerty's Factory - John Fogerty + Family: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=2qW2139LKN0	Fogerty's Factory - John Fogerty + Family	HOME	2020-04-23	https://i.ytimg.com/vi/2qW2139LKN0/hqdefault.jpg
8931	The Pop Ups: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=ans3p-jnuyo	The Pop Ups	HOME	2020-04-22	https://i.ytimg.com/vi/ans3p-jnuyo/hqdefault.jpg
8932	Nick Hakim: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=6-kMktdfHms	Nick Hakim	HOME	2020-04-17	https://i.ytimg.com/vi/6-kMktdfHms/hqdefault.jpg
8933	Lang Lang: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=TMxAKlC5FMM	Lang Lang	HOME	2020-04-16	https://i.ytimg.com/vi/TMxAKlC5FMM/hqdefault.jpg
8934	Laura Marling: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=7RzBrwRLX2E	Laura Marling	HOME	2020-04-15	https://i.ytimg.com/vi/7RzBrwRLX2E/hqdefault.jpg
8935	Kevin Morby and Waxahatchee: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=NArUd2vMgA8	Kevin Morby and Waxahatchee	HOME	2020-04-13	https://i.ytimg.com/vi/NArUd2vMgA8/hqdefault.jpg
8936	John Prine Tribute: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=PBksI8zbhrg	John Prine Tribute	HOME	2020-04-11	https://i.ytimg.com/vi/PBksI8zbhrg/hqdefault.jpg
8937	Black Thought of The Roots: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=u12r_JI8mGM	Black Thought of The Roots	HOME	2020-04-08	https://i.ytimg.com/vi/u12r_JI8mGM/hqdefault.jpg
8938	King Princess: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=uKPo110Qpvo	King Princess	HOME	2020-04-07	https://i.ytimg.com/vi/uKPo110Qpvo/hqdefault.jpg
8939	Ben Gibbard: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=HXGyYeG4eRc	Ben Gibbard	HOME	2020-04-03	https://i.ytimg.com/vi/HXGyYeG4eRc/hqdefault.jpg
8940	Michael McDonald: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=B_TOY8gQ2NY	Michael McDonald	HOME	2020-03-31	https://i.ytimg.com/vi/B_TOY8gQ2NY/hqdefault.jpg
8941	Tarriona "Tank" Ball: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=bvQnLyjDuEg	Tarriona "Tank" Ball	HOME	2020-03-26	https://i.ytimg.com/vi/bvQnLyjDuEg/hqdefault.jpg
8942	Margo Price & Jeremy Ivey: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=CfnM5aeH92Q	Margo Price & Jeremy Ivey	HOME	2020-03-25	https://i.ytimg.com/vi/CfnM5aeH92Q/hqdefault.jpg
8943	Soccer Mommy: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=KZk3eoAb6Ck	Soccer Mommy	HOME	2020-03-23	https://i.ytimg.com/vi/KZk3eoAb6Ck/hqdefault.jpg
8944	Dave: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=s_TgmrNNHXA	Dave	HOME	2021-05-21	https://i.ytimg.com/vi/s_TgmrNNHXA/hqdefault.jpg
8945	Roberto Fonseca: Tiny Desk Concert	https://www.youtube.com/watch?v=vdph2l0iw74	Roberto Fonseca	ELTINY	2025-02-05	https://i.ytimg.com/vi/vdph2l0iw74/hqdefault.jpg
8946	Sheila E.: Tiny Desk Concert	https://www.youtube.com/watch?v=GjZ2XqYzPTI	Sheila E.	ELTINY	2024-10-11	https://i.ytimg.com/vi/GjZ2XqYzPTI/hqdefault.jpg
8947	The Mar├¡as: Tiny Desk Concert	https://www.youtube.com/watch?v=I067BonnW48	The Mar├¡as	ELTINY	2024-10-09	https://i.ytimg.com/vi/I067BonnW48/hqdefault.jpg
8948	Eladio Carrio╠ün: Tiny Desk Concert	https://www.youtube.com/watch?v=s9xYNeiSofM	Eladio Carrio╠ün	ELTINY	2024-10-07	https://i.ytimg.com/vi/s9xYNeiSofM/hqdefault.jpg
8949	Ca7riel & Paco Amoroso: Tiny Desk Concert	https://www.youtube.com/watch?v=9kqnsoY94L8	Ca7riel & Paco Amoroso	ELTINY	2024-10-04	https://i.ytimg.com/vi/9kqnsoY94L8/hqdefault.jpg
8950	Rita Pay├®s: Tiny Desk Concert	https://www.youtube.com/watch?v=ZVEeAxeyAPU	Rita Pay├®s	ELTINY	2024-10-02	https://i.ytimg.com/vi/ZVEeAxeyAPU/hqdefault.jpg
8951	Fabiola M├®ndez: Tiny Desk Concert	https://www.youtube.com/watch?v=1yJjALda0X4	Fabiola M├®ndez	ELTINY	2024-09-30	https://i.ytimg.com/vi/1yJjALda0X4/hqdefault.jpg
8952	Ivan Cornejo: Tiny Desk Concert	https://www.youtube.com/watch?v=vevgI9a18GQ	Ivan Cornejo	ELTINY	2024-09-26	https://i.ytimg.com/vi/vevgI9a18GQ/hqdefault.jpg
8953	OKAN: Tiny Desk Concert	https://www.youtube.com/watch?v=7DSVjIxZBjs	OKAN	ELTINY	2024-09-24	https://i.ytimg.com/vi/7DSVjIxZBjs/hqdefault.jpg
8954	Daniel, Me Est├ís Matando: Tiny Desk Concert	https://www.youtube.com/watch?v=wC6iA_C_KC8	Daniel, Me Est├ís Matando	ELTINY	2024-09-20	https://i.ytimg.com/vi/wC6iA_C_KC8/hqdefault.jpg
8955	Danny Ocean: Tiny Desk Concert	https://www.youtube.com/watch?v=ZfbX3MAnJUM	Danny Ocean	ELTINY	2024-09-18	https://i.ytimg.com/vi/ZfbX3MAnJUM/hqdefault.jpg
8956	Juanes: Tiny Desk Concert	https://www.youtube.com/watch?v=1Pt-nLSMONI	Juanes	ELTINY	2024-09-16	https://i.ytimg.com/vi/1Pt-nLSMONI/hqdefault.jpg
8957	├ülvaro D├¡az: Tiny Desk Concert	https://www.youtube.com/watch?v=PCgB07Yy6Xs	├ülvaro D├¡az	ELTINY	2024-07-19	https://i.ytimg.com/vi/PCgB07Yy6Xs/hqdefault.jpg
8958	Nathy Peluso: Tiny Desk Concert	https://www.youtube.com/watch?v=_1V_PGElOHs	Nathy Peluso	ELTINY	2024-07-15	https://i.ytimg.com/vi/_1V_PGElOHs/hqdefault.jpg
8959	Silvia P├®rez Cruz: Tiny Desk Concert	https://www.youtube.com/watch?v=zoAs0-nXPQM	Silvia P├®rez Cruz	ELTINY	2024-07-09	https://i.ytimg.com/vi/zoAs0-nXPQM/hqdefault.jpg
8960	Mar├¡a Jos├® Llergo: Tiny Desk Concert	https://www.youtube.com/watch?v=v1VLZnBEw_M	Mar├¡a Jos├® Llergo	ELTINY	2024-07-08	https://i.ytimg.com/vi/v1VLZnBEw_M/hqdefault.jpg
8961	Ana Tijoux: Tiny Desk Concert	https://www.youtube.com/watch?v=5G6q__7jQoU	Ana Tijoux	ELTINY	2024-05-22	https://i.ytimg.com/vi/5G6q__7jQoU/hqdefault.jpg
8962	Luciana Souza: Tiny Desk Concert	https://www.youtube.com/watch?v=49zIojl1CM4	Luciana Souza	ELTINY	2024-05-17	https://i.ytimg.com/vi/49zIojl1CM4/hqdefault.jpg
8963	Yasser Tejeda: Tiny Desk Concert	https://www.youtube.com/watch?v=tajoGudOj70	Yasser Tejeda	ELTINY	2024-05-15	https://i.ytimg.com/vi/tajoGudOj70/hqdefault.jpg
8964	El Laberinto del Coco: Tiny Desk x globalFEST	https://www.youtube.com/watch?v=R2_7ADO2Hlo	El Laberinto del Coco	ELTINY	2024-04-05	https://i.ytimg.com/vi/R2_7ADO2Hlo/hqdefault.jpg
8965	Tarta Relena: Tiny Desk x globalFEST	https://www.youtube.com/watch?v=3lwoczostI0	Tarta Relena	ELTINY	2024-04-05	https://i.ytimg.com/vi/3lwoczostI0/hqdefault.jpg
8966	Kevin Kaarl: Tiny Desk Concert	https://www.youtube.com/watch?v=o4Iv7k0aQoc	Kevin Kaarl	ELTINY	2024-01-08	https://i.ytimg.com/vi/o4Iv7k0aQoc/hqdefault.jpg
8967	Marta Pereira da Costa: Tiny Desk Concert	https://www.youtube.com/watch?v=wzlZ68ts-IU	Marta Pereira da Costa	ELTINY	2023-11-15	https://i.ytimg.com/vi/wzlZ68ts-IU/hqdefault.jpg
8968	Maluma: Tiny Desk Concert	https://www.youtube.com/watch?v=P_yPDiMN3uk	Maluma	ELTINY	2023-10-20	https://i.ytimg.com/vi/P_yPDiMN3uk/hqdefault.jpg
8969	Becky G: Tiny Desk Concert	https://www.youtube.com/watch?v=FftvVi42U4o	Becky G	ELTINY	2023-10-13	https://i.ytimg.com/vi/FftvVi42U4o/hqdefault.jpg
8970	Ivy Queen: Tiny Desk Concert	https://www.youtube.com/watch?v=7EAM4pxxL4Y	Ivy Queen	ELTINY	2023-10-11	https://i.ytimg.com/vi/7EAM4pxxL4Y/hqdefault.jpg
8971	Villano Antillano: Tiny Desk Concert	https://www.youtube.com/watch?v=RxhleZbLF64	Villano Antillano	ELTINY	2023-10-06	https://i.ytimg.com/vi/RxhleZbLF64/hqdefault.jpg
8972	Alex Cuba: Tiny Desk Concert	https://www.youtube.com/watch?v=A3ThZptD8WY	Alex Cuba	ELTINY	2023-10-04	https://i.ytimg.com/vi/A3ThZptD8WY/hqdefault.jpg
8973	DannyLux: Tiny Desk Concert	https://www.youtube.com/watch?v=AynDvSkZ8og	DannyLux	ELTINY	2023-09-27	https://i.ytimg.com/vi/AynDvSkZ8og/hqdefault.jpg
8974	J Noa: Tiny Desk Concert	https://www.youtube.com/watch?v=LwDRLLPuOA4	J Noa	ELTINY	2023-09-22	https://i.ytimg.com/vi/LwDRLLPuOA4/hqdefault.jpg
8975	Rawayana: Tiny Desk Concert	https://www.youtube.com/watch?v=CbotsXwCbNE	Rawayana	ELTINY	2023-09-19	https://i.ytimg.com/vi/CbotsXwCbNE/hqdefault.jpg
8976	Yahritza y Su Esencia: Tiny Desk Concert	https://www.youtube.com/watch?v=jjA7vj3_Htk	Yahritza y Su Esencia	ELTINY	2023-08-24	https://i.ytimg.com/vi/jjA7vj3_Htk/hqdefault.jpg
8977	Omar Montes: Tiny Desk Concert	https://www.youtube.com/watch?v=Rmg040Su5R8	Omar Montes	ELTINY	2023-08-17	https://i.ytimg.com/vi/Rmg040Su5R8/hqdefault.jpg
8978	Gregorio Uribe: Tiny Desk Concert	https://www.youtube.com/watch?v=O0sUBp7ps8k	Gregorio Uribe	ELTINY	2023-08-04	https://i.ytimg.com/vi/O0sUBp7ps8k/hqdefault.jpg
8979	Kany Garc├¡a: Tiny Desk Concert	https://www.youtube.com/watch?v=LJdWpAFutYM	Kany Garc├¡a	ELTINY	2023-07-24	https://i.ytimg.com/vi/LJdWpAFutYM/hqdefault.jpg
8980	MARO: Tiny Desk Concert	https://www.youtube.com/watch?v=btiE3ASfUUE	MARO	ELTINY	2023-07-13	https://i.ytimg.com/vi/btiE3ASfUUE/hqdefault.jpg
8981	Meridian Brothers: Tiny Desk Concert	https://www.youtube.com/watch?v=m9jHZ_pa2PM	Meridian Brothers	ELTINY	2023-07-07	https://i.ytimg.com/vi/m9jHZ_pa2PM/hqdefault.jpg
8982	Omar Sosa & Seckou Keita SUBA Trio: Tiny Desk Concert	https://www.youtube.com/watch?v=KUm6f0QJ_FI	Omar Sosa & Seckou Keita SUBA Trio	ELTINY	2023-07-05	https://i.ytimg.com/vi/KUm6f0QJ_FI/hqdefault.jpg
8983	Karol G: Tiny Desk Concert	https://www.youtube.com/watch?v=D8UWsFMVj_Q	Karol G	ELTINY	2023-05-15	https://i.ytimg.com/vi/D8UWsFMVj_Q/hqdefault.jpg
8984	Cuco: Tiny Desk Concert	https://www.youtube.com/watch?v=oy-4I58Dru0	Cuco	ELTINY	2023-04-28	https://i.ytimg.com/vi/oy-4I58Dru0/hqdefault.jpg
8985	Claudia Acu├▒a: Tiny Desk Concert	https://www.youtube.com/watch?v=FCjsmZlwSzA	Claudia Acu├▒a	ELTINY	2023-04-18	https://i.ytimg.com/vi/FCjsmZlwSzA/hqdefault.jpg
8986	Jorge Glem and Sam Reider: Tiny Desk Concert	https://www.youtube.com/watch?v=JxEvAHLqryg	Jorge Glem and Sam Reider	ELTINY	2023-03-06	https://i.ytimg.com/vi/JxEvAHLqryg/hqdefault.jpg
8987	Hermanos Guti├®rrez: Tiny Desk Concert	https://www.youtube.com/watch?v=wTqCthvtL8k	Hermanos Guti├®rrez	ELTINY	2023-01-31	https://i.ytimg.com/vi/wTqCthvtL8k/hqdefault.jpg
8988	The Mavericks: Tiny Desk Concert	https://www.youtube.com/watch?v=M6Rh-CzEo24	The Mavericks	ELTINY	2022-12-12	https://i.ytimg.com/vi/M6Rh-CzEo24/hqdefault.jpg
8989	Farruko: Tiny Desk Concert	https://www.youtube.com/watch?v=xNm2JuN2WLQ	Farruko	ELTINY	2022-10-14	https://i.ytimg.com/vi/xNm2JuN2WLQ/hqdefault.jpg
8990	Tokischa: Tiny Desk Concert	https://www.youtube.com/watch?v=abb3ObvdBus	Tokischa	ELTINY	2022-10-12	https://i.ytimg.com/vi/abb3ObvdBus/hqdefault.jpg
8991	Carla Morrison: Tiny Desk Concert	https://www.youtube.com/watch?v=aKWV7b3j5P0	Carla Morrison	ELTINY	2022-10-07	https://i.ytimg.com/vi/aKWV7b3j5P0/hqdefault.jpg
8992	Jessie Reyez: Tiny Desk Concert	https://www.youtube.com/watch?v=wSl5_RDCfrQ	Jessie Reyez	ELTINY	2022-09-30	https://i.ytimg.com/vi/wSl5_RDCfrQ/hqdefault.jpg
8993	Carin Le├│n: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=ug25yQSEub0	Carin Le├│n	ELTINY	2022-09-27	https://i.ytimg.com/vi/ug25yQSEub0/hqdefault.jpg
8994	Omar Apollo: Tiny Desk Concert	https://www.youtube.com/watch?v=7p78XATPcyg	Omar Apollo	ELTINY	2022-09-27	https://i.ytimg.com/vi/7p78XATPcyg/hqdefault.jpg
8995	Alisa Amador, 2022 Tiny Desk Contest Winner: Tiny Desk Concert	https://www.youtube.com/watch?v=sN58k8tSFXg	Alisa Amador, 2022 Tiny Desk Contest Winner	ELTINY	2022-09-27	https://i.ytimg.com/vi/sN58k8tSFXg/hqdefault.jpg
8996	Thee Sinseers: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=lsg1BCISPNU	Thee Sinseers	ELTINY	2022-09-27	https://i.ytimg.com/vi/lsg1BCISPNU/hqdefault.jpg
8997	Feid: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=UJMhvIlADYc	Feid	ELTINY	2022-09-27	https://i.ytimg.com/vi/UJMhvIlADYc/hqdefault.jpg
8998	The Linda Lindas: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=USdiumz1ZFM	The Linda Lindas	ELTINY	2022-09-27	https://i.ytimg.com/vi/USdiumz1ZFM/hqdefault.jpg
8999	Los Rivera Destino: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=tarsyQZCMUs	Los Rivera Destino	ELTINY	2022-09-27	https://i.ytimg.com/vi/tarsyQZCMUs/hqdefault.jpg
9000	Tiny Desk Meets SXSW: KAINA	https://www.youtube.com/watch?v=jSK5fJpqs5I	Tiny Desk Meets SXSW	ELTINY	2022-09-27	https://i.ytimg.com/vi/jSK5fJpqs5I/hqdefault.jpg
9001	Camilo: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=FlZuFh0KUvc	Camilo	ELTINY	2022-09-27	https://i.ytimg.com/vi/FlZuFh0KUvc/hqdefault.jpg
9002	Son Rompe Pera: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=S1qpVSz3pP4	Son Rompe Pera	ELTINY	2022-09-27	https://i.ytimg.com/vi/S1qpVSz3pP4/hqdefault.jpg
9003	Kombilesa M├¡: Tiny Desk Meets globalFEST	https://www.youtube.com/watch?v=H-cCTeVD3MM	Kombilesa M├¡	ELTINY	2022-09-27	https://i.ytimg.com/vi/H-cCTeVD3MM/hqdefault.jpg
9004	Girl Ultra: Tiny Desk Concert	https://www.youtube.com/watch?v=aQcXSoamCVA	Girl Ultra	ELTINY	2022-09-27	https://i.ytimg.com/vi/aQcXSoamCVA/hqdefault.jpg
9005	Trueno: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=2C-WmZQABLQ	Trueno	ELTINY	2022-09-27	https://i.ytimg.com/vi/2C-WmZQABLQ/hqdefault.jpg
9006	Mon Laferte: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=Dy4pEFFbFsA	Mon Laferte	ELTINY	2022-01-12	https://i.ytimg.com/vi/Dy4pEFFbFsA/hqdefault.jpg
9007	Pistolera: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=9_FL_Vc3yZU	Pistolera	ELTINY	2021-11-17	https://i.ytimg.com/vi/9_FL_Vc3yZU/hqdefault.jpg
9008	Hit La Rosa: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=A3fxj5CoyfU	Hit La Rosa	ELTINY	2021-11-17	https://i.ytimg.com/vi/A3fxj5CoyfU/hqdefault.jpg
9009	Edwin Perez: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=S77KlsGlbCI	Edwin Perez	ELTINY	2021-11-17	https://i.ytimg.com/vi/S77KlsGlbCI/hqdefault.jpg
9010	Omara Portuondo: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=e3blQ3I3GRQ	Omara Portuondo	ELTINY	2021-11-17	https://i.ytimg.com/vi/e3blQ3I3GRQ/hqdefault.jpg
9011	Maria Volonte: Tiny Desk Concert	https://www.youtube.com/watch?v=hXy9_xjOrb8	Maria Volonte	ELTINY	2021-11-17	https://i.ytimg.com/vi/hXy9_xjOrb8/hqdefault.jpg
9012	Rana Santacruz: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=zq1T0P7zotA	Rana Santacruz	ELTINY	2021-11-17	https://i.ytimg.com/vi/zq1T0P7zotA/hqdefault.jpg
9013	The Creole Choir Of Cuba: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=pJSv2hoH5ro	The Creole Choir Of Cuba	ELTINY	2021-11-17	https://i.ytimg.com/vi/pJSv2hoH5ro/hqdefault.jpg
9014	Luisa Maita: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=wqFlSNLF3YE	Luisa Maita	ELTINY	2021-11-17	https://i.ytimg.com/vi/wqFlSNLF3YE/hqdefault.jpg
9015	Lara Bello: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=9-0f3bKQyAw	Lara Bello	ELTINY	2021-11-17	https://i.ytimg.com/vi/9-0f3bKQyAw/hqdefault.jpg
9016	Diego Garcia: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=DjmHpDI89v8	Diego Garcia	ELTINY	2021-11-17	https://i.ytimg.com/vi/DjmHpDI89v8/hqdefault.jpg
9017	Dav├¡d Garza: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=JPcqESmvTTY	Dav├¡d Garza	ELTINY	2021-11-17	https://i.ytimg.com/vi/JPcqESmvTTY/hqdefault.jpg
9018	Yva Las Vegass: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=P19YL-fy3Vk	Yva Las Vegass	ELTINY	2021-11-17	https://i.ytimg.com/vi/P19YL-fy3Vk/hqdefault.jpg
9019	Federico Aubele: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=1lc8mAiOUPA	Federico Aubele	ELTINY	2021-11-17	https://i.ytimg.com/vi/1lc8mAiOUPA/hqdefault.jpg
9020	Arturo O'Farrill: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=UhMRD7lw5zs	Arturo O'Farrill	ELTINY	2021-11-17	https://i.ytimg.com/vi/UhMRD7lw5zs/hqdefault.jpg
9021	Magos Herrera and Brooklyn Rider: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=BVnSJ4SL7sI	Magos Herrera and Brooklyn Rider	ELTINY	2021-11-17	https://i.ytimg.com/vi/BVnSJ4SL7sI/hqdefault.jpg
9022	Tiny Desk Meets SXSW: Yasser Tejeda & Palotr├®	https://www.youtube.com/watch?v=C9fMzxICTjU	Tiny Desk Meets SXSW	ELTINY	2021-11-17	https://i.ytimg.com/vi/C9fMzxICTjU/hqdefault.jpg
9023	Tiny Desk Meets AFROPUNK: NENNY	https://www.youtube.com/watch?v=IdqnNo1mqko	Tiny Desk Meets AFROPUNK	ELTINY	2021-11-17	https://i.ytimg.com/vi/IdqnNo1mqko/hqdefault.jpg
9024	Rio Mira: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=G1jq_2-l6wA	Rio Mira	ELTINY	2021-11-17	https://i.ytimg.com/vi/G1jq_2-l6wA/hqdefault.jpg
9025	Sofia Rei: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=eKSjxfYbxzc	Sofia Rei	ELTINY	2021-11-17	https://i.ytimg.com/vi/eKSjxfYbxzc/hqdefault.jpg
9026	Alejandro Escovedo: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=YxUaLKJ_978	Alejandro Escovedo	ELTINY	2021-11-17	https://i.ytimg.com/vi/YxUaLKJ_978/hqdefault.jpg
9027	Jovino Santos Neto Trio: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=-kfrmkseMAI	Jovino Santos Neto Trio	ELTINY	2021-11-17	https://i.ytimg.com/vi/-kfrmkseMAI/hqdefault.jpg
9028	Troker: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=HdFP4P8ZkjA	Troker	ELTINY	2021-11-17	https://i.ytimg.com/vi/HdFP4P8ZkjA/hqdefault.jpg
9029	Brownout: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=2DyEjfb5hrA	Brownout	ELTINY	2021-11-17	https://i.ytimg.com/vi/2DyEjfb5hrA/hqdefault.jpg
9030	Andrea Cruz: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=HN4Mk3LWWC4	Andrea Cruz	ELTINY	2021-11-17	https://i.ytimg.com/vi/HN4Mk3LWWC4/hqdefault.jpg
9031	Rosa D├¡az: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=a86HDx0h768	Rosa D├¡az	ELTINY	2021-11-17	https://i.ytimg.com/vi/a86HDx0h768/hqdefault.jpg
9032	Buscabulla: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=zvDmr_REr5w	Buscabulla	ELTINY	2021-11-17	https://i.ytimg.com/vi/zvDmr_REr5w/hqdefault.jpg
9033	Eddie Palmieri: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=oUGukMLPQJs	Eddie Palmieri	ELTINY	2021-11-17	https://i.ytimg.com/vi/oUGukMLPQJs/hqdefault.jpg
9034	Bio Ritmo: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=n_4EMO8e-1Y	Bio Ritmo	ELTINY	2021-11-17	https://i.ytimg.com/vi/n_4EMO8e-1Y/hqdefault.jpg
9035	Ana Tijoux: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=jsCO_M0Nnwk	Ana Tijoux	ELTINY	2021-11-17	https://i.ytimg.com/vi/jsCO_M0Nnwk/hqdefault.jpg
9036	LADAMA: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=LIP7efANp0E	LADAMA	ELTINY	2021-11-17	https://i.ytimg.com/vi/LIP7efANp0E/hqdefault.jpg
9037	Making Movies: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=-jWBOgn8xJQ	Making Movies	ELTINY	2021-11-17	https://i.ytimg.com/vi/-jWBOgn8xJQ/hqdefault.jpg
9038	Sofia Rei: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=6cQUKZXoHlE	Sofia Rei	ELTINY	2021-11-17	https://i.ytimg.com/vi/6cQUKZXoHlE/hqdefault.jpg
9039	Carrie Rodriguez: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=tWWxWpfkzR0	Carrie Rodriguez	ELTINY	2021-11-17	https://i.ytimg.com/vi/tWWxWpfkzR0/hqdefault.jpg
9040	Caman├®: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=BDUwGCHA2b0	Caman├®	ELTINY	2021-11-16	https://i.ytimg.com/vi/BDUwGCHA2b0/hqdefault.jpg
9041	Harold Lo╠üpez-Nussa Trio: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=0pzIzOgIGyg	Harold Lo╠üpez-Nussa Trio	ELTINY	2021-11-16	https://i.ytimg.com/vi/0pzIzOgIGyg/hqdefault.jpg
9042	Bal├║n: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=YZ2iWUyT_DI	Bal├║n	ELTINY	2021-11-16	https://i.ytimg.com/vi/YZ2iWUyT_DI/hqdefault.jpg
9043	Miramar: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=4Nr7mq74gD0	Miramar	ELTINY	2021-11-16	https://i.ytimg.com/vi/4Nr7mq74gD0/hqdefault.jpg
9044	Betsayda Machado y Parranda El Clavo: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=W8SnRPbiGH8	Betsayda Machado y Parranda El Clavo	ELTINY	2021-11-16	https://i.ytimg.com/vi/W8SnRPbiGH8/hqdefault.jpg
9045	Joan Soriano: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=XnCyyJhJCc0	Joan Soriano	ELTINY	2021-11-16	https://i.ytimg.com/vi/XnCyyJhJCc0/hqdefault.jpg
9046	Irene Diaz: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=KhpxH2QZ0-Q	Irene Diaz	ELTINY	2021-11-16	https://i.ytimg.com/vi/KhpxH2QZ0-Q/hqdefault.jpg
9047	Y La Bamba: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=au-mBoepJUA	Y La Bamba	ELTINY	2021-11-15	https://i.ytimg.com/vi/au-mBoepJUA/hqdefault.jpg
9048	Spanglish Fly: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=yCCOq36BMe0	Spanglish Fly	ELTINY	2021-11-15	https://i.ytimg.com/vi/yCCOq36BMe0/hqdefault.jpg
9049	Raul Mid├│n: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=x9qEmmPSHs8	Raul Mid├│n	ELTINY	2021-11-15	https://i.ytimg.com/vi/x9qEmmPSHs8/hqdefault.jpg
9050	Aurelio Martinez: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=iNqkT54EDBM	Aurelio Martinez	ELTINY	2021-11-15	https://i.ytimg.com/vi/iNqkT54EDBM/hqdefault.jpg
9051	Bebel Gilberto: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=uEK-6cHmmZI	Bebel Gilberto	ELTINY	2021-11-15	https://i.ytimg.com/vi/uEK-6cHmmZI/hqdefault.jpg
9052	Prince Royce: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=-jLebs9xraI	Prince Royce	ELTINY	2021-11-15	https://i.ytimg.com/vi/-jLebs9xraI/hqdefault.jpg
9053	Yissy Garc├¡a & Bandancha: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=Y1Kv_sFZHqI	Yissy Garc├¡a & Bandancha	ELTINY	2021-11-15	https://i.ytimg.com/vi/Y1Kv_sFZHqI/hqdefault.jpg
9054	Le Butcherettes: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=19FnFxiQmKc	Le Butcherettes	ELTINY	2021-11-15	https://i.ytimg.com/vi/19FnFxiQmKc/hqdefault.jpg
9055	Mariachi El Bronx: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=d8IMf7dBLuw	Mariachi El Bronx	ELTINY	2021-11-15	https://i.ytimg.com/vi/d8IMf7dBLuw/hqdefault.jpg
9056	Juanes: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=TG6NqII3Zuw	Juanes	ELTINY	2021-11-15	https://i.ytimg.com/vi/TG6NqII3Zuw/hqdefault.jpg
9057	Xenia Rubinos: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=4KbPdFZ24F4	Xenia Rubinos	ELTINY	2021-11-15	https://i.ytimg.com/vi/4KbPdFZ24F4/hqdefault.jpg
9058	Nina Diaz: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=3q3z_KvLUNI	Nina Diaz	ELTINY	2021-11-15	https://i.ytimg.com/vi/3q3z_KvLUNI/hqdefault.jpg
9059	Renaud Garcia-Fons: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=2ZNKLUHeJtg	Renaud Garcia-Fons	ELTINY	2021-11-15	https://i.ytimg.com/vi/2ZNKLUHeJtg/hqdefault.jpg
9060	Flaco Jimenez: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=gOMRNSmwa3U	Flaco Jimenez	ELTINY	2021-11-15	https://i.ytimg.com/vi/gOMRNSmwa3U/hqdefault.jpg
9061	Danilo Brito: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=FdBwOOwcwTU	Danilo Brito	ELTINY	2021-11-15	https://i.ytimg.com/vi/FdBwOOwcwTU/hqdefault.jpg
9062	Tiny Desk Meets AFROPUNK: Luedji Luna	https://www.youtube.com/watch?v=CM_ARaGik3o	Tiny Desk Meets AFROPUNK	ELTINY	2021-11-15	https://i.ytimg.com/vi/CM_ARaGik3o/hqdefault.jpg
9063	Daym├® Arocena: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=tKTQAGYo5hE	Daym├® Arocena	ELTINY	2021-11-15	https://i.ytimg.com/vi/tKTQAGYo5hE/hqdefault.jpg
9064	Cande y Paulo: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=ZoxKkGpRbtk	Cande y Paulo	ELTINY	2021-11-15	https://i.ytimg.com/vi/ZoxKkGpRbtk/hqdefault.jpg
9065	Omar Sosa & Paolo Fresu: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=RJMQkye_YTw	Omar Sosa & Paolo Fresu	ELTINY	2021-11-15	https://i.ytimg.com/vi/RJMQkye_YTw/hqdefault.jpg
9066	Tiny Desk Meets AFROPUNK: Calma Carmona	https://www.youtube.com/watch?v=rr5gRttagmU	Tiny Desk Meets AFROPUNK	ELTINY	2021-11-15	https://i.ytimg.com/vi/rr5gRttagmU/hqdefault.jpg
9067	Juana Molina: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=he-eAyHRfFg	Juana Molina	ELTINY	2021-11-15	https://i.ytimg.com/vi/he-eAyHRfFg/hqdefault.jpg
9068	Helado Negro: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=p0x3aKmEu7M	Helado Negro	ELTINY	2021-11-15	https://i.ytimg.com/vi/p0x3aKmEu7M/hqdefault.jpg
9069	Los Lobos: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=oJxApTsm1YQ	Los Lobos	ELTINY	2021-11-15	https://i.ytimg.com/vi/oJxApTsm1YQ/hqdefault.jpg
9070	Raquel Sofia: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=B6DLS5tahlM	Raquel Sofia	ELTINY	2021-11-15	https://i.ytimg.com/vi/B6DLS5tahlM/hqdefault.jpg
9071	Girl In A Coma: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=je2HSRcRruI	Girl In A Coma	ELTINY	2021-11-15	https://i.ytimg.com/vi/je2HSRcRruI/hqdefault.jpg
9072	Edmar Castaneda: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=0SNhAKyXtC8	Edmar Castaneda	ELTINY	2021-11-15	https://i.ytimg.com/vi/0SNhAKyXtC8/hqdefault.jpg
9073	iLe: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=rZjRU5ElGrk	iLe	ELTINY	2021-11-15	https://i.ytimg.com/vi/rZjRU5ElGrk/hqdefault.jpg
9074	Alfredo Rodr├¡guez Trio: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=qOxCOMtJbC8	Alfredo Rodr├¡guez Trio	ELTINY	2021-11-15	https://i.ytimg.com/vi/qOxCOMtJbC8/hqdefault.jpg
9075	Tiny Desk Meets AFROPUNK: ChocQuibTown	https://www.youtube.com/watch?v=mkYN0mzY_2E	Tiny Desk Meets AFROPUNK	ELTINY	2021-11-15	https://i.ytimg.com/vi/mkYN0mzY_2E/hqdefault.jpg
9076	Gaby Moreno: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=sIdRsY5HJGw	Gaby Moreno	ELTINY	2021-11-15	https://i.ytimg.com/vi/sIdRsY5HJGw/hqdefault.jpg
9077	La Santa Cecilia: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=iT3YnNdorCg	La Santa Cecilia	ELTINY	2021-11-15	https://i.ytimg.com/vi/iT3YnNdorCg/hqdefault.jpg
9078	Angelica Garcia: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=JQTM86SZW2g	Angelica Garcia	ELTINY	2021-11-15	https://i.ytimg.com/vi/JQTM86SZW2g/hqdefault.jpg
9079	Los Lobos: NPR Music Tiny Desk Concert From The Archives	https://www.youtube.com/watch?v=VyO6-oZmtms	Los Lobos	ELTINY	2021-11-12	https://i.ytimg.com/vi/VyO6-oZmtms/hqdefault.jpg
9080	Sech: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=jdHPotMqv1M	Sech	ELTINY	2021-11-12	https://i.ytimg.com/vi/jdHPotMqv1M/hqdefault.jpg
9081	Silvana Estrada: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=S52_XxBwbJg	Silvana Estrada	ELTINY	2021-11-12	https://i.ytimg.com/vi/S52_XxBwbJg/hqdefault.jpg
9082	Diamante El├®ctrico: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=4J5zTLnIqMY	Diamante El├®ctrico	ELTINY	2021-11-12	https://i.ytimg.com/vi/4J5zTLnIqMY/hqdefault.jpg
9083	Eme Alfonso: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=fJNSgPqQ1yw	Eme Alfonso	ELTINY	2021-11-12	https://i.ytimg.com/vi/fJNSgPqQ1yw/hqdefault.jpg
9084	maye: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=2nkWKhcG-Zg	maye	ELTINY	2021-11-12	https://i.ytimg.com/vi/2nkWKhcG-Zg/hqdefault.jpg
9085	YEðÿDRY: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=h_a5zbizXCw	YEðÿDRY	ELTINY	2021-11-12	https://i.ytimg.com/vi/h_a5zbizXCw/hqdefault.jpg
9086	J Balvin: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=coMyNfnNBs4	J Balvin	ELTINY	2021-11-12	https://i.ytimg.com/vi/coMyNfnNBs4/hqdefault.jpg
9087	Julieta Venegas: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=-lLnpEv_9dw	Julieta Venegas	ELTINY	2021-11-12	https://i.ytimg.com/vi/-lLnpEv_9dw/hqdefault.jpg
9088	├îF├ë: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=Q6s_ZL8b3GE	├îF├ë	ELTINY	2021-11-12	https://i.ytimg.com/vi/Q6s_ZL8b3GE/hqdefault.jpg
9089	Cimafunk: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=auy9DFC2eOE	Cimafunk	ELTINY	2021-11-12	https://i.ytimg.com/vi/auy9DFC2eOE/hqdefault.jpg
9090	The Pedrito Martinez Group: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=GP3jS_gFs-g	The Pedrito Martinez Group	ELTINY	2021-11-12	https://i.ytimg.com/vi/GP3jS_gFs-g/hqdefault.jpg
9091	Chicano Batman: Tiny Desk Concert	https://www.youtube.com/watch?v=gOwpqDhko3c	Chicano Batman	ELTINY	2021-11-12	https://i.ytimg.com/vi/gOwpqDhko3c/hqdefault.jpg
9092	Vicente Garc├¡a: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=haK0DUXIre0	Vicente Garc├¡a	ELTINY	2021-11-12	https://i.ytimg.com/vi/haK0DUXIre0/hqdefault.jpg
9093	Rodrigo y Gabriela: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=PMpGjox3TBs	Rodrigo y Gabriela	ELTINY	2021-11-12	https://i.ytimg.com/vi/PMpGjox3TBs/hqdefault.jpg
9094	Ibeyi: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=GeApLkyH8jg	Ibeyi	ELTINY	2021-11-12	https://i.ytimg.com/vi/GeApLkyH8jg/hqdefault.jpg
9095	Gina Chavez: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=sRZi4QQEGBI	Gina Chavez	ELTINY	2021-11-12	https://i.ytimg.com/vi/sRZi4QQEGBI/hqdefault.jpg
9096	Rodrigo Amarante: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=ppDcuEyNoIU	Rodrigo Amarante	ELTINY	2021-11-12	https://i.ytimg.com/vi/ppDcuEyNoIU/hqdefault.jpg
9097	Camila Cabello: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=F7wIRxQEetc	Camila Cabello	ELTINY	2021-11-12	https://i.ytimg.com/vi/F7wIRxQEetc/hqdefault.jpg
9098	Seu Jorge: NPR Music Tiny Desk Concert From The Archives	https://www.youtube.com/watch?v=2Ws_5-hiqao	Seu Jorge	ELTINY	2021-11-12	https://i.ytimg.com/vi/2Ws_5-hiqao/hqdefault.jpg
9099	Bomba Estereo: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=3oY-GQVzAX8	Bomba Estereo	ELTINY	2021-11-12	https://i.ytimg.com/vi/3oY-GQVzAX8/hqdefault.jpg
9100	Diego El Cigala: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=-Q9uIhuvUKc	Diego El Cigala	ELTINY	2021-11-12	https://i.ytimg.com/vi/-Q9uIhuvUKc/hqdefault.jpg
9101	Caf├® Tacvba: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=O70s9aV_9_Q	Caf├® Tacvba	ELTINY	2021-11-12	https://i.ytimg.com/vi/O70s9aV_9_Q/hqdefault.jpg
9102	Carlos Vives: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=RvVqaCs-K_8	Carlos Vives	ELTINY	2021-11-12	https://i.ytimg.com/vi/RvVqaCs-K_8/hqdefault.jpg
9103	Rodrigo y Gabriela: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=wKd0HNg1kFQ	Rodrigo y Gabriela	ELTINY	2021-11-12	https://i.ytimg.com/vi/wKd0HNg1kFQ/hqdefault.jpg
9104	Nicki Nicole: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=RG6O-Qq79G0	Nicki Nicole	ELTINY	2021-11-12	https://i.ytimg.com/vi/RG6O-Qq79G0/hqdefault.jpg
9105	Jenny and the Mexicats: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=yng5CTT8Ogk	Jenny and the Mexicats	ELTINY	2021-11-12	https://i.ytimg.com/vi/yng5CTT8Ogk/hqdefault.jpg
9106	Liniker e os Caramelows: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=tCrLnfwX088	Liniker e os Caramelows	ELTINY	2021-11-12	https://i.ytimg.com/vi/tCrLnfwX088/hqdefault.jpg
9107	Jorge Drexler: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=qn6rgisZm1M	Jorge Drexler	ELTINY	2021-11-12	https://i.ytimg.com/vi/qn6rgisZm1M/hqdefault.jpg
9108	Mariachi Flor De Toloache: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=-rl26QKPHtE	Mariachi Flor De Toloache	ELTINY	2021-11-12	https://i.ytimg.com/vi/-rl26QKPHtE/hqdefault.jpg
9109	Lila Downs: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=hU3P6dlNaB4	Lila Downs	ELTINY	2021-11-12	https://i.ytimg.com/vi/hU3P6dlNaB4/hqdefault.jpg
9110	Lido Pimienta: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=YEnY43csEG0	Lido Pimienta	ELTINY	2021-11-12	https://i.ytimg.com/vi/YEnY43csEG0/hqdefault.jpg
9111	Joss Favela: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=l4c4PUNkawc	Joss Favela	ELTINY	2021-11-03	https://i.ytimg.com/vi/l4c4PUNkawc/hqdefault.jpg
9112	Miguel: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=n7w0-KgZMdY	Miguel	ELTINY	2021-11-02	https://i.ytimg.com/vi/n7w0-KgZMdY/hqdefault.jpg
9113	Los Hacheros: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=bWdZP2Qj6wA	Los Hacheros	ELTINY	2021-11-02	https://i.ytimg.com/vi/bWdZP2Qj6wA/hqdefault.jpg
9114	Ozuna: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=iK1uBBv83M0	Ozuna	ELTINY	2021-11-02	https://i.ytimg.com/vi/iK1uBBv83M0/hqdefault.jpg
9115	Monsieur Perin├®: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=JGL-eQAAxGs	Monsieur Perin├®	ELTINY	2021-11-02	https://i.ytimg.com/vi/JGL-eQAAxGs/hqdefault.jpg
9116	Juanes & Mon Laferte: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=aWjihS2LHLs	Juanes & Mon Laferte	ELTINY	2021-11-02	https://i.ytimg.com/vi/aWjihS2LHLs/hqdefault.jpg
9117	C. Tangana: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=SW6L_lTrIFg	C. Tangana	ELTINY	2021-11-02	https://i.ytimg.com/vi/SW6L_lTrIFg/hqdefault.jpg
9118	Natalia Lafourcade: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=JODaYjDyjyQ	Natalia Lafourcade	ELTINY	2021-11-02	https://i.ytimg.com/vi/JODaYjDyjyQ/hqdefault.jpg
9119	The Philharmonik, 2024 Tiny Desk Contest Winner: Tiny Desk Concert	https://www.youtube.com/watch?v=sKHswNFsRww	The Philharmonik, 2024 Tiny Desk Contest Winner	CONTEST_WINNER	2024-06-03	https://i.ytimg.com/vi/sKHswNFsRww/hqdefault.jpg
9120	Little Moon, 2023 Tiny Desk Contest Winner: Tiny Desk Concert	https://www.youtube.com/watch?v=6PgYuit1BXw	Little Moon, 2023 Tiny Desk Contest Winner	CONTEST_WINNER	2023-05-30	https://i.ytimg.com/vi/6PgYuit1BXw/hqdefault.jpg
9121	Alisa Amador, 2022 Tiny Desk Contest Winner: Tiny Desk Concert	https://www.youtube.com/watch?v=sN58k8tSFXg	Alisa Amador, 2022 Tiny Desk Contest Winner	CONTEST_WINNER	2022-05-31	https://i.ytimg.com/vi/sN58k8tSFXg/hqdefault.jpg
9122	Neffy's journey to the Tiny Desk	https://www.youtube.com/watch?v=Hq4SuewheZQ	Neffy's journey to the Tiny Desk	CONTEST_WINNER	2021-11-19	https://i.ytimg.com/vi/Hq4SuewheZQ/hqdefault.jpg
9123	Neffy, 2021 Tiny Desk Contest Winner: Tiny Desk Concert	https://www.youtube.com/watch?v=l-JEdcOGuzQ	Neffy, 2021 Tiny Desk Contest Winner	CONTEST_WINNER	2021-10-27	https://i.ytimg.com/vi/l-JEdcOGuzQ/hqdefault.jpg
9124	Linda Diaz, 2020 Tiny Desk Contest Winner: Tiny Desk (Home) Concert	https://www.youtube.com/watch?v=MYiP0WO6yzA	Linda Diaz, 2020 Tiny Desk Contest Winner	CONTEST_WINNER	2021-02-19	https://i.ytimg.com/vi/MYiP0WO6yzA/hqdefault.jpg
9125	Quinn Christopherson: NPR Music Tiny Desk Contest Winner 2019	https://www.youtube.com/watch?v=wzyR_MWEGBU	Quinn Christopherson	CONTEST_WINNER	2020-03-19	https://i.ytimg.com/vi/wzyR_MWEGBU/hqdefault.jpg
9126	Naia Izumi: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=42MiCMJ6DJU	Naia Izumi	CONTEST_WINNER	2020-03-19	https://i.ytimg.com/vi/42MiCMJ6DJU/hqdefault.jpg
9127	Tank And The Bangas' Journey To The Tiny Desk	https://www.youtube.com/watch?v=jLTe8Hdbz88	Tank And The Bangas' Journey To The Tiny Desk	CONTEST_WINNER	2021-11-19	https://i.ytimg.com/vi/jLTe8Hdbz88/hqdefault.jpg
9128	Tank And The Bangas: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=QKzobTCIRDw	Tank And The Bangas	CONTEST_WINNER	2020-03-19	https://i.ytimg.com/vi/QKzobTCIRDw/hqdefault.jpg
9129	Gaelynn Lea: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=n6oSeODGmoQ	Gaelynn Lea	CONTEST_WINNER	2020-03-19	https://i.ytimg.com/vi/n6oSeODGmoQ/hqdefault.jpg
9130	Fantastic Negrito: NPR Music Tiny Desk Concert	https://www.youtube.com/watch?v=ymYjwsFz8iM	Fantastic Negrito	CONTEST_WINNER	2020-03-19	https://i.ytimg.com/vi/ymYjwsFz8iM/hqdefault.jpg
\.


--
-- Data for Name: favorites; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.favorites (user_id, concert_id) FROM stdin;
5	7307
5	7305
6	7305
\.


--
-- Data for Name: likes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.likes (user_id, concert_id) FROM stdin;
6	7308
5	7307
5	7308
\.


--
-- Data for Name: reports; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reports (id, user_id, concert_id, issue_type, description, created_at) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, email, password, usertype, isactive, emailverified, profilepicture, createdon, createdby, updatedon, updatedby, version) FROM stdin;
2	Tom├ís	tomas@email.com	1234	1	t	f	\N	2025-05-02 20:43:13.349888	\N	2025-05-02 20:43:13.349888	\N	1
3	maria	maria@gmail.com	$2b$12$TCQP/BZ9PPteZkubCbNdF.1BPZ1hE1hAHB.JVP.WnIfU6ARe6KAdS	1	t	f	\N	2025-05-03 09:12:37.103895	\N	2025-05-03 09:12:37.103895	\N	1
4	maria	tomas@example.com	$2b$12$sTZFRcUEEyegyAgVL7470uvQCDNCvvr2Vm4pJc8CBvvmYHJ1eI5Za	1	t	f	\N	2025-05-16 11:06:26.03212	\N	2025-05-16 11:06:26.03212	\N	1
6	teste	teste@gmail.com	$2b$12$s3dby215OOyMaPPj9NkrAOe7ZR/mHdZUe5AuREmu1.qEwjrbLZydO	1	t	f	\N	2025-05-17 19:44:29.354587	\N	2025-05-17 19:44:29.354587	\N	1
5	vitorr	vitor@gmail.com	$2b$12$EqxX5Ftqe99U3gfwop2tFe3g.rcSeE25b6yrQve.ZTwBA9lgmlnA.	0	t	f	\N	2025-05-16 11:30:54.835594	\N	2025-05-16 11:30:54.835594	\N	1
\.


--
-- Data for Name: usertype; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usertype (id, role) FROM stdin;
1	normal
0	admin
\.


--
-- Name: comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.comments_id_seq', 3, true);


--
-- Name: concerts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.concerts_id_seq', 9130, true);


--
-- Name: reports_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reports_id_seq', 1, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 6, true);


--
-- Name: usertype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usertype_id_seq', 1, false);


--
-- Name: comments comments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


--
-- Name: concerts concerts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.concerts
    ADD CONSTRAINT concerts_pkey PRIMARY KEY (id);


--
-- Name: favorites favorites_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.favorites
    ADD CONSTRAINT favorites_pkey PRIMARY KEY (user_id, concert_id);


--
-- Name: likes likes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.likes
    ADD CONSTRAINT likes_pkey PRIMARY KEY (user_id, concert_id);


--
-- Name: reports reports_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reports
    ADD CONSTRAINT reports_pkey PRIMARY KEY (id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: usertype usertype_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usertype
    ADD CONSTRAINT usertype_pkey PRIMARY KEY (id);


--
-- Name: comments comments_concert_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_concert_id_fkey FOREIGN KEY (concert_id) REFERENCES public.concerts(id) ON DELETE CASCADE;


--
-- Name: comments comments_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: favorites favorites_concert_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.favorites
    ADD CONSTRAINT favorites_concert_id_fkey FOREIGN KEY (concert_id) REFERENCES public.concerts(id) ON DELETE CASCADE;


--
-- Name: favorites favorites_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.favorites
    ADD CONSTRAINT favorites_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: likes likes_concert_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.likes
    ADD CONSTRAINT likes_concert_id_fkey FOREIGN KEY (concert_id) REFERENCES public.concerts(id) ON DELETE CASCADE;


--
-- Name: likes likes_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.likes
    ADD CONSTRAINT likes_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: reports reports_concert_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reports
    ADD CONSTRAINT reports_concert_id_fkey FOREIGN KEY (concert_id) REFERENCES public.concerts(id) ON DELETE CASCADE;


--
-- Name: reports reports_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reports
    ADD CONSTRAINT reports_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE SET NULL;


--
-- Name: users users_usertype_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_usertype_fkey FOREIGN KEY (usertype) REFERENCES public.usertype(id);


--
-- PostgreSQL database dump complete
--


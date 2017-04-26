--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.2
-- Dumped by pg_dump version 9.6.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
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


SET search_path = public, pg_catalog;

--
-- Name: authors_id_seq; Type: SEQUENCE; Schema: public; Owner: jondich
--

CREATE SEQUENCE authors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE authors_id_seq OWNER TO jondich;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: authors; Type: TABLE; Schema: public; Owner: jeff
--

CREATE TABLE authors (
    id integer DEFAULT nextval('authors_id_seq'::regclass) NOT NULL,
    last_name text,
    first_name text,
    birth_year integer,
    death_year integer
);


ALTER TABLE authors OWNER TO jeff;

--
-- Name: books_single_author; Type: TABLE; Schema: public; Owner: jeff
--

CREATE TABLE books_single_author (
    id integer NOT NULL,
    title text,
    author_id integer,
    publication_year integer
);


ALTER TABLE books_single_author OWNER TO jeff;

--
-- Name: books_id_seq; Type: SEQUENCE; Schema: public; Owner: jeff
--

CREATE SEQUENCE books_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE books_id_seq OWNER TO jeff;

--
-- Name: books_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jeff
--

ALTER SEQUENCE books_id_seq OWNED BY books_single_author.id;


--
-- Name: books; Type: TABLE; Schema: public; Owner: jeff
--

CREATE TABLE books (
    id integer DEFAULT nextval('books_id_seq'::regclass) NOT NULL,
    title text,
    publication_year integer
);


ALTER TABLE books OWNER TO jeff;

--
-- Name: books_authors; Type: TABLE; Schema: public; Owner: jeff
--

CREATE TABLE books_authors (
    book_id integer,
    author_id integer
);


ALTER TABLE books_authors OWNER TO jeff;

--
-- Data for Name: authors; Type: TABLE DATA; Schema: public; Owner: jeff
--

COPY authors (id, last_name, first_name, birth_year, death_year) FROM stdin;
1	Melville	Herman	1819	1891
2	Austen	Jane	1775	1817
3	Christie	Agatha	1890	1976
4	Rushdie	Salman	1947	0
5	Morrison	Toni	1931	0
6	Wodehouse	P.G.	1881	1975
7	Gaiman	Neil	1960	0
8	Pratchett	Terry	1948	2015
9	Willis	Connie	1945	0
10	Lewis	Sinclair	1885	0
11	Brontë	Emily	1818	1848
12	Brontë	Charlotte	1816	1855
13	Brontë	Ann	1820	1849
14	Bujold	Lois McMaster	1949	0
15	García Márquez	Gabriel	1927	2014
\.


--
-- Name: authors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jondich
--

SELECT pg_catalog.setval('authors_id_seq', 15, true);


--
-- Data for Name: books; Type: TABLE DATA; Schema: public; Owner: jeff
--

COPY books (id, title, publication_year) FROM stdin;
1	Moby Dick	1851
2	Omoo	1847
3	Beloved	1987
4	Sula	1973
5	Midnight's Children	1981
6	The Satanic Verses	1988
7	Emma	1815
8	Pride and Prejudice	1813
9	Sense and Sensibility	1813
10	Right Ho, Jeeves	1934
11	Leave it to Psmith	1923
12	The Code of the Woosters	1938
13	Murder on the Orient Express	1934
14	And Then There Were None	1939
15	Good Omens	1990
16	Neverwhere	1996
17	Thief of Time	1996
18	To Say Nothing of the Dog	1997
19	Blackout	2010
20	All Clear	2010
21	Main Street	1920
22	Elmer Gantry	1927
23	The Tenant of Wildfell Hall	1848
24	Jane Eyre	1847
25	Villette	1853
26	Wuthering Heights	1847
27	One Hundred Years of Solitude	1967
28	Love in the Time of Cholera	1985
29	Shards of Honor	1986
30	Mirror Dance	1994
\.


--
-- Data for Name: books_authors; Type: TABLE DATA; Schema: public; Owner: jeff
--

COPY books_authors (book_id, author_id) FROM stdin;
1	1
2	1
3	5
4	5
5	4
6	4
7	2
8	2
9	2
10	6
11	6
12	6
13	3
14	3
15	7
15	8
16	7
17	8
18	9
19	9
20	9
21	10
22	10
23	13
24	12
25	12
26	11
14	29
14	30
15	28
15	27
\.


--
-- Name: books_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jeff
--

SELECT pg_catalog.setval('books_id_seq', 30, true);


--
-- Data for Name: books_single_author; Type: TABLE DATA; Schema: public; Owner: jeff
--

COPY books_single_author (id, title, author_id, publication_year) FROM stdin;
1	Moby Dick	1	1851
2	Omoo	1	1847
3	Beloved	5	1987
4	Sula	5	1973
5	Midnight's Children	4	1981
6	The Satanic Verses	4	1988
7	Emma	2	1815
8	Pride and Prejudice	2	1813
9	Sense and Sensibility	2	1813
10	Right Ho, Jeeves	6	1934
11	Leave it to Psmith	6	1923
12	The Code of the Woosters	6	1938
13	Murder on the Orient Express	3	1934
14	And Then There Were None	3	1939
\.


--
-- Name: authors authors_pkey; Type: CONSTRAINT; Schema: public; Owner: jeff
--

ALTER TABLE ONLY authors
    ADD CONSTRAINT authors_pkey PRIMARY KEY (id);


--
-- Name: books books_pkey; Type: CONSTRAINT; Schema: public; Owner: jeff
--

ALTER TABLE ONLY books
    ADD CONSTRAINT books_pkey PRIMARY KEY (id);


--
-- Name: books_single_author books_single_author_pkey; Type: CONSTRAINT; Schema: public; Owner: jeff
--

ALTER TABLE ONLY books_single_author
    ADD CONSTRAINT books_single_author_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--


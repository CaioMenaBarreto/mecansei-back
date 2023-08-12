--
-- PostgreSQL database dump
--

-- Dumped from database version 14.8 (Ubuntu 14.8-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.8 (Ubuntu 14.8-0ubuntu0.22.04.1)

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
-- Name: products; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.products (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text NOT NULL,
    value money NOT NULL,
    photo character varying(255) NOT NULL,
    "userId" integer NOT NULL,
    vendido boolean DEFAULT false NOT NULL
);


--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- Name: sessions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sessions (
    id integer NOT NULL,
    "userId" integer NOT NULL,
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
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name text NOT NULL,
    email text NOT NULL,
    password text NOT NULL,
    cpf text NOT NULL,
    phone text NOT NULL
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
-- Name: products id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- Name: sessions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions ALTER COLUMN id SET DEFAULT nextval('public.sessions_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.products VALUES (1, 'Iphone 11', 'Iphone 11 seminovo com a bateria em 80%', 'R$ 800.000,00', 'https://media.istockphoto.com/id/1297615934/pt/foto/hand-holding-smartphone-iphone-11-ios-application-on-developed-by-apple-inc.jpg?s=1024x1024&w=is&k=20&c=KxIaZKz0_hV7NfFY6eitJ0I8wJ1-smQxHdTvnNpnUBw=', 2, true);
INSERT INTO public.products VALUES (2, 'Garrafa Tupperware', 'Uma garrafa Tupperware que suporta 1 litro.', 'R$ 50,00', 'https://live.staticflickr.com/8688/16828940549_80149771f3_m.jpg', 2, true);
INSERT INTO public.products VALUES (5, 'Ferrari', 'Uma Ferrari seminova.', 'R$ 550.000,00', 'https://images.unsplash.com/photo-1592198084033-aade902d1aae?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8ZmVycmFyaXxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60', 2, true);
INSERT INTO public.products VALUES (3, 'Rolex', 'Um Rolex novo usado poucas vezes.', 'R$ 50.000,30', 'https://cdn.iset.io/assets/41659/produtos/1080/rolex-gold.jpg', 1, true);
INSERT INTO public.products VALUES (6, 'Teste', 'Só pra ver se aceita gif ', 'R$ 1.000.000,00', 'https://media1.giphy.com/media/REEp9iIP70X5BKlnql/giphy.gif?cid=ecf05e471ac3henjwtbk2e9qbeow109alflzeqbtdtvimzp9&ep=v1_gifs_gifId&rid=giphy.gif&ct=g', 2, true);
INSERT INTO public.products VALUES (7, 'Golzinho', 'Golzinho', 'R$ 123,00', 'https://media1.giphy.com/media/495S7vcopTiZDp11ZV/200w.webp?cid=ecf05e47kd1pgztxixhb97e34p58czhb7a5nshf07mpht5op&ep=v1_gifs_search&rid=200w.webp&ct=g', 2, true);
INSERT INTO public.products VALUES (8, 'Bomba', 'Bomba grande que só tem tamanho mas não tem potência', 'R$ 1,50', 'https://media2.giphy.com/media/XZXK8Cg6cEf9rqUpgg/giphy.webp', 1, false);


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.sessions VALUES (1, 1, 'c27206d8-43d4-4737-82c4-adb84a7ae052');
INSERT INTO public.sessions VALUES (2, 1, '5bf1778c-f15d-4878-a8e1-57b0575add61');
INSERT INTO public.sessions VALUES (3, 1, 'de9429bc-e693-4809-a1e8-847f8b451614');
INSERT INTO public.sessions VALUES (4, 1, '77ddbe84-0be2-484c-b73b-12fcb42e16d8');
INSERT INTO public.sessions VALUES (5, 1, 'c655e4c5-84e6-45b4-b24c-645d34569c01');
INSERT INTO public.sessions VALUES (6, 1, '9bd0ad82-be12-4f69-8e63-095f4cdf6ea9');
INSERT INTO public.sessions VALUES (7, 1, '284a5d70-ee0b-403c-aef6-b952d72f7600');
INSERT INTO public.sessions VALUES (8, 1, '55f012e1-f246-4cdc-aead-2df1e505a626');
INSERT INTO public.sessions VALUES (9, 1, '8269a0c8-2b45-4ead-8e08-7bb16781bcf2');
INSERT INTO public.sessions VALUES (10, 1, 'dd8296e1-4907-422a-813d-88f051f0adf9');
INSERT INTO public.sessions VALUES (11, 1, '1f4ca62e-059d-43f0-9aef-de874b1fc711');
INSERT INTO public.sessions VALUES (12, 1, 'd3acfe63-af03-439f-8bc9-bd0de0c09f5c');
INSERT INTO public.sessions VALUES (13, 1, '8a287b2d-3882-40b2-a35c-f68c336fd1b1');
INSERT INTO public.sessions VALUES (14, 1, '536c9d79-3f10-4051-ab7f-080b7f9b5c76');
INSERT INTO public.sessions VALUES (15, 1, '947e036a-2082-4222-833d-3f403a8b5121');
INSERT INTO public.sessions VALUES (16, 1, 'c6387c05-c212-4f56-b8a4-a742b6789fdf');
INSERT INTO public.sessions VALUES (17, 1, 'c289ccae-6117-4566-8fd4-cb0e6e042666');
INSERT INTO public.sessions VALUES (18, 1, '7d4b1c5f-ebab-48ed-b350-1157bea3944f');
INSERT INTO public.sessions VALUES (19, 1, 'eb047cdf-6f52-4c35-958e-429cee7760a2');
INSERT INTO public.sessions VALUES (20, 1, 'e7585980-bec5-40b6-9f35-cc2f7cf97126');
INSERT INTO public.sessions VALUES (21, 1, '9034911d-012a-48d7-ac61-3dee23cab6ea');
INSERT INTO public.sessions VALUES (22, 1, '548f52a3-8b1a-4f1d-b786-8061ff0521f9');
INSERT INTO public.sessions VALUES (23, 1, 'df530c17-7540-478d-9633-af2aafad99ff');
INSERT INTO public.sessions VALUES (24, 1, 'f8f12d96-f6f6-4d4d-a161-cb86511e0a68');
INSERT INTO public.sessions VALUES (25, 2, '0d0c440d-4868-4909-b783-985e1e4a44e4');
INSERT INTO public.sessions VALUES (26, 1, '1cfee8b4-59d0-4dee-9440-35bd99ffb18a');
INSERT INTO public.sessions VALUES (27, 1, 'd9e9d756-dfe2-4b97-bdb2-9a2e1cc84149');
INSERT INTO public.sessions VALUES (28, 1, 'd2e8a1d5-6503-43b2-83d8-04e176530382');
INSERT INTO public.sessions VALUES (29, 1, 'f823004c-b2cc-4503-aca9-e4343406eeb9');
INSERT INTO public.sessions VALUES (30, 1, '47827939-d74b-4236-891a-7be0c37b6d92');
INSERT INTO public.sessions VALUES (31, 2, '37bed953-f3c1-4078-a24b-76f27915031f');
INSERT INTO public.sessions VALUES (32, 1, '1070588a-4490-4253-812c-7743efa302cc');
INSERT INTO public.sessions VALUES (33, 1, '33ebbd51-1c3c-4181-a476-6b10719dd79b');
INSERT INTO public.sessions VALUES (34, 1, 'a5d178a7-a457-4adb-b763-3d6d01e11f3b');
INSERT INTO public.sessions VALUES (35, 1, 'd05f1cb3-d1d4-49f1-a75f-e93daadb940f');
INSERT INTO public.sessions VALUES (36, 1, '606529da-64d0-4946-94a2-5e12d00f5216');
INSERT INTO public.sessions VALUES (37, 2, 'c3e18486-cd0a-409c-8b3e-57b9ab7a0245');
INSERT INTO public.sessions VALUES (38, 2, '6cf35d96-0b6a-4d38-9a61-476d36fd3e7c');
INSERT INTO public.sessions VALUES (39, 1, '7220a9f5-9166-482e-a469-383975f7d9c7');
INSERT INTO public.sessions VALUES (40, 1, 'b8cd05a3-bc2e-4db2-ae3a-8615054d622c');
INSERT INTO public.sessions VALUES (41, 1, 'eda74791-205b-40f7-a188-67d216bb3200');
INSERT INTO public.sessions VALUES (42, 2, 'e86125e0-3bc9-4c4d-95b3-9a766044b29d');
INSERT INTO public.sessions VALUES (43, 1, '2b2fe3ff-0035-4260-8b78-821abcbc1295');


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users VALUES (1, 'Caio Lucas', 'clpmb2000@gmail.com', '$2b$10$WlLEPiwqymTFVTlJXzA3YuipV/YMjxkt0W0i/91VSr5k9fLs1lwUC', '065.787.541-48', '61 99138-9999');
INSERT INTO public.users VALUES (2, 'Juliana', 'jsremedios4@gmail.com', '$2b$10$Z7oFqYQsDEQ8wIr5fv52COjcYObX8TjbggDc5kKmyaPcCn.0JWrpS', '070.205.981-10', '61 99963-9093');


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.products_id_seq', 8, true);


--
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sessions_id_seq', 43, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 2, true);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT "sessions_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--


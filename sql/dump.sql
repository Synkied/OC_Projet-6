--
-- PostgreSQL database dump
--

-- Dumped from database version 10.1
-- Dumped by pg_dump version 10.1

-- Started on 2018-01-28 15:32:18

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 216 (class 1259 OID 37182)
-- Name: address; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE address (
    address_id integer NOT NULL,
    user_id integer,
    supplier_id integer,
    restaurant_id integer,
    title character varying(128),
    street_number character varying(10) NOT NULL,
    street_name character varying(256) NOT NULL,
    postal_code character varying(16) NOT NULL,
    town character varying(128) NOT NULL,
    latitude real,
    longitude real
);


ALTER TABLE address OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 37180)
-- Name: address_address_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE address_address_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE address_address_id_seq OWNER TO postgres;

--
-- TOC entry 2969 (class 0 OID 0)
-- Dependencies: 215
-- Name: address_address_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE address_address_id_seq OWNED BY address.address_id;


--
-- TOC entry 218 (class 1259 OID 37193)
-- Name: app_order; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE app_order (
    order_id integer NOT NULL,
    user_id integer NOT NULL,
    restaurant_id integer NOT NULL,
    address_id integer NOT NULL
);


ALTER TABLE app_order OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 37191)
-- Name: app_order_order_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE app_order_order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE app_order_order_id_seq OWNER TO postgres;

--
-- TOC entry 2970 (class 0 OID 0)
-- Dependencies: 217
-- Name: app_order_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE app_order_order_id_seq OWNED BY app_order.order_id;


--
-- TOC entry 211 (class 1259 OID 37158)
-- Name: app_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE app_user (
    user_id integer NOT NULL,
    role_id smallint NOT NULL,
    gender character varying(16) NOT NULL,
    first_name character varying(64) NOT NULL,
    last_name character varying(64) NOT NULL,
    phone_number character varying(16) NOT NULL,
    email character varying(128) NOT NULL,
    password_sha256 character varying NOT NULL,
    restaurant_id integer
);


ALTER TABLE app_user OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 37156)
-- Name: app_user_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE app_user_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE app_user_user_id_seq OWNER TO postgres;

--
-- TOC entry 2971 (class 0 OID 0)
-- Dependencies: 210
-- Name: app_user_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE app_user_user_id_seq OWNED BY app_user.user_id;


--
-- TOC entry 199 (class 1259 OID 37102)
-- Name: category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE category (
    category_id integer NOT NULL,
    name character varying NOT NULL,
    parent_category_id integer
);


ALTER TABLE category OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 37100)
-- Name: category_category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE category_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE category_category_id_seq OWNER TO postgres;

--
-- TOC entry 2972 (class 0 OID 0)
-- Dependencies: 198
-- Name: category_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE category_category_id_seq OWNED BY category.category_id;


--
-- TOC entry 201 (class 1259 OID 37113)
-- Name: ingredient; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE ingredient (
    ingredient_id integer NOT NULL,
    name character varying(128) NOT NULL,
    description character varying(256)
);


ALTER TABLE ingredient OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 37111)
-- Name: ingredient_ingredient_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE ingredient_ingredient_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ingredient_ingredient_id_seq OWNER TO postgres;

--
-- TOC entry 2973 (class 0 OID 0)
-- Dependencies: 200
-- Name: ingredient_ingredient_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE ingredient_ingredient_id_seq OWNED BY ingredient.ingredient_id;


--
-- TOC entry 221 (class 1259 OID 37212)
-- Name: order_product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE order_product (
    product_id integer NOT NULL,
    order_id integer NOT NULL,
    quantity smallint NOT NULL
);


ALTER TABLE order_product OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 37207)
-- Name: order_status; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE order_status (
    order_id integer NOT NULL,
    created timestamp without time zone NOT NULL,
    prepared timestamp without time zone NOT NULL,
    shipped timestamp without time zone NOT NULL,
    delivered timestamp without time zone NOT NULL,
    transaction_id integer
);


ALTER TABLE order_status OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 37137)
-- Name: product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE product (
    product_id integer NOT NULL,
    name character varying(64) NOT NULL,
    description character varying(256),
    price numeric(5,2) NOT NULL,
    img_filename bytea
);


ALTER TABLE product OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 37146)
-- Name: product_category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE product_category (
    product_id integer NOT NULL,
    category_id integer NOT NULL
);


ALTER TABLE product_category OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 37151)
-- Name: product_ingredient; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE product_ingredient (
    product_id integer NOT NULL,
    ingredient_id integer NOT NULL,
    quantity numeric(5,2) NOT NULL
);


ALTER TABLE product_ingredient OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 37135)
-- Name: product_product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE product_product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE product_product_id_seq OWNER TO postgres;

--
-- TOC entry 2974 (class 0 OID 0)
-- Dependencies: 206
-- Name: product_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE product_product_id_seq OWNED BY product.product_id;


--
-- TOC entry 203 (class 1259 OID 37121)
-- Name: restaurant; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE restaurant (
    restaurant_id integer NOT NULL,
    name character varying(64) NOT NULL,
    email character varying(128),
    phone character varying(16)
);


ALTER TABLE restaurant OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 37119)
-- Name: restaurant_restaurant_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE restaurant_restaurant_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE restaurant_restaurant_id_seq OWNER TO postgres;

--
-- TOC entry 2975 (class 0 OID 0)
-- Dependencies: 202
-- Name: restaurant_restaurant_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE restaurant_restaurant_id_seq OWNED BY restaurant.restaurant_id;


--
-- TOC entry 197 (class 1259 OID 37093)
-- Name: role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE role (
    role_id smallint NOT NULL,
    name character varying(32) NOT NULL
);


ALTER TABLE role OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 37091)
-- Name: role_role_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE role_role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE role_role_id_seq OWNER TO postgres;

--
-- TOC entry 2976 (class 0 OID 0)
-- Dependencies: 196
-- Name: role_role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE role_role_id_seq OWNED BY role.role_id;


--
-- TOC entry 205 (class 1259 OID 37129)
-- Name: stock; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE stock (
    stock_id integer NOT NULL,
    restaurant_id integer NOT NULL,
    ingredient_id integer NOT NULL,
    quantity numeric(10,2) NOT NULL,
    change_datetime timestamp without time zone NOT NULL
);


ALTER TABLE stock OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 37127)
-- Name: stock_stock_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE stock_stock_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE stock_stock_id_seq OWNER TO postgres;

--
-- TOC entry 2977 (class 0 OID 0)
-- Dependencies: 204
-- Name: stock_stock_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE stock_stock_id_seq OWNED BY stock.stock_id;


--
-- TOC entry 213 (class 1259 OID 37169)
-- Name: supplier; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE supplier (
    supplier_id integer NOT NULL,
    name character varying(45) NOT NULL,
    description character varying(300),
    email character varying(100) NOT NULL,
    phone_number character varying(16) NOT NULL
);


ALTER TABLE supplier OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 37175)
-- Name: supplier_ingredient; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE supplier_ingredient (
    supplier_id integer NOT NULL,
    ingredient_id integer NOT NULL
);


ALTER TABLE supplier_ingredient OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 37167)
-- Name: supplier_supplier_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE supplier_supplier_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE supplier_supplier_id_seq OWNER TO postgres;

--
-- TOC entry 2978 (class 0 OID 0)
-- Dependencies: 212
-- Name: supplier_supplier_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE supplier_supplier_id_seq OWNED BY supplier.supplier_id;


--
-- TOC entry 219 (class 1259 OID 37199)
-- Name: transaction; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE transaction (
    transaction_id integer NOT NULL,
    order_id integer NOT NULL,
    stripe_token character varying NOT NULL,
    transaction_datetime timestamp without time zone NOT NULL,
    refund_cause character varying(512)
);


ALTER TABLE transaction OWNER TO postgres;

--
-- TOC entry 2761 (class 2604 OID 37185)
-- Name: address address_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY address ALTER COLUMN address_id SET DEFAULT nextval('address_address_id_seq'::regclass);


--
-- TOC entry 2762 (class 2604 OID 37196)
-- Name: app_order order_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY app_order ALTER COLUMN order_id SET DEFAULT nextval('app_order_order_id_seq'::regclass);


--
-- TOC entry 2759 (class 2604 OID 37161)
-- Name: app_user user_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY app_user ALTER COLUMN user_id SET DEFAULT nextval('app_user_user_id_seq'::regclass);


--
-- TOC entry 2754 (class 2604 OID 37105)
-- Name: category category_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY category ALTER COLUMN category_id SET DEFAULT nextval('category_category_id_seq'::regclass);


--
-- TOC entry 2755 (class 2604 OID 37116)
-- Name: ingredient ingredient_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ingredient ALTER COLUMN ingredient_id SET DEFAULT nextval('ingredient_ingredient_id_seq'::regclass);


--
-- TOC entry 2758 (class 2604 OID 37140)
-- Name: product product_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY product ALTER COLUMN product_id SET DEFAULT nextval('product_product_id_seq'::regclass);


--
-- TOC entry 2756 (class 2604 OID 37124)
-- Name: restaurant restaurant_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY restaurant ALTER COLUMN restaurant_id SET DEFAULT nextval('restaurant_restaurant_id_seq'::regclass);


--
-- TOC entry 2753 (class 2604 OID 37096)
-- Name: role role_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY role ALTER COLUMN role_id SET DEFAULT nextval('role_role_id_seq'::regclass);


--
-- TOC entry 2757 (class 2604 OID 37132)
-- Name: stock stock_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY stock ALTER COLUMN stock_id SET DEFAULT nextval('stock_stock_id_seq'::regclass);


--
-- TOC entry 2760 (class 2604 OID 37172)
-- Name: supplier supplier_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY supplier ALTER COLUMN supplier_id SET DEFAULT nextval('supplier_supplier_id_seq'::regclass);


--
-- TOC entry 2959 (class 0 OID 37182)
-- Dependencies: 216
-- Data for Name: address; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY address (address_id, user_id, supplier_id, restaurant_id, title, street_number, street_name, postal_code, town, latitude, longitude) FROM stdin;
1	\N	\N	1	\N	13 bis	place denfert rochereau	75014	Paris	\N	\N
2	\N	\N	2	\N	15 ter	place de la bastille	75011	Paris	\N	\N
3	\N	1	\N	\N	1	rue de la tour	94152	Rungis	\N	\N
4	5	\N	\N	Ma maison	600	route du Noiray	73290	La Motte-Servolex	\N	\N
5	6	\N	\N	La maison de maman	55	rue des archives	75003	Paris	\N	\N
\.


--
-- TOC entry 2961 (class 0 OID 37193)
-- Dependencies: 218
-- Data for Name: app_order; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY app_order (order_id, user_id, restaurant_id, address_id) FROM stdin;
1	5	1	3
2	6	2	4
3	6	1	4
\.


--
-- TOC entry 2954 (class 0 OID 37158)
-- Dependencies: 211
-- Data for Name: app_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY app_user (user_id, role_id, gender, first_name, last_name, phone_number, email, password_sha256, restaurant_id) FROM stdin;
1	1	F	Peach	Princess	0000000000	peach@mario_world.fr	85356064d03872ac4bed179b8bbe8318ab67a9626be55d0d72288ee14e165265	1
2	2	M	Bowser	Bad	0000000000	bowser@mario_world.fr	24c15bdcf0144615360f6154593dd73b54d5d159b92dfeab2faddcb4ad06d74b	1
3	3	M	Mario	Mario	0000000000	mario@mario_world.fr	59195c6c541c8307f1da2d1e768d6f2280c984df217ad5f4c64c3542b04111a4	1
4	4	M	Luigi	Luigi	0000000000	luigi@mario_world.fr	5839ecdfd43bc7467f77cba4a40ea64c8ee5f986f61cf16a0e024ed2225891a4	1
5	5	M	Toad	Toad	0000000000	toad@toad_world.fr	1b34942add2c85bbca6a87ba114b9ffb1c92f1a6fde8bec4ebd98a4dd18d74a7	\N
6	5	M	Yoshi	Yoshi	0000000000	yoshi@yoshi_world.fr	a2d7cd5aba4611fd646db71593d23e0d9758b24a82cc759a2ae0f6ef2c8e1724	\N
7	5	F	Zelda	Princess	0000000000	zelda@link_world.fr	f4c7079ad36ede23223bde716d102b1891a234dcc451cca28d3dbff07abe826b	\N
\.


--
-- TOC entry 2942 (class 0 OID 37102)
-- Dependencies: 199
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY category (category_id, name, parent_category_id) FROM stdin;
1	Pizza	\N
2	Boissons	\N
3	Desserts	\N
4	Entrées	\N
5	Antipasti	4
\.


--
-- TOC entry 2944 (class 0 OID 37113)
-- Dependencies: 201
-- Data for Name: ingredient; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY ingredient (ingredient_id, name, description) FROM stdin;
1	Mozzarella	1 boule de mozzarella
2	Champignons de Paris	1 champignon entier
3	Sauce tomate	1 unité de sauce tomate (250 ml)
4	Pâte à Pizza	1 unité de pâte à pizza
5	Roquette	1 unité de roquette (50g)
6	Aubergine	1 aubergine entière
7	Jambon	1 tranche de jambon
8	Tomate	1 tomate
9	Tiramisu	1 unité de tiramisu
\.


--
-- TOC entry 2964 (class 0 OID 37212)
-- Dependencies: 221
-- Data for Name: order_product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY order_product (product_id, order_id, quantity) FROM stdin;
1	1	2
2	1	1
1	2	1
3	2	1
2	3	1
\.


--
-- TOC entry 2963 (class 0 OID 37207)
-- Dependencies: 220
-- Data for Name: order_status; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY order_status (order_id, created, prepared, shipped, delivered, transaction_id) FROM stdin;
1	2018-01-27 12:41:05	2018-01-27 12:51:55	2018-01-27 12:52:45	2018-01-27 13:10:37	1
2	2018-01-27 12:46:00	2018-01-27 12:57:34	2018-01-27 12:59:00	2018-01-27 13:18:15	2
3	2018-01-26 12:46:00	2018-01-26 12:57:34	2018-01-26 12:59:00	2018-01-26 13:18:15	3
\.


--
-- TOC entry 2950 (class 0 OID 37137)
-- Dependencies: 207
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY product (product_id, name, description, price, img_filename) FROM stdin;
1	Pizza végétarienne	\N	9.50	\N
2	Margherita	\N	8.00	\N
3	Roquette	\N	11.00	\N
4	Tiramisu	\N	5.00	\N
\.


--
-- TOC entry 2951 (class 0 OID 37146)
-- Dependencies: 208
-- Data for Name: product_category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY product_category (product_id, category_id) FROM stdin;
1	1
2	1
3	1
4	3
\.


--
-- TOC entry 2952 (class 0 OID 37151)
-- Dependencies: 209
-- Data for Name: product_ingredient; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY product_ingredient (product_id, ingredient_id, quantity) FROM stdin;
1	1	1.00
1	2	1.00
1	3	0.15
1	4	1.00
1	6	0.15
2	1	1.00
2	3	1.00
2	4	1.00
3	1	1.00
3	2	1.00
3	3	0.15
3	4	1.00
3	5	1.00
4	9	1.00
\.


--
-- TOC entry 2946 (class 0 OID 37121)
-- Dependencies: 203
-- Data for Name: restaurant; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY restaurant (restaurant_id, name, email, phone) FROM stdin;
1	OC Pizza Denfert	oc_pizza_denfert@oc_pizza.fr	0000000000
2	OC Pizza Cambronne	oc_pizza_cambronne@oc_pizza.fr	0000000000
\.


--
-- TOC entry 2940 (class 0 OID 37093)
-- Dependencies: 197
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY role (role_id, name) FROM stdin;
1	EMPLOYEE
2	ADMIN
3	DELIVERYMAN
4	ORDERMAKER
5	CLIENT
\.


--
-- TOC entry 2948 (class 0 OID 37129)
-- Dependencies: 205
-- Data for Name: stock; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY stock (stock_id, restaurant_id, ingredient_id, quantity, change_datetime) FROM stdin;
1	1	1	100.00	2018-01-26 12:30:50
2	1	2	500.00	2018-01-27 12:40:37
3	1	3	200.00	2018-01-26 12:30:50
4	1	4	200.00	2018-01-27 12:40:37
5	1	5	125.00	2018-01-26 12:30:50
6	1	6	40.00	2018-01-27 12:40:37
7	1	7	100.00	2018-01-26 12:30:50
8	1	8	50.00	2018-01-27 12:40:37
9	2	1	100.00	2018-01-26 12:30:50
10	2	2	500.00	2018-01-27 12:40:37
11	2	3	200.00	2018-01-26 12:30:50
12	2	4	200.00	2018-01-27 12:40:37
13	2	5	125.00	2018-01-26 12:30:50
14	2	6	40.00	2018-01-27 12:40:37
15	2	7	100.00	2018-01-26 12:30:50
16	2	8	50.00	2018-01-27 12:40:37
\.


--
-- TOC entry 2956 (class 0 OID 37169)
-- Dependencies: 213
-- Data for Name: supplier; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY supplier (supplier_id, name, description, email, phone_number) FROM stdin;
1	Rungis	\N	rungis@rungis.fr	0000000000
\.


--
-- TOC entry 2957 (class 0 OID 37175)
-- Dependencies: 214
-- Data for Name: supplier_ingredient; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY supplier_ingredient (supplier_id, ingredient_id) FROM stdin;
1	1
1	2
1	3
1	4
1	5
1	6
1	7
1	8
\.


--
-- TOC entry 2962 (class 0 OID 37199)
-- Dependencies: 219
-- Data for Name: transaction; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY transaction (transaction_id, order_id, stripe_token, transaction_datetime, refund_cause) FROM stdin;
1	1	4c78987eqsdqf1548	2018-01-27 12:40:37	\N
2	2	54465qsd56qezq564	2018-01-27 12:45:18	\N
3	3	2545qs6r74q56e788	2018-01-26 12:45:18	\N
\.


--
-- TOC entry 2979 (class 0 OID 0)
-- Dependencies: 215
-- Name: address_address_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('address_address_id_seq', 5, true);


--
-- TOC entry 2980 (class 0 OID 0)
-- Dependencies: 217
-- Name: app_order_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('app_order_order_id_seq', 3, true);


--
-- TOC entry 2981 (class 0 OID 0)
-- Dependencies: 210
-- Name: app_user_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('app_user_user_id_seq', 7, true);


--
-- TOC entry 2982 (class 0 OID 0)
-- Dependencies: 198
-- Name: category_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('category_category_id_seq', 5, true);


--
-- TOC entry 2983 (class 0 OID 0)
-- Dependencies: 200
-- Name: ingredient_ingredient_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('ingredient_ingredient_id_seq', 9, true);


--
-- TOC entry 2984 (class 0 OID 0)
-- Dependencies: 206
-- Name: product_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('product_product_id_seq', 4, true);


--
-- TOC entry 2985 (class 0 OID 0)
-- Dependencies: 202
-- Name: restaurant_restaurant_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('restaurant_restaurant_id_seq', 2, true);


--
-- TOC entry 2986 (class 0 OID 0)
-- Dependencies: 196
-- Name: role_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('role_role_id_seq', 5, true);


--
-- TOC entry 2987 (class 0 OID 0)
-- Dependencies: 204
-- Name: stock_stock_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('stock_stock_id_seq', 16, true);


--
-- TOC entry 2988 (class 0 OID 0)
-- Dependencies: 212
-- Name: supplier_supplier_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('supplier_supplier_id_seq', 1, true);


--
-- TOC entry 2787 (class 2606 OID 37190)
-- Name: address address_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY address
    ADD CONSTRAINT address_pk PRIMARY KEY (address_id);


--
-- TOC entry 2789 (class 2606 OID 37198)
-- Name: app_order app_order_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY app_order
    ADD CONSTRAINT app_order_pk PRIMARY KEY (order_id);


--
-- TOC entry 2781 (class 2606 OID 37166)
-- Name: app_user app_user_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY app_user
    ADD CONSTRAINT app_user_pk PRIMARY KEY (user_id);


--
-- TOC entry 2767 (class 2606 OID 37110)
-- Name: category category_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY category
    ADD CONSTRAINT category_pk PRIMARY KEY (category_id);


--
-- TOC entry 2769 (class 2606 OID 37118)
-- Name: ingredient ingredient_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ingredient
    ADD CONSTRAINT ingredient_pk PRIMARY KEY (ingredient_id);


--
-- TOC entry 2795 (class 2606 OID 37216)
-- Name: order_product order_product_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY order_product
    ADD CONSTRAINT order_product_pk PRIMARY KEY (product_id, order_id);


--
-- TOC entry 2793 (class 2606 OID 37211)
-- Name: order_status order_status_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY order_status
    ADD CONSTRAINT order_status_pk PRIMARY KEY (order_id);


--
-- TOC entry 2777 (class 2606 OID 37150)
-- Name: product_category product_category_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY product_category
    ADD CONSTRAINT product_category_pk PRIMARY KEY (product_id, category_id);


--
-- TOC entry 2779 (class 2606 OID 37155)
-- Name: product_ingredient product_ingredient_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY product_ingredient
    ADD CONSTRAINT product_ingredient_pk PRIMARY KEY (product_id, ingredient_id);


--
-- TOC entry 2775 (class 2606 OID 37145)
-- Name: product product_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY product
    ADD CONSTRAINT product_pk PRIMARY KEY (product_id);


--
-- TOC entry 2771 (class 2606 OID 37126)
-- Name: restaurant restaurant_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY restaurant
    ADD CONSTRAINT restaurant_pk PRIMARY KEY (restaurant_id);


--
-- TOC entry 2765 (class 2606 OID 37098)
-- Name: role role_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pk PRIMARY KEY (role_id);


--
-- TOC entry 2773 (class 2606 OID 37134)
-- Name: stock stock_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY stock
    ADD CONSTRAINT stock_pk PRIMARY KEY (stock_id, restaurant_id, ingredient_id);


--
-- TOC entry 2785 (class 2606 OID 37179)
-- Name: supplier_ingredient supplier_ingredient_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY supplier_ingredient
    ADD CONSTRAINT supplier_ingredient_pk PRIMARY KEY (supplier_id, ingredient_id);


--
-- TOC entry 2783 (class 2606 OID 37174)
-- Name: supplier supplier_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY supplier
    ADD CONSTRAINT supplier_pk PRIMARY KEY (supplier_id);


--
-- TOC entry 2791 (class 2606 OID 37206)
-- Name: transaction transaction_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY transaction
    ADD CONSTRAINT transaction_pk PRIMARY KEY (transaction_id);


--
-- TOC entry 2763 (class 1259 OID 37099)
-- Name: role_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX role_idx ON role USING btree (name);


--
-- TOC entry 2812 (class 2606 OID 37302)
-- Name: app_order address_order_1_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY app_order
    ADD CONSTRAINT address_order_1_fk FOREIGN KEY (address_id) REFERENCES address(address_id);


--
-- TOC entry 2796 (class 2606 OID 37227)
-- Name: category category_category_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY category
    ADD CONSTRAINT category_category_fk FOREIGN KEY (parent_category_id) REFERENCES category(category_id);


--
-- TOC entry 2799 (class 2606 OID 37222)
-- Name: product_category category_product_category_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY product_category
    ADD CONSTRAINT category_product_category_fk FOREIGN KEY (category_id) REFERENCES category(category_id);


--
-- TOC entry 2801 (class 2606 OID 37232)
-- Name: product_ingredient ingredient_product_ingredient_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY product_ingredient
    ADD CONSTRAINT ingredient_product_ingredient_fk FOREIGN KEY (ingredient_id) REFERENCES ingredient(ingredient_id);


--
-- TOC entry 2797 (class 2606 OID 37242)
-- Name: stock ingredient_stock_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY stock
    ADD CONSTRAINT ingredient_stock_fk FOREIGN KEY (ingredient_id) REFERENCES ingredient(ingredient_id);


--
-- TOC entry 2805 (class 2606 OID 37237)
-- Name: supplier_ingredient ingredient_supplier_ingredient_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY supplier_ingredient
    ADD CONSTRAINT ingredient_supplier_ingredient_fk FOREIGN KEY (ingredient_id) REFERENCES ingredient(ingredient_id);


--
-- TOC entry 2817 (class 2606 OID 37307)
-- Name: order_product order_order_product_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY order_product
    ADD CONSTRAINT order_order_product_fk FOREIGN KEY (order_id) REFERENCES app_order(order_id);


--
-- TOC entry 2814 (class 2606 OID 37312)
-- Name: order_status order_order_status_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY order_status
    ADD CONSTRAINT order_order_status_fk FOREIGN KEY (order_id) REFERENCES app_order(order_id);


--
-- TOC entry 2815 (class 2606 OID 37322)
-- Name: order_status order_status_transaction_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY order_status
    ADD CONSTRAINT order_status_transaction_fk FOREIGN KEY (transaction_id) REFERENCES transaction(transaction_id);


--
-- TOC entry 2813 (class 2606 OID 37317)
-- Name: transaction order_transaction_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY transaction
    ADD CONSTRAINT order_transaction_fk FOREIGN KEY (order_id) REFERENCES app_order(order_id);


--
-- TOC entry 2816 (class 2606 OID 37267)
-- Name: order_product product_order_product_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY order_product
    ADD CONSTRAINT product_order_product_fk FOREIGN KEY (product_id) REFERENCES product(product_id);


--
-- TOC entry 2800 (class 2606 OID 37277)
-- Name: product_category product_product_category_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY product_category
    ADD CONSTRAINT product_product_category_fk FOREIGN KEY (product_id) REFERENCES product(product_id);


--
-- TOC entry 2802 (class 2606 OID 37272)
-- Name: product_ingredient product_product_ingredient_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY product_ingredient
    ADD CONSTRAINT product_product_ingredient_fk FOREIGN KEY (product_id) REFERENCES product(product_id);


--
-- TOC entry 2807 (class 2606 OID 37247)
-- Name: address restaurant_address_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY address
    ADD CONSTRAINT restaurant_address_fk FOREIGN KEY (restaurant_id) REFERENCES restaurant(restaurant_id);


--
-- TOC entry 2810 (class 2606 OID 37257)
-- Name: app_order restaurant_order_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY app_order
    ADD CONSTRAINT restaurant_order_fk FOREIGN KEY (restaurant_id) REFERENCES restaurant(restaurant_id);


--
-- TOC entry 2798 (class 2606 OID 37252)
-- Name: stock restaurant_stock_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY stock
    ADD CONSTRAINT restaurant_stock_fk FOREIGN KEY (restaurant_id) REFERENCES restaurant(restaurant_id);


--
-- TOC entry 2804 (class 2606 OID 37262)
-- Name: app_user restaurant_user_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY app_user
    ADD CONSTRAINT restaurant_user_fk FOREIGN KEY (restaurant_id) REFERENCES restaurant(restaurant_id);


--
-- TOC entry 2803 (class 2606 OID 37217)
-- Name: app_user role_user_1_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY app_user
    ADD CONSTRAINT role_user_1_fk FOREIGN KEY (role_id) REFERENCES role(role_id);


--
-- TOC entry 2809 (class 2606 OID 37297)
-- Name: address supplier_address_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY address
    ADD CONSTRAINT supplier_address_fk FOREIGN KEY (supplier_id) REFERENCES supplier(supplier_id);


--
-- TOC entry 2806 (class 2606 OID 37292)
-- Name: supplier_ingredient supplier_supplier_ingredient_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY supplier_ingredient
    ADD CONSTRAINT supplier_supplier_ingredient_fk FOREIGN KEY (supplier_id) REFERENCES supplier(supplier_id);


--
-- TOC entry 2808 (class 2606 OID 37282)
-- Name: address user_address_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY address
    ADD CONSTRAINT user_address_fk FOREIGN KEY (user_id) REFERENCES app_user(user_id);


--
-- TOC entry 2811 (class 2606 OID 37287)
-- Name: app_order user_order_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY app_order
    ADD CONSTRAINT user_order_fk FOREIGN KEY (user_id) REFERENCES app_user(user_id);


-- Completed on 2018-01-28 15:32:19

--
-- PostgreSQL database dump complete
--


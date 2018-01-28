
CREATE SEQUENCE public.role_role_id_seq;

CREATE TABLE public.role (
                role_id SMALLINT NOT NULL DEFAULT nextval('public.role_role_id_seq'),
                name VARCHAR(32) NOT NULL,
                CONSTRAINT role_pk PRIMARY KEY (role_id)
);


ALTER SEQUENCE public.role_role_id_seq OWNED BY public.role.role_id;

CREATE SEQUENCE public.category_category_id_seq;

CREATE TABLE public.category (
                category_id INTEGER NOT NULL DEFAULT nextval('public.category_category_id_seq'),
                name VARCHAR NOT NULL,
                parent_category_id INTEGER,
                CONSTRAINT category_pk PRIMARY KEY (category_id)
);


ALTER SEQUENCE public.category_category_id_seq OWNED BY public.category.category_id;

CREATE SEQUENCE public.ingredient_ingredient_id_seq;

CREATE TABLE public.ingredient (
                ingredient_id INTEGER NOT NULL DEFAULT nextval('public.ingredient_ingredient_id_seq'),
                name VARCHAR(128) NOT NULL,
                description VARCHAR(256),
                CONSTRAINT ingredient_pk PRIMARY KEY (ingredient_id)
);


ALTER SEQUENCE public.ingredient_ingredient_id_seq OWNED BY public.ingredient.ingredient_id;

CREATE SEQUENCE public.restaurant_restaurant_id_seq;

CREATE TABLE public.restaurant (
                restaurant_id INTEGER NOT NULL DEFAULT nextval('public.restaurant_restaurant_id_seq'),
                name VARCHAR(64) NOT NULL,
                email VARCHAR(128),
                phone VARCHAR(16),
                CONSTRAINT restaurant_pk PRIMARY KEY (restaurant_id)
);


ALTER SEQUENCE public.restaurant_restaurant_id_seq OWNED BY public.restaurant.restaurant_id;

CREATE SEQUENCE public.stock_stock_id_seq;

CREATE TABLE public.stock (
                stock_id INTEGER NOT NULL DEFAULT nextval('public.stock_stock_id_seq'),
                restaurant_id INTEGER NOT NULL,
                ingredient_id INTEGER NOT NULL,
                quantity NUMERIC(10,2) NOT NULL,
                change_datetime TIMESTAMP NOT NULL,
                CONSTRAINT stock_pk PRIMARY KEY (stock_id, restaurant_id, ingredient_id)
);


ALTER SEQUENCE public.stock_stock_id_seq OWNED BY public.stock.stock_id;

CREATE SEQUENCE public.product_product_id_seq;

CREATE TABLE public.product (
                product_id INTEGER NOT NULL DEFAULT nextval('public.product_product_id_seq'),
                name VARCHAR(64) NOT NULL,
                description VARCHAR(256),
                price NUMERIC(5,2) NOT NULL,
                img_filename BYTEA,
                CONSTRAINT product_pk PRIMARY KEY (product_id)
);


ALTER SEQUENCE public.product_product_id_seq OWNED BY public.product.product_id;

CREATE TABLE public.product_category (
                product_id INTEGER NOT NULL,
                category_id INTEGER NOT NULL,
                CONSTRAINT product_category_pk PRIMARY KEY (product_id, category_id)
);


CREATE TABLE public.product_ingredient (
                product_id INTEGER NOT NULL,
                ingredient_id INTEGER NOT NULL,
                quantity NUMERIC(5,2) NOT NULL,
                CONSTRAINT product_ingredient_pk PRIMARY KEY (product_id, ingredient_id)
);


CREATE SEQUENCE public.app_user_user_id_seq;

CREATE TABLE public.app_user (
                user_id INTEGER NOT NULL DEFAULT nextval('public.app_user_user_id_seq'),
                role_id SMALLINT NOT NULL,
                gender VARCHAR(16) NOT NULL,
                first_name VARCHAR(64) NOT NULL,
                last_name VARCHAR(64) NOT NULL,
                phone_number VARCHAR(16) NOT NULL,
                email VARCHAR(128) NOT NULL,
                password_sha256 VARCHAR NOT NULL,
                restaurant_id INTEGER NOT NULL,
                CONSTRAINT app_user_pk PRIMARY KEY (user_id)
);


ALTER SEQUENCE public.app_user_user_id_seq OWNED BY public.app_user.user_id;

CREATE SEQUENCE public.supplier_supplier_id_seq;

CREATE TABLE public.supplier (
                supplier_id INTEGER NOT NULL DEFAULT nextval('public.supplier_supplier_id_seq'),
                name VARCHAR(45) NOT NULL,
                description VARCHAR(300),
                email VARCHAR(100) NOT NULL,
                phone_number VARCHAR(16) NOT NULL,
                CONSTRAINT supplier_pk PRIMARY KEY (supplier_id)
);


ALTER SEQUENCE public.supplier_supplier_id_seq OWNED BY public.supplier.supplier_id;

CREATE TABLE public.supplier_ingredient (
                supplier_id INTEGER NOT NULL,
                ingredient_id INTEGER NOT NULL,
                CONSTRAINT supplier_ingredient_pk PRIMARY KEY (supplier_id, ingredient_id)
);


CREATE SEQUENCE public.address_address_id_seq;

CREATE TABLE public.address (
                address_id INTEGER NOT NULL DEFAULT nextval('public.address_address_id_seq'),
                user_id INTEGER,
                supplier_id INTEGER,
                restaurant_id INTEGER,
                title VARCHAR(128),
                street_number VARCHAR(10) NOT NULL,
                street_name VARCHAR(256) NOT NULL,
                postal_code VARCHAR(16) NOT NULL,
                town VARCHAR(128) NOT NULL,
                latitude REAL,
                longitude REAL,
                CONSTRAINT address_pk PRIMARY KEY (address_id)
);


ALTER SEQUENCE public.address_address_id_seq OWNED BY public.address.address_id;

CREATE SEQUENCE public.app_order_order_id_seq;

CREATE TABLE public.app_order (
                order_id INTEGER NOT NULL DEFAULT nextval('public.app_order_order_id_seq'),
                user_id INTEGER NOT NULL,
                restaurant_id INTEGER NOT NULL,
                address_id INTEGER NOT NULL,
                CONSTRAINT app_order_pk PRIMARY KEY (order_id)
);


ALTER SEQUENCE public.app_order_order_id_seq OWNED BY public.app_order.order_id;

CREATE TABLE public.transaction (
                transaction_id INTEGER NOT NULL,
                order_id INTEGER NOT NULL,
                transaction_datetime TIMESTAMP NOT NULL,
                refund_cause VARCHAR(512),
                CONSTRAINT transaction_pk PRIMARY KEY (transaction_id)
);


CREATE TABLE public.order_status (
                order_id INTEGER NOT NULL,
                created TIMESTAMP NOT NULL,
                prepared TIMESTAMP NOT NULL,
                shipped TIMESTAMP NOT NULL,
                delivered TIMESTAMP NOT NULL,
                transaction_id INTEGER,
                CONSTRAINT order_status_pk PRIMARY KEY (order_id)
);


CREATE TABLE public.order_product (
                product_id INTEGER NOT NULL,
                order_id INTEGER NOT NULL,
                quantity SMALLINT NOT NULL,
                CONSTRAINT order_product_pk PRIMARY KEY (product_id, order_id)
);


ALTER TABLE public.app_user ADD CONSTRAINT role_user_1_fk
FOREIGN KEY (role_id)
REFERENCES public.role (role_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.product_category ADD CONSTRAINT category_product_category_fk
FOREIGN KEY (category_id)
REFERENCES public.category (category_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.category ADD CONSTRAINT category_category_fk
FOREIGN KEY (parent_category_id)
REFERENCES public.category (category_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.product_ingredient ADD CONSTRAINT ingredient_product_ingredient_fk
FOREIGN KEY (ingredient_id)
REFERENCES public.ingredient (ingredient_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.supplier_ingredient ADD CONSTRAINT ingredient_supplier_ingredient_fk
FOREIGN KEY (ingredient_id)
REFERENCES public.ingredient (ingredient_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.stock ADD CONSTRAINT ingredient_stock_fk
FOREIGN KEY (ingredient_id)
REFERENCES public.ingredient (ingredient_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.address ADD CONSTRAINT restaurant_address_fk
FOREIGN KEY (restaurant_id)
REFERENCES public.restaurant (restaurant_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.stock ADD CONSTRAINT restaurant_stock_fk
FOREIGN KEY (restaurant_id)
REFERENCES public.restaurant (restaurant_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.app_order ADD CONSTRAINT restaurant_order_fk
FOREIGN KEY (restaurant_id)
REFERENCES public.restaurant (restaurant_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.app_user ADD CONSTRAINT restaurant_user_fk
FOREIGN KEY (restaurant_id)
REFERENCES public.restaurant (restaurant_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.order_product ADD CONSTRAINT product_order_product_fk
FOREIGN KEY (product_id)
REFERENCES public.product (product_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.product_ingredient ADD CONSTRAINT product_product_ingredient_fk
FOREIGN KEY (product_id)
REFERENCES public.product (product_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.product_category ADD CONSTRAINT product_product_category_fk
FOREIGN KEY (product_id)
REFERENCES public.product (product_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.address ADD CONSTRAINT user_address_fk
FOREIGN KEY (user_id)
REFERENCES public.app_user (user_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.app_order ADD CONSTRAINT user_order_fk
FOREIGN KEY (user_id)
REFERENCES public.app_user (user_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.supplier_ingredient ADD CONSTRAINT supplier_supplier_ingredient_fk
FOREIGN KEY (supplier_id)
REFERENCES public.supplier (supplier_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.address ADD CONSTRAINT supplier_address_fk
FOREIGN KEY (supplier_id)
REFERENCES public.supplier (supplier_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.app_order ADD CONSTRAINT address_order_1_fk
FOREIGN KEY (address_id)
REFERENCES public.address (address_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.order_product ADD CONSTRAINT order_order_product_fk
FOREIGN KEY (order_id)
REFERENCES public.app_order (order_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.order_status ADD CONSTRAINT order_order_status_fk
FOREIGN KEY (order_id)
REFERENCES public.app_order (order_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.transaction ADD CONSTRAINT order_transaction_fk
FOREIGN KEY (order_id)
REFERENCES public.app_order (order_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.order_status ADD CONSTRAINT order_status_transaction_fk
FOREIGN KEY (transaction_id)
REFERENCES public.transaction (transaction_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

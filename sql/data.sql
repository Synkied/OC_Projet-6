INSERT INTO public.role 
    (name)
VALUES
    ('EMPLOYEE'),
    ('ADMIN'),
    ('DELIVERYMAN'),
    ('ORDERMAKER'),
    ('CLIENT');


INSERT INTO public.restaurant
    (name, email, phone)
VALUES
    ('OC Pizza Denfert', 'oc_pizza_denfert@oc_pizza.fr', '0000000000'),
    ('OC Pizza Cambronne', 'oc_pizza_cambronne@oc_pizza.fr', '0000000000');


INSERT INTO public.app_user
    (role_id, gender, first_name, last_name, phone_number, email, password_sha256, restaurant_id)
VALUES
    (1, 'F', 'Peach', 'Princess', '0000000000', 'peach@mario_world.fr', '85356064d03872ac4bed179b8bbe8318ab67a9626be55d0d72288ee14e165265', 1),
    (2, 'M', 'Bowser', 'Bad', '0000000000', 'bowser@mario_world.fr', '24c15bdcf0144615360f6154593dd73b54d5d159b92dfeab2faddcb4ad06d74b', 1),
    (3, 'M', 'Mario', 'Mario', '0000000000', 'mario@mario_world.fr', '59195c6c541c8307f1da2d1e768d6f2280c984df217ad5f4c64c3542b04111a4', 1),
    (4, 'M', 'Luigi', 'Luigi', '0000000000', 'luigi@mario_world.fr', '5839ecdfd43bc7467f77cba4a40ea64c8ee5f986f61cf16a0e024ed2225891a4', 1),
    (5, 'M', 'Toad', 'Toad', '0000000000', 'toad@toad_world.fr', '1b34942add2c85bbca6a87ba114b9ffb1c92f1a6fde8bec4ebd98a4dd18d74a7', NULL),
    (5, 'M', 'Yoshi', 'Yoshi', '0000000000', 'yoshi@yoshi_world.fr', 'a2d7cd5aba4611fd646db71593d23e0d9758b24a82cc759a2ae0f6ef2c8e1724', NULL),
    (5, 'F', 'Zelda', 'Princess', '0000000000', 'zelda@link_world.fr', 'f4c7079ad36ede23223bde716d102b1891a234dcc451cca28d3dbff07abe826b', NULL);


INSERT INTO public.product
    (name, description, price, img_filename)
VALUES
    ('Pizza végétarienne', NULL, 9.50, NULL),
    ('Margherita', NULL, 8, NULL),
    ('Roquette', NULL, 11, NULL),
    ('Tiramisu', NULL, 5, NULL);


INSERT INTO public.category
    (name, parent_category_id)
VALUES
    ('Pizza', NULL),
    ('Boissons', NULL),
    ('Desserts', NULL),
    ('Entrées', NULL),
    ('Antipasti', 4);


INSERT INTO public.product_category
    (product_id, category_id)
VALUES
    (1, 1),
    (2, 1),
    (3, 1),
    (4, 3);


INSERT INTO public.ingredient
    (name, description)
VALUES
    ('Mozzarella', '1 boule de mozzarella'),
    ('Champignons de Paris', '1 champignon entier'),
    ('Sauce tomate', '1 unité de sauce tomate (250 ml)'),
    ('Pâte à Pizza', '1 unité de pâte à pizza'),
    ('Roquette', '1 unité de roquette (50g)'),
    ('Aubergine', '1 aubergine entière'),
    ('Jambon', '1 tranche de jambon'),
    ('Tomate', '1 tomate'),
    ('Tiramisu', '1 unité de tiramisu');


INSERT INTO public.product_ingredient
    (product_id, ingredient_id, quantity)
VALUES
    (1, 1, 1),
    (1, 2, 1),
    (1, 3, 0.15),
    (1, 4, 1),
    (1, 6, 0.15),
    (2, 1, 1),
    (2, 3, 1),
    (2, 4, 1),
    (3, 1, 1),
    (3, 2, 1),
    (3, 3, 0.15),
    (3, 4, 1),
    (3, 5, 1),
    (4, 9, 1);


INSERT INTO public.supplier
    (name, description, email, phone_number)
VALUES
    ('Rungis', NULL, 'rungis@rungis.fr', '0000000000');


INSERT INTO public.supplier_ingredient
    (supplier_id, ingredient_id)
VALUES
    (1, 1),
    (1, 2),
    (1, 3),
    (1, 4),
    (1, 5),
    (1, 6),
    (1, 7),
    (1, 8);


INSERT INTO public.stock
     (restaurant_id, ingredient_id, quantity, change_datetime)
VALUES
    (1, 1, 100, '2018-01-26 12:30:50'),
    (1, 2, 500, '2018-01-27 12:40:37'),
    (1, 3, 200, '2018-01-26 12:30:50'),
    (1, 4, 200, '2018-01-27 12:40:37'),
    (1, 5, 125, '2018-01-26 12:30:50'),
    (1, 6, 40, '2018-01-27 12:40:37'),
    (1, 7, 100, '2018-01-26 12:30:50'),
    (1, 8, 50, '2018-01-27 12:40:37'),
    (2, 1, 100, '2018-01-26 12:30:50'),
    (2, 2, 500, '2018-01-27 12:40:37'),
    (2, 3, 200, '2018-01-26 12:30:50'),
    (2, 4, 200, '2018-01-27 12:40:37'),
    (2, 5, 125, '2018-01-26 12:30:50'),
    (2, 6, 40, '2018-01-27 12:40:37'),
    (2, 7, 100, '2018-01-26 12:30:50'),
    (2, 8, 50, '2018-01-27 12:40:37');


INSERT INTO public.address
    (user_id, supplier_id, restaurant_id, title, street_number, street_name, postal_code, town, latitude, longitude)
VALUES
    (NULL, NULL, 1, NULL, '13 bis', 'place denfert rochereau', '75014', 'Paris', NULL, NULL),
    (NULL, NULL, 2, NULL, '15 ter', 'place de la bastille', '75011', 'Paris', NULL, NULL),
    (NULL, 1, NULL, NULL, '1', 'rue de la tour', '94152', 'Rungis', NULL, NULL),
    (5, NULL, NULL, 'Ma maison', '600', 'route du Noiray', '73290', 'La Motte-Servolex', NULL, NULL),
    (6, NULL, NULL, 'La maison de maman', '55', 'rue des archives', '75003', 'Paris', NULL, NULL);


INSERT INTO public.app_order
    (user_id, restaurant_id, address_id)
VALUES
    (5, 1, 3),
    (6, 2, 4),
    (6, 1, 4);


INSERT INTO public.order_product
    (product_id, order_id, quantity)
VALUES
    (1, 1, 2),
    (2, 1, 1),
    (1, 2, 1),
    (3, 2, 1),
    (2, 3, 1);


INSERT INTO public.transaction
    (transaction_id, order_id, stripe_token, transaction_datetime, refund_cause)
VALUES
    (1, 1, '4c78987eqsdqf1548', '2018-01-27 12:40:37', NULL),
    (2, 2, '54465qsd56qezq564', '2018-01-27 12:45:18', NULL),
    (3, 3, '2545qs6r74q56e788', '2018-01-26 12:45:18', NULL);


INSERT INTO public.order_status
    (order_id, created, prepared, shipped, delivered, transaction_id)
VALUES
    (1, '2018-01-27 12:41:05', '2018-01-27 12:51:55', '2018-01-27 12:52:45', '2018-01-27 13:10:37', 1),
    (2, '2018-01-27 12:46:00', '2018-01-27 12:57:34', '2018-01-27 12:59:00', '2018-01-27 13:18:15', 2),
    (3, '2018-01-26 12:46:00', '2018-01-26 12:57:34', '2018-01-26 12:59:00', '2018-01-26 13:18:15', 3);
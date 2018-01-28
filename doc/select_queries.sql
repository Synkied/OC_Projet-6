--
-- See stock for a given restaurant
--

SELECT * FROM public.stock
WHERE
    (
    stock.restaurant_id = 1
);


--
-- See registered customers who have not passed any order
--

SELECT * FROM public.app_user
WHERE
    user_id NOT IN
    (
        SELECT user_id FROM public.app_order
) AND
    app_user.role_id = 5;


--
-- Number of pizzas sold in total for a given restaurant
--

SELECT SUM(quantity) AS "Pizzas vendues", app_order.restaurant_id FROM public.order_product
INNER JOIN public.product_category
ON order_product.product_id = product_category.product_id
INNER JOIN public.app_order
ON app_order.order_id = order_product.order_id
WHERE
    app_order.order_id IN(
        SELECT app_order.order_id FROM app_order
) AND
    product_category.category_id = 1
GROUP BY
    app_order.restaurant_id
;



--
-- Number of orders for the specified date
--


SELECT COUNT(DISTINCT order_product.order_id) AS "Nb de commandes" FROM public.order_product 
INNER JOIN public.order_status
ON order_product.order_id = order_status.order_id
WHERE 
    order_status.created IN(
    SELECT order_status.created FROM order_status
    WHERE
        order_status.created::date = date '2018-01-27'
);


--
-- Number of orders for the specified date for a given restaurant
--

SELECT COUNT(DISTINCT order_product.order_id) AS "Nb de commandes", app_order.restaurant_id FROM public.order_product 
INNER JOIN public.order_status
ON order_product.order_id = order_status.order_id
INNER JOIN public.app_order
ON app_order.order_id = order_product.order_id
WHERE 
    order_status.created IN(
    SELECT order_status.created FROM order_status
    WHERE
        order_status.created::date = date '2018-01-27'
)
GROUP BY app_order.restaurant_id;
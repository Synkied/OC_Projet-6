--
-- Number of pizzas sold in total
--

SELECT SUM(quantity) FROM public.order_product
WHERE 
    order_id IN(
    SELECT app_order.order_id FROM app_order
);


--
-- Number of orders for the specified date
--


SELECT COUNT(DISTINCT order_product.order_id) AS number_of_orders FROM public.order_product 
INNER JOIN public.order_status
ON order_product.order_id = order_status.order_id
WHERE 
    order_status.created IN(
    SELECT order_status.created FROM order_status
    WHERE
        order_status.created::date = date '2018-01-27'
);


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
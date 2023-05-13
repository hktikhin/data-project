
-- What is the time peroid of data?
SELECT MIN(payment_date) as min_payment_date,
    MAX(payment_date) as max_payment_date
FROM payment
;

-- min_payment_date	max_payment_date
-- Feb 14 2007 21:21:59 May 14 2007 13:44:29

-- What is the revenue of each file?
SELECT 
    f.title,
    SUM(p.amount) as revenue
FROM payment as p
JOIN rental as r 
    ON r.rental_id = p.rental_id
JOIN inventory as i 
    ON i.inventory_id = r.inventory_id
JOIN film as f 
    ON f.film_id = i.film_id   
GROUP BY 1
ORDER BY 2 DESC
;

-- What is the top city that customer come from and
-- contribute most of the revenue?
SELECT 
    ct.city,
    SUM(p.amount) as revenue
FROM payment as p 
JOIN customer as c 
    ON c.customer_id = p.customer_id
JOIN address as a 
    ON a.address_id = c.address_id
JOIN city as ct 
    ON ct.city_id = a.city_id
GROUP BY 1
ORDER BY 2 DESC
;


-- Trnasfrom ER diagram to dimensional model 
CREATE TABLE dimDate 
(
    date_key SERIAL PRIMARY KEY,
    date date NOT NULL,
    year smallint NOT NULL,
    month smallint NOT NULL,
    week smallint NOT NULL,
    day smallint NOT NULL, 
    is_weed_end BOOLEAN
)
;

CREATE TABLE dimCustomer
(
    customer_key SERIAL PRIMARY KEY,
    customer_id smallint NOT NULL,
    first_name varchar(45) NOT NULL,
    last_name varchar(45) NOT NULL,
    email varchar(50),
    address varchar(50) NOT NULL,
    address2 varchar(50),
    district varchar(20) NOT NULL,
    city varchar(50) NOT NULL,
    country varchar(50) NOT NULL,
    postal_code varchar(10),
    phone varchar(20) NOT NULL,
    active smallint NOT NULL,
    create_date timestamp NOT NULL,
    start_date date NOT NULL,
    end_date date NOT NULL
)
;

CREATE TABLE dimMovie
(
    movie_key SERIAL PRIMARY KEY,
    film_id smallint NOT NULL,
    title varchar(255) NOT NULL,
    description text,   
    release_year year,
    language varchar(20) NOT NULL,
    original_language varchar(20),
    rental_duration smallint NOT NULL,
    length smallint,
    rating varchar(5) NOT NULL,
    special_features varchar(60) NOT NULL
)
;

CREATE TABLE dimStore
(
    store_key SERIAL PRIMARY KEY,
    store_id smallint NOT NULL,
    address varchar(50) NOT NULL,
    address2 varchar(50),
    district varchar(20) NOT NULL,
    city varchar(50) NOT NULL,
    country varchar(50) NOT NULL,
    postal_code varchar(10),  
    manager_first_name varchar(45) NOT NULL,
    manager_last_name varchar(45) NOT NULL,
    start_date date NOT NULL,
    end_date date NOT NULL
)
;

CREATE TABLE factSales
(
    sales_key SERIAL PRIMARY KEY,
    date_key integer REFERENCES dimDate(date_key),
    customer_key integer REFERENCES dimCustomer(customer_key),
    movie_key integer REFERENCES dimMovie(movie_key),
    store_key integer REFERENCES dimStore(store_key),
    sales_amount numeric 
)
;

-- Datawarehouse Ingestion 
-- Dim table ingestion
INSERT IN dimDate (date_key, date, year, month, week, day, is_weed_end)
SELECT 
    DISTINCT TO_CHAR(payment_date :: date, 'yyyyMMDD') :: integer as date_kay, 
    date(payment_date) as date,
    EXTRACT(year from payment_date) as year,
    EXTRACT(quarter from payment_date) as quarter,
    EXTRACT(month from payment_date) as month,
    EXTRACT(week from payment_date) as week,
    EXTRACT(day from payment_date) as day,
    EXTRACT(year from payment_date) as year,
    CASE 
        WHEN EXTRACT(ISODOW from payment_date) IN (6, 7) 
            THEN true 
            ELSE false
    END as is_weed_end
FROM payment
;

INSERT INTO dimCustomer(
    customer_key, customer_id, first_name, last_name, email, address, address2 , district, city, country, postal_code, phone, active, create_date, start_date, end_date
)
SELECT 
    c.customer_id as customer_key,
    c.customer_id,
    c.first_name,
    c.last_name,
    c.email,
    a.address,
    a.address2 ,
    a.district,
    ci.city,
    co.country,
    a.postal_code,
    a.phone,
    c.active,
    c.create_date,
    now() as start_date, 
    now() as end_date
FROM customer as c 
JOIN address as a 
    ON c.address_id = a.address_id
JOIN city as ci 
    ON ci.city_id = a.city_id
JOIN country as co 
    ON co.country_id = ci.country_id
;

INSERT INTO dimStore (store_key, store_id , address, address2 , district , city , country , postal_code , manager_first_name, manager_last_name, start_date, end_date)
SELECT
    s.store_id as store_key, 
    s.store_id,
    a.address,
    a.address2,
    a.district,
    ci.city,
    co.country,
    a.postal_code,
    st.first_name as manager_first_name,
    st.last_name as manager_last_name,
    now() as start_date,
    now() as end_date
FROM store as s 
JOIN staff as st 
    ON st.staff_id = s.manager_staff_id
JOIN address as a 
    ON s.address_id = a.address_id
JOIN city as ci 
    ON ci.city_id = a.city_id
JOIN country as co 
    ON co.country_id = ci.country_id
;   

INSERT INTO dimMovie (movie_key, film_id, title, description, release_year, language, original_language, rental_duration, length, rating, special_features)
SELECT
    f.film_id as movie_key, 
    f.film_id, 
    f.title, 
    f.description, 
    f.release_year, 
    l.name as language, 
    l.name as original_language, 
    f.rental_duration, 
    f.length, 
    f.rating,
    f.special_features
FROM film as f 
JOIN language as l
    ON l.language_id = f.language_id
;  


-- Fact table ingestion
INSERT INTO factSales(date_key, customer_key, movie_key, store_key, sales_amount)
SELECT 
    TO_CHAR(p.payment_date :: date, 'yyyyMMDD') :: integer as date_key, 
    p.customer_id as customer_key, 
    i.film_id as movie_key, 
    i.store_id as store_key, 
    p.amount as sales_amount
FROM payment as p
JOIN rental as r 
    ON r.rental_id = p.rental_id
JOIN inventory as i 
    ON i.inventory_id = r.inventory_id
;

-- performance comparison for 3NF modeling and dimensional modleing 

SELECT 
    dm.title,
    dd.month,
    dc.city,
    SUM(fs.sales_amount) as revenue
FROM factSales as fs 
JOIN dimMovie as dm
    ON dm.movie_key = fs.movie_key
JOIN dimDate as dd
    ON dd.date_key = fs.date_key
JOIN dimCustomer as dc
    ON dc.customer_key = fs.customer_key
JOIN dimStore as ds
    ON ds.store_key = fs.store_key
GROUP BY 1, 2, 3
ORDER BY 1, 2, 3, 4 DESC
;
-- 125 ms 

SELECT 
    f.title,
    EXTRACT(month FROM p.payment_date) as month,
    ci.city,
    sum(p.amount) as revenue
FROM payment as p
JOIN rental as r 
    ON r.rental_id = p.rental_id
JOIN inventory as i 
    ON i.inventory_id = r.inventory_id
JOIN film as f 
    ON f.film_id = i.film_id   
JOIN customer as c 
    ON c.customer_id = p.customer_id
JOIN address as a 
    ON a.address_id = c.address_id
JOIN city as ci
    ON ci.city_id = a.city_id
GROUP BY 1, 2, 3
ORDER BY 1, 2, 3, 4 DESC
;
-- 147 ms
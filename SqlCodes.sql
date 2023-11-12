////////////////////////////////////1-125 arası tüm sorguları içerir.////////////////////////////////////


1-Select product_name, quantity_per_unit from products

2-Select product_id, product_name, discontinued from products where discontinued>0

3-Select product_id, product_name, discontinued from products where discontinued=0

4-Select product_id, product_name, unit_price from products where unit_price<20

5-Select product_id, product_name, unit_price from products where unit-price between 15 and 25

6-Select product_name, product_id, units_in_stock, units_on_order from products where units_in_stock<units_on_order

7-Select * from products where LOWER(product_name) LIKE 'a%'

8-Select * from products where LOWER(product_name) LIKE '%i'

9-Select product_name, unit_price, unit_price*1.18 as unit_price_kdv from products

10-Select COUNT(*) from products where unit_price>30

11-Select LOWER(product_name), unit_price from products order by unit_price desc

12-Select CONCAT(first_name, ' ', last_name) as full_name from employees

13-Select COUNT(*) from employees where (region IS NULL)

14-Select COUNT(*) from employees where (region IS NOT NULL)

15-Select CONCAT('TR', UPPER(product_name)) from products

16-Select CONCAT('TR',product_name), unit_price from products where unit_price<20 

17-Select product_name, unit_price from products where unit_price=(Select MAX(unit_price) from products)

18-Select product_name, unit_price from products order by unit_price desc LIMIT 10

19-Select product_name, unit_price from products where unit_price>(Select AVG(unit_price) from products)

20-Select SUM(units_in_stock*unit_price) as revenue from products where units_in_stock>0

21-Select COUNT(units_in_stock+discontinued) from products where units_in_stock>0 AND discontinued=1

22-Select product.product_name ,category.category_name from products product
INNER JOIN categories category ON category.category_id = product.category_id

23-SELECT category_id, AVG(unit_price) AS average_price FROM products
GROUP BY category_id;

24-Select  product.product_name, product.unit_price, category.category_name from products product
INNER JOIN categories category ON category. category_id = product.category_id
Where unit_price = (Select MAX (unit_price) from products);

SELECT product.product_name, product.unit_price, category.category_name FROM Products product
JOIN Categories category ON product.category_id = category.category_id
ORDER BY product.Unit_price DESC LIMIT 1;

25-Select  product.product_name,  category.category_name, company.company_name from products product
JOIN categories category ON category. category_id = product.category_id 
JOIN suppliers company ON company.supplier_id = product.supplier_id
Where units_on_order = (Select MAX (units_on_order) from products);
26.select p.product_id, p.product_name, s.company_name, s.phone from products p inner join suppliers s on p.supplier_id = s.supplier_id where p.units_in_stock = 0

27.SELECT * FROM orders o join shippers s on s.shipper_id = o.ship_via WHERE date_part('year', o.order_date) = 1998 and date_part('month', o.order_date) = 03

28.SELECT COUNT(*) FROM orders o
WHERE DATE_PART('year', o.order_date) = 1997
AND DATE_PART('month', o.order_date) = 2;

29.SELECT COUNT(*) FROM orders o
WHERE DATE_PART('year', o.order_date) = 1998
AND o.ship_city = 'London'

30.SELECT c.contact_name, c.phone FROM orders o
join customers c on o.customer_id = c.customer_id
WHERE DATE_PART('year', o.order_date) = 1997

31.select * from orders o where  o.freight > 40

32.select c.contact_name, o.ship_city from orders o join customers c on c.customer_id = o.customer_id where  o.freight > 40

33.select o.order_date, o.ship_city,UPPER( e.first_name || ' ' || e.last_name)  from orders o join employees e on e.employee_id = o.employee_id
where date_part('year', o.order_date) = 1997

34.SELECT c.contact_name, 
regexp_replace(c.phone, '\D', '', 'g') AS formatted_phone
FROM orders o
JOIN customers c ON c.customer_id = o.customer_id
WHERE date_part('year', o.order_date) = 1997;

35.SELECT o.order_date, c.contact_name, e.first_name AS employee_first_name, e.last_name AS employee_last_name
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN employees e ON o.employee_id = e.employee_id;


36.select * from orders o where o.required_date < o.shipped_date

37.select c.contact_name, o.order_date from orders o join customers c on o.customer_id = c.customer_id where o.required_date < o.shipped_date

38.select c.category_name, s.* from orders o join order_details od on o.order_id = od.order_id
join products p on p.product_id = od.product_id
join categories c on p.category_id = c.category_id
join suppliers s on s.supplier_id = p.supplier_id
where o.order_id = 10248

39.select c.category_name, s.* from orders o join order_details od on o.order_id = od.order_id
join products p on p.product_id = od.product_id
join categories c on p.category_id = c.category_id
join suppliers s on s.supplier_id = p.supplier_id
where o.order_id = 10248

40.select p.product_name, count(quantity)  from orders o 
join order_details od
on o.order_id = od.order_id
join products p 
on p.product_id = od.product_id
where employee_id = 3 and date_part('year', o.order_date) = 1997
group by p.product_id

41. SELECT e.employee_id,
e.first_name || ' ' || e.last_name FROM employees e
WHERE e.employee_id = (
  SELECT o.employee_id
  FROM orders o
  JOIN order_details od ON o.order_id = od.order_id
  GROUP BY o.employee_id
  ORDER BY SUM(od.unit_price * od.quantity) DESC
  LIMIT 1
);

42. SELECT e.employee_id, e.first_name, e.last_name, e.title, e.hire_date,
       SUM(od.quantity * od.unit_price) AS total_sales
FROM employees e
JOIN orders o ON e.employee_id = o.employee_id
JOIN order_details od ON o.order_id = od.order_id
WHERE date_part('year', o.order_date) = 1997
GROUP BY e.employee_id, e.first_name, e.last_name, e.title, e.hire_date
ORDER BY total_sales DESC
LIMIT 1;


43.select p.product_name, c.category_name, p.unit_price from products p join categories c on p.category_id = c.category_id
order by unit_price desc limit 1 

44.SELECT e.first_name, e.last_name, o.order_date, o.order_id
FROM employees e
JOIN orders o ON e.employee_id = o.employee_id
ORDER BY o.order_date;

45.SELECT o.order_id, AVG(od.unit_price * od.quantity) AS average_price
FROM orders o
JOIN order_details od ON o.order_id = od.order_id
GROUP BY o.order_id
ORDER BY o.order_date DESC
LIMIT 5;

46.SELECT p.product_name, c.category_name, SUM(od.quantity) AS total_sales
FROM products p
JOIN categories c ON p.category_id = c.category_id
JOIN order_details od ON p.product_id = od.product_id
JOIN orders o ON od.order_id = o.order_id
WHERE EXTRACT(MONTH FROM o.order_date) = 1
GROUP BY p.product_name, c.category_name;

47.SELECT o.order_id, round(od.unit_price * od.quantity) AS total_sales
FROM order_details od
JOIN orders o ON od.order_id = o.order_id
GROUP BY o.order_id, total_sales
having round(od.unit_price * od.quantity) > (SELECT AVG(od2.unit_price * od2.quantity) FROM order_details od2)
order by total_sales desc;


48.select p.product_name,c.category_name, s.contact_name from products p join categories c on c.category_id = p.category_id
join suppliers s on s.supplier_id = p.supplier_id 
where p.product_id = (select od.product_id as sales_count from order_details od
group by od.product_id order by sales_count desc limit 1)

49.SELECT COUNT(DISTINCT country) AS customer_count
FROM customers;

50.SELECT e.employee_id, round(SUM(od.unit_price * od.quantity)) AS total_sales
FROM employees e
JOIN orders o ON e.employee_id = o.employee_id
JOIN order_details od ON o.order_id = od.order_id
WHERE e.employee_id = 3
  AND o.order_date >= '1093-01-01' 
  AND o.order_date <=  CURRENT_DATE
GROUP BY e.employee_id;

51.SELECT p.product_name, c.category_name, od.quantity
FROM order_details od
JOIN products p ON od.product_id = p.product_id
JOIN categories c ON p.category_id = c.category_id
WHERE od.order_id = 10248;


52.SELECT p.product_name, s.supplier_name
FROM order_details od
JOIN products p ON od.product_id = p.product_id
JOIN suppliers s ON p.supplier_id = s.supplier_id
WHERE od.order_id = 10248;

53.SELECT p.product_name, od.quantity
FROM employees e
JOIN orders o ON e.employee_id = o.employee_id
JOIN order_details od ON o.order_id = od.order_id
JOIN products p ON od.product_id = p.product_id
WHERE e.employee_id = 3
  AND EXTRACT(YEAR FROM o.order_date) = 1997;


54.select e.employee_id, e.first_name || ' ' || e.last_name from orders o 
join employees e on o.employee_id = e.employee_id
where o.order_id =
(select o.order_id from orders o join order_details od on o.order_id = od.order_id
join employees e on e.employee_id = o.employee_id
where EXTRACT(YEAR from o.order_date ) = 1997
group by o.order_id
order by sum(quantity*unit_price) desc 
limit 1

);

55.SELECT e.employee_id, e.first_name, e.last_name
FROM employees e
WHERE e.employee_id = (
  SELECT o.employee_id
  FROM orders o
  JOIN order_details od ON o.order_id = od.order_id
  WHERE EXTRACT(YEAR FROM o.order_date) = 1997
  GROUP BY o.employee_id
  ORDER BY SUM(od.quantity * od.unit_price) DESC
  LIMIT 1
);

56.SELECT p.product_name, p.unit_price, c.category_name
FROM products p
JOIN categories c ON p.category_id = c.category_id
ORDER BY p.unit_price DESC
LIMIT 1;

57.SELECT e.first_name, e.last_name, o.order_date, o.order_id
FROM employees e
JOIN orders o ON e.employee_id = o.employee_id
ORDER BY o.order_date;

58.SELECT o.order_id, AVG(od.unit_price * od.quantity) AS average_price
FROM orders o
JOIN order_details od ON o.order_id = od.order_id
GROUP BY o.order_id
ORDER BY o.order_date DESC
LIMIT 5;

59.SELECT p.product_name, c.category_name, SUM(od.quantity) AS total_sales
FROM products p
JOIN categories c ON p.category_id = c.category_id
JOIN order_details od ON p.product_id = od.product_id
JOIN orders o ON od.order_id = o.order_id
WHERE EXTRACT(MONTH FROM o.order_date) = 1
GROUP BY p.product_name, c.category_name;

60.SELECT o.order_id, od.unit_price * od.quantity AS total_sales
FROM order_details od
JOIN orders o ON od.order_id = o.order_id
WHERE od.unit_price * od.quantity > (
  SELECT AVG(od2.unit_price * od2.quantity) 
  FROM order_details od2
);


61.SELECT p.product_name, c.category_name, s.contact_name
FROM products p
JOIN categories c ON p.category_id = c.category_id
JOIN suppliers s ON p.supplier_id = s.supplier_id
JOIN order_details od ON p.product_id = od.product_id
GROUP BY p.product_name, c.category_name, s.contact_name
ORDER BY SUM(od.quantity) DESC
LIMIT 1;


62.SELECT COUNT(DISTINCT country) AS customer_count
FROM customers;


63.SELECT country, COUNT(customer_id) AS customer_count
FROM customers
GROUP BY country
ORDER BY customer_count DESC;


64.SELECT e.employee_id, SUM(od.unit_price * od.quantity) AS total_sales
FROM employees e
JOIN orders o ON e.employee_id = o.employee_id
JOIN order_details od ON o.order_id = od.order_id
WHERE e.employee_id = 3
  AND o.order_date >= '1996-01-01' -- Ocak ayının ilk gününü geçerli tarihe güncelleyin
  AND o.order_date <=  CURRENT_DATE
GROUP BY e.employee_id;

65.SELECT SUM(od.unit_price * od.quantity) AS total_revenue
FROM order_details od
JOIN orders o ON od.order_id = o.order_id
WHERE od.product_id = 10
  AND o.order_date >= CURRENT_DATE - INTERVAL '3 months';


66.select e.employee_id, e.first_name ||' '|| e.last_name, count(o.order_id)  from orders o join employees e on e.employee_id = o.employee_id
join order_details od on od.order_id = o.order_id
group by o.employee_id, e.employee_id

67.select c.customer_id, c.contact_name from orders o right join customers c on c.customer_id = o.customer_id where order_id is null

68.select c.company_name,c.contact_name,c.city,c.country,c.address  from customers c where c.country = 'Brazil'

69.SELECT *
FROM customers
WHERE country <> 'Brazıl';


70.SELECT *
FROM customers
WHERE country IN ('Spain', 'France', 'Germany');

71.SELECT *
FROM customers
WHERE fax IS NULL;

72.SELECT *
FROM customers
WHERE city IN ('London', 'Paris');

73.SELECT *
FROM customers
WHERE city LIKE 'México D.F.' and contact_title ilike 'owner';

74.SELECT product_name, unit_price
FROM products
WHERE product_name ILIKE 'c%';


75.SELECT first_name, last_name, birth_date
FROM employees
WHERE first_name ILIKE 'A%';


76.SELECT company_name
FROM customers
WHERE company_name ILIKE '%RESTAURANT%';

77.SELECT product_name, unit_price
FROM products
WHERE unit_price BETWEEN 50 AND 100;

78.SELECT order_id, order_date
FROM orders
WHERE order_date BETWEEN '1996-07-01' AND '1996-12-31';

79.SELECT *
FROM customers
WHERE country IN ('Spain', 'France', 'Germany');

80.SELECT *
FROM customers
WHERE fax IS NULL;

81.SELECT *
FROM customers
ORDER BY country;

82.SELECT product_name, unit_price
FROM products
ORDER BY unit_price DESC;

83.SELECT product_name, unit_price
FROM products
ORDER BY unit_price DESC, units_in_stock;

84.SELECT COUNT(*) AS product_count
FROM products
WHERE category_id = 1;

85.SELECT COUNT(DISTINCT country) AS country_count
FROM customers;

--86. a.Bu ülkeler hangileri..?
select country, count(distinct country) as ulke_sayisi
from customers 
group by country

--87. En Pahalı 5 ürün
select unit_price from products order by unit_price desc limit 5

--88. ALFKI CustomerID’sine sahip müşterimin sipariş sayısı..?
select customer_id,count(order_id) from orders 
where customer_id='ALFKI'
group by customer_id

--89. Ürünlerimin toplam maliyeti
select sum(units_in_stock*unit_price) from products

--90. Şirketim, şimdiye kadar ne kadar ciro yapmış..?
select sum(unit_price*quantity) as Toplam from order_details

--91. Ortalama Ürün Fiyatım
select avg(unit_price) as Ortalama_Fiyat from products

--92. En Pahalı Ürünün Adı
select product_id,product_name from products order by unit_price desc limit 1

--93. En az kazandıran sipariş
select o.order_id, round(sum(quantity*unit_price)) from orders o 
join order_details od on o.order_id = od.order_id
group by o.order_id 
order by sum(quantity*unit_price) asc limit 1

--94. Müşterilerimin içinde en uzun isimli müşteri
select contact_name,customer_id from Customers
order by length(contact_name) desc limit 1

--95. Çalışanlarımın Ad, Soyad ve Yaşları
--1.Yol
select e.first_name || ' ' || e.last_name AS full_name,
extract(year from age(current_date, e.birth_date)) as age
from employees e
--2.Yol
Select first_name, last_name, (DATE_PART('year',CURRENT_DATE)-DATE_PART('year',birth_date)) as ages
from employees

--96. Hangi üründen toplam kaç adet alınmış
select product_id, sum(quantity) from order_details
group by product_id order by product_id asc

--97. Hangi siparişte toplam ne kadar kazanmışım..?
select order_id,sum(unit_price*quantity) as Toplam from order_details
group by order_id
order by Toplam desc

--98. Hangi kategoride toplam kaç adet ürün bulunuyor..?
select c.category_id,c.category_name, count(product_id) from products p
join categories c on c.category_id = p.category_id
group by c.category_id,c.category_name

--99. 1000 Adetten fazla satılan ürünler?
select product_id,sum(quantity) from order_details
group by product_id
having sum(quantity)>1000

--100. Hangi Müşterilerim hiç sipariş vermemiş..?
select c.company_name,o.customer_id from orders o
right join customers c on  c.customer_id=o.customer_id
where o.customer_id is null

--101. Hangi tedarikçi hangi ürünü sağlıyor ?
select s.supplier_id,s.company_name,p.product_name from suppliers s
inner join products p on p.supplier_id=s.supplier_id
order by company_name asc

--102. Hangi sipariş hangi kargo şirketi ile ne zaman gönderilmiş..?
select order_id, ship_name, shipped_date from orders
group by order_id, ship_name, shipped_date

--103. Hangi siparişi hangi müşteri verir..?
select o.order_id,c.customer_id,c.contact_name from Customers c
inner join orders o on c.customer_id=o.customer_id

--104. Hangi çalışan, toplam kaç sipariş almış..?
select e.employee_id, count(o.order_id) from employees e
join orders o on o.employee_id = e.employee_id
group by e.employee_id

--105. En fazla siparişi kim almış..?
select e.employee_id, count(o.order_id) from orders o join employees e on 
e.employee_id = o.employee_id
group by e.employee_id, e.first_name, e.last_name
order by count(o.order_id) desc
limit 1

--106. Hangi siparişi, hangi çalışan, hangi müşteri vermiştir..?
select o.order_id, e.first_name || ' ' || e.last_name, c.contact_name from orders o 
join employees e 
on e.employee_id = o.employee_id
join customers c
on c.customer_id = o.customer_id

--107. Hangi ürün, hangi kategoride bulunmaktadır..? Bu ürünü kim tedarik etmektedir..?
select p.product_name, c.category_name, s.contact_name from products p join categories c on c.category_id = p.category_id
join suppliers s on s.supplier_id = p.supplier_id

--108. Hangi siparişi hangi müşteri vermiş, hangi çalışan almış, hangi tarihte, hangi kargo şirketi tarafından gönderilmiş hangi üründen kaç adet alınmış, hangi fiyattan alınmış, ürün hangi kategorideymiş bu ürünü hangi tedarikçi sağlamış

SELECT
    orders.order_id,
    customers.company_name,
	employees.first_name,
    employees.last_name,
    orders.order_date,
    shippers.company_name,
    products.product_name,
    od.quantity,
    od.unit_price,
    categories.category_name,
    suppliers.company_name
FROM
    orders
JOIN
    customers ON orders.customer_id = customers.customer_id
JOIN
    employees ON orders.employee_id = employees.employee_id
JOIN
    shippers ON orders.ship_via = shippers.shipper_id
JOIN
    order_details od ON orders.order_id = od.order_id
JOIN
    products ON od.product_id = products.product_id
JOIN
    categories ON products.category_id = categories.category_id
JOIN
    suppliers ON products.supplier_id = suppliers.supplier_id;


--109. Altında ürün bulunmayan kategoriler
SELECT
    c.category_id,
    c.category_name
FROM
    Categories c
LEFT JOIN
    Products p ON c.category_id = p.category_id
WHERE
    p.product_id IS NULL;


--110. Manager ünvanına sahip tüm müşterileri listeleyiniz.
select contact_title from customers
where contact_title LIKE '%Manager'

--111. FR ile başlayan 5 karekter olan tüm müşterileri listeleyiniz.
select customer_id,contact_name from customers
where contact_name like('Fr%')

--112. (171) alan kodlu telefon numarasına sahip müşterileri listeleyiniz.
select phone from customers
where phone like('%(171)%')

--113. BirimdekiMiktar alanında boxes geçen tüm ürünleri listeleyiniz.
select product_id,product_name,quantity_per_unit from products
where quantity_per_unit like('%boxes%')

--114. Fransa ve Almanyadaki (France,Germany) Müdürlerin (Manager) Adını ve Telefonunu listeleyiniz.(MusteriAdi,Telefon)
select * from customers c where c.country in ('Germany', 'France') and c.contact_title like '%manager%'

--115. En yüksek birim fiyata sahip 10 ürünü listeleyiniz.
select product_id,product_name,unit_price from products
order by unit_price desc limit 10

--116. Müşterileri ülke ve şehir bilgisine göre sıralayıp listeleyiniz.
select*from customers
order by country,city asc

--117. Personellerin ad,soyad ve yaş bilgilerini listeleyiniz.
select first_name,last_name,(DATE_PART('year',CURRENT_DATE)-DATE_PART('year',birth_date)) as ages from employees

--118. 35 gün içinde sevk edilmeyen satışları listeleyiniz.
SELECT order_id,
shipped_date - order_date as gün
FROM orders
WHERE shipped_date IS NOT NULL
   AND shipped_date - order_date > 35;

--119. Birim fiyatı en yüksek olan ürünün kategori adını listeleyiniz. (Alt Sorgu)
SELECT category_name
FROM categories
WHERE category_id = (
    SELECT category_id
    FROM products
    WHERE unit_price = (
        SELECT MAX(unit_price)
        FROM products
    )
);

--120. Kategori adında 'on' geçen kategorilerin ürünlerini listeleyiniz. (Alt Sorgu)

SELECT
    p.product_name,
    SUM(od.quantity) AS satılan_adet
FROM
    products p
JOIN
    order_details od ON p.product_id = od.product_id
WHERE
    p.product_name = 'Konbu'
GROUP BY
    p.product_name;

--121. Konbu adlı üründen kaç adet satılmıştır.
SELECT
    p.product_name,
    SUM(od.quantity) AS satılan_adet
FROM
    products p
JOIN
    order_details od ON p.product_id = od.product_id
WHERE
    p.product_name = 'Konbu'
GROUP BY
    p.product_name;


--122. Japonyadan kaç farklı ürün tedarik edilmektedir.
SELECT
    COUNT(DISTINCT p.productid) AS farklıürün_sayısı
FROM
    suppliers s
JOIN
    products p ON s.supplier_id = p.supplier_id
WHERE
    s.country = 'Japan';


--123. 1997 yılında yapılmış satışların en yüksek, en düşük ve ortalama nakliye ücretlisi ne kadardır?
SELECT
    MAX(freight) AS en_yükseknakliyeücreti,
    MIN(freight) AS en_düşüknakliyeücreti,
    AVG(freight) AS ortalamanakliyeücreti
FROM
    orders
WHERE
    DATE_PART('year', order_date) = 1997;

--124. Faks numarası olan tüm müşterileri listeleyiniz.
select customer_id,contact_name,fax from customers
where fax is not null

--125. 1996-07-16 ile 1996-07-30 arasında sevk edilen satışları listeleyiniz. 
select*from orders
where shipped_date between '1996-07-16' AND '1996-07-30'
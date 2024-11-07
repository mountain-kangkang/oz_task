-- SELECT DATABASE();
-- USE classicmodels;

-- -- -- -- 생성(CREATE)

-- -- -- 초급

-- -- (1) customers 테이블에 새 고객을 추가하세요.
-- insert  into customers(customerNumber,customerName,contactLastName,contactFirstName,phone,addressLine1,addressLine2,city,state,postalCode,country,salesRepEmployeeNumber,creditLimit) values 
-- (499,'OZ coding school','San','Kang','40.32.2555','54, rue Royale',NULL,'Nantes',NULL,'44000','Korea',1370,'21000.00');

-- -- (2) products 테이블에 새 제품을 추가하세요.
-- insert  into products(productCode,productName,productLine,productScale,productVendor,productDescription,quantityInStock,buyPrice,MSRP) values 
-- ('S10_1679','1969 Harley Davidson Ultimate Chopper','Motorcycles','1:10','Min Lin Diecast','This replica features working kickstand, front suspension, gear-shift lever, footbrake lever, drive chain, wheels and steering. All parts are particularly delicate due to their precise scale and require special care and attention.',7933,'48.81','95.70');

-- -- (4) offices 테이블에 새 사무실을 추가하세요. -- (3) 직원 추가 시 새로운 지역에 저장하기 위해 offices 먼저 추가함
-- insert  into offices(officeCode,city,phone,addressLine1,addressLine2,state,country,postalCode,territory) values 
-- ('11','Seoul','+82 02 219 4782','100 Market Street','Suite 300','CA','Korea','94080','NA');

-- -- (3) employees 테이블에 새 직원을 추가하세요.
-- insert  into employees(employeeNumber,lastName,firstName,extension,email,officeCode,reportsTo,jobTitle) values 
-- (1800,'Murphy','Diane','x5800','dmurphy@motorcycles.com','11',NULL,'Student');

-- -- (5) orders 테이블에 새 주문을 추가하세요.
-- insert  into orders(orderNumber,orderDate,requiredDate,shippedDate,status,comments,customerNumber) values 
-- (10426,'2024-10-07','2024-10-14','2024-10-12','Shipped',NULL,363);

-- -- (6) orderdetails 테이블에 주문 상세 정보를 추가하세요.
-- insert  into orderdetails(orderNumber,productCode,quantityOrdered,priceEach,orderLineNumber) values 
-- (10426,'S18_1749',30,'136.00',3);

-- -- (7) payments 테이블에 지불 정보를 추가하세요.
-- insert  into payments(customerNumber,checkNumber,paymentDate,amount) values 
-- (499,'KS111111','2024-10-12','6066.78');

-- -- (8) productlines 테이블에 제품 라인을 추가하세요.
-- insert  into productlines(productLine,textDescription,htmlDescription,image) values 
-- ('Bike','a mobile device that can move with your legs.',NULL,NULL);

-- -- (9) customers 테이블에 다른 지역의 고객을 추가하세요.
-- insert  into customers(customerNumber,customerName,contactLastName,contactFirstName,phone,addressLine1,addressLine2,city,state,postalCode,country,salesRepEmployeeNumber,creditLimit) values 
-- (500,'OZ coding school','real_San','real_Kang','010.123.4567','11, 범서읍',NULL,'ULSAN',NULL,'44000','Korea',1370,'21000.00');

-- -- (10) products 테이블에 다른 카테고리의 제품을 추가하세요.
-- insert  into products(productCode,productName,productLine,productScale,productVendor,productDescription,quantityInStock,buyPrice,MSRP) values 
-- ('B137','삼천리 자전거','Bike','1:10','Min Lin Diecast','튼튼한 자전거.',7933,'19.99','95.70');


-- -- -- -- 읽기(READ)

-- -- -- 초급

-- -- (1) customers 테이블에서 모든 고객 정보를 조회하세요.
-- SELECT * FROM customers;

-- -- (3) employees 테이블에서 모든 직원의 이름과 직급을 조회하세요.
-- SELECT lastName, jobTitle FROM employees;

-- -- (5) orders 테이블에서 최근 10개의 주문을 조회하세요.
-- SELECT * FROM orders
-- ORDER BY orderDate DESC
-- LIMIT 10;

-- -- (6) orderdetails 테이블에서 특정 주문의 모든 상세 정보를 조회하세요.
-- SELECT * FROM orderdetails WHERE orderNumber = 10100;

-- -- (9) customers 테이블에서 특정 지역의 고객을 조회하세요.
-- SELECT * FROM customers WHERE country = 'USA';

-- -- (10) products 테이블에서 특정 가격 범위의 제품을 조회하세요.
-- SELECT * FROM products WHERE buyPrice BETWEEN 15 AND 30;


-- -- -- 중급

-- -- (1) orders 테이블에서 특정 고객의 모든 주문을 조회하세요.
-- SELECT * FROM orders WHERE customerNumber = 103;

-- -- (3) payments 테이블에서 특정 기간 동안의 모든 지불 정보를 조회하세요.
-- SELECT * FROM payments WHERE paymentDate BETWEEN '2023-01-01' AND '2024-12-31';

-- -- (8) products 테이블에서 재고가 부족한 모든 제품을 조회하세요.
-- SELECT * FROM products WHERE quantityInStock < 30;

-- -- (10) orderdetails 테이블에서 특정 주문에 대한 총 금액을 계산하세요.
-- SELECT orderNumber, SUM(quantityOrdered * priceEach) AS totalAmount FROM orderdetails WHERE orderNumber = 10100 GROUP BY orderNumber;


-- -- -- 고급

-- -- (1) customers 테이블에서 각 지역별 고객 수를 계산하세요.
-- SELECT city, COUNT(*) AS customerCount FROM customers GROUP BY city;

-- -- (2) products 테이블에서 각 제품 카테고리별 평균 가격을 계산하세요.
-- SELECT productLine, AVG(buyPrice) AS averagePrice FROM products GROUP BY productLine;

-- -- (5) orderdetails 테이블에서 가장 많이 팔린 제품 5개를 조회하세요.
-- SELECT productCode, SUM(quantityOrdered) AS totalOrdered FROM orderdetails 
-- GROUP BY productCode ORDER BY totalOrdered DESC LIMIT 5;


-- -- -- -- 갱신(UPDATE)

-- -- -- 초급

-- -- (1) customers 테이블에서 특정 고객의 주소를 갱신하세요.
-- UPDATE customers SET addressLine1 = 'Mars 12 St' WHERE customerNumber = 498;

-- -- (6) orderdetails 테이블에서 특정 주문 상세의 수량을 갱신하세요.
-- UPDATE orderdetails SET quantityOrdered = 31 WHERE orderNumber = 10100 AND productCode = "S18_1749";

-- -- (10) products 테이블에서 여러 제품의 가격을 한 번에 갱신하세요.
-- SET sql_safe_updates=0;
-- UPDATE products SET buyPrice = buyPrice * 1.1;


-- -- -- 중급

-- -- (1) employees 테이블에서 여러 직원의 부서를 한 번에 갱신하세요.
-- UPDATE employees SET officeCode = 11 WHERE jobTitle = 'Sales';

-- -- (3) orders 테이블에서 지난 달의 모든 주문의 배송 상태를 갱신하세요.
-- UPDATE orders SET status = 'Shipped' WHERE orderDate 
-- BETWEEN '2022-12-01' AND '2022-12-31';

-- SELECT * FROM orders WHERE orderDate BETWEEN '2022-12-01' AND '2022-12-31';

-- -- (4) orderdetails 테이블에서 여러 주문 상세의 가격을 한 번에 갱신하세요.
-- UPDATE orderdetails SET priceEach = priceEach * 0.9 WHERE orderNumber 
-- IN (SELECT orderNumber FROM orders WHERE orderDate BETWEEN '2024-10-01' AND '2024-12-31');

-- -- (10) offices 테이블에서 특정 사무실의 모든 정보를 갱신하세요.
-- UPDATE offices SET addressLine1 = '용산', addressLine2 = '전자상가'
-- WHERE officeCode = 11;


-- -- -- 고급

-- -- (4) productlines 테이블에서 모든 제품 라인의 정보를 갱신하세요.
-- UPDATE products SET quantityInStock = 9 WHERE productName = '삼천리 자전거';

-- UPDATE productlines SET textDescription = '품절 임박!!' 
-- WHERE productLine IN (SELECT productLine FROM products WHERE quantityInStock < 10);


-- -- -- -- 삭제(DELETE)

-- -- -- 초급

-- -- (1) customers 테이블에서 특정 고객을 삭제하세요.
-- DELETE FROM customers WHERE customerNumber = 498;


-- -- -- 중급

-- -- (1) employees 테이블에서 특정 부서의 모든 직원을 삭제하세요.
-- DELETE FROM employees WHERE jobTitle = 'Student';

-- -- (6) productlines 테이블에서 여러 제품 라인을 한 번에 삭제하세요.
-- DELETE FROM productlines WHERE productLine IN ('Bike', 'Planes');
-- productlines 테이블에서 productLine이 products 테이블의 FOREIGN KEY로 등록되있어서 먼저 처리해줘야함 귀찮으니 스킵..
-- SELECT VERSION();

-- -- (7) customers 테이블에서 가장 오래된 5명의 고객을 삭제하세요.
-- DELETE FROM customers
-- WHERE customerNumber IN 
-- SELECT customerNumber FROM customers ORDER BY customerNumber DESC LIMIT 5;
-- Error Code: 1235. This version of MySQL doesn't yet support 'LIMIT & IN/ALL/ANY/SOME subquery'

-- DELETE FROM customers ORDER BY customerNumber DESC LIMIT 5;


-- -- -- 고급

-- -- (2) orderdetails 테이블에서 가장 적게 팔린 제품의 모든 주문 상세를 삭제하세요.
-- DELETE FROM orderdetails WHERE productCode IN 
-- (SELECT productCode FROM products ORDER BY quantityInStock ASC LIMIT 5);
-- 위 삭제 중급 7번과 동일한 에러

-- -- (4) productlines 테이블에서 제품이 없는 모든 제품 라인을 삭제하세요.
-- DELETE FROM productlines WHERE productLine NOT IN (SELECT DISTINCT productLine FROM products);
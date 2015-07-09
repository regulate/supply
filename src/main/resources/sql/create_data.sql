-- delete old data
delete from contact;
delete from phone_number;
delete from producer;
delete from product;
delete from supply;
delete from user;

-- reset increments
ALTER TABLE contact AUTO_INCREMENT = 1;
ALTER TABLE phone_number AUTO_INCREMENT = 1;
ALTER TABLE producer AUTO_INCREMENT = 1;
ALTER TABLE product AUTO_INCREMENT = 1;
ALTER TABLE supply AUTO_INCREMENT = 1;
ALTER TABLE user AUTO_INCREMENT = 1;

-- add users
insert into user (email, first_name, last_name, password, role_id, banned) values('test@test.test', 'John', 'Travolta', 'Test_777', 2, false);
insert into user (email, first_name, last_name, password, role_id, banned) values('test1@test.test', 'Mike', 'Benson', 'Test_333', 1, false);
insert into user (email, first_name, last_name, password, role_id, banned) values('test2@test.test', 'Mick', 'Jager', 'Test_555', 1, true);

-- add producers
insert into producer (producer_id, legal_name) values(1, 'P&G');
insert into producer (producer_id, legal_name) values(2 ,'CocaCola');
insert into producer (producer_id, legal_name) values(3 ,'Pepsi');
insert into producer (producer_id, legal_name) values(4 ,'Casio');
insert into producer (producer_id, legal_name) values(5 ,'LG');
insert into producer (producer_id, legal_name) values(6 ,'HTC');
insert into producer (producer_id, legal_name) values(7 ,'Samsung');

-- add contact
insert into contact (contact_id, country, region, city, street_name, street_number, zipcode, producer_id) values(1 ,'Ukraine', 'Donetsk', 'Donetsk', 'Artema', 11, 27017, 1);
insert into contact (contact_id, country, region, city, street_name, street_number, zipcode, producer_id) values(2 ,'Ukraine', 'Kyiv', 'Boguslav', 'Artema', 11, 27017, 2);
insert into contact (contact_id, country, region, city, street_name, street_number, zipcode, producer_id) values(3 ,'Ukraine', 'Kharkiv', 'Zmiiv', 'Artema', 11, 27017, 3);
insert into contact (contact_id, country, region, city, street_name, street_number, zipcode, producer_id) values(4 ,'Ukraine', 'Odessa', 'Odessa', 'Artema', 11, 27017, 4);
insert into contact (contact_id, country, region, city, street_name, street_number, zipcode, producer_id) values(5 ,'Ukraine', 'Dnipro', 'Dnipro', 'Artema', 11, 27017, 5);
insert into contact (contact_id, country, region, city, street_name, street_number, zipcode, producer_id) values(6 ,'Ukraine', 'Lugansk', 'Lugansk', 'Artema', 11, 27017, 6);
insert into contact (contact_id, country, region, city, street_name, street_number, zipcode, producer_id) values(7 ,'Ukraine', 'Kharkiv', 'Chuguev', 'Artema', 11, 27017, 7);

-- add phone numbers
insert into phone_number (phone_number_id, abonent_number, contact_id, area_code, country_code) values(1, 4349701, 1, 063, 380);
insert into phone_number (phone_number_id, abonent_number, contact_id, area_code, country_code) values(2, 4390001, 2, 063, 380);
insert into phone_number (phone_number_id, abonent_number, contact_id, area_code, country_code) values(3, 4343101, 3, 063, 380);
insert into phone_number (phone_number_id, abonent_number, contact_id, area_code, country_code) values(4, 4349671, 4, 063, 380);
insert into phone_number (phone_number_id, abonent_number, contact_id, area_code, country_code) values(5, 4899001, 5, 063, 380);
insert into phone_number (phone_number_id, abonent_number, contact_id, area_code, country_code) values(6, 4378001, 6, 063, 380);
insert into phone_number (phone_number_id, abonent_number, contact_id, area_code, country_code) values(7, 4679001, 7, 063, 380);

--add products
insert into product (product_id, serial, name, price, weight, dimensions, m_date, e_date) values(1, '00000001', 'Calgon', 4.25, 1.20, '1x1x1', '2011-11-11', '2012-12-12');
insert into product (product_id, serial, name, price, weight, dimensions, m_date, e_date) values(2, '00000002', 'G-Shock', 45, 0.15, '1x1x1', '2011-11-11', '2012-12-12');
insert into product (product_id, serial, name, price, weight, dimensions, m_date, e_date) values(3, '00000003', 'One Mini', 300, 0.25, '1x1x1', '2011-11-11', '2012-12-12');
insert into product (product_id, serial, name, price, weight, dimensions, m_date, e_date) values(4, '00000004', 'Flatron 19', 150, 2.20, '1x1x1', '2011-11-11', '2012-12-12');
insert into product (product_id, serial, name, price, weight, dimensions, m_date, e_date) values(5, '00000005', 'Galaxy S4', 500, 0.30, '1x1x1', '2011-11-11', '2012-12-12');
insert into product (product_id, serial, name, price, weight, dimensions, m_date, e_date) values(6, '00000006', 'Pepsi Cola', 0.75, 1.00, '1x1x1', '2011-11-11', '2012-12-12');
insert into product (product_id, serial, name, price, weight, dimensions, m_date, e_date) values(7, '00000007', 'Colgate', 1.25, 0.10, '1x1x1', '2011-11-11', '2012-12-12');

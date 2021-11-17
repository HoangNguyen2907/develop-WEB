USE    QLBANHANG;
CREATE TABLE  `admin`(
    id INT(11) NOT NULL,
    username VARCHAR(32)  NOT NULL DEFAULT '',
    password VARCHAR(32)  NOT NULL DEFAULT '',
    name VARCHAR(128) NOT NULL,
    PRIMARY KEY(id)
); CREATE TABLE  `user`(
    id INT(255) NOT NULL ,
    name VARCHAR(50)  NOT NULL,
    email VARCHAR(50)  NOT NULL,
    phone VARCHAR(15)  NOT NULL,
    address VARCHAR(128) NOT NULL,
    password VARCHAR(40) NOT NULL,
    created date,
    PRIMARY KEY(id)
); CREATE TABLE category(
    id INT(11) NOT NULL ,
    name VARCHAR(128)  NOT NULL,
    PRIMARY KEY(id)
);CREATE TABLE in_category(
    id int not null AUTO_INCREMENT,
    category_id int(11) not null,
    trademark_id int(11) not null,
    PRIMARY KEY(id)
);create TABLE trademark(
    id int(11) not null,
    name VARCHAR(100) not null,
    PRIMARY KEY(id)
);CREATE TABLE  product(
    id INT(255) NOT NULL AUTO_INCREMENT,
    category_id INT(11) NOT NULL,
    admin_id int(11) not null,
    trademark_id int(11) not null,
    name VARCHAR(100)  NOT NULL,
    price DECIMAL(15, 4) NOT NULL DEFAULT '0.0000',
    content TEXT  NOT NULL,
    image_link VARCHAR(50)  NOT NULL,
    created date,
    view INT(11) NOT NULL DEFAULT '0',
    PRIMARY KEY(id),
    FULLTEXT KEY name(name)
); CREATE TABLE  transaction(
    id int(255) NOT NULL AUTO_INCREMENT,
    status TINYINT(4) NOT NULL DEFAULT '0',
    user_id INT(11) NOT NULL DEFAULT '0',
    user_name VARCHAR(50)  NOT NULL,
    user_email VARCHAR(50)  NOT NULL,
    user_phone VARCHAR(20) NOT NULL,
    amount DECIMAL(15, 4) NOT NULL DEFAULT '0.0000',
    payment VARCHAR(32)  NOT NULL,
    payment_info TEXT NOT NULL,
    message VARCHAR(255) NOT NULL,
    security VARCHAR(16)  NOT NULL,
    created INT(11) NOT NULL DEFAULT '0',
    PRIMARY KEY(id)
);CREATE TABLE `order`(
    transaction_id int(255) NOT NULL,
    id INT(255) NOT NULL AUTO_INCREMENT,
    product_id INT(255) NOT NULL,
    qty INT(11) NOT NULL DEFAULT '0',
    amount DECIMAL(15, 4) NOT NULL DEFAULT '0.0000',
    data TEXT,
    status char NOT NULL DEFAULT '0',
    PRIMARY KEY(id),
    FOREIGN KEY (transaction_id) REFERENCES transaction(id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);
ALTER TABLE product
ADD CONSTRAINT fk_product_category FOREIGN KEY (category_id) REFERENCES category(id);
ALTER TABLE product
ADD CONSTRAINT fk_product_admin FOREIGN KEY (admin_id) REFERENCES admin(id);
ALTER TABLE product
ADD CONSTRAINT fk_product_trademark FOREIGN KEY (trademark_id) REFERENCES trademark(id);
ALTER TABLE transaction 
ADD CONSTRAINT fk_transaction_user FOREIGN KEY(user_id) REFERENCES user(id);
ALTER TABLE in_category
ADD CONSTRAINT fk_incategory_category FOREIGN KEY(category_id) REFERENCES category(id);
ALTER TABLE in_category
ADD CONSTRAINT fk_incategory_trademark FOREIGN KEY(trademark_id) REFERENCES trademark(id);

insert into admin(id,username,password,name) VALUES(
    12312312,
    'admin',
    'admin',
    N'HOÀNG NGUYỄN'
);
insert into category(id,name) VALUES(
    123123,
    N'Thể thao'
);

insert into category(id,name) VALUES(
    123456,
    N'Nam'
);
insert into category(id,name) VALUES(
    111111,
    N'Nữ'
);
insert into trademark(id,name) VALUES(
    123456789,
    'NIKE'
);
insert into trademark(id,name) VALUES(
    234567890,
    'ADIDAS'
);
insert into trademark(id,name) VALUES(
    12341234,
    'CHANEL'
);
insert into in_category(category_id, trademark_id) VALUES(
    123123,
    123456789
);
insert into in_category(category_id, trademark_id) VALUES(
    123456,
    123456789
);
insert into in_category(category_id, trademark_id) VALUES(
    111111,
    123456789
);
insert into in_category(category_id, trademark_id) VALUES(
    123123,
    234567890
);
insert into in_category(category_id, trademark_id) VALUES(
    123456,
    234567890
);

insert into user(id,name,email,phone,address,password,created) VALUES(
    1,
    N'Nguyễn Văn A',
    'noname@gamil.com',
    '0989999999',
    'TPHCM',
    'A1234',
    '2021-11-16'
);
insert into product(id,category_id,admin_id,trademark_id,name,price,image_link,created) VALUES(
   1,  
  123123,
  12312312,
  123456789,
  N'Giày Thể Thao',
  1000000,
  'product\image\Giaythethao.png',
    '2021-11-16'
);
insert into product(id,category_id,admin_id,trademark_id,name,price,image_link,created) VALUES(
  2,
  123456,
  12312312,
  123456789,
  N'Áo Khoác Thể Thao',
  1000000,
  'product\image\AoKhoacNIKE.png',
    '2021-11-16'
);
insert into product(id,category_id,admin_id,trademark_id,name,price,image_link,created) VALUES(
  3,
  111111,
  12312312,
  12341234,
  N'Túi Xách Chanel',
  20000000,
  'product\image\tuichanel.png',
    '2021-11-16'
);

insert into transaction(id, status, user_id, user_name, user_email,user_phone,amount,security,created) VALUES(
    1,
    0,
    1,
    N'Nguyễn Văn A',
    'noname@gamil.com',
    '0989999999',
    3000000,
    'securitycode',
    '2021-11-16'
);

insert into `order`(transaction_id,product_id,qty,amount,status) VALUES(
    1,
    1,
    1,
    1000000,
    0
);
insert into `order`(transaction_id,product_id,qty,amount,status) VALUES(
    1,
    2,
    2,
    2000000,
    0
);
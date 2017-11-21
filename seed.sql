DROP TABLE IF EXISTS cars;

CREATE TABLE cars (

  id SERIAL PRIMARY KEY,
  title VARCHAR(255),
  body TEXT,
  image TEXT

);

insert into cars (title, body, image) values ('Ferrari 458', 'My first car description','https://images.autotrader.com/scaler/400/300/pictures/model_info/NVD_Fleet_US_EN/All/14092.jpg');
insert into cars (title, body, image) values ('Lamborgini Gallardo', 'My second car','https://media.ed.edmunds-media.com/lamborghini/gallardo/2004/oem/2004_lamborghini_gallardo_coupe_base_fq_oem_1_500.jpg');
insert into cars (title, body, image) values ('Buggati Veyron', 'My third car description','https://upload.wikimedia.org/wikipedia/commons/thumb/9/94/Bugatti_Veyron_16.4_%E2%80%93_Frontansicht_%283%29%2C_5._April_2012%2C_D%C3%BCsseldorf.jpg/1200px-Bugatti_Veyron_16.4_%E2%80%93_Frontansicht_%283%29%2C_5._April_2012%2C_D%C3%BCsseldorf.jpg');

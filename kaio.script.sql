create table users(
id_user int primary key auto_increment,
name varchar(40) not null,
email varchar(40) not null unique,
password varchar(20) not null unique
);

create table posts(
id_post int primary key auto_increment,
tittle varchar(20),
description text,
id_user int,
foreign key(id_user) references users(id_user)
);

create table roles(
id_role int primary key auto_increment,
name varchar(16) not null
);

create table user_roles(
id_user int,
id_role int,
foreign key(id_user) references users(id_user),
foreign key(id_role) references roles(id_role)
);

insert into roles
(name)
values
("Admin"),
("Employee"),
("Client");

insert into users
(name, email, password)
values
("kaio gouveia", "shiitkaio@gmail.com", "123456"),
("kaylane queiroz", "kayyzoldyck@gmail.com", "654321"),
("augusto morais", "august_morais@gmail.com", "246135"),
("kananda larry", "kananda.kl@gmail.com", "531642"),
("arthur leandro", "arturbl_bjj@gmail.com", "642531");

insert into posts
(tittle, description, id_user)
values
("let it happen", "o hit que tame impala trouxe ao mundo", "1"),
("jealous", "minha vida se resume em escutar essa", "1"),
("vida vazia", "a melhor do momento", "2"),
("rhinestone eyes", "conheci essa antes de virar modinha", "2"),
("judas", "batida forte e impactante, isso sim é música", "3"),
("the perfect girl", "hino de psicopata americano", "3"),
("peças de grife", "sou obcecada", "4"),
("relógio", "obra prima", "4"),
("eu te amo tanto", "me iludo achando que ainda existe amor", "5"),
("vizão de cria 2", "cada parte melhor que a outra", "5");

insert into user_roles
(id_user, id_role)
values
(1,1),
(2,3),
(3,3),
(4,2),
(5,2);

select
posts.id_post,
posts.tittle,
posts.description,
posts.id_user,
users.id_user,
users.name from posts inner join users
on posts.id_user = users.id_user
where users.id_user = 3;

select
posts.id_post,
posts.tittle,
posts.description,
posts.id_user,
users.id_user,
users.name from posts inner join users
on posts.id_user = users.id_user
where users.id_user = 5;

delete from posts
where id_user = 2;

delete from user_roles
where id_user = 2;

delete from users
where id_user = 2;

update posts 
set tittle = "kaio",
description = "085157"
where id_user = 1;

select 
u.id_user,
u.name,
r.name
from user_roles ur
join users u on u.id_user = ur.id_user 
join roles r on r.id_role = ur.id_role 
where r.name = 'Admin';

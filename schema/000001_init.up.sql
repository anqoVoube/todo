CREATE TABLE users
(
    id serial primary key,
    name varchar(255) not null,
    username varchar(255) not null unique,
    password_hash varchar(255) not null
);

CREATE TABLE todo_lists
(
    id serial primary key,
    title varchar(255) not null,
    description varchar(255)
);


CREATE TABLE users_lists
(
    id serial primary key,
    user_id int not null,
    list_id int not null,
    description varchar(255),
    FOREIGN KEY (user_id) REFERENCES users ON DELETE CASCADE,
    FOREIGN KEY (list_id) REFERENCES todo_lists ON DELETE CASCADE
);

CREATE TABLE todo_items
(
    id serial primary key,
    title varchar(255) not null,
    description varchar(255),
    done boolean not null default false
);

CREATE TABLE lists_items
(
    id serial primary key,
    item_id int not null,
    list_id int not null,
    FOREIGN KEY (item_id) REFERENCES todo_items ON DELETE CASCADE,
    FOREIGN KEY (list_id) REFERENCES todo_lists ON DELETE CASCADE
)
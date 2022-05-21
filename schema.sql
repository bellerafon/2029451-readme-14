CREATE DATABASE readme
DEFAULT character set utf8
DEFAULT COLLATE utf8_general_ci;

USE readme;

CREATE TABLE users (
  id int AUTO_INCREMENT PRIMARY KEY,
  dt_add timestamp DEFAULT CURRENT_TIMESTAMP(),
  email varchar(128) NOT NULL UNIQUE,
  login char(64) NOT NULL UNIQUE,
  password char(64) NOT NULL,
  ava_link varchar(256)
);

CREATE TABLE posts (
  id int AUTO_INCREMENT PRIMARY KEY,
  dt_add timestamp DEFAULT CURRENT_TIMESTAMP(),
  title varchar(256) NOT NULL,
  content text NOT NULL,
  author varchar(256) NOT NULL,
  img_link varchar(256),
  video_link varchar(256),
  link varchar(256),
  view_count int,
  user_id int,
  content_type_id int,
  tag_id int
);
  
CREATE TABLE comments (
    id int AUTO_INCREMENT PRIMARY KEY,
    dt_add timestamp DEFAULT CURRENT_TIMESTAMP(),
    content varchar(256) NOT NULL,
    user_id int NOT NULL,
    post_id int NOT NULL
);

CREATE TABLE likes (    
    user_id int NOT NULL,
    post_id int NOT NULL
);

CREATE TABLE subs (
    user_id int NOT NULL,
    user_sub_id int NOT NULL
);

CREATE TABLE messages (
    id int AUTO_INCREMENT PRIMARY KEY,
    dt_add timestamp DEFAULT CURRENT_TIMESTAMP(),
    content varchar(256) NOT NULL,
    user_send_id int NOT NULL,
    user_get_id int NOT NULL
);

CREATE TABLE tags (
    id int AUTO_INCREMENT PRIMARY KEY,
    name varchar(128)    
);

CREATE TABLE posts_tags (
    post_id int,
    tag_id int
);

CREATE TABLE roles (
    id int AUTO_INCREMENT PRIMARY KEY,
    role_name varchar(64)
);


CREATE INDEX u_author ON users(login);

CREATE INDEX p_author ON posts(author);

CREATE INDEX c_text ON comments(content);
 



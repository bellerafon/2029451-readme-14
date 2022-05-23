USE readme;

/* 
  добавление списка типов контента для постов
*/

INSERT INTO content_type (content_type) VALUE ('all');
INSERT INTO content_type (content_type) VALUE ('text');
INSERT INTO content_type (content_type) VALUE ('image');
INSERT INTO content_type (content_type) VALUE ('link');
INSERT INTO content_type (content_type) VALUE ('quote');
INSERT INTO content_type (content_type) VALUE ('video');

/* 
  добавление пользователей
*/

INSERT INTO users (email, login, password, ava_link) VALUES ('aaa@aa.aa', 'larisa', '123', 'img/ava1.jpg');
INSERT INTO users (email, login, password, ava_link) VALUES ('bbb@bb.bb', 'vladik', '123', 'img/ava2.jpg');
INSERT INTO users (email, login, password, ava_link) VALUES ('ccc@cc.cc', 'viktor', '123', 'img/ava3.jpg');

/* 
  добавление комментарий к постам
*/

INSERT INTO comments (content, user_id, post_id) VALUES ('Вау, круто!', 1, 1);
INSERT INTO comments (content, user_id, post_id) VALUES ('А что так можно было?', 2, 2);

/* 
  добавление контента для постов
*/

INSERT INTO posts (title, content, author, user_id, content_type_id) VALUES ('Цитата', 'Мы в жизни любим только раз, а после ищем лишь похожих', 'Лариса', 1, 5);
INSERT INTO posts (title, content, author, user_id, content_type_id) VALUES ('Игра престолов', 'Не могу дождаться начала финального сезона своего любимого сериала!', 'Владик', 2, 2);
INSERT INTO posts (title, content, author, user_id, content_type_id) VALUES ('Наконец, обработал фотки!', 'rock-medium.jpg', 'Виктор', 3, 3);
INSERT INTO posts (title, content, author, user_id, content_type_id) VALUES ('Моя мечта', 'coast-medium.jpg', 'Лариса', 1, 3);
INSERT INTO posts (title, content, author, user_id, content_type_id) VALUES ('Лучшие курсы', 'www.htmlacademy.ru', 'Владик', 2, 4);

/* 
  получение списка постов с сортировкой по популярности и вместе с именами авторов и типом контента
*/

SELECT p.id, title, content, author, content_type, view_count FROM posts p JOIN content_type c ON p.content_type_id = c.id ORDER BY view_count DESC; 

/* 
  получение списка постов для конкретного пользователя
*/

SELECT * FROM posts WHERE user_id = 1;

/* 
  получение списка комментариев для одного поста, в комментариях должен быть логин пользователя
*/

SELECT c.id, content, login FROM comments c JOIN users u ON c.user_id = u.id WHERE c.post_id = 2;

/* 
  добавление лайка к посту
*/

INSERT INTO likes (user_id, post_id) VALUES (1, 1);

/* 
  подписаться на пользователя
*/

INSERT INTO subs (user_id, user_sub_id) VALUES (1, 2);

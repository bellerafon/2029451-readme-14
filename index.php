<?php
date_default_timezone_set('Asia/Almaty');

require_once('helpers.php');
require_once('init.php');
require_once('functions.php');


$content = include_template('main.php', [
    'populars' => get_popular_posts($link)
]);

$layout_content = include_template('layout.php', [
    'content' => $content,
    'title' => 'Популярное'
]);

print($layout_content);
?>
<?php
require_once('helpers.php');
require_once('data.php');

$page_content = include_template('main.php', ['populars' => $populars]);

$layout_content = include_template('layout.php', [
    'content' => $page_content,
    'title' => 'Популярное'
]);

print($layout_content);
?>
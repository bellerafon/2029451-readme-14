<?php
date_default_timezone_set('Asia/Almaty');
/*
require_once('helpers.php');
require_once('data.php');
*/

require_once('init.php');

if (!$link) {
    $error = mysqli_connect_error();
    $content = include_template('error.php', ['error' => $error]);
}
else {
    $sql = 'SELECT p.id, dt_add, title, content, author, avatar, content_type, view_count FROM posts p ' 
         . 'JOIN content_type c ON p.content_type_id = c.id '
         . 'ORDER BY view_count DESC LIMIT 6';
    
    if ($result = mysqli_query($link, $sql)) {
        $populars = mysqli_fetch_all($result, MYSQLI_ASSOC);
        
        $content = include_template('main.php', [
            'populars' => $populars
        ]);

    }
    else {
        $error = mysqli_error($link);
        $content = include_template('error.php', ['error' => $error]);
    }

}



$layout_content = include_template('layout.php', [
    'content' => $content,
    'title' => 'Популярное'
]);

print($layout_content);
?>
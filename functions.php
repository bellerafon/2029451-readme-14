<?php
    function get_popular_posts($link) {
        $sql = 'SELECT p.id, p.dt_add, title, content, u.login, avatar, content_type, view_count FROM posts p ' 
         . 'JOIN content_type c ON p.content_type_id = c.id '
         . 'JOIN users u ON p.user_id = u.id '
         . 'ORDER BY view_count DESC LIMIT 6';
    
        if ($result = mysqli_query($link, $sql)) {
            return $populars = mysqli_fetch_all($result, MYSQLI_ASSOC);
        }
        else {
            $error = mysqli_error($link);
            $content = include_template('error.php', ['error' => $error]);
            exit();
        }
    }



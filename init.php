<?php
require_once('helpers.php');
$db = require('db.php');

$link = mysqli_connect($db['host'], $db['user'], $db['password'], $db['database']);

if (!$link) {
    $error = mysqli_connect_error();
    $content = include_template('error.php', ['error' => $error]);
    exit();
}

mysqli_set_charset($link, 'UTF-8');



/*
$populars = [];
$content = '';*/
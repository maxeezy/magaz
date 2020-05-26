<?php
include_once  'pages.php';
$routes = explode('/', $_SERVER['REQUEST_URI']);
$current = $pages[$routes[1]];
if ($current == null) {
    $current = $pages['404'];
}
$title = $current['title'];
$content = file_get_contents('templates/' . $current['content']);
$scripts = '';
if (isset($current['scripts'])) {
    foreach ($current['scripts'] as $script) {
        $scripts .= "<script rel=\"script\" type=\"application/javascript\" src=\"/assets/js/${script}.js\"></script>";
    }
}

include 'templates/page.html';
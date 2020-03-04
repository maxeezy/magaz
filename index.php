<?php
include_once __DIR__ . '/engine/config/pages.php';
$routes = explode('/', $_SERVER['REQUEST_URI']);
$current = $pages[$routes[1]];
$current2 = $routes[2];
if (($current == null)||!empty($current2)) {
    $current = $pages['404'];
}
$title = $current['title'];
$content = file_get_contents(__DIR__ . '/templates/' . $current['content']);
$scripts = '';
if (isset($current['scripts'])) {
    foreach ($current['scripts'] as $script) {
        $scripts .= "<script rel=\"script\" type=\"application/javascript\" src=\"/assets/js/${script}.js\"></script>";
    }
}

include __DIR__ . '/templates/page.html';
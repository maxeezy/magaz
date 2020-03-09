<?php
$pages = [
    '' => [
        'title' => 'Интернет магазин значков и украшений',
        'content' => 'main.html',
        'scripts' => ['main_view','view_add']
    ],
    '404' => [
        'title' => 'Страница не найдена',
        'content' => '404.html'
    ],
    'about' => [
        'title' => 'О нас | Интернет магазин значков и украшений',
        'content' => 'about.html'
    ],
    'conditions' => [
        'title' => 'Условия | Интернет магазин значков и украшений',
        'content' => 'conditions.html'
    ],
    'article-brace' => [
        'title' => 'Как заказать браслет | Интернет магазин значков и украшений',
        'content' => 'article-brace.html'
    ],
    'article-znacok' => [
        'title' => 'Как заказать значок | Интернет магазин значков и украшений',
        'content' => 'article-znacok.html'
    ],
    'category' => [
        'title' => 'Категории | Интернет магазин значков и украшений',
        'content' => 'category.html',
        'scripts' => ['default', 'category']
    ],
    'section' => [
        'title' => 'Товар | Интернет магазин значков и украшений',
        'content' => 'section.html',
        'scripts' => ['default']
    ],
    'good' => [
        'title' => 'Товар | Интернет магазин значков и украшений',
        'content' => 'good.html',
        'scripts' => ['view_one']
    ],
    'favorites' => [
        'title' => 'Избранное | Интернет магазин значков и украшений',
        'content' => 'favorites.html',
        'scripts' => ['buy-favorites', 'delete']
    ],
    'basket' => [
        'title' => 'Корзина | Интернет магазин значков и украшений',
        'content' => 'basket.html',
        'scripts' => ['buy-favorites', 'delete']
    ],
    'brace'  => [
        'title' => 'Браслеты | Интернет магазин значков и украшений',
        'content' => 'section.html',
        'script' => ['get-category','view_category']
    ]

];
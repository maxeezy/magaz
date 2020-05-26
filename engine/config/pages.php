<?php
$pages = [
    '' => [
        'title' => 'Интернет магазин значков и украшений',
        'content' => 'main.html',
        'scripts' => ['main_view', 'view_add','slider']
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
    'good' => [
        'title' => 'Товар | Интернет магазин значков и украшений',
        'content' => 'good.html',
        'scripts' => ['view_one','to-favorite','to-basket']
    ],
    'favorites' => [
        'title' => 'Избранное | Интернет магазин значков и украшений',
        'content' => 'favorites.html',
        'scripts' => ['favorites_to-basket', 'delete_favorites','view_favorites']
    ],
    'basket' => [
        'title' => 'Корзина | Интернет магазин значков и украшений',
        'content' => 'basket.html',
        'scripts' => ['accept_basket', 'delete_basket','view_basket','change_price']
    ],
    'brace' => [
        'title' => 'Браслеты | Интернет магазин значков и украшений',
        'content' => 'section.html',
        'scripts' => ['view_good_article']
    ],
    'badges' => [
        'title' => 'Значки | Интернет магазин значков и украшений',
        'content' => 'category.html',
        'scripts' => ['view_category']
    ],
    'badges-category' => [
        'title' => 'Значки | Интернет магазин значков и украшений',
        'content' => 'section.html',
        'scripts' => ['view_good_article']
    ],
    'pendants' => [
        'title' => 'Кулоны | Интернет магазин значков и украшений',
        'content' => 'section.html',
        'scripts' => ['view_good_article']
    ],
    'passport-covers' => [
        'title' => 'Обложки на паспорт | Интернет магазин значков и украшений',
        'content' => 'section.html',
        'scripts' => ['view_good_article']
    ]
    ,
    'account' => [
        'title' => 'Интернет магазин значков и украшений',
        'content' => 'account.html'
    ],
    'sign-in' => [
        'title' => 'Вход в аккаунт | Интернет магазин значков и украшений',
        'content' => 'sign-in.html',
        'scripts' => ['sign-in']
    ],
    'sign-up' => [
        'title' => 'Регистрация | Интернет магазин значков и украшений',
        'content' => 'sign-up.html',
        'scripts' => ['sign-up']
    ],
    'user' => [
        'title' => 'Личный кабинет | Интернет магазин значков и украшений',
        'content' => 'user.html',
        'scripts' => ['view_info','view_orders','logout']
    ],
    'admin' => [
        'title' => 'Админ панель | Интернет магазин значков и украшений',
        'content' => 'admin.html',
        'scripts' => ['orders','goods','logout']
    ]
];
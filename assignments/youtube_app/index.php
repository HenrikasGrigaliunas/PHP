<?php

session_start();

function autoload_classes($class)
{
    if (is_file($class . '.php'))
        include $class . '.php';
}
spl_autoload_register('autoload_classes');


    
    $page = isset($_GET['page']) ? $_GET['page'] : '';

    switch ($page) {
 
        case 'category':
            Controller\Homepage::byCategory($_GET['id']);
            break;

        case 'login':
            if($_SERVER['REQUEST_METHOD'] === 'GET'){
                Controller\Auth::loginIndex();
            } else if($_SERVER['REQUEST_METHOD'] === 'POST') {
                Controller\Auth::processLogin();
            }
            break;

        case 'register':
            if($_SERVER['REQUEST_METHOD'] === 'GET'){
                Controller\Auth::registerIndex();
            } else if($_SERVER['REQUEST_METHOD'] === 'POST') {
                Controller\Auth::processRegister();
            }
            break;
            
        case 'logout':
            session_destroy();
            header('Location: ?page=/');

        case 'search':
            Controller\Search::search();
            break;

        case 'video':
                Controller\Video::toSingleVideo($_GET['id']);
            break;

        default:
            Controller\Homepage::index();
    }
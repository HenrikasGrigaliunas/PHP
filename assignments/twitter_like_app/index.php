<?php 
session_start(); 

$page = isset($_GET['page']) ? $_GET['page'] : '/';

include './views/partials/header.php';

switch($page) {
    case 'register':
        include './views/pages/register.php';
        break;
        default:
        echo '<h1>pagrindinis puslapis</h1>';
}

include './views/partials/footer.php';

?>


    

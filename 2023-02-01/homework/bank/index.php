<?php session_start(); ?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ManoBank</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">

</head>
<body>
    <?php
    include('./views/header.php');
    ?>
    <main>
    <?php 
            //Paprasto router'io (marsrutizatorius) pavyzdys
            $page = isset($_GET['page']) ? $_GET['page'] : '';

            switch($page) {
                case 'account':
                    include './views/account.php';
                    break;
                case 'logout':
                    session_destroy();
                    include './views/services.php';
                    break;
                case 'login':
                    include './views/login.php';
                    break;
                case 'korteles':
                    include './views/cards.php';
                    break;
                case 'paskolos':
                    include './views/loans.php';
                    break;
                case 'pensija':
                    include './views/pension.php';
                    break;
                default:
                    include './views/services.php';
            }
            ?>

    </main>
    <?php include './views/footer.php'; ?>
    
</body>
</html>
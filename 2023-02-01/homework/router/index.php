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
                case 'signin':
                    include './views/signin.php';
                    break;
                case 'korteles':
                    include './views/korteles.php';
                    break;
                case 'paskolos':
                    include './views/paskolos.php';
                    break;
                case 'pensija':
                    include './views/pensija.php';
                    break;
                default:
                    include './views/paslaugos.php';
            }
            ?>

    </main>
    <?php include './views/footer.php'; ?>
    
</body>
</html>
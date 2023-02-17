<?php
if(!empty($_POST)) {
    $email = $_POST['email'];
    $password = md5($_POST['password']);
    $params = [
        'page' => 'login',
        'message' => 'Vartotojas sekmingai sukurtas',
        'status' => 'success'
    ];

    if ($db->query("INSERT INTO users (email, password) VALUES ('{$email}', '{$password}') ")) {
       // header('Location: ?page=register&message=Vartotojas sekmingai sukurtas&status=success');
       header('Location: ?' . http_build_query($params));
    }
}

?>

<h1>Registration</h1>

<form method="POST">
    <div class="mb-3">
        <label>Email address</label>
        <input type="email" name="email" placeholder="test@gmail.com" class="form-control" required />
    </div>
    <div class="mb-3">
        <label>Password</label>
        <input type="password" name="password" class="form-control" required />
    </div>
    

    <button class="btn btn-primary">Register</button>
</form>
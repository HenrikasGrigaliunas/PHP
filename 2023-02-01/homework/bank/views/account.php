<?php
    if(!isset($_SESSION['user'])) {
        header('Location: index.php');
    }

   
?>
<div class="container">
<h4>Jūsų sąskaitos informacija</h4>


<table class="table table-bordered">
  <thead>
    <tr>
      <th scope="col">Vardas</th>
      <th scope="col">Pavardė</th>
      <th scope="col">Sąskaitos numeris</th>
      <th scope="col">Sąskaitos likutis, Eur</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><?php print_r($_SESSION['user']->name) ?></td>
      <td><?php print_r($_SESSION['user']->last_name) ?></td>
      <td><?php print_r($_SESSION['user']->iban) ?></td>
      <td><?php print_r($_SESSION['user']->balance) ?></td>
    </tr>
  </tbody>
</table>
<a href="?page=logout" class="btn btn-primary">Atsijungti</a>
</div>

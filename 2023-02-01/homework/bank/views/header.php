<?php 
    $navigacija = [
        'Pagrindinis' => 'index.php',
        'Korteles' => '?page=korteles',
        'Paskolos' => '?page=paskolos',
        'Pensija' => '?page=pensija',
        'Internetinis Bankas' => '?page=login'
    ];
    
?>
<div class="container">
    <header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4 border-bottom">
      <a href="/" class="d-flex align-items-center col-md-3 mb-2 mb-md-0 text-dark text-decoration-none">
        <h2>Mano Bankas</h2>
      </a>

      <ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
        <?php foreach($navigacija as $title => $link) : ?>
            <li><a href="<?= $link ?>" class="nav-link px-4 link-dark"><?= $title ?></a></li>
        <?php endforeach; ?>
      </ul>

     
    </header>
</div>
<?php
      
    echo '<h2>Sugeneruokite masyvą iš 30 elementų (indeksai nuo 0 iki 29), kurių reikšmės yra atsitiktiniai skaičiai nuo 5 iki 25.
    </h2>';

    $masyvas = [];

    for($i = 0; $i < 30; $i++) {
        echo $i . '- indeksas ' . rand(5, 25) . ' -sugeneruotas skaičius' . ' <br />';
    }

    var_dump($masyvas);
   
?>
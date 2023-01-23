<?php
      
    echo '<h2>1. Sugeneruokite masyvą iš 30 elementų (indeksai nuo 0 iki 29), kurių reikšmės yra atsitiktiniai skaičiai nuo 5 iki 25.
    </h2>';

    $masyvas = [];

    for($i = 0; $i < 30; $i++) {
        echo $i . '- indeksas ' . rand(5, 25) . ' -sugeneruotas skaičius' . ' <br />';
    }

    var_dump($masyvas);
    print '<h2>2. Sugeneruokite masyvą, kurio reikšmės atsitiktinės raidės A, B, C ir D, o ilgis 200.</h2>';
    
    $letters = ["A", "B", "C", "D"];
    $random_array = [];
    for ($i = 0; $i < 200; $i++) {
        $random_letter = $letters[array_rand($letters)];
        array_push($random_array, $random_letter);
    }
    print_r($random_array);

   // echo '<br />';
    //var_dump($random_array);

    print '<h2>3. Sugeneruokite 3 masyvus pagal 2 uždavinio sąlygą. Sudėkite masyvus, sudėdami reikšmes pagal atitinkamus indeksus. 
    </h2>';

    $letters = ["A", "B", "C", "D"];
    $random_array1 = [];
    $random_array2 = [];
    $random_array3 = [];

echo '<p>Pirmas masyvas</p>';
for ($i = 0; $i < 200; $i++) {
    $random_letter = $letters[array_rand($letters)];
    array_push($random_array1, $random_letter);
}
print_r($random_array1);


echo '<p>Antras masyvas</p>';
for ($i = 0; $i < 200; $i++) {
    $random_letter = $letters[array_rand($letters)];
    array_push($random_array2, $random_letter);
}
print_r($random_array2);


echo '<p>Trecias masyvas</p>';
for ($i = 0; $i < 200; $i++) {
    $random_letter = $letters[array_rand($letters)];
    array_push($random_array3, $random_letter);
}
print_r($random_array3);


echo '<p>Sudetinis masyvas</p>';
$mixed_array = [];
for ($i = 0; $i < 200; $i++) {
    $mixed = $random_array1[$i] . $random_array2[$i] . $random_array3[$i];
    array_push($mixed_array, $mixed);
}
print_r($mixed_array);

print '<h2>4. Nupieškite kvadratą iš “*”, kurio kraštines sudaro 100 “*”. Panaudokite css stilių, kad kvadratas ekrane atrodytų kvadratinis. Nupieštam kvadratui nupieškite raudonas įstrižaines.
</h2>';


$size = 25;
for($i = 1; $i <= $size; $i++) {
    for( $x = 1; $x <= $size; $x++) {
        if($i === $x || $x === ($size - $i) + 1) {
            echo '<span style="color: red;">*</span>';
        } else {
            echo '*';
        }
    }
    echo '<br />';
}
   
?>
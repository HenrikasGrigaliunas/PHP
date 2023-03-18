<?php

namespace Controller;

use Model\Videos;

class Search {
    public static function search() {
        $searchingFor = $_GET['search'];

        $videos = new Videos;
        $results = $videos->searchFor($searchingFor);

        include ("view/search.php");
    }
}
<?php

require_once __DIR__.'/../bootstrap.php';

$api = new \TcApi\SemesterData();

$data = $api->getData();

echo  '<PRE>';
print_r($data);


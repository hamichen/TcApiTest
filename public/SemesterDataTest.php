<?php

require_once '../bootstrap.php';

$t1 = new \TcApi\TcApi();

$t1->apiName = 'semester-data';
$t1->setMethod('GET');
$res = $t1->getData();

echo '<pre>';

print_r($res);
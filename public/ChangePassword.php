<?php

require_once '../bootstrap.php';

$t1 = new \TcApi\TcApi();

$t1->apiName = 'change-password';
$t1->setMethod('PATCH');

$arr = [
    [
        'account' => '103-103001',
        'password' => 'SSSSSSSSSSSSSSSS',
    ],
    [
        'account' => '103-103002',
        'password' => 'SSSSSSSSSS',
    ]
];
$res = $t1->getData($arr);

echo '<pre>';

print_r($res);
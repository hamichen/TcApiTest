<?php

// Load our autoloader
require_once __DIR__.'/vendor/autoload.php';

require_once __DIR__.'/config/local.php';


// Specify our Twig templates location
$loader = new Twig_Loader_Filesystem(__DIR__.'/templates');

// Instantiate our Twig
$twig = new Twig_Environment($loader,['cache' => __DIR__.'/data/cache']);

// 設定資料庫
try {
    $dsn = 'mysql:host='.$mysqlConn['host'].';dbname='.$mysqlConn['dbname'].';charset='.$mysqlConn['charset'];

    $mysqlPdo = new \PDO($dsn, $mysqlConn['user'], $mysqlConn['password']);

} catch (\PDOException $e) {
    print "Error!: " . $e->getMessage() . "<br/>";
    die();
}
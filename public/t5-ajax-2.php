<?php
require_once '../bootstrap.php';

$id = (int) $_GET['id'];

$sql = "SELECT * from student WHERE id=".$id;

$arr = $mysqlPdo->query($sql)->fetch(\PDO::FETCH_ASSOC);

echo $twig->render('test/t5-ajax-2.twig',['data'=>$arr]);


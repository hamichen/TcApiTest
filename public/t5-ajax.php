<?php
require_once '../bootstrap.php';

$id = (int) $_GET['id'];

$sql = "SELECT a.*, b.* from semester_student a
LEFT JOIN student b ON a.student_id=b.id 
where a.semester_class_id=$id order by a.number";


$arr = $mysqlPdo->query($sql)->fetchAll(\PDO::FETCH_ASSOC);

echo $twig->render('test/t5-ajax.twig',['data'=>$arr]);


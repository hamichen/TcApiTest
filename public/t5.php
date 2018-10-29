<?php

require_once '../bootstrap.php';

$sql = 'SELECT * FROM semester ORDER BY year desc , semester desc ';

$semesterData = $mysqlPdo->query($sql)->fetchAll(\PDO::FETCH_ASSOC);

$classData = null;

if (isset($_POST['semester_id'])){
    $sql = "SELECT * FROM semester_class WHERE semester_id=".$_POST['semester_id'];
    $classData = $mysqlPdo->query($sql)->fetchAll(\PDO::FETCH_ASSOC);
}

echo  $twig->render('test/t5.twig',['semester' => $semesterData, 'class'=>$classData ]);
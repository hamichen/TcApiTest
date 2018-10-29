<?php
$servername = "mysqldb";
$username = "root";
$password = "root";
$dbname = "school_cms";

try {
    $conn = new \PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
    // set the PDO error mode to exception
    $conn->setAttribute(PDO::ATTR_ERRMODE, \PDO::ERRMODE_EXCEPTION);
    $sql = "INSERT INTO semester (year, semester)
    VALUES (107,1)";
    // use exec() because no results are returned
    $conn->exec($sql);
    echo "New record created successfully";

    $sql = "SELECT * FROM semester";
    $arr = $conn->query($sql)->fetchAll();
    print_r($arr);
}
catch(\PDOException $e)
{
    echo $sql . "<br>" . $e->getMessage();
}

$conn = null;

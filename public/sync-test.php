<?php

require_once '../bootstrap.php';

$semesterData = new \TcApi\SemesterData($mysqlPdo);

$res = $semesterData->syncData();



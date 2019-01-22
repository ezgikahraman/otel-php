<?php
require_once(__DIR__ . DIRECTORY_SEPARATOR . "config.php");

$dbConfig = $config['database'];

$db = new PDO($dbConfig["host"], $dbConfig["username"], $dbConfig["password"]);
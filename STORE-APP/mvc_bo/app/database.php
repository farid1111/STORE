<?php

use Illuminate\Database\Capsule\Manager as Capsule;
$capsule = new Capsule();

$capsule->addConnection([
    'driver' => 'mysql',
    'host' => 'localhost', //'127.0.0.1'
    'username' => 'root',
    'password' => '',
    'database' => 'testing',
    'charset' => 'utf8',
    'collation' => 'utf8_unicode_ci',
    'prefix' => '',
]);

$capsule->bootEloquent();
// public function setFetchMode($fetchMode)
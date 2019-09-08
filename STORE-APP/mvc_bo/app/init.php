<?php
// Le point d'entré de notre application. Tous ce qui se trouve ici sera accessible partout dans notre application.

// Composer autoloader
require_once '../vendor/autoload.php';

require_once 'config/initialize.php';

require_once 'database.php';

require_once "core/App.php";

require_once "core/Controller.php";

$app = new App;
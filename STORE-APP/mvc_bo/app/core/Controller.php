<?php

// The ROUTER:
// On récupére dans une méthode d'un controller => /controllers les deux fonctions ci-dessous model() & view()
// par un "extends" de cette classe Controller:
class Controller
{
    public function model($model)
    {
        require_once '../app/models/' . $model . '.php';
        return new $model();
    }

    // $data is automatically available for $view:
    public function view($view, $data = [])
    {
        require_once '../app/views/' . $view . '.php';
    }
}
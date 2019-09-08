<?php

class Home extends Controller
{
    public function index($name = null)
    {
        // Get the file name of the model into /models:
        $user = $this->model('User');
        $user->name = $name;

        $this->view('dashboard/dashboard', ['name' => "Abdenour"]);
    }

}
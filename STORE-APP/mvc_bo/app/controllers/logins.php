<?php
class Logins extends Controller
{

    public function password()
    {
        $this->view('logins/forgot_password', ['page_title' => "Mot de passe oublié!"]);
    }

    public function signin()
    {
        $this->view('logins/signin', ['page_title' => "Se connecter"]);
    }

    public function signup()
    {
        $this->view('logins/signup', ['page_title' => "Se déconnecter"]);
    }

}
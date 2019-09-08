<?php
class Customers extends Controller
{

    public function show()
    {
        $this->view('customers/show_customers', ['page_title' => "Affichage des Comptes utilisateurs"]);
    }

    public function add()
    {
        $this->view('customers/add_customer', ['page_title' => "Ajouter un compte"]);
    }

}
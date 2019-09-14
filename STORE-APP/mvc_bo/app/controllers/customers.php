<?php
class Customers extends Controller
{
    public function __construct()
    {
        $this->model('Customer');
    }

    public function show()
    {

        $customers = Customer::all();
        $this->view('customers/show_customers', ['page_title' => "Affichage des Comptes utilisateurs", 'customers' => $customers]);
    }

    public function add()
    {
        $this->view('customers/add_customer', ['page_title' => "Ajouter un compte"]);
    }

}
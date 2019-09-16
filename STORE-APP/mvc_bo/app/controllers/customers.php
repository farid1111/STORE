<?php
class Customers extends Controller
{
    public function __construct()
    {
        $this->model('Customer');
    }

    public function index()
    {

        // $customers = Customer::all();
        $customers = Customer::orderBy('cus_id', 'desc')->get();
        $total = $customers->count();
        $this->view('customers/show_customers', ['page_title' => "Affichage des Comptes utilisateurs", 'customers' => $customers, "total" => $total]);
    }

    public function add()
    {
        $this->view('customers/add_customer', ['page_title' => "Ajouter un compte"]);
    }

    public function update()
    {
        $this->view('customers/update_customer', ['page_title' => "Modifier un compte"]);
    }

}
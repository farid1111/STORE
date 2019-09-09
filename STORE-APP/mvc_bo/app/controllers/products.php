<?php
class Products extends Controller
{

    public function index()
    {
        $this->view('products/show_products', ['page_title' => "Affichage des produits", "name" => "FARID"]);
    }

    public function add()
    {
        $this->view('products/add_product', ['page_title' => "Ajouter un produit"]);
    }

}
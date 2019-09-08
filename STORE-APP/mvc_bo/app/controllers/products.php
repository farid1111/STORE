<?php
class Products extends Controller
{

    public function show()
    {
        $this->view('products/show_products', ['page_title' => "Affichage des produits"]);
    }

    public function add()
    {
        $this->view('products/add_product', ['page_title' => "Ajouter un produit"]);
    }

}
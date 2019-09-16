<?php
class Products extends Controller
{
    public function __construct()
    {
        $this->model('Product');
    }

    public function index($id = null)
    {

        // $products = Product::all();
        $products = Product::orderBy('pro_id', 'DESC')->get();
        $total = $products->count();
        $this->view('products/show_products', ['page_title' => "Affichage des produits", 'products' => $products, "total" => $total]);
    }

    public function add($id = null)
    {

        $this->view('products/add_product', ['page_title' => "Ajouter un produit"]);
    }

    public function update($id = null)
    {

        $this->view('products/update_product', ['page_title' => "Modifier un produit"]);
    }

}
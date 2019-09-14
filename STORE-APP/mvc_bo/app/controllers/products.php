<?php
class Products extends Controller
{
    public function __construct()
    {
        $this->model('Product');
    }

    public function index($id = null)
    {
        // $oneProduct = Product::find($id);
        // Afficher une Table en JSON:
        // echo Product::all(); // Le echo affiche un tableau "JSON" des articles.

        // $products = Product::all();
        $products = Product::orderBy('pro_id', 'desc')->get();
        $this->view('products/show_products', ['page_title' => "Affichage des produits", 'products' => $products]);
    }

    public function add($id = null)
    {

        $this->view('products/add_product', ['page_title' => "Ajouter un produit"]);
    }

    public function delete($id = null)
    {
        echo $id;
        print_r($_REQUEST);
    }

}
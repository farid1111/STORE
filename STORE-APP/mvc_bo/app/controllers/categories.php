<?php
class Categories extends Controller
{

    public function __construct()
    {
        $this->model('Category');
    }

    public function index()
    {
        // $categories = Category::all();
        $categories = Category::orderBy('cat_id', 'desc')->get();
        $total = $categories->count();
        $this->view('categories/show_categories', ['page_title' => "Affichage des catégories", "categories" => $categories, "total" => $total]);
    }

    public function add($name = null)
    {
        $this->view('categories/add_category', ['page_title' => "Ajouter une catégorie"]);
    }

    public function update($name = null)
    {
        $this->view('categories/update_category', ['page_title' => "Modifier une catégorie"]);
    }
}
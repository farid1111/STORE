<?php
class Categories extends Controller
{

    public function __construct()
    {
        $this->model('Category');
    }

    public function show()
    {
        // $categories = Category::all();
        //Récupérer toutes les catégories et les ordonner en descendant par "cat_id":
        $categories = Category::orderBy('cat_id', 'desc')->get();
        $this->view('categories/show_categories', ['page_title' => "Affichage des catégories", "categories" => $categories]);
    }

    public function add($name = null)
    {
        $this->view('categories/add_category', ['page_title' => "Ajouter une catégorie"]);
    }

}
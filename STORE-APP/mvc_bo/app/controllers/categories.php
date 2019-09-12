<?php
class Categories extends Controller
{

    public function __construct()
    {
        $this->model('Category');
    }

    public function show()
    {
        $categories = Category::all();
        $this->view('categories/show_categories', ['page_title' => "Affichage des catégories", "categories" => $categories]);
    }

    public function add()
    {
        $this->view('categories/add_category', ['page_title' => "Ajouter une catégorie"]);
    }

}
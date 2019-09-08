<?php
class Categories extends Controller
{

    public function show()
    {
        $this->view('categories/show_categories', ['page_title' => "Affichage des catégories"]);
    }

    public function add()
    {
        $this->view('categories/add_category', ['page_title' => "Ajouter une catégorie"]);
    }

}
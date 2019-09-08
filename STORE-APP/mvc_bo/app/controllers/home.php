<?php

class Home extends Controller
{

    public function __construct()
    {
        $this->model('Product');
    }

    public function index($name = null)
    {
        $this->view('dashboard/dashboard', ['page_title' => 'Accueil']);
    }

    public function create($title = '', $desc = '')
    {
        // CREATE-INSERT:
        //$datas = Product::updateOrCreate([]);
        $datas = Product::updateOrCreate([
            'title' => $title,
            'description' => $desc,
        ]);

        // UPDATE: Remarque: Le champ "updated_at" se met à jour automatiquement, alors que "created_at" ne change pas!
        // Product::find(21)->update(['title' => 'durand@cheznous.fr']);
        // $del = Product::find(21);
        // $del->update(['title' => 'durand@cheznous.fr']);

        // DELETE:Supprimer une ligne en lui fournissant un ID dans la méthode "find()":
        //Product::find(22)->delete();
        //$deleteRows = Product::where('id', 21)->delete(); // retourne le nombre de ligne(s) supprimée(s)

        echo "<pre>";
        echo "Réussi: voici ce qui a été enregisterer dans la base de données:";
        echo '<br>';
        print_r(Product::all());
        echo '<br>';
        print_r(Product::find(25));
        echo "</>";

        // $this->view('dashboard/dashboard', ['title' => $one, 'desc' => $one]);
    }

}
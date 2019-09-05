<?php
function dbConnect()
{
    try
    {
        $db = new PDO('mysql:host=localhost;dbname=afpa0519_store_1;charset=utf8', 'root', '', [
            PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
            PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC, // PDO::FETCH_OBJ
        ]);
        return $db;
    } catch (Exception $e) {
        return die('Erreur MySQL : ' . $e->getMessage());
    }
}

function get_products()
{
    $pdo = dbConnect();

    // RECUPERER LES PRODUITS AVEC POUR CHACUN UN TABLEAU DE CATEGORIES AUQUEL IL EST ATTACHE:
    // $sql = "SELECT p.*, GROUP_CONCAT(DISTINCT c.cat_descr  ORDER BY c.cat_descr DESC SEPARATOR ' , ' ) AS categories , GROUP_CONCAT(DISTINCT c.cat_id  ORDER BY c.cat_descr DESC SEPARATOR ' , ' ) AS ids_cats
    // FROM st_products AS p
    // INNER JOIN st_products_has_st_categories AS pc ON p.pro_id = pc.st_products_pro_id
    // INNER JOIN  st_categories AS c ON pc.st_categories_cat_id = c.cat_id
    // GROUP BY p.pro_id, p.pro_title,p.pro_descr LIMIT 3";

    // SELECTIONNER DES PRODUITS APARETENANT A PLUSIEURS CATEGORIES:
    // $sql = "SELECT pc.st_products_pro_id, p.pro_id, p.pro_title, p.pro_subtitle3
    // FROM st_products_has_st_categories AS pc
    // JOIN st_products AS p ON p.pro_id = pc.st_products_pro_id
    // WHERE pc.st_categories_cat_id IN (1)
    // GROUP BY pc.st_products_pro_id";

    // SELECTIONNER DES SOUS-CATEGORIES APARETENANT A PLUSIEURS CATEGORIES PARENTS:
    $sql = "SELECT cc.st_categories_cat_id, c.cat_id, c.cat_descr
    FROM st_categories_main_has_st_categories AS cc
    JOIN st_categories AS c ON c.cat_id = cc.st_categories_cat_id
    WHERE cc.st_categories_main_cat_main_id IN (1)
    GROUP BY cc.st_categories_cat_id";

    $req = $pdo->prepare($sql);
    $req->execute();
    $products = $req->fetchAll();
    // $categoriesSTR = $products[0]['categories'];
    // $categoriesARR = explode(',', $categoriesSTR);

    echo "<pre>";
    print_r($products);
    echo "</pre>";

    return $products;
}

// ucfirst() - converts the first character of a string to uppercase.
// ucwords() - converts the first character of each word in a string to uppercase.
// strtoupper() - converts a string to uppercase.
// strtolower() - converts a string to lowercase.
// Example: ucfirst(strtolower("HELLO")) // => "Hello"

//============= VIEW ===========
$datas = get_products();

echo "<h1>LABELS:(" . count($datas) . ")</h1>";

$arr = array_map('arrProByCat', $datas);

function arrProByCat($data)
{
    $pdo = dbConnect();
    $id = intval($data['cat_id']);
    $sql = "SELECT pc.st_products_pro_id, p.*
    FROM st_products_has_st_categories AS pc
    JOIN st_products AS p ON p.pro_id = pc.st_products_pro_id
    WHERE pc.st_categories_cat_id IN ($id)
    GROUP BY pc.st_products_pro_id LIMIT 3";

    $req = $pdo->prepare($sql);
    $req->execute();
    $products = $req->fetchAll();

    return $products;
}

echo "<pre>";
print_r($arr); // Retourne un tableau de produits pour chaque sous-catégorie d'une catégorie MAIN(Parent)
echo "</pre>";
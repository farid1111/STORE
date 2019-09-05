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
    $sql = "SELECT p.*, GROUP_CONCAT(DISTINCT c.cat_descr  ORDER BY c.cat_descr DESC SEPARATOR ' , ' ) AS categories , GROUP_CONCAT(DISTINCT c.cat_id  ORDER BY c.cat_descr DESC SEPARATOR ' , ' ) AS ids_cats
    FROM st_products AS p
    INNER JOIN st_products_has_st_categories AS pc ON p.pro_id = pc.st_products_pro_id
    INNER JOIN  st_categories AS c ON pc.st_categories_cat_id = c.cat_id
    GROUP BY p.pro_id, p.pro_title,p.pro_descr LIMIT 3";

    // SELECTIONNER DES PRODUITS APARETENANT A PLUSIEURS CATEGORIES:
    // $sql = "SELECT pc.st_products_pro_id, p.pro_id, p.pro_title, p.pro_subtitle3
    // FROM st_products_has_st_categories AS pc
    // JOIN st_products AS p ON p.pro_id = pc.st_products_pro_id
    // WHERE pc.st_categories_cat_id IN (1)
    // GROUP BY pc.st_products_pro_id";

    // SELECTIONNER DES SOUS-CATEGORIES APARETENANT A PLUSIEURS CATEGORIES PARENTS:
    // $sql = "SELECT cc.st_categories_cat_id, c.cat_id, c.cat_descr
    // FROM st_categories_main_has_st_categories AS cc
    // JOIN st_categories AS c ON c.cat_id = cc.st_categories_cat_id
    // WHERE cc.st_categories_main_cat_main_id IN (1)
    // GROUP BY cc.st_categories_cat_id";

    $req = $pdo->prepare($sql);
    $req->execute();
    $products = $req->fetchAll();
    // $categoriesSTR = $products[0]['categories'];
    // $categoriesARR = explode(',', $categoriesSTR);
    
    function func ($product){
        $cats = array_combine(explode(',',$product['ids_cats']), explode(',',$product['categories']));   
        $a = array_map('trim', array_keys($cats));
        $b = array_map('trim', $cats);
        $cats = array_combine($a, $b);

        return [
            "id"=>$product['pro_id'],
            "title"=>$product['pro_title'],
            "sub1"=>$product['pro_subtitle1'],
            "sub2"=>$product['pro_subtitle2'],
            "sub3"=>$product['pro_subtitle3'],
            "img1"=>$product['pro_img_url_recto'],
            "img2"=>$product['pro_img_url_verso'],
            "desc"=>$product['pro_descr'],
            "price"=>$product['pro_price_euro'],
            "date"=>$product['pro_date'],
            "categories"=>$cats,
        ];  
    }
    $arr = array_map('func', $products);
    echo "<pre>";
    print_r($arr);
    echo "</pre>";

    return $arr;
}

// ucfirst() - converts the first character of a string to uppercase.
// ucwords() - converts the first character of each word in a string to uppercase.
// strtoupper() - converts a string to uppercase.
// strtolower() - converts a string to lowercase.
// Example: ucfirst(strtolower("HELLO")) // => "Hello"

//============= VIEW ===========
$datas = get_products();
// echo "<h1>LABELS:(" . count($datas) . ")</h1>";

// function arrProByCat($datas)
// {
//     $result;
//     foreach ($datas as $key => $data) {
//         $pdo = dbConnect();
//         $id = intval($data['cat_id']);
//         $sql = "SELECT pc.st_products_pro_id, p.pro_id, p.pro_title, p.pro_subtitle2
//     FROM st_products_has_st_categories AS pc
//     JOIN st_products AS p ON p.pro_id = pc.st_products_pro_id
//     WHERE pc.st_categories_cat_id IN ($id)
//     GROUP BY pc.st_products_pro_id LIMIT (7,10)";

//         $req = $pdo->prepare($sql);
//         $req->execute();
//         $products = $req->fetchAll();

//         // echo "<pre>";
//         // print_r($products[0]);
//         // echo "</pre>";
//         $products[] = ["main" => $data['cat_descr']];
//         $result[] = $products;
//     }
//     return $result;
// }

// $results = arrProByCat($datas);

// echo "<pre>";
// print_r($results);
// echo "</pre>";

// foreach ($results as $key => $result) {

//     echo "<pre>";
//     print_r("KEY: $key <br>");
//     print_r($result[$key]['main']);
//     echo "</pre>";

//     echo <<<HTML
//             <div>

//                 <p>MAIN: <strong>{$result['main']}</p>
//                 <p>TITLE: <strong>{$result[$key][$key]}</p>

//             </div>
// HTML;
// }

$names = ["RUBIS", "ESPAGNE", "CACAO SAMPAKA", "ARTISANAL"];
$id = [44, 12, 48, 1];

$result = array_combine($id, $names);
echo "<pre>";
print_r($result);
echo "</pre>";

foreach($result as $key=>$one){
    echo "<a style='margin-right: 20px' href='?id=$key'>$one</a>";
}

// $result = array_merge($names, $id);



// $categories = [
//     ["name"=> "RUBIS", "id"=>44],
//     ["name"=> "ESPAGNE", "id"=>12],
//     ["name"=> "CACAO SAMPAKA", "id"=>48],
//     ["name"=> "ARTISANAL", "id"=>1],

// ]
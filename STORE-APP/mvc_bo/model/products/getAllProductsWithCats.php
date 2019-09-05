<?php

function get_products_with_cats()
{
    $pdo = dbConnect();

    // RECUPERER LES PRODUITS AVEC POUR CHACUN UN TABLEAU DE CATEGORIES AUQUEL IL EST ATTACHE:
    $sql = "SELECT p.*, GROUP_CONCAT(DISTINCT c.cat_descr  ORDER BY c.cat_descr DESC SEPARATOR ' , ' ) AS categories , GROUP_CONCAT(DISTINCT c.cat_id  ORDER BY c.cat_descr DESC SEPARATOR ' , ' ) AS ids_cats
    FROM st_products AS p
    INNER JOIN st_products_has_st_categories AS pc ON p.pro_id = pc.st_products_pro_id
    INNER JOIN  st_categories AS c ON pc.st_categories_cat_id = c.cat_id
    GROUP BY p.pro_id, p.pro_title,p.pro_descr LIMIT 3";

    $req = $pdo->prepare($sql);
    $req->execute();
    $products = $req->fetchAll();
 
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

    return $arr;
}
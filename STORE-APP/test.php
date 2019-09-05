<?php

// RECUPERER LES PRODUITS AVEC POUR CHACUN UN TABLEAU DE CATEGORIES AUQUEL IL EST ATTACHE:
$sql = "SELECT p.*, GROUP_CONCAT(DISTINCT c.cat_descr ORDER BY c.cat_descr DESC SEPARATOR ', ') AS categories
FROM st_products AS p
INNER JOIN st_products_has_st_categories AS pc ON p.pro_id = pc.st_products_pro_id
INNER JOIN  st_categories AS c ON pc.st_categories_cat_id = c.cat_id
GROUP BY p.pro_id, p.pro_title,p.pro_descr";

// SELECTIONNER DES PRODUITS APARETENANT A PLUSIEURS CATEGORIES:
//On a des prpoduits (1), on a des catégories(3), on veut récuperer tout les produits d'une certaine catégorie(2)
// (1) - st_products Table: pro_id ,pro_title
// (2) - st_products_has_st_categories Table: st_products_pro_id,st_categories_cat_id
// (3) - st_categories Table:cat_id,cat_descr

$prosByCat = "SELECT pc.st_products_pro_id, p.pro_title
FROM st_products_has_st_categories AS pc
JOIN st_products AS p ON p.pro_id = pc.st_products_pro_id
WHERE pc.st_categories_cat_id IN (1,2,3)
GROUP BY pc.st_products_pro_id
HAVING COUNT(DISTINCT pc.st_categories_cat_id) = 3";

// SELECTIONNER DES SOUS-CATEGORIES APARETENANT A PLUSIEURS CATEGORIES PARENTS:
//On a des sous-catégorie (1), on a des catégories parent(3), on veut récuperer tout les sous-catégories d'une certaine catégorie parent(2)
// (1) - st_categories Table: cat_id ,cat_descr =sous-catégories
// (2) - st_categories_main_has_st_categories Table: st_categories_cat_id,st_categories_main_cat_main_id
// (3) - st_categories_main Table:    cat_main_id, cat_main_descr =catégorie parent

$catsByMain = "SELECT cc.st_categories_cat_id, c.cat_id, c.cat_descr
    FROM st_categories_main_has_st_categories AS cc
    JOIN st_categories AS c ON c.cat_id = cc.st_categories_cat_id
    WHERE cc.st_categories_main_cat_main_id IN (1,2,3)
    GROUP BY cc.st_categories_cat_id
    HAVING COUNT(DISTINCT cc.st_categories_main_cat_main_id) = 3";
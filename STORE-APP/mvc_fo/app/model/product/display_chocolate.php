<?php
function display_chocolate($id){
   global $pdo;
   // var_dump ($pdo);
   try {
      $query= "SELECT * FROM `st_products`,st_products_has_st_categories,st_categories 
                  WHERE pro_id=st_products_pro_id 
                  AND st_categories_cat_id=cat_id
                  AND pro_id=:id";
      // die($query);

      //ENVOI de la requête
      $req = $pdo->prepare($query);
      //INITIALISATION des paramètres
      $req->bindParam(":id", $id, PDO::PARAM_INT);
      //EXÉCUTION de la requête
      $req->execute();
      //RÉCUPÉRATION de tous les résultats
      $req->setFetchMode(PDO::FETCH_ASSOC);
      $data = $req->fetch();
      // var_dump($data);exit;
      $req->closeCursor();
      //RETOUR de tous les articles sélectionnés
      return $data;
    }catch (Exception $e) {
      // die("Erreur MySQL :". utf8_encode($e->getMessage()));
      return false;
   }
}
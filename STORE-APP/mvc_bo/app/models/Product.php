<?php

use Illuminate\Database\Eloquent\Model as Eloquent;

// Associer cette class "Product" à la Table "st_products":
// la class Product est un Model car il hérite de Eloquent\Model
class Product extends Eloquent
{
    // Les champs de la table à remplir:
    public $name;
    // Par défaut Eloquent tient à jour des colonnes "created_at" et "updated_at" dans la table. Comme nous ne les avons pas prévues, pour désactiver cette action on est obligé de mettre à "false" la propriété "timestamps"
    public $timestamps = false; //On peut désactiver les champs "created_at" & "updated_at" qui sont par défaut activé.

    // On renseigne le nom de la table associée au modèle Eloquent
    // Si on ne renseigne pas la propriété "$table" Laravel va déduire le nom de la table à partir du nom du modèle, ici Product.
    // Autrement dit dans notre cas on pourrait éviter cette ligne de code.
    // const CREATED_AT = 'creation_date';
    // const UPDATED_AT = 'last_update';
    protected $table = 'st_products';
    protected $primaryKey = 'pro_id';
    protected $fillable = ['pro_title', 'pro_descr'];

}
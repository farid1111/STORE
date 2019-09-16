<?php

use Illuminate\Database\Eloquent\Model as Eloquent;

class Product extends Eloquent
{
    public $name;
    public $timestamps = false; 

    protected $table = 'st_products';
    protected $primaryKey = 'pro_id';
    protected $fillable = [
                            'pro_title',
                            'pro_subtitle1', 
                            'pro_subtitle2', 
                            'pro_img_url_recto', 
                            'pro_img_url_verso', 
                            'pro_descr', 
                            'pro_price_euro'
                        ];

}
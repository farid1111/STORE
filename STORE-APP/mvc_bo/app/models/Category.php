<?php

use Illuminate\Database\Eloquent\Model as Eloquent;

class Category extends Eloquent
{
    public $name;
    public $timestamps = false;

    protected $table = 'st_categories';
    protected $primaryKey = 'cat_id';
    protected $fillable = ['cat_id', 'cat_descr', 'is_exist'];

}
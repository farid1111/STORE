<?php

use Illuminate\Database\Eloquent\Model as Eloquent;

class Customer extends Eloquent
{
    public $name;
    public $timestamps = false;

    protected $table = 'st_customers';
    protected $primaryKey = 'cus_id';
    protected $fillable = ['cus_civility', 'cus_lastname', 'cus_firstname', 'cus_mail', 'cus_password'];

}
<?php
class Details extends Controller
{

    public function __construct()
    {
        $this->model('Product');
    }

    public function details($id = null)
    {

        $oneProduct = Product::find($id);
        $this->view('home/details', ['one' => $oneProduct]);
    }
}
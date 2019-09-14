<?php
class Ajax extends Controller
{
    public function __construct()
    {
        $this->model('Category');
        $this->model('Product');
    }
    //========================== ADD CATEGORY ====================================
    public function categories_add($param = null)
    {
        if (isset($_POST["category"]) && !empty($_POST["category"])) {
            $action = $_POST["category"];
            // print_r($action);

            $datas = Category::updateOrCreate([
                'cat_descr' => $action,
            ]);

            echo $datas;

        } else {
            echo ["error" => "ERROR"];
        }
    }

    //========================== DELETE CATEGORY ====================================
    public function categories_delete($param = null)
    {
        if (isset($_POST["cat_id"]) && !empty($_POST["cat_id"])) {
            $action = $_POST["cat_id"];
            $delete = Category::find($action)->delete();
            echo $delete;

        } else {
            echo ["error" => "ERROR"];
        }
    }

    //========================== SHOW PRODUCTS ====================================
    public function products_show($param = null)
    {
        if (isset($_POST["pro_id"]) && !empty($_POST["pro_id"])) {
            $action = $_POST["pro_id"];
            $product = Product::find($action);
            echo $product;
        } else {
            echo ["error" => "ERROR"];
        }
    }

}
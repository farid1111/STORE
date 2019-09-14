<?php
class Ajax extends Controller
{

    public function __construct()
    {
        $this->model('Category');
    }

    //========================== ADD CATEGORY ====================================

    public function categories_add($param = null)
    {
        if (isset($_POST["category"]) && !empty($_POST["category"])) {
            $action = $_POST["category"];
            print_r($action);

            $datas = Category::updateOrCreate([
                'cat_descr' => $action,
            ]);

            echo "$datas";

        } else {
            echo json_encode(["error" => "ERROR"]);
        }
    }

    //========================== DELETE CATEGORY ====================================
    public function categories_delete($param = null)
    {
        if (isset($_POST["cat_id"]) && !empty($_POST["cat_id"])) {
            $action = $_POST["cat_id"];
            print_r($action);
            $delete = Category::find($action)->delete();
            echo $delete;

        } else {
            echo json_encode(["error" => "ERROR"]);
        }
    }

}
<?php
class Ajax extends Controller
{
    public function __construct()
    {
        $this->model('Category');
        $this->model('Product');
        $this->model('Customer');
    }
    //========================== ADD CATEGORY ====================================
    public function categories_add($param = null)
    {
        if (isset($_POST["cat_descr"]) && !empty($_POST["cat_descr"])) {
            $action = $_POST["cat_descr"];
            $datas = Category::updateOrCreate([
                'cat_descr' => $action,
            ]);
            // Return last insert row:
            echo $datas;
        } else {
            echo json_encode(["message" => "ERROR!"]);
        }
    }

    //========================== DELETE CATEGORY =================================
    public function categories_delete($param = null)
    {
        if (isset($_POST["cat_id"]) && !empty($_POST["cat_id"])) {
            $action = $_POST["cat_id"];
            $delete = Category::find($action)->delete();
            $total = Category::count();
            echo json_encode(["total" => $total, "isDeleted" => $delete]);

        } else {
            echo json_encode(["error" => "ERROR"]);
        }
    }

    //========================== UPDATE CATEGORY =================================

    public function categories_update($param = null)
    {
        if (isset($_POST["cat_id"]) && !empty($_POST["cat_id"])) {
            $action = $_POST["cat_id"];
            $newValue = $_POST["cat_descr"];
            $update = Category::find($action)->update(['cat_descr' => $newValue]);
            echo $update;

        } else {
            echo json_encode(["error" => "ERROR"]);
        }
    }

    //========================== SHOW PRODUCT DETAILS ============================
    public function products_show($param = null)
    {
        if (isset($_POST["pro_id"]) && !empty($_POST["pro_id"])) {
            $action = $_POST["pro_id"];
            $product = Product::find($action);
            echo $product;
        } else {
            echo json_encode(["error" => "ERROR"]);
        }
    }

    //========================== ADD PRODUCT =====================================
    public function products_add($param = null)
    {
        if (isset($_POST["pro_title"]) && !empty($_POST["pro_title"])) {
            $action = $_POST["pro_title"];
            $product = Product::updateOrCreate([
                'pro_title' => $_POST["pro_title"],
                'pro_subtitle1' => $_POST["pro_subtitle1"],
                'pro_subtitle2' => $_POST["pro_subtitle2"],
                'pro_img_url_recto' => $_POST["pro_img_url_recto"],
                'pro_img_url_verso' => $_POST["pro_img_url_verso"],
                'pro_descr' => $_POST["pro_descr"],
                'pro_price_euro' => $_POST["pro_price_euro"],
            ]);

            echo $product;

        } else {
            echo json_encode(["error" => "ERROR"]);
        }
    }
    //========================== DELETE PRODUCT =====================================
    public function products_delete($param = null)
    {
        if (isset($_POST["pro_id"]) && !empty($_POST["pro_id"])) {
            $action = $_POST["pro_id"];
            $delete = Product::find($action)->delete();
            $total = Product::count();
            echo json_encode(["total" => $total, "isDeleted" => $delete]);

        } else {
            echo json_encode(["error" => "ERROR"]);
        }
    }
    //========================== UPDATE PRODUCT =====================================
    public function products_update($param = null)
    {
        if (isset($_POST["pro_id"]) && !empty($_POST["pro_id"])) {
            $action = $_POST["pro_id"];

            $update = Product::find($action)->update([
                'pro_title' => $_POST["pro_title"],
                'pro_subtitle1' => $_POST["pro_subtitle1"],
                'pro_subtitle2' => $_POST["pro_subtitle2"],
                'pro_img_url_recto' => $_POST["pro_img_url_recto"],
                'pro_img_url_verso' => $_POST["pro_img_url_verso"],
                'pro_descr' => $_POST["pro_descr"],
                'pro_price_euro' => $_POST["pro_price_euro"],
            ]);

            echo $update;

        } else {
            echo json_encode(["error" => "ERROR"]);
        }
    }

    //========================== ADD CUSTOMER ====================================
    public function customers_add($param = null)
    {
        if (isset($_POST["cus_lastname"]) && !empty($_POST["cus_lastname"])) {
            $customer = Customer::updateOrCreate([
                'cus_civility' => $_POST["cus_civility"],
                'cus_lastname' => $_POST["cus_lastname"],
                'cus_firstname' => $_POST["cus_firstname"],
                'cus_mail' => $_POST["cus_mail"],
                'cus_password' => md5($_POST["cus_password"]),
            ]);
            echo $customer;
        } else {
            echo json_encode(["error" => "ERROR"]);
        }
    }

    //========================== DELETE CUSTOMER ====================================
    public function customers_delete($param = null)
    {
        if (isset($_POST["cus_id"]) && !empty($_POST["cus_id"])) {
            $action = $_POST["cus_id"];
            $delete = Customer::find($action)->delete();
            $total = Customer::count();

            echo json_encode(["total" => $total, "isDeleted" => $delete]);

        } else {
            echo json_encode(["error" => "ERROR"]);
        }
    }
    //========================== UPDATE CUSTOMER ====================================
    public function customers_update($param = null)
    {
        if (isset($_POST["cus_id"]) && !empty($_POST["cus_id"])) {
            $action = $_POST["cus_id"];

            $update = Customer::find($action)->update([
                'cus_civility' => $_POST["cus_civility"],
                'cus_lastname' => $_POST["cus_lastname"],
                'cus_firstname' => $_POST["cus_firstname"],
                'cus_mail' => $_POST["cus_mail"],
                'cus_password' => md5($_POST["cus_password"]),
            ]);

            echo $update;

        } else {
            echo json_encode(["error" => "ERROR"]);
        }
    }
}
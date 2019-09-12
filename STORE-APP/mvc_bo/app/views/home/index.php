<?='<strong>TO_SRC FUNCTION: </strong>' . to_src('1') . '<br>'?>
<?='<strong>MODELS PATH: </strong>' . MODELS_PATH . '<br>'?>
<?='<strong>CONTROLLERS PATH: </strong>' . CONTROLLERS_PATH . '<br>'?>
<?='<strong>VIEWS PATH: </strong>' . VIEWS_PATH . '<br>'?>
<?='<strong>APP PATH: </strong>' . APP_PATH . '<br>'?>
<?='<strong>CONFIG PATH: </strong>' . CONFIG_PATH . '<br>'?>
<?='<strong>MVC PATH: </strong>' . MVC_PATH . '<br>'?>
<?='<strong>WWW PUBLIC: </strong>' . WWW_PUBLIC . '<br>'?>
<?='<strong>WWW_MVC: </strong>' . WWW_MVC . '<br>'?>
<?='<strong>ROOT FUNCTION: </strong>' . root('1') . '<br>'?>
<?='<strong>TO_APP FUNCTION:</strong>' . to_app('views/home/index.php') . '<br>'?>
<!-- href="/STORE/STORE-APP/mvc_bo2/public/home/index3" -->
<a href="/store/store-app/mvc_bo2/public/home/index3">to Dashboard</a>

<?php foreach ($data['products'] as $product): ?>

<a href="">
    <p><?=$product->pro_title?></p>
</a>

<?php endforeach;?>
<?php include 'header.inc.php';?>
<!-- START MENU -->
<div class="app-header white box-shadow">
    <div class="navbar navbar-toggleable-sm flex-row align-items-center box-shadow">
        <a data-toggle="collapse" data-target="#navbar-5" class="navbar-item hidden-md-up mr-3">
            <i class="material-icons">menu</i>
        </a>
        <!-- brand -->
        <a class="navbar-brand" href="<?=WWW_PUBLIC . '/home'?>">
            <img src="<?=to_src('assets/images/logo.png')?>" alt="profile image">
            <span class="hidden-folded inline">ADMIN</span>
        </a>
        <!-- / brand -->
        <!-- navbar collapse -->
        <div class="collapse navbar-collapse justify-content-center" id="navbar-5">
            <!-- link and dropdown -->
            <ul class="nav navbar-nav navbar-nav-inline text-center pull-left m-r text-warn-hover">
                <li class="nav-item mx-2">
                    <a class="nav-link btn menuChoco" href="<?=WWW_PUBLIC . '/products'?>">
                        <span class="nav-text">
                            <i class="material-icons">shopping_basket</i>
                            <span class="text-xs">Produits</span>
                        </span>
                    </a>
                </li>
                <li class="nav-item mx-2">
                    <a class="nav-link btn menuChoco" href="<?=WWW_PUBLIC . '/categories'?>">
                        <span class="nav-text">
                            <i class="material-icons">local_play</i>
                            <span class="text-xs">Catégories</span>
                        </span>
                    </a>
                </li>
                <li class="nav-item mx-2">
                    <a class="nav-link btn menuChoco" href="<?=WWW_PUBLIC . '/customers'?>">
                        <span class="nav-text">
                            <i class="material-icons">person_pin</i>
                            <span class="text-xs">Clients</span>
                        </span>
                    </a>

                </li>
            </ul>
            <!-- / link and dropdown -->

        </div>
        <!-- / navbar collapse -->
        <!-- nabar right -->
        <ul class="nav navbar-nav flex-row align-items-center ml-auto">
            <li class="nav-item dropdown">
                <a class="nav-link text-ellipsis" href="" data-toggle="dropdown">
                    <span class="avatar w-32">
                        <img src="<?=to_src('assets/images/a3.jpg')?>" alt="...">
                        <i class="on b-white bottom"></i>
                    </span>
                    <span class="hidden-md-down nav-text m-l-sm text-left">
                        <span class="_500">Rose Martin</span>
                        <small class="text-muted">Administrator</small>
                    </span>
                </a>
                <div class="dropdown-menu dropdown-menu-scale pull-right">
                    <a class="dropdown-item" ui-sref="app.page.profile">
                        <span>Profile</span>
                    </a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" ui-sref="access.signin">Déconnexion</a>
                </div>
            </li>
        </ul>
        <!-- / navbar right -->

    </div>
</div>
<!-- END MENU -->

<!-- START SWITCHER -->
<div id="switcher">
    <div class="switcher box-color black lt" id="sw-theme" ui-class="active">
        <a href="" ui-toggle-class="active" target="#sw-theme" class="box-color black lt text-color sw-btn">
            <i class="fa fa-gear text-white"></i>
        </a>
        <div class="box-header">
            <h2>Administration</h2>
        </div>
        <div class="box-divider"></div>
        <div class="box-body">
            <p>Ajouter:</p>
            <div class="">
                <div class=" mb-2 w-100">
                    <a href="<?=WWW_PUBLIC . '/products/add'?>" class="btn btn-md white w-100">
                        <span class="pull-left m-r-sm">
                            <i class="fa fa-plus "></i>
                        </span>
                        <span class="clear text-left l-h-1x">
                            <b class="text-sm text-u-c m-b-xs">Produit</b>
                        </span>
                    </a>
                </div>

                <div class=" mb-2">
                    <a href="<?=WWW_PUBLIC . '/categories/add'?>" class="btn btn-md white w-100">
                        <span class="pull-left m-r-sm">
                            <i class="fa fa-plus "></i>
                        </span>
                        <span class="clear text-left l-h-1x">
                            <b class="text-sm text-u-c m-b-xs">Catégorie</b>
                        </span>
                    </a>
                </div>

                <div class="mb-2">
                    <a href="<?=WWW_PUBLIC . '/customers/add'?>" class="btn btn-md white w-100">
                        <span class="pull-left m-r-sm">
                            <i class="fa fa-plus "></i>
                        </span>
                        <span class="clear text-left l-h-1x">
                            <b class="text-sm text-u-c m-b-xs">Compte</b>
                        </span>
                    </a>
                </div>
            </div>

            <p>Themes:</p>
            <div data-target="bg" class="row no-gutter text-u-c text-center _600 clearfix">
                <label class="p-a col-sm-6 light text-black pointer m-0">
                    <input type="radio" name="theme" value="" hidden="">
                    Light
                </label>
                <label class="p-a col-sm-6 grey pointer m-0">
                    <input type="radio" name="theme" value="grey" hidden="" class="has-value">
                    Grey
                </label>
                <label class="p-a col-sm-6 dark pointer m-0">
                    <input type="radio" name="theme" value="dark" hidden="" class="has-value">
                    Dark
                </label>
                <label class="p-a col-sm-6 black pointer m-0">
                    <input type="radio" name="theme" value="black" hidden="" class="has-value">
                    Black
                </label>
            </div>
        </div>
    </div>


</div>
<!-- END SWITCHER -->

<div style="padding-top:100px;">
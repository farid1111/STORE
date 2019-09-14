<?php include APP_PATH . '/views/layout/menu.inc.php';?>
<!-- ############ LAYOUT START-->
<!-- content -->
<div id="content" class="app-content box-shadow-z0" role="main">


    <div ui-view class="app-body" id="view">

        <!-- ############ PAGE START-->
        <div class="padding">
            <div class="row d-flex justify-content-center ">
                <div class="col-sm-12 col-md-8">
                    <a class="md-btn md-flat m-b-sm px-3" href="<?=WWW_PUBLIC . '/categories/show'?>">
                        <i class="fa fa-chevron-left mr-2"></i>
                        Voir les Catégories
                    </a>
                    <form ui-jp="parsley" name="cat" id="cat" action="#" method="post">
                        <div class="box padding">
                            <div class="box-header mb-3">
                                <h2>Ajout d'une Catégorie</h2>
                            </div>
                            <div class="box-divider m-0"></div>
                            <div class="box-body">
                                <div class="form-group row">
                                    <label class="col-sm-2 form-control-label">Description</label>
                                    <div class="col-sm-10">
                                        <input name="category" id="input-category" type="text" class="form-control" placeholder="Le nom de la catégorie" data-parsley-range="[4, 45]" required>
                                    </div>
                                </div>
                            </div>
                            <div class=" p-a text-right">
                                <button type="submit" class="btn text-dark warn pointer add_cat">Ajouter</button>

                            </div>
                        </div>
                    </form>
                </div>

            </div>


        </div>

        <!-- ############ PAGE END-->

    </div>
</div>
<!-- / -->
<!-- ############ LAYOUT END-->

<?php include APP_PATH . '/views/layout/footer.inc.php';?>
<?php include APP_PATH . '/views/layout/scripts.inc.php';?>
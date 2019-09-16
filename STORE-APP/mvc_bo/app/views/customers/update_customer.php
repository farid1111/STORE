<?php include APP_PATH . '/views/layout/menu.inc.php';?>
<!-- ############ LAYOUT START-->
<!-- content -->
<div id="content" class="app-content box-shadow-z0" role="main">


    <div ui-view class="app-body" id="view">

        <!-- ############ PAGE START-->
        <div class="padding">
            <div class="row d-flex justify-content-center ">
                <div class="col-sm-12 col-md-8">
                    <a class="md-btn md-flat m-b-sm px-3" href="<?=WWW_PUBLIC . '/customers/show'?>">
                        <i class="fa fa-chevron-left mr-2"></i>
                        Voir les Comptes
                    </a>
                    <form id="customer-update-form" action="<?=WWW_PUBLIC . '/ajax/customers_update'?>" ui-jp="parsley">
                        <div class="box padding">
                            <div class="box-header mb-3">
                                <h2>Modifier un compte Client</h2>
                            </div>
                            <div class="box-divider m-0"></div>
                            <div class="box-body">
                                <p class="text-muted">Veuillez remplir tous les champs</p>
                                <div class="form-group row align-items-baseline">
                                    <label class="col-sm-2 form-control-label">Sexe</label>
                                    <p class="">
                                        <label class="md-check ml-2">
                                            <input type="radio" name="cus_civility" checked class="up-cus-civility-0 has-value" value="0">
                                            <i class="pink no-icon"></i>
                                            Féminin
                                        </label>
                                    </p>
                                    <p class="ml-4">
                                        <label class="md-check">
                                            <input type="radio" name="cus_civility" class="up-cus-civility-1 has-value" value="1">
                                            <i class="blue no-icon"></i>
                                            Masculin
                                        </label>
                                    </p>
                                </div>

                                <div class="form-group row">
                                    <label class="col-sm-2 form-control-label">Nom</label>
                                    <div class="col-sm-10">
                                        <input autofocus name="cus_lastname" type="text" class="up-cus-lastname form-control" placeholder="Entrez un nom" data-parsley-range="[1, 45]" required>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-sm-2 form-control-label">Prénom</label>
                                    <div class="col-sm-10">
                                        <input name="cus_firstname" type="text" class="up-cus-firstname form-control" placeholder="Entrez un prénom" data-parsley-range="[1, 45]" required>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-sm-2 form-control-label">Email</label>
                                    <div class="col-sm-10">
                                        <input name="cus_mail" type="email" class="up-cus-mail form-control" required="" placeholder="Entrez une adresse email" data-parsley-id="56" data-parsley-range="[4, 80]">
                                    </div>
                                </div>


                                <div class="row m-b justify-content-end">
                                    <div class="col-sm-5">
                                        <label>Mot de passe</label>
                                        <input name="cus_password" type="password" class="form-control" required="" placeholder="Entrez un mot de passe" id="pwd" data-parsley-id="8" data-parsley-range="[4, 32]" />
                                    </div>
                                    <div class=" col-sm-5">
                                        <label>Confirmer</label>
                                        <input type="password" class="cus-password-2 form-control" data-parsley-equalto="#pwd" required="" placeholder="Confirmez le mot de passe" data-parsley-id="10" data-parsley-range="[4, 32]" />
                                    </div>
                                </div>
                            </div>
                            <div class=" p-a text-right">
                                <input type="submit" class="btn text-dark warn pointer" value="Modifier">
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
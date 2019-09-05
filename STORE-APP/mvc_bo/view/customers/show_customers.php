<?php include '../layout/menu.inc.php';?>

<!--START CONTENT -->
<div class="d-flex justify-content-center">

    <div class="col-xs-12 col-sm-12 col-md-8">
        <div class="d-flex justify-content-end mb-2">
            <a href="<?=root('view/customers/addCustomer.php')?>" class="btn btn-md text-dark warn">
                <span class="pull-left m-r-sm">
                    <i class="fa fa-plus "></i>
                </span>
                <span class="clear text-left l-h-1x">
                    <b class="text-sm m-b-xs">Ajouter un Compte</b>
                </span>
            </a>
        </div>
        <div class="box padding">
            <div class="box-header">
                <h3 class=" d-flex align-items-center">
                    <span class="text-u-c text-md">Clients</span>
                    <span class="label rounded ml-2 brown totalNumber"></span>
                </h3>
                <small>Tous nos clients</small>
            </div>
            <div class="box-divider m-0"></div>
            <ul class="list no-border p-b totalElements">
                <!-- START FOREACH LOOP -->
                <li class="list-item">
                    <a herf="" class="list-left">
                        <span class="w-40 avatar">
                            <img src="<?=root('public/assets/images/a4.jpg')?>" alt="...">
                            <i class="on b-white bottom"></i>
                        </span>
                    </a>
                    <div class="list-body">
                        <div class="m-y-sm pull-right">
                            <a href="" class="btn btn-sm  white b-info">
                                <i class="fa fa-link"></i>
                            </a>
                            <a href="" class="btn btn-sm  white b-danger">
                                <i class="fa fa-trash"></i>
                            </a>
                            <a href="" class="btn btn-sm white b-success">
                                <i class="fa fa-pencil "></i>
                            </a>
                        </div>
                        <div>
                            <span>Anabelle</span>
                            <small class="block"><i class="fa fa-phone m-r-sm text-muted"></i>(021) 9000 9877</small>
                        </div>
                    </div>
                </li>
                <!-- START FOREACH LOOP -->

                <!-- START REMOVE -->
                <li class="list-item">
                    <a herf="" class="list-left">
                        <span class="w-40 avatar">
                            <img src="<?=root('public/assets/images/a5.jpg')?>" alt="...">
                            <i class="busy b-white bottom"></i>
                        </span>
                    </a>
                    <div class="list-body">
                        <div class="m-y-sm pull-right">
                            <a href="" class="btn btn-sm  white b-info">
                                <i class="fa fa-link"></i>
                            </a>
                            <a href="" class="btn btn-sm  white b-danger">
                                <i class="fa fa-trash"></i>
                            </a>
                            <a href="" class="btn btn-sm white b-success">
                                <i class="fa fa-pencil "></i>
                            </a>
                        </div>
                        <div>
                            <span>Fafa</span>
                            <small class="block"><i class="fa fa-phone m-r-sm text-muted"></i>(021) 9000 9877</small>
                        </div>
                    </div>
                </li>

                <li class="list-item">
                    <a herf="" class="list-left">
                        <span class="w-40 avatar">
                            <img src="<?=root('public/assets/images/a6.jpg')?>" alt="...">
                            <i class="away b-white bottom"></i>
                        </span>
                    </a>
                    <div class="list-body">
                        <div class="m-y-sm pull-right">
                            <a href="" class="btn btn-sm  white b-info">
                                <i class="fa fa-link"></i>
                            </a>
                            <a href="" class="btn btn-sm  white b-danger">
                                <i class="fa fa-trash"></i>
                            </a>
                            <a href="" class="btn btn-sm white b-success">
                                <i class="fa fa-pencil "></i>
                            </a>
                        </div>
                        <div>
                            <span>Marijuata</span>
                            <small class="block"><i class="fa fa-phone m-r-sm text-muted"></i>(021) 9000 9877</small>
                        </div>
                    </div>
                </li>

                <li class="list-item">
                    <a herf="" class="list-left">
                        <span class="w-40 avatar">
                            <img src="<?=root('public/assets/images/a7.jpg')?>" alt="...">
                            <i class="on b-white bottom"></i>
                        </span>
                    </a>
                    <div class="list-body">
                        <div class="m-y-sm pull-right">
                            <a href="" class="btn btn-sm  white b-info">
                                <i class="fa fa-link"></i>
                            </a>
                            <a href="" class="btn btn-sm  white b-danger">
                                <i class="fa fa-trash"></i>
                            </a>
                            <a href="" class="btn btn-sm white b-success">
                                <i class="fa fa-pencil "></i>
                            </a>
                        </div>
                        <div>
                            <span>Gwendalou</span>
                            <small class="block"><i class="fa fa-phone m-r-sm text-muted"></i>(021) 9000 9877</small>
                        </div>
                    </div>
                </li>

                <!-- END REMOVE -->

            </ul>
        </div>
    </div>
</div>
<!--ENDCONTENT -->

<?php include '../layout/footer.inc.php';?>
<?php $myScript = MY_SCRIPT?>
<?php include '../layout/scripts.inc.php';?>
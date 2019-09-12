<?php include APP_PATH . '/views/layout/menu.inc.php';?>
<!--START CONTENT -->
<div class="d-flex justify-content-center">

    <div class="col-xs-12 col-sm-12 col-md-8">
        <div class="d-flex justify-content-end mb-2">
            <a href="<?=WWW_PUBLIC . '/customers/add'?>" class="btn btn-md text-dark warn">
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
                <?php foreach ($data['customers'] as $customer): ?>
                <li class="list-item">
                    <a herf="" class="list-left">
                        <span class="w-40 avatar">
                            <img src="<?=to_src('assets/images/a4.jpg')?>" alt="...">
                            <i class="on b-white bottom"></i>
                        </span>
                    </a>
                    <div class="list-body">
                        <div class="m-y-sm pull-right">

                            <a href="" class="btn btn-sm  white b-info" data-toggle="tooltip" data-placement="top" title="voir">
                                <i class="fa fa-link"></i>
                            </a>

                            <a href="" class="btn btn-sm  white b-danger" data-toggle="tooltip" data-placement="top" title="supprimer">
                                <i class="fa fa-trash"></i>
                            </a>

                            <a href="" class="btn btn-sm white b-success" data-toggle="tooltip" data-placement="top" title="modifier">
                                <i class="fa fa-pencil "></i>
                            </a>
                        </div>
                        <div>
                            <span class="label brown-300"><?=$customer['cus_civility'] === 1 ? 'H' : 'F';?></span>
                            <span class=""><?=$customer['cus_lastname']?> <?=$customer['cus_firstname']?></span>
                            <small class="block"><i class="fa fa-envelope m-r-sm text-muted"></i><?=$customer['cus_mail']?></small>
                        </div>
                    </div>
                </li>
                <?php endforeach;?>
                <!-- START FOREACH LOOP -->
            </ul>
        </div>
    </div>
</div>
<!--ENDCONTENT -->

<?php include APP_PATH . '/views/layout/footer.inc.php';?>
<?php include APP_PATH . '/views/layout/scripts.inc.php';?>
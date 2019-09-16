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
                    <span class="label rounded ml-2 brown total-customers"><?=$data['total']?></span>
                </h3>
                <small>Tous nos clients</small>
            </div>
            <div class="box-divider m-0"></div>
            <ul class="list no-border p-b totalElements">
                <!-- START FOREACH LOOP -->
                <?php foreach ($data['customers'] as $customer): ?>
                <li class="list-item ">
                    <span data-toggle="modal" data-target="#m-a-f-cus-details">
                        <a data-firstname="<?=$customer['cus_firstname']?>" data-lastname="<?=$customer['cus_lastname']?>" data-mail="<?=$customer['cus_mail']?>" class="list-left show-cus-details">
                            <span class="w-40 avatar">
                                <img src="<?=to_src('assets/images/a3.jpg')?>" alt="...">
                                <i class="on b-white bottom"></i>
                            </span>
                        </a>
                    </span>
                    <div class="list-body">
                        <div class="m-y-sm pull-right">

                            <span data-toggle="modal" data-target="#m-a-f-cus-details">
                                <a data-firstname="<?=$customer['cus_firstname']?>" data-lastname="<?=$customer['cus_lastname']?>" data-mail="<?=$customer['cus_mail']?>" class="show-cus-details btn btn-sm  white b-info" data-toggle="tooltip" data-placement="top" title="voir">
                                    <i class="fa fa-link"></i>
                                </a>
                            </span>

                            <span data-toggle="modal" data-target="#m-a-f-cus-delete">
                                <a data-link="<?=WWW_PUBLIC . '/ajax/customers_delete'?>" data-id="<?=$customer['cus_id']?>" data-firstname="<?=$customer['cus_firstname']?>" data-lastname="<?=$customer['cus_lastname']?>" class="customer-delete btn btn-sm  white b-danger" data-toggle="tooltip"
                                    data-placement="top" title="supprimer">
                                    <i class="fa fa-trash"></i>
                                </a>
                            </span>

                            <a href="<?=WWW_PUBLIC . '/customers/update'?>" data-id="<?=$customer['cus_id']?>" data-civility="<?=$customer['cus_civility']?>" data-lastname="<?=$customer['cus_lastname']?>" data-firstname="<?=$customer['cus_firstname']?>" data-mail="<?=$customer['cus_mail']?>"
                                data-mail="<?=$customer['cus_mail']?>" data-password="<?=$customer['cus_password']?>" class="customers-update btn btn-sm white b-success" data-toggle="tooltip" data-placement="top" title="modifier">
                                <i class="fa fa-pencil "></i>
                            </a>
                        </div>
                        <div>
                            <span class="label <?=$customer['cus_civility'] === 1 ? 'blue' : 'red';?>"><?=$customer['cus_civility'] === 1 ? 'H' : 'F';?></span>
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


<!-- START CUSTOMER DELETE MODAL FADE -->
<div id="m-a-f-cus-delete" class="modal fade" data-backdrop="true" style="display: none;" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Suppression</h5>
            </div>
            <div class="modal-body text-center p-lg">
                <p>Êtes-vous sûr de supprimer ce Compte?</p>
                <div class="d-flex flex-column align-items-center">
                    <div class="d-flex">
                        <span class="cus-id-confirm w-40 rounded-left _600 text-md text-u-c accent brown-900">564</span>
                        <span class="cus-fname-confirm d-flex align-items-center  _400 text-md text-u-c accent brown px-3">firstname</span>
                        <span class="cus-lname-confirm d-flex align-items-center  _400 text-md text-u-c rounded-right accent brown px-3">lastname</span>
                    </div>
                </div>

            </div>
            <div class="modal-footer">
                <button data-modalcusdelete="false" type="button" class="modal-cus-del pointer btn dark-white p-x-md" data-dismiss="modal">Non</button>
                <button data-modalcusdelete="true" type="button" class="modal-cus-del pointer btn danger p-x-md" data-dismiss="modal">Oui</button>
            </div>
        </div>
    </div>
</div>
<!-- END CUSTOMER DELETE MODAL FADE -->

<!-- START CUSTOMER SHOW MODAL FADE SHOW -->
<div id="m-a-f-cus-details" class="modal fade" data-backdrop="true" style="display: none;" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Fiche Client</h5>
                <button class="btn btn-sm btn-icon white pointer" data-dismiss="modal">
                    <i class="fa fa-remove"></i>
                </button>
            </div>
            <div class="modal-body text-center p-lg">
                <div>
                    <div class="box">
                        <div class="item">
                            <div class="item-bg">
                                <img src="<?=to_src('assets/images/a3.jpg')?>" class="blur">
                            </div>
                            <div class="p-a-lg pos-rlt text-center">
                                <img src="<?=to_src('assets/images/a3.jpg')?>" class="img-circle w-56" style="margin-bottom: -7rem">
                            </div>
                        </div>
                        <div class="p-a text-center">
                            <p class="text-md m-t block cus-name-details">Jack Perez</p>
                            <p><small class="cus-mail-details">Designer, Blogger</small></p>
                            <p class="btn btn-sm primary">Partager</p>
                            <div class="text-xs">
                                <em>Commandes Passées: <strong>32</strong>, En cours: <strong>50</strong></em>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- END CUSTOMER SHOW MODAL FADE SHOW -->

<?php include APP_PATH . '/views/layout/footer.inc.php';?>
<?php include APP_PATH . '/views/layout/scripts.inc.php';?>
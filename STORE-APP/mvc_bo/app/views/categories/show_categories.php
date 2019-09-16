<?php include APP_PATH . '/views/layout/menu.inc.php';?>
<!-- ############ LAYOUT START-->
<div class="col-lg-8 mx-auto">
    <div class="d-flex justify-content-end mb-2">
        <a href="<?=WWW_PUBLIC . '/categories/add'?>" class="btn btn-md text-dark warn">
            <span class="pull-left m-r-sm">
                <i class="fa fa-plus "></i>
            </span>
            <span class="clear text-left l-h-1x">
                <b class="text-sm m-b-xs ">Ajouter une Catégorie</b>
            </span>
        </a>
    </div>
    <div class="box padding">
        <div class="box-header">
            <h3 class=" d-flex align-items-center">
                <span class="text-u-c text-md">Catégories</span>
                <span class="label rounded ml-2 brown total-categories"><?=$data['total']?></span>
            </h3>
            <small>Tous nos types de chocolats</small>
        </div>
        <div class="box-divider m-0"></div>
        <ul class="list inset totalElements">
            <!-- START FOREACH LOOP -->
            <?php foreach ($data['categories'] as $category): ?>
            <li class="list-item category_list">

                <a class="show-cat-details d-flex list-left" data-toggle="modal" data-target="#m-a-f-cat-details" data-id="<?=$category['cat_id']?>" data-descr="<?=$category['cat_descr']?>">
                    <span class=" w-40 rounded-left _600 text-md text-u-c accent brown-900"><?=$category['cat_id']?></span>
                    <span class="d-flex align-items-center _400 text-md text-u-c rounded-right accent brown px-3"><?=$category['cat_descr']?></span>
                </a>


                <div class="list-body">
                    <div class="m-y-sm pull-right">

                        <span data-toggle="modal" data-target="#m-a-f-cat-details">
                            <a data-id="<?=$category['cat_id']?>" data-descr="<?=$category['cat_descr']?>" class="btn btn-sm  white b-info show-cat-details" data-toggle="tooltip" data-placement="top" title="voir">
                                <i class="fa fa-link"></i>
                            </a>
                        </span>

                        <span data-toggle="modal" data-target="#m-a-f-pro-delete">
                            <a data-link="<?=WWW_PUBLIC . '/ajax/categories_delete'?>" data-id="<?=$category['cat_id']?>" data-descr="<?=$category['cat_descr']?>" data-firstname="<?=$category['cus_firstname']?>" class="btn btn-sm  white b-danger categories_delete" data-toggle="tooltip"
                                data-placement="top" title="supprimer">
                                <i class="fa fa-trash"></i>
                            </a>
                        </span>

                        <a data-link="<?=WWW_PUBLIC . '/ajax/categories_update'?>" data-id="<?=$category['cat_id']?>" data-descr="<?=$category['cat_descr']?>" href="<?=WWW_PUBLIC . '/categories/update'?>" class="btn btn-sm white b-success categories_update" data-toggle="tooltip" data-placement="top"
                            title="modifier">
                            <i class="fa fa-pencil "></i>
                        </a>
                    </div>
                </div>
            </li>
            <?php endforeach;?>
            <!-- END FOREACH LOOP -->
        </ul>
    </div>
</div>

<!-- START DELETE MODAL FADE -->
<div id="m-a-f-pro-delete" class="modal fade" data-backdrop="true" style="display: none;" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Suppression</h5>
            </div>
            <div class="modal-body text-center p-lg">
                <p>Êtes-vous sûr de supprimer cette catégorie?</p>
                <div class="d-flex flex-column align-items-center">
                    <div class="d-flex">
                        <span class="cat-id-confirm w-40 rounded-left _600 text-md text-u-c accent brown-900"></span>
                        <span class="d-flex align-items-center cat-descr-confirm _400 text-md text-u-c rounded-right accent brown px-3"></span>
                    </div>
                </div>

            </div>
            <div class="modal-footer">
                <button data-modaldelete="false" type="button" class="modal-del pointer btn dark-white p-x-md" data-dismiss="modal">Non</button>
                <button data-modaldelete="true" type="button" class="modal-del pointer btn danger p-x-md" data-dismiss="modal">Oui</button>
            </div>
        </div>
    </div>
</div>
<!-- END DELETE MODAL FADE -->


<!-- START SHOW DETAILS MODAL FADE SHOW -->
<div id="m-a-f-cat-details" class="modal fade" data-backdrop="true" style="display: none;" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Fiche Produit</h5>
                <button class="btn btn-sm btn-icon white pointer" data-dismiss="modal">
                    <i class="fa fa-remove"></i>
                </button>
            </div>
            <div class="modal-body text-center p-lg">

                <div class="d-flex flex-column align-items-center">
                    <div class="d-flex">
                        <span class="cat-id-details w-40 rounded-left _600 text-md text-u-c accent brown-900"></span>
                        <span class="cat-descr-details d-flex align-items-center _400 text-md text-u-c rounded-right accent brown px-3"></span>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>
<!-- END SHOW DETAILS MODAL FADE SHOW -->

<!-- ############ LAYOUT END-->
<?php include APP_PATH . '/views/layout/footer.inc.php';?>
<?php include APP_PATH . '/views/layout/scripts.inc.php';?>
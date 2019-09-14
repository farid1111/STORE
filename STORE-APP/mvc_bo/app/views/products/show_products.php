<?php include APP_PATH . '/views/layout/menu.inc.php';?>

<!-- ############ LAYOUT START-->
<div class="col-lg-8 mx-auto p">

    <div class="d-flex justify-content-end mb-2">
        <a href="<?=WWW_PUBLIC . '/products/add'?>" class="btn btn-md text-dark warn">
            <span class="pull-left m-r-sm">
                <i class="fa fa-plus "></i>
            </span>
            <span class="clear text-left l-h-1x">
                <b class="text-sm m-b-xs">Ajouter un Produit</b>
            </span>
        </a>
    </div>

    <div class="box padding">
        <div class="box-header">
            <h3 class=" d-flex align-items-center">
                <span class="text-u-c text-md">Produits</span>
                <span class="label rounded ml-2 brown  totalNumber"></span>
            </h3>
            <small>Tous nos produits</small>
        </div>
        <div class="box-divider m-0"></div>
        <ul class="list inset totalElements">
            <!-- START FOREACH LOOP -->
            <?php foreach ($data['products'] as $product): ?>
            <li class="list-item">
                <a herf="" class="list-left">
                    <span class="w-40 r-2x _600 text-lg brown-600 text-u-c"></span>
                </a>
                <div class="list-body">
                    <div class="m-y-sm pull-right">
                        <span class="show-product" data-proid="<?=$product['pro_id']?>" data-toggle="modal" data-target="#m-a-f-p">
                            <a class="btn btn-sm  white b-info" data-toggle="tooltip" data-placement="top" title="voir">
                                <i class="fa fa-link"></i>
                            </a>
                        </span>

                        <a href="#" class="btn btn-sm  white b-danger" data-toggle="tooltip" data-placement="top" title="supprimer">
                            <i class="fa fa-trash"></i>
                        </a>

                        <a href="#" class="btn btn-sm white b-success" data-toggle="tooltip" data-placement="top" title="modifier">
                            <i class="fa fa-pencil "></i>
                        </a>
                    </div>
                    <div><a class="firstTitle" href=""> <?=$product['pro_title']?></a></div>
                    <div class="text-sm">
                        <span class="text-muted"><?=$product['pro_subtitle1']?></span>
                        <!-- LABELS PUCES -->
                        <!-- <span class="label brown-300">B</span>
                        <span class="label red-300">N</span> -->
                    </div>
                </div>
            </li>
            <?php endforeach;?>
            <!-- END FOREACH LOOP -->
        </ul>
    </div>
</div>

<!-- START MODAL FADE -->
<div id="m-a-f-p" class="modal fade" data-backdrop="true" style="display: none;" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Fiche Produit</h5>
                <button class="btn btn-sm btn-icon white pointer" data-dismiss="modal">
                    <i class="fa fa-remove"></i>
                </button>
            </div>
            <div class="modal-body text-center p-lg">

                <div>
                    <div class="box">
                        <div class="item">
                            <div class="item-overlay active p-a">
                                <span class="pull-right label dark-white text-color "><span class=" pro_price"></span><i class="fa fa-euro ml-2"></i></span>
                                <span href="" class="pull-left text-u-c label brown"><i class="fa fa-tag"><span class="ml-1 pro_id"></span></i></span>
                            </div>
                            <img src="" class="w-full pro_img_url_recto">
                        </div>
                        <div class="p-a">
                            <div class="text-muted m-b-xs">
                                <span class="fa fa-calendar"></span>
                                <span class="ml-2 m-r pro_date"></span>
                            </div>
                            <div class="m-b h-2x">
                                <p class="_800 pro_title"></p>
                            </div>
                            <!--class="h-3x" : Limiter la taille du paragraphe -->
                            <p class="pro_descr"></p>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>
<!-- END MODAL FADE -->

<!-- ############ LAYOUT END-->

<?php include APP_PATH . '/views/layout/footer.inc.php';?>
<?php include APP_PATH . '/views/layout/scripts.inc.php';?>
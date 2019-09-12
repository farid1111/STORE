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
                <span class="label rounded ml-2 brown totalNumber"></span>
            </h3>
            <small>Tous nos types de chocolats</small>
        </div>
        <div class="box-divider m-0"></div>
        <ul class="list inset totalElements">
            <!-- START FOREACH LOOP -->
            <?php foreach ($data['categories'] as $category): ?>
            <li class="list-item ">
                <a herf="" class="list-left">
                    <span class="w-40 r-2x _600 text-lg text-u-c accent brown"></span>
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
                        <a class="firstTitle h-100" href=""><?=$category['cat_descr']?></a>
                    </div>


                    <!-- <div class="text-sm">
                        <span class="text-muted">Chocolat noir au lait grand cru avec caramel | Pérou</span>
                        <span class="label brown-300"></span>
                        <span class="label red-300"></span>
                    </div> -->
                </div>
            </li>
            <?php endforeach;?>
            <!-- END FOREACH LOOP -->
        </ul>
    </div>
</div>
<!-- ############ LAYOUT END-->
<?php include APP_PATH . '/views/layout/footer.inc.php';?>
<?php include APP_PATH . '/views/layout/scripts.inc.php';?>
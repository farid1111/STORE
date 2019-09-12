<?php include APP_PATH . '/views/layout/menu.inc.php';?>

<!-- START CONTENT -->

<div class="row col-12 d-flex justify-content-center m-0 p-0">
    <div class="col-sm-6 col-md-4 col-lg-3">
        <div class="box p-a">
            <div class="pull-left m-r">
                <span class="w-40 warn text-center rounded">
                    <i class="material-icons">shopping_basket</i>
                </span>
            </div>
            <div class="clear">
                <h4 class="m-0 text-md"><a href="">75 <span class="text-sm">Ventes</span></a></h4>
                <small class="text-muted">6 paiements en attente</small>
            </div>
        </div>
    </div>

    <div class="col-sm-6 col-md-4 col-lg-3">
        <div class="box-color p-a warn">

            <div class="clear">
                <h4 class="m-0 text-md"><a href="">25% <span class="text-sm"> de Reduction</span></a></h4>
                <small class="text-muted">632 activités.</small>
            </div>
        </div>
    </div>

    <div class="col-sm-6 col-md-4 col-lg-3">
        <div class="box p-a">
            <div class="pull-right m-l">
                <span class="w-40 accent text-center rounded">
                    <i class="material-icons">people</i>
                </span>
            </div>
            <div class="clear">
                <h4 class="m-0 text-md"><a href="">6,000 <span class="text-sm">Membres</span></a></h4>
                <small class="text-muted">632 activités.</small>
            </div>
        </div>
    </div>

    <div class="col-sm-6 col-md-4 col-lg-3">
        <div class="box-color p-a accent">
            <div class="pull-left m-r">
                <span class="w-40 dker text-center rounded">
                    <i class="material-icons">comment</i>
                </span>
            </div>
            <div class="clear">
                <h4 class="m-0 text-md"><a href="">69 <span class="text-sm">Commentaires</span></a></h4>
                <small class="text-muted">5 approuvés.</small>
            </div>
        </div>
    </div>

    <div class="col-sm-6 col-md-4 col-lg-3">
        <div class="box-color p-a primary">
            <div class="pull-right m-l">
                <span class="w-40 dker text-center rounded">
                    <i class="material-icons">local_shipping</i>
                </span>
            </div>
            <div class="clear">
                <h4 class="m-0 text-md"><a href="">40 <span class="text-sm">Commandes</span></a></h4>
                <small class="text-muted">38 Expédiées.</small>
            </div>
        </div>
    </div>

    <div class="col-sm-6 col-md-4 col-lg-3">
        <div class="box p-a">
            <div class="pull-right m-l">
                <span class="w-40 dker text-center rounded">
                    <i class="material-icons">local_shipping</i>
                </span>
            </div>
            <div class="clear">
                <h4 class="m-0 text-md"><a href="">60% <span class="text-sm">d'Augmentation</span></a></h4>
                <small class="text-muted">38 Expédiées.</small>
            </div>
        </div>
    </div>

    <div class="col-sm-6 col-md-4 col-lg-3">
        <div class="box-color p-a warn">

            <div class="clear">
                <h4 class="m-0 text-md"><a href="">25% <span class="text-sm"> de Reduction</span></a></h4>
                <small class="text-muted">632 activités.</small>
            </div>
        </div>
    </div>

    <div class="col-sm-6 col-md-4 col-lg-3">
        <div class="box p-a">

            <div class="clear">
                <h4 class="m-0 text-md"><a href="">10% <span class="text-sm">de Croissance</span></a></h4>
                <small class="text-muted">Caculée il y a 2h.</small>
            </div>
        </div>
    </div>
</div>

<div>
    <!-- Ici on passe un seul param via le href="" pour le récupérer sur la page du chemin:/home/index -->
    <!-- donc on le récupère exactement dans la méthode 'index($name, $age, $job,...)' de la classe 'home.php' -->
    <!-- ici le param $name de index() veut 'Coucou' -->
    <!-- La variable $data & $view nous vient du /core/Controller, tandis que leurs valeurs nous viennet d'un des méthodes d'une classe dans le dossier /controllers -->

    <h6>
        <span class="label brown-300"><?=$view?>.php</span>
        L'adresse réelle de l'adresse virtuelle:
        <span class="label brown-300">home/index</span>
    </h6>

    <p><?=$data['product']->pro_title?></p>
    <p><?=$data['product']->pro_subtitle1?></p>
    <p><?=$data['product']->pro_subtitle2?></p>
    <p><?=$data['product']->pro_descr?></p>
</div>


<!-- END CONTENT -->

<?php include APP_PATH . '/views/layout/footer.inc.php';?>
<?php include APP_PATH . '/views/layout/scripts.inc.php';?>
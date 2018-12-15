<?php
/* @var $this yii\web\View */
use yii\widgets\ListView;
?>
<div class="site-index">
    <div class="jumbotron">
        <h1>Products!</h1>
        <p class="lead">Here is the list of all the products we have</p>
    </div>

    <div class="body-content">
        <div class="row">
            <?php
              echo ListView::widget([
                'dataProvider'=>$products,
                'layout' => "<div class=\"items\">{items}</div>",
                'itemView'=> '_product'
              ]);
            ?>
        </div>
        <div class="row">
          <?php
              echo \yii\widgets\LinkPager::widget([
                'pagination'=>$products->pagination,
              ]);?>
        </div>
    </div>
</div>

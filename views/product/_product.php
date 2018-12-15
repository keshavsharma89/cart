<?php
use yii\helpers\Html;
use yii\helpers\Url;
?>
<div class="col-md-2 column productbox">
    <img src="http://placehold.it/460x250/e67e22/ffffff&text=<?php echo $model->Name?>" class="img-responsive">
    <div class="producttitle"><?php echo $model->Name?></div>
    <div class="productprice">
      <div class="pull-right">
        <form action="<?= URL::to(['/cart/']) ?>" method="post">
          <input type="hidden" value="<?php echo $model->ProductId?>" name="pid" >
          <button class="btn btn-danger btn-sm" role="button">BUY</button>
        </form>
      </div>
      <div class="pricetext">€ <?php echo $model->Price?></div>
    </div>
</div>

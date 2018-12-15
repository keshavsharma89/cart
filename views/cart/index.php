<?php
/* @var $this yii\web\View */

use yii\helpers\Url;
?>
<h1>Shopping cart</h1>
<div class="container">
	<table id="cart" class="table table-hover table-condensed">
		<thead>
			<tr>
				<th style="width:50%">Product</th>
				<th style="width:10%">Price</th>
				<th style="width:8%">Quantity</th>
				<th style="width:22%" class="text-center">Subtotal</th>
				<th style="width:10%"></th>
			</tr>
		</thead>
		<tbody>
      <?php if(sizeof($Products) < 1 ){ ?>
				<tr>
					<td colspan="5"> Cart is empty </td>
				</tr>
      <?php }else{ ?>
      <?php foreach($Products as $Product){ ?>
  			<tr>
  				<td data-th="Product">
  					<div class="row">
  						<div class="col-sm-2 hidden-xs"><img src="http://placehold.it/100x100" alt="..." class="img-responsive"/></div>
  						<div class="col-sm-10">
  							<h4 class="nomargin"><?= $Product->Name; ?></h4>
  							<p><?= $Product->Description; ?></p>
  						</div>
  					</div>
  				</td>
  				<td data-th="Price">€ <?= $Product->Price; ?></td>
  				<td data-th="Quantity">
						<form action="<?= URL::to(['/cart/updatecart']) ?>" method="post">
  						<input type="number" onblur="this.form.submit()" name="Quantity" class="form-control text-center" value="<?= $Product->Quantity; ?>">
  						<input type="hidden" name="ProductId" class="form-control text-center" value="<?= $Product->ProductId; ?>">
						</form>
  				</td>
					<?php
						$subtotal= $Product->Quantity*$Product->Price;
						$total+=$subtotal;
					?>
  				<td data-th="Subtotal" class="text-center"><?php echo $subtotal;?></td>
  				<td class="actions" data-th="">
						<a href="<?= URL::to(['/cart/removeproduct?pid='.$Product->ProductId]) ?>">
  						<button class="btn btn-danger btn-sm"><i class="glyphicon glyphicon-trash"></i></button>
						</a>
  				</td>
  			</tr>
      <?php } } ?>
		</tbody>
		<tfoot>
			<tr class="visible-xs">
				<td class="text-center"><strong>Total €<?php echo $total; ?></strong></td>
			</tr>
			<tr>
				<td><a href="<?php echo URL::to(['/product']); ?>" class="btn btn-warning"><i class="fa fa-angle-left"></i> Continue Shopping</a></td>
				<td colspan="2" class="hidden-xs"></td>
				<td class="hidden-xs text-center"><strong>Total €<?php echo $total; ?></strong></td>
				<td><a href="#" class="btn btn-success btn-block">Checkout <i class="fa fa-angle-right"></i></a></td>
			</tr>
		</tfoot>
	</table>
</div>

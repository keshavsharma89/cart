<?php

namespace app\controllers;
use app\models\Product;
use app\models\Cart;
use Yii;

class CartController extends \yii\web\Controller
{
    public $enableCsrfValidation =false;

    /**
     * Displays Cart page.
     */
    public function actionIndex()
    {
      // we are taking userId 1 for now, In working model it will be comming from session
      $userId=1;
      $post=Yii::$app->request->post();
      // If we have pid then we need to add that new product to the cart
      if(isset($post['pid']))
      {
        $Cart=Cart::find()->select(['CartId', 'Quantity'])->where(['ProductId'=>$post['pid'], 'UserId'=>$userId, 'IsDeleted'=>0])->one();
        // if that same product is already there for same user we will increase the quantity by 1
        if(isset($Cart) && $Cart['CartId'] > 0 ){
          $model =Cart::findOne($Cart['CartId']);
          $quantity=$Cart['Quantity']+1;
        }else{
          $model =new Cart();
          $quantity=1;
        }
        $model->UserId=$userId;
        $model->ProductId=$post['pid'];
        $model->Quantity=$quantity;
        $model->save();
      }

      // fetching the products from cart and there details form product table
      $Products = Product::find()
        ->select(['Product.Name AS Name', 'Product.Description AS Description', 'Product.Price AS Price', 'Product.ProductId AS ProductId', 'Cart.Quantity AS Quantity' ])
        ->leftJoin('Cart', 'Cart.ProductId=Product.ProductId')
        ->where(['Cart.UserId'=>$userId, 'Cart.IsDeleted'=> 0])
        ->all();

      // variable total is set to zero at initial stage.
      return $this->render('index',['Products'=>$Products, 'total'=>0]);
    }

    /**
     * Remove product from cart.
     */
    public function actionRemoveproduct($pid){
      // we are taking userId 1 for now, In working model it will be comming from session
      $userId=1;
      $model = Cart::find()->where(['ProductId'=>$pid, 'UserId'=>$userId, 'IsDeleted'=>0])->one();
      $model->IsDeleted=1;
      $model->save();
      return $this->redirect(['index']);
    }

    /**
     * Update product quantity in cart.
     */
    public function actionUpdatecart(){
      $post=Yii::$app->request->post();
      $quantity=$post['Quantity'];
      $productId=$post['ProductId'];
      $userId=1;// we are taking userId 1 for now, In working model it will be comming from session

      $model = Cart::find()->where(['ProductId'=>$productId, 'UserId'=>$userId, 'IsDeleted'=>0])->one();
      $model->Quantity=$quantity;
      $model->save();

      return $this->redirect(['index']);
    }

}

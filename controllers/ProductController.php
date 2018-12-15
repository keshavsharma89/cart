<?php

namespace app\controllers;
use app\models\Product;
use yii\data\ActiveDataProvider;

class ProductController extends \yii\web\Controller
{
    /**
    * Displays List of products.
    */
    public function actionIndex()
    {
      // will list all the products, which are in stock
      $pp=Product::find()->where("Quantity > 0")->orderBy("Created_by DESC")->all();
      $products = new ActiveDataProvider([
        'query'=> Product::find()->where("Quantity > 0")->orderBy("Created_by DESC"),
        'pagination'=> ['pageSize'=> 3] // pagination is set to 3 producrs per page
      ]);
      return $this->render('index', ['products' => $products]);
    }
}

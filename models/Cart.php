<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "{{%Cart}}".
 *
 * @property int $CartId
 * @property int $ProductId
 * @property int $Quantity
 * @property int $UserId
 * @property int $IsDeleted
 * @property string $Created_date
 * @property string $Modified_date
 */
class Cart extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return '{{%Cart}}';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['ProductId', 'Quantity', 'UserId'], 'required'],
            [['ProductId', 'Quantity', 'UserId', 'IsDeleted'], 'integer'],
            [['Created_date', 'Modified_date'], 'safe'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'CartId' => 'Cart ID',
            'ProductId' => 'Product ID',
            'Quantity' => 'Quantity',
            'UserId' => 'User ID',
            'IsDeleted' => 'Is Deleted',
            'Created_date' => 'Created Date',
            'Modified_date' => 'Modified Date',
        ];
    }
}

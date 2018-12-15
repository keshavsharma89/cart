<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "{{%Product}}".
 *
 * @property int $ProductId
 * @property string $ProductCode
 * @property string $Name
 * @property string $Description
 * @property double $Price
 * @property int $Quantity
 * @property int $Created_by
 * @property string $Created_date
 * @property int $Modified_by
 * @property string $Modified_date
 */
class Product extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return '{{%Product}}';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['ProductCode', 'Name'], 'required'],
            [['Description'], 'string'],
            [['Price'], 'number'],
            [['Quantity', 'Created_by', 'Modified_by'], 'integer'],
            [['Created_date', 'Modified_date'], 'safe'],
            [['ProductCode', 'Name'], 'string', 'max' => 255],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'ProductId' => 'Product ID',
            'ProductCode' => 'Product Code',
            'Name' => 'Name',
            'Description' => 'Description',
            'Price' => 'Price',
            'Quantity' => 'Quantity',
            'Created_by' => 'Created By',
            'Created_date' => 'Created Date',
            'Modified_by' => 'Modified By',
            'Modified_date' => 'Modified Date',
        ];
    }
}

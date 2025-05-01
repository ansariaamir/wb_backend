<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "investor_opportunity".
 *
 * @property int $id
 * @property int|null $user_id
 * @property int|null $ip_id investor profile ID
 * @property string|null $company_name
 * @property string|null $company_logo
 * @property string|null $fund_name
 * @property float|null $fund_size
 * @property string|null $stage
 * @property string|null $about_investment
 * @property string|null $expiry_date
 */
class InvestorOpportunity extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'investor_opportunity';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['user_id', 'ip_id'], 'integer'],
            [['fund_size'], 'number'],
            [['about_investment'], 'string'],
            [['expiry_date'], 'safe'],
            [['company_name', 'company_logo'], 'string', 'max' => 200],
            [['fund_name'], 'string', 'max' => 100],
            [['stage'], 'string', 'max' => 50],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'user_id' => 'User ID',
            'ip_id' => 'Ip ID',
            'company_name' => 'Company Name',
            'company_logo' => 'Company Logo',
            'fund_name' => 'Fund Name',
            'fund_size' => 'Fund Size',
            'stage' => 'Stage',
            'about_investment' => 'About Investment',
            'expiry_date' => 'Expiry Date',
        ];
    }
}

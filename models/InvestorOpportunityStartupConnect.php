<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "investor_opportunity_startup_connect".
 *
 * @property int $id
 * @property int|null $io_id investor opportunity
 * @property int|null $stqartup_user_id
 * @property int|null $pitch_id
 * @property string|null $status
 * @property string|null $applied_on
 */
class InvestorOpportunityStartupConnect extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'investor_opportunity_startup_connect';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['io_id', 'stqartup_user_id', 'pitch_id'], 'integer'],
            [['applied_on'], 'safe'],
            [['status'], 'string', 'max' => 50],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'io_id' => 'Io ID',
            'stqartup_user_id' => 'Stqartup User ID',
            'pitch_id' => 'Pitch ID',
            'status' => 'Status',
            'applied_on' => 'Applied On',
        ];
    }
}

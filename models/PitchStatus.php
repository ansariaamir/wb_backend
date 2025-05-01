<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "pitch_status".
 *
 * @property int $id
 * @property int $is_active
 * @property string|null $status
 */
class PitchStatus extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'pitch_status';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['is_active'], 'integer'],
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
            'is_active' => 'Is Active',
            'status' => 'Status',
        ];
    }
}

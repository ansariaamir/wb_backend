<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "pitch_log".
 *
 * @property int $id
 * @property int|null $user_id
 * @property int|null $p_id
 * @property string|null $user_type
 * @property string|null $status
 * @property string|null $log_string
 * @property string|null $bo_remark
 * @property string|null $uploaded_file
 * @property string|null $created_on
 */
class PitchLog extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'pitch_log';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['user_id', 'p_id'], 'integer'],
            [['created_on'], 'safe'],
            [['user_type', 'status'], 'string', 'max' => 50],
            [['log_string', 'bo_remark'], 'string', 'max' => 500],
            [['uploaded_file'], 'string', 'max' => 200],
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
            'p_id' => 'P ID',
            'user_type' => 'User Type',
            'status' => 'Status',
            'log_string' => 'Log String',
            'bo_remark' => 'Bo Remark',
            'uploaded_file' => 'Uploaded File',
            'created_on' => 'Created On',
        ];
    }
}

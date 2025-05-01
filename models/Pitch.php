<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "pitch".
 *
 * @property int $id
 * @property int|null $user_id
 * @property string|null $company_name
 * @property string|null $description
 * @property string|null $status
 * @property string|null $pitch_file
 * @property string|null $location
 * @property string|null $website
 * @property string|null $created_on
 * @property string|null $updated_on
 */
class Pitch extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'pitch';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['user_id'], 'integer'],
            [['description'], 'string'],
            [['created_on', 'updated_on'], 'safe'],
            [['company_name', 'location', 'website'], 'string', 'max' => 200],
            [['status'], 'string', 'max' => 50],
            [['pitch_file'], 'string', 'max' => 500],
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
            'company_name' => 'Company Name',
            'description' => 'Description',
            'status' => 'Status',
            'pitch_file' => 'Pitch File',
            'location' => 'Location',
            'website' => 'Website',
            'created_on' => 'Created On',
            'updated_on' => 'Updated On',
        ];
    }
}

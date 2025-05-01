<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "investor_profile".
 *
 * @property int $id
 * @property int|null $user_id
 * @property string|null $role
 * @property string|null $industries
 * @property string|null $technologies
 * @property string|null $insta
 * @property string|null $facebook
 * @property string|null $twitter
 * @property string|null $linkedin
 */
class InvestorProfile extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'investor_profile';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['user_id'], 'integer'],
            [['role'], 'string', 'max' => 100],
            [['industries', 'technologies'], 'string', 'max' => 500],
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
            'role' => 'Role',
            'industries' => 'Industries',
            'technologies' => 'Technologies',
        ];
    }
}

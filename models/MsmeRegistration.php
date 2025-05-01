<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "msme_registration".
 *
 * @property int $id
 * @property string|null $business_name
 * @property string|null $owner_name
 * @property string|null $contact
 * @property string|null $email
 * @property string|null $business_type
 * @property string|null $reg_no
 * @property string|null $service_type
 * @property string|null $address
 * @property string|null $description
 * @property string|null $status
 *
 * @property MsmeDms[] $msmeDms
 */
class MsmeRegistration extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'msme_registration';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['description'], 'string'],
            [['business_name', 'owner_name'], 'string', 'max' => 200],
            [['contact', 'email', 'reg_no', 'status'], 'string', 'max' => 50],
            [['business_type', 'service_type', 'address'], 'string', 'max' => 500],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'business_name' => 'Business Name',
            'owner_name' => 'Owner Name',
            'contact' => 'Contact',
            'email' => 'Email',
            'business_type' => 'Business Type',
            'reg_no' => 'Reg No',
            'service_type' => 'Service Type',
            'address' => 'Address',
            'description' => 'Description',
            'status' => 'Status',
        ];
    }

    /**
     * Gets query for [[MsmeDms]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getMsmeDms()
    {
        return $this->hasMany(MsmeDms::class, ['msme_id' => 'id']);
    }
}

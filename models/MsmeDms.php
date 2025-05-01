<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "msme_dms".
 *
 * @property int $id
 * @property int|null $msme_id
 * @property string|null $document
 * @property string|null $remark
 * @property int|null $created_on
 *
 * @property MsmeRegistration $msme
 */
class MsmeDms extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'msme_dms';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['msme_id', 'created_on'], 'integer'],
            [['remark'], 'string'],
            [['document'], 'string', 'max' => 200],
            [['msme_id'], 'exist', 'skipOnError' => true, 'targetClass' => MsmeRegistration::class, 'targetAttribute' => ['msme_id' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'msme_id' => 'Msme ID',
            'document' => 'Document',
            'remark' => 'Remark',
            'created_on' => 'Created On',
        ];
    }

    /**
     * Gets query for [[Msme]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getMsme()
    {
        return $this->hasOne(MsmeRegistration::class, ['id' => 'msme_id']);
    }
}

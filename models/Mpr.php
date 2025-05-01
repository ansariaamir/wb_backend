<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "mpr".
 *
 * @property int $id
 * @property int|null $p_id
 * @property int|null $applicant_id
 * @property string|null $month
 * @property int|null $year
 * @property string|null $remark
 * @property string|null $file
 * @property string|null $uploaded_on
 * @property string|null $status
  * @property string|null $progress_status
 */
class Mpr extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'mpr';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['p_id', 'applicant_id', 'year'], 'integer'],
            [['remark'], 'string'],
            [['uploaded_on'], 'safe'],
            [['month', 'status','progress_status'], 'string', 'max' => 50],
            [['file'], 'string', 'max' => 500],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'p_id' => 'P ID',
            'applicant_id' => 'Applicant ID',
            'month' => 'Month',
            'year' => 'Year',
            'remark' => 'Remark',
            'file' => 'File',
            'uploaded_on' => 'Uploaded On',
            'status' => 'Status',
        ];
    }
}

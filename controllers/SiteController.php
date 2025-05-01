<?php

namespace app\controllers;


use agielks\yii2\jwt\JwtBearerAuth;
// Use your own login form
use common\models\LoginForm;
use Yii;
use yii\base\InvalidConfigException;
use yii\web\Controller;
use yii\web\Response;
 use Mpdf\Mpdf;
use Mpdf\QrCode\QrCode;
use Mpdf\QrCode\Output;

class SiteController extends Controller
{
    public function actionIndex(){
     

        return $this->render('index');
    }

   

   
}

<?php

namespace app\controllers;


use agielks\yii2\jwt\JwtBearerAuth;
// Use your own login form
use common\models\LoginForm;
use Yii;
use yii\base\InvalidConfigException;
use yii\filters\Cors;
use app\controllers\MyController;
use yii\web\Response;
use app\models\User;
use app\models\UserProfile;
use app\models\Token;
use app\models\Helper;
use app\models\Pitch;
use app\models\PitchLog;
use app\models\Mpr;
use app\models\PitchStatus;
use app\models\transactions\TApplicationSubmission;
use app\models\ServiceConfigParameterMapping;
use app\models\ProjectConfigurations;
use app\models\masters\OptionValue;
use app\models\masters\MstUserrole;
use yii\web\UploadedFile;
use app\models\InvestorProfile;
use app\models\InvestorOpportunity;
use app\models\InvestorOpportunityStartupConnect;
/**
 * Class SiteController
 */



class RestController extends MyController
{
    /**
     * {@inheritdoc}
     */
    public function behaviors()
    {
        $behaviors = parent::behaviors();
        $behaviors['contentNegotiator']['formats']['text/html'] = Response::FORMAT_JSON;
        $behaviors['corsFilter'] = ['class' => Cors::class];
        $behaviors['authenticator'] = [
            'class' => JwtBearerAuth::class,
            'optional' => [
                'login','register-fo','all-opportunities'
            ],
        ];

        return $behaviors;
    }

    /**
     * {@inheritdoc}
     */
    protected function verbs()
    {
        return [
            'login' => ['OPTIONS', 'POST'],
        ];
    }

    public function actionTest(){
        return Yii::$app->user->identity;
    }

    /**
     * @return array|LoginForm
     * @throws InvalidConfigException
     */
    public function actionLogin()
    {       

        
        $model = new \app\models\LoginForm();
       
        
        $model->username = $_POST['email'];
        $model->password = $_POST['password'];
        if ($model->load(Yii::$app->getRequest()->getBodyParams(), '') && $model->login()) {
            $user = $model->getUser();
            $token = Token::tokenGenerator($user->id);

            $prifle_img_url = Helper::GetProfileImgurl($user);       

            $protocol = (!empty($_SERVER['HTTPS']) && $_SERVER['HTTPS'] !== 'off') ? 'https' : 'http';
            $server_name = $_SERVER['SERVER_NAME']; 
            $server_port = $_SERVER['SERVER_PORT']; 
            if ($server_port != '80' && $server_port != '443') { 
                $full_address = $protocol . '://' . $server_name . ':' . $server_port;
            } else {
                $full_address = $protocol . '://' . $server_name;
            }


            return [
                        'status' => true,
                        'message' => 'Login successfully',
                        'user_data' => [
                            'user_detail'=>User::GetUserDetails($user->id),
                            'login_time'=>date('Y-m-d H:i:s'),
                            'user_image'=>$prifle_img_url
                        ],                      
                        'clientlogo' => ($full_address.'/img/logo.png'),
                        'clientlogocolor' => 1,
                        //'master_options'=> $options,                        
                        'token' => $token,
                    ];
        }else{
            $model->validate();
            return ['status'=>false,'msg'=>$model];
        }       
    }

   /*
   * this Dashboard is for all but specially for startup user
   */
    public function actionDashboard(){
        if(Yii::$app->user->id){    
        $token = Token::tokenGenerator(Yii::$app->user->id);      
        $pitch = Pitch::find()->where(['user_id'=>Yii::$app->user->id])->one();  

            return [
                'success' => true,
                'identity'=>Yii::$app->user->identity,                               
                "pitchData" => $pitch,                
                "token" => $token,
                'mprData' => Mpr::find()->where(['applicant_id'=>Yii::$app->user->id])->all(),
                'statusData' => PitchStatus::find()->where(['is_active'=>1])->all(),
                'hostinfo' => Yii::$app->request->hostInfo ,
                'investorProfile' => InvestorProfile::find()->where(['user_id'=>Yii::$app->user->id])->one(),
                'opportunities' => InvestorOpportunity::find()->where(['user_id'=>Yii::$app->user->id])->all()
            ];
        }else{
             return [
                'success' => false, 'message'=>'Session expired. Please login again'
            ];
        } 
    }

    public function actionAdmindashboard(){
        if(Yii::$app->user->id){    
        $token = Token::tokenGenerator(Yii::$app->user->id);  

        if(Yii::$app->user->identity->role_name == 'admin'){
            $condi = "where p.status='forward'";
        }else{
            $condi = "where p.status='pending'";
        }

        $pitch = Yii::$app->db->createCommand("SELECT p.id, p.company_name, p.location, p.created_on, u.name 
            from pitch p 
            inner join users u on p.user_id=u.id $condi")->queryAll();  

            return [
                'success' => true,
                'identity'=>Yii::$app->user->identity,                       
                "pitchData" => $pitch,                
                "token" => $token,
                'hostinfo' => Yii::$app->request->hostInfo 
            ];
        }else{
             return [
                'success' => false, 'message'=>'Session expired. Please login again'
            ];
        } 
    }

   

    public function actionLogout(){
        if(Yii::$app->user->id){            
            Yii::$app->user->logout();
            return [
                'status' => true,
            ];
        }else{
             return [
                'status' => false, 'message'=>'Session expired. Please login again'
            ];
        } 
    }

/*
* 
*/
    public function actionRegisterFo(){
        if(isset($_POST['name'])){
            $model = new User;
            $model->name = $_POST['name'];
            $model->email = $_POST['email'];
            $model->mobile_no = $_POST['mobile'];
            $model->password_hash = Yii::$app->security->generatePasswordHash($_POST['password']);    
            $model->status =1;       
            $model->save();
            $puser = new UserProfile;
            $puser->user_id =$model->id;
            if($_POST['registrationFor']=='startup'){
                $puser->role_id =4;
            }
            if($_POST['registrationFor']=='investor'){
                $puser->role_id =3;
            }
            
            $puser->save(false);
            return [
                'success' => true                
            ];
        }
    }


public function actionUploadPitch()
{
    Yii::$app->response->format = \yii\web\Response::FORMAT_JSON;

    $model = new Pitch(); // Your Pitch model (create this if not exists)
    $model->company_name = Yii::$app->request->post('companyName');
    $model->description = Yii::$app->request->post('description');
    $model->location = Yii::$app->request->post('location');
    $model->website = Yii::$app->request->post('website');
    $model->status = 'pending'; // default status
    $model->created_on = date('Y-m-d H:i:s');
    $model->updated_on = date('Y-m-d H:i:s');
    $model->user_id = Yii::$app->user->id;
    $pitchFile = UploadedFile::getInstanceByName('pitchDeck');

    if ($pitchFile) {
        $token = Token::tokenGenerator(Yii::$app->user->id);        
        $filename = 'pitch_' . time() . '.' . $pitchFile->extension;
        $uploadDir = Yii::getAlias('@webroot/uploads/pitches/');
        if (!file_exists($uploadDir)) {
            mkdir($uploadDir, 0777, true); // recursive mkdir
        }
        $filePath = $uploadDir . $filename;

        if ($pitchFile->saveAs($filePath)) {
            $model->pitch_file = '/uploads/pitches/' . $filename;

            if ($model->save()) {
                $this->pitchlog($model->id,'FO',$model->status,'Pitch Deck was submitted',null,null);
                return [
                    'success' => true, 
                    'message' => 'Pitch uploaded successfully.',
                    "pitchData" => $model,
                    "token" => $token,
                    'hostinfo' => Yii::$app->request->hostInfo                    

            ];
            } else {
                return ['success' => false, 'errors' => $model->getErrors()];
            }
        } else {
            return ['success' => false, 'message' => 'Failed to save file.'];
        }
    } else {
        return ['success' => false, 'message' => 'No file uploaded.'];
    }
}

   protected function pitchlog($p_id,$user_type,$status,$log_string,$remark,$is_doc){
      
        $model = new PitchLog;
        $model->user_id = Yii::$app->user->id;
        $model->p_id = $p_id;
        $model->user_type = $user_type;
        $model->status = $status;
        $model->log_string = $log_string;
        $model->bo_remark = $remark;
        if($is_doc){
            $model->uploaded_file = '';
        }        
        $model->created_on = date('Y-m-d H:i:s');
        $model->save();
        return true;

   }

    public function actionGetpitchdetails(){
        if (isset($_POST['pitch_id'])) {
             $token = Token::tokenGenerator(Yii::$app->user->id);  
            $model = Pitch::find()->where(['id'=>$_POST['pitch_id']])->one();
            if($model){
                $log = PitchLog::find()->where(['p_id'=>$model->id])->all();
                $action = [];
                if(Yii::$app->user->identity->role_name=='admin'){
                    $action = [
                        'pending'=>'Revert To Nodal',
                        'approved'=>'Approved',
                        'reject'=>'reject',
                    ];
                }

                if(Yii::$app->user->identity->role_name=='scrutiny_committee'){
                    $action = [
                        'reverted'=>'Revert To Applicant',
                        'forward'=>'Forward'
                    ];
                }

                return [
                    'success'=>true,
                    'data'=>[
                        'main'=>$model,
                        'logs'=>$log,
                        'hostinfo' => Yii::$app->request->hostInfo  ,
                        'action' => $action,
                        'mprData' => Mpr::find()->where(['p_id'=>$model->id])->all(),
                    ],
                    "token" => $token
                     
                ];
            }else{
                return [
                    'success'=> false,
                    'message'=> 'Pitch Detail Not Found'
                ];
            }
        }
    }

    public function actionProcesspitch(){
        if(isset($_POST['pitch_id']) && $_POST['pitch_id']){
            $model = Pitch::find()->where(['id'=>$_POST['pitch_id']])->one();

            if($model){
               
                $model->status = $_POST['action'];
                $model->updated_on = date("Y-m-d H:i:s");
                $model->save();
                switch ($model->status) {
                    case 'pending':
                        $log_string = "Form was reverted to nodal";
                        break;
                    case 'forward':
                        $log_string = "Form was forwarded to approver";
                        break;
                    case 'reverted':
                        $log_string = "Form was reverted to applicant";
                        break;
                    case 'approved':
                        $log_string = "Form was approved";
                        break;
                    case 'reject':
                        $log_string = "Form was rejected";
                        break;                
                    
                    default:
                        $log_string = 'NA Status';
                        break;
                }
                $this->pitchlog($model->id,'BO',$model->status,$log_string,$_POST['remark'],null);
                return [
                    'success'=>true                     
                ];
            }else{
                return [
                    'success'=> false,
                    'message'=> 'Pitch Detail Not Found'
                ];
            }
        }else{
            return [
                    'success'=> false,
                    'message'=> 'Parameter missing'
                ];
        }
    }

    public function actionSubmitMpr(){
        if(Yii::$app->user->id){
            $findPitch = Pitch::find()->where(['user_id'=>Yii::$app->user->id,'status'=>'approved'])->one();
            if($findPitch){
                $token = Token::tokenGenerator(Yii::$app->user->id); 

                $model = new Mpr;
                $model->p_id = $findPitch->id;
                $model->applicant_id = Yii::$app->user->id;
                $model->month = $_POST['month'];
                $model->year = $_POST['year'];
                 $model->progress_status = $_POST['status']; 
                $model->remark = $_POST['remark'];                
                $model->uploaded_on = date('Y-m-d H:i:s');             
                $pitchFile = UploadedFile::getInstanceByName('file');   
                $filename = 'mpr_' . time() . '.' . $pitchFile->extension;
                $uploadDir = Yii::getAlias('@webroot/uploads/pitches/'.Yii::$app->user->id.'/');
                if (!file_exists($uploadDir)) {
                    mkdir($uploadDir, 0777, true); // recursive mkdir
                }
                $filePath = $uploadDir . $filename;

                if ($pitchFile->saveAs($filePath)) {
                    $model->file = '/uploads/pitches/'.Yii::$app->user->id.'/' . $filename;

                    if ($model->save()) {
                        
                         return [
                            'success'=>true,
                            'mprData' => Mpr::find()->where(['applicant_id'=>Yii::$app->user->id])->all()
                        ];
                    } else {
                        return ['success' => false, 'message' => $model->getErrors()];
                    }
                } else {
                    return ['success' => false, 'message' => 'Failed to save file.'];
                }
              
               
            }else{
                return [
                    'success'=>false,
                    'message' => 'Sorry you are not authenticate or approved to upload progress report'
                ];
            }
        }
    }

    public function actionPitchStatusList(){
        $token = Token::tokenGenerator(Yii::$app->user->id); 
         return [
                'success' => true,
                'token' => $token,
                'statusData' => PitchStatus::find()->where(['is_active'=>1])->all(),
                'message' => 'status list'
            ];
    }

    public function actionAddPitchStatus(){
        if(isset($_POST['status']) && $_POST['status']){
            $token = Token::tokenGenerator(Yii::$app->user->id); 
            $model = new PitchStatus;
            $model->status = $_POST['status'];
            $model->save();
            return [
                'success' => true,
                'token' => $token,
                'statusData' => PitchStatus::find()->where(['is_active'=>1])->all(),
                'message' => 'Added'
            ];
        }else{
            return [
                'success' => false,
                'message' => 'Please enter status to add'
            ];
        }
    }

    public function actionDeletePitchStatus(){
        if(isset($_POST['id']) && $_POST['id']){
            $token = Token::tokenGenerator(Yii::$app->user->id); 
            $model = PitchStatus::findOne($_POST['id']);
            $model->is_active = 0;
            $model->save();
            return [
                'success' => true,
                'token' => $token,
                'statusData' => PitchStatus::find()->where(['is_active'=>1])->all(),
                'message' => 'Deleted'
            ];
        }else{
            return [
                'success' => false,
                'message' => 'invalid record'
            ];
        }
    }

    public function actionPitchDataByStatus(){
        if(isset($_POST['status'])){
            $pitch = Yii::$app->db->createCommand("SELECT p.id, p.company_name, p.location, p.created_on, u.name 
                from pitch p 
                inner join users u on p.user_id=u.id WHERE p.status='".$_POST['status']."'")->queryAll(); 
            $token = Token::tokenGenerator(Yii::$app->user->id);

            return [
                    'success' => true,
                    'token' => $token,
                    'appData' => $pitch 
                ];
        }
    }

    public function actionInvestorProfile(){
        if(isset($_POST['role'])){
            $model = InvestorProfile::find()->where(['user_id'=>Yii::$app->user->id])->one();
            if(!$model){
                 $model = new InvestorProfile; 
                 $model->user_id = Yii::$app->user->id;
            }
           
            
            $model->role = $_POST['role'];
            $model->industries = implode(',', $_POST['industries']);
            $model->technologies = implode(',', $_POST['technologies']);
            $model->linkedin = $_POST['linkedin'];
            $model->facebook = $_POST['facebook'];
            $model->twitter = $_POST['twitter'];
            $model->insta = $_POST['insta'];
            $model->save();
            $token = Token::tokenGenerator(Yii::$app->user->id);
            return [
                'success' => true,
                'token' =>  $token,
                'investorProfile' => $model
            ];
        }
    }

    public function actionAddInvestmentOpportunity(){
        if(isset($_POST['company_name'])){
            $model = new InvestorOpportunity;

            $token = Token::tokenGenerator(Yii::$app->user->id); 

                $model->user_id = Yii::$app->user->id;
                $ip = InvestorProfile::find()->where(['user_id'=>Yii::$app->user->id])->one();
                $model->ip_id = $ip->id;
                $model->company_name = $_POST['company_name'];                
                $model->fund_name = $_POST['fund_name'];
                $model->fund_size = $_POST['fund_size'];
                $model->stage = $_POST['stage'];
                $model->about_investment = $_POST['about_investment'];
                $model->expiry_date = date('Y-m-d',strtotime($_POST['expiry_date']));

                       
             
                $pitchFile = UploadedFile::getInstanceByName('company_logo');   
                $filename = 'io_' . time() . '.' . $pitchFile->extension;
                $uploadDir = Yii::getAlias('@webroot/uploads/investor opportunity/'.Yii::$app->user->id.'/');
                if (!file_exists($uploadDir)) {
                    mkdir($uploadDir, 0777, true); // recursive mkdir
                }
                $filePath = $uploadDir . $filename;

                if ($pitchFile->saveAs($filePath)) {
                    $model->company_logo =  '/uploads/investor opportunity/'.Yii::$app->user->id.'/' . $filename;

                    if ($model->save()) {
                        
                         return [
                            'success'=>true,
                        ];
                    } else {
                        return ['success' => false, 'message' => $model->getErrors()];
                    }
                } else {
                    return ['success' => false, 'message' => 'Failed to save file.'];
                }

            return [
                'success' => true
            ];
        }
    }

    public function actionGetopportunitydetails(){
        if(isset($_POST['opp_id'])){
            $model = InvestorOpportunity::findOne($_POST['opp_id']);
            if($model){
                 $token = Token::tokenGenerator(Yii::$app->user->id); 
                 return [
                    'success' => true,
                    'token' => $token,
                    'opportunity' => $model,
                    'investorProfile' => InvestorProfile::findOne($model->ip_id),
                    'hostinfo' => Yii::$app->request->hostInfo  ,
                 ];
            }else{
                return ['success' => false, 'message' => 'Failed to load data.'];
            }
        }
    }
    
    public function actionAllOpportunities(){
        $data = Yii::$app->db->createCommand("SELECT o.*, p.industries, p.technologies, p.linkedin as linkedin, p.twitter as twitter, p.facebook as facebook, p.insta as insta FROM investor_opportunity o
            INNER JOIN investor_profile p ON o.ip_id = p.id"
        )->queryAll();
        return [
                'success' => true,
                'opportunities' => $data,               
                'hostinfo' => Yii::$app->request->hostInfo,
             ];
    }

    public function actionInvestorOpportunityStartupConnect(){
        if(isset($_POST['opp_id'])){
            $inModel = InvestorOpportunity::findOne($_POST['opp_id']);
            $pitch = Pitch::find()->where(['user_id'=>Yii::$app->user->id])->one();
            $model = new InvestorOpportunityStartupConnect;
            $model->io_id = $_POST['opp_id'];
            $model->stqartup_user_id = Yii::$app->user->id;
            $model->pitch_id = $pitch->id;
            $model->status = 'pending';
            $model->applied_on = date('Y-m-d H:i:s');             
            $model->save();
            return [
                'success' => true
            ];
        }
       
    }

/*
*  this is call from startup dashboard
*/
    public function actionGetstartupappliedopportunity(){
        $data = Yii::$app->db->createCommand("SELECT ao.id, ao.io_id as opp_id, ao.status, ao.applied_on , o.company_name, o.fund_name 
            FROM investor_opportunity_startup_connect ao
            INNER JOIN investor_opportunity o ON ao.io_id = o.id
            WHERE ao.stqartup_user_id=".Yii::$app->user->id
        )->queryAll();

       
        $token = Token::tokenGenerator(Yii::$app->user->id); 
        return [
                'success' => true,
                'data'=>$data,
                'token'=>$token
            ];
    }

/*
*  this is call from investor dashboard
*  startup user opportunity per apply kargea uska data investor ko show hoga
*/
    public function actionAppliedApplication(){
        $data = Yii::$app->db->createCommand("SELECT ao.id, ao.io_id as opp_id, ao.status, ao.applied_on ,p.company_name, p.location, p.website
            FROM investor_opportunity_startup_connect ao
            INNER JOIN pitch p ON ao.pitch_id = p.id
            INNER JOIN investor_opportunity o ON ao.io_id = o.id
            WHERE o.user_id=".Yii::$app->user->id
        )->queryAll();

       
        $token = Token::tokenGenerator(Yii::$app->user->id); 
        return [
                'success' => true,
                'data'=>$data,
                'token'=>$token
            ];
    }

}

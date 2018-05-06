<?php
namespace Home\Controller;
use Think\Controller;
use Home\Controller\CommonController;
class UserController extends CommonController {
    public function _initialize()
    {
        parent::_initialize(); // TODO: Change the autogenerated stub
    }

    public function index(){
		$userid = session('userid');

		$this->display();
	}
	

    /**
     * 个人资料
     */
    public function profile()
    {
        $userid = session('userid') ;
        $info = M('user')->where(array('id'=>$userid))->find();
        $this->assign('info',$info);
        $this->display();
    }
    /**
     * 个人资料修改
     */
    public function ajax_profile()
    {
        $userid = session('userid') ;
        $realname = I('post.realname');
        $idcard = I('post.idcard');
        $country = I('post.country');
        $province = I('post.province');
        $city = I('post.city');

        $info = M('User')->where(array('id'=>$userid))->save(array(
            'realname'=>$realname,'idcard'=>$idcard,
            'country'=>$country,'province'=>$province,'city'=>$city,
        ));
        if($info){
            echo ajax_return(1,'修改成功');
        }else{
            echo ajax_return(0,'修改失败');
        }
    }

    /**
     * 密码管理
     */
    public function password()
    {
        $this->display();
    }
    /**
     * 修改登录密码
     */
    public function ajax_password()
    {
        $userid = session('userid');
        $oldpassword = I('post.oldpassword');
        $newpassword = I('post.newpassword');
        $newpassword2 = I('post.newpassword2');

        if($oldpassword == '' || $newpassword == '' || $newpassword2 == '' || $newpassword != $newpassword2){
            echo ajax_return(0,'密码设置不正确');exit;
        }

        $password = M('user')->where(array('id'=>$userid))->getField('password');
        if($password != md5($oldpassword)){
            echo ajax_return(0,'原始密码输入不正确');exit;
        }

        $info = M('user')->where(array('id'=>$userid))->setField(array('password'=>md5($newpassword)));
        if($info){
            echo ajax_return(1,'修改成功');exit;
        }else{
            echo ajax_return(0,'修改失败');
        }

    }
    /**
     * 修改交易密码
     */
    public function ajax_paypassword()
    {
        $userid = session('userid') ;
        $oldpassword = I('post.oldpassword');
        $newpassword = I('post.newpassword');
        $newpassword2 = I('post.newpassword2');

        if($oldpassword == '' || $newpassword == '' || $newpassword2 == '' || $newpassword != $newpassword2){
            echo ajax_return(0,'密码设置不正确');exit;
        }

        $password = M('user')->where(array('id'=>$userid))->getField('paypassword');
        if($password != md5($oldpassword)){
            echo ajax_return(0,'原始密码输入不正确');exit;
        }

        $info = M('user')->where(array('id'=>$userid))->setField(array('paypassword'=>md5($newpassword)));
        if($info){
            echo ajax_return(1,'修改成功');exit;
        }else{
            echo ajax_return(0,'修改失败');
        }

    }

    /**
     * 手机页面
     */
    public function phone()
    {
        $this->display();
    }

    /**
     *发送更换手机短信验证
     */
    public function ajax_send_sms()
    {
        $phone = I('post.phone');
        //判断手机号是否存在
        $id = M('user')->where(array('phone'=>$phone))->getField('id');
        if($id){
            echo ajax_return(0,'手机号已存在');exit;
        }
        $code = mt_rand(10000,99999);
        $result = send_sms('72713',$phone,$code);
        if($result['info'] == 'success'){
            session($phone.'chg',$code);
            echo ajax_return(1,'短信验证码发送成功');
        }else{
            echo ajax_return(0,$result['msg']);
        }
    }

    /**
     * 更换手机号操作
     */
    public function ajax_change_phone()
    {
        $phone = I('post.phone');
        $sms = I('post.sms');

        $userid = session('userid') ;
        //判断短信吗是否正确
        if($sms != session($phone . 'chg')){
            echo ajax_return(0,'短信验证码不正确');exit;
        }
        //可以更换
        $info = M('user')->where(array('id'=>$userid))->setField(array('phone'=>$phone,'username'=>$phone));
        if($info){
            session('phone',$phone);
            echo ajax_return(0,'修改成功');
        }else{
            echo ajax_return(0,'修改失败');
        }
    }


    /**
     * 我的设备
     */
    public function device()
    {
        $userid = session('userid');
        $mydevice = M('user_device')->alias('a')->join('left join device b on a.device_id=b.id')->field('a.*,b.name')->where(array('userid'=>$userid))->select();
        $this->assign('mydevice',$mydevice);

        $device = M('device')->select();
        $res = array();
        foreach($device as $v){ //{id:'1',value:'POS机'}
            $res[] = array('id'=>$v['id'],'value'=>$v['name']);
        }
        $this->assign('res',json_encode($res));
        $this->display();
    }
    /**
     * 获取设备信息
     */
    public function ajax_get_device()
    {
        $id = I('post.id');
        $device = M('device')->where(array('id'=>$id))->find();
        if(!$device){
            echo ajax_return(0,'请求有误');exit;
        }
        if(!$device['status']){
            echo ajax_return(0,'暂未开放');exit;
        }
        echo ajax_return(1,'yes');exit;
    }
    /**
     * 添加设备页面
     */
    public function adddevice()
    {
        $id = I('param.id');
        $device = M('device')->where(array('id'=>$id))->find();
        $this->assign('device',$device);
        $this->display();
    }
    public function ajax_add_device()
    {
        $userid = session('userid');
        $id = I('post.id');
        $sn = I('post.sn');
        $mima = I('post.mima');
        $device = M('device')->where(array('id'=>$id))->find();
        if(!$device){
            echo ajax_return(0,'请求有误');exit;
        }
        if(!$device['status']){
            echo ajax_return(0,'暂未开放,不能绑定');exit;
        }
        $device_sn = M('device_sn')->where(array('device_id'=>$id,'sn'=>$sn,'mima'=>$mima))->find();
        if(!$device_sn){
            echo ajax_return(0,'SN码或密码不正确');exit;
        }
        if(!$device_sn['status']){
            echo ajax_return(0,'此sn码已绑定');exit;
        }
        //判断最大数量
        $count = M('user_device')->where(array('userid'=>$userid,'device_id'=>$device['id']))->count();
        if($count>=$device['max']){
            echo ajax_return(0,'您已超过该设备绑定添加的最大限制');exit;
        }
        //可以绑定
        $jihuo = 0;
        if($device['charge']){
            $jihuo = 0; //未激活
        }else{
            $jihuo =1; //激活
        }

        $pid = M('user')->where(array('id'=>$userid))->getField('pid');//上级
		if($pid){
			$ppid = M('user')->where(array('id'=>$pid))->getField('pid');//上上级
		}
        $mo = M();
        $mo->startTrans();
        $rs = array();
        $rs[] = $mo->table('user_device')->add(array('userid'=>$userid,'device_id'=>$device['id'],'sn'=>$sn,'mima'=>$mima,'createdate'=>time(),'status'=>$jihuo));
        if($pid){
            if($device['yuanlibi']){
                //给推荐人返原力币
                $rs[] = $mo->table('myinvite')->add(array('userid'=>$pid,'device_id'=>$rs[0],'type'=>1,'num'=>$device['yuanlibi'],'status'=>$jihuo,'createdate'=>time()));
                if($jihuo){
                    $field = 'lth';
                }else{
                    $field = 'lthd';
                }
                $rs[] = $mo->table('user_coin')->where(array('userid'=>$pid))->setInc($field,$device['yuanlibi']);
            }
        }
		if($ppid){
            if($device['yuanlibi_2']){
                //给推荐人返原力币
                $rs[] = $mo->table('myinvite')->add(array('userid'=>$ppid,'device_id'=>$rs[0],'type'=>1,'num'=>$device['yuanlibi_2'],'status'=>$jihuo,'createdate'=>time()));
                if($jihuo){
                    $field = 'lth';
                }else{
                    $field = 'lthd';
                }
                $rs[] = $mo->table('user_coin')->where(array('userid'=>$ppid))->setInc($field,$device['yuanlibi_2']);
            }
        }
        if($jihuo){
            if($device['suanli']){
                //给自己返算力 一般需要激活才返
                $rs[] = $mo->table('myinvite')->add(array('userid'=>$userid,'device_id'=>$rs[0],'type'=>2,'num'=>$device['suanli'],'status'=>$jihuo,'createdate'=>time()));
                $rs[] = $mo->table('user_coin')->where(array('userid'=>$userid))->setInc('lthz',$device['suanli']);
            }
        }
        $rs[] = M('device_sn')->where(array('id'=>$device_sn['id']))->setField('status',0);
        if(check_arr($rs)){
            $mo->commit();
            echo ajax_return(1,'新增设备成功');
        }else{
            $mo->rollback();
            echo ajax_return(0,'新增设备失败');
        }

    }
    /**
     * 邀请好友
     */
    public function invite()
    {
        $phone = session('phone');
        $this->assign('phone',$phone);
        $this->display();
    }
    /**
     * 实名认证
     */
    public function certification()
    {
        $userid = session('userid');
        $info = M('user_certification')->where(array('userid'=>$userid))->find();

        if($info && $info['status']){
            $is_cert = true;
            $notice = '恭喜您已通过实名认证';
        }elseif($info){
            $is_cert = true;
            $notice = '您已提交实名认证，请耐心等待后台审核';
        }
        $this->assign('is_cert',$is_cert);
        $this->assign('notice',$notice);
        $this->display();
    }
    public function ajax_certification()
    {
        $userid = session('userid');
        //先判断是否已经提交或审核通过
        $info = M('user_certification')->where(array('userid'=>$userid))->find();
        if($info && $info['status']){
            echo ajax_return(0,'您已通过实名认证，无需再次提交');exit;
        }elseif($info){
            echo ajax_return(0,'您已提交实名认证，请耐心等待后台审核');exit;
        }
        $realname = I('post.realname');
        $idcard = I('post.idcard');
        $zhengmian = upload_file(UP_USER,$_FILES['file1']);
        $fanmian = upload_file(UP_USER,$_FILES['file2']);
        $shouchi = upload_file(UP_USER,$_FILES['file3']);
        $id = M('user_certification')->add(array('userid'=>$userid,'zheng'=>$zhengmian,'fan'=>$fanmian,'shou'=>$shouchi,
                'realname'=>$realname,'idcard'=>$idcard,'createdate'=>time()
            ));
        if($id){
            echo ajax_return(1,'提交成功，请耐心等待后台审核');
        }else{
            echo ajax_return(0,'提交失败');
        }
    }


    /**
     * 邀请记录
     */
    public function myinvite()
    {
        $userid = session('userid');
        $p = I('param.p',1);
        $list = 5;
        $res = M('myinvite')->where(array('userid'=>$userid))->order('id desc')->page($p.','.$list)->select();
        $this->assign('res',$res);
        $this->display();
    }
    /**
     * 转出记录
     */
    public function ajax_myinvite()
    {
        $userid = session('userid');
        $p = I('param.p',1);
        $list = 5;
        $res = M('myinvite')->where(array('userid'=>$userid))->order('id desc')->page($p.','.$list)->select();
        foreach($res as &$v){
            $v['date'] = date('m月d日');
            $v['time'] = date('H:i');
        }
        echo json_encode($res);
    }





	/*
	*添加申请pos机或路由器
	*/
	public function getpos(){
		$this->display();
	}
	public function getrouter(){
		$this->display();
	}
	public function addaddress(){
		$this->display();
	}

	/**
     * 退出登录
     */
	public function ajax_logout()
    {
        session(null);
        echo ajax_return(1,'退出成功');
    }

    
}
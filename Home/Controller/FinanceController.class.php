<?php
namespace Home\Controller;
use Think\Controller;
use Home\Controller\CommonController;
class FinanceController extends CommonController {

    public function _initialize()
    {
        parent::_initialize(); // TODO: Change the autogenerated stub
    }
	//检查是否实名认证
	private function check_certification(){
		$userid = session('userid');
		$is_cert = M('user')->where(array('id'=>$userid))->getField('is_cert');
		if($is_cert){
			return true;
		}
		return false;
	}
    public function index(){
		$userid = session('userid');
		//合计挖矿收益
		$wk_hj =  M('sys_fl_log')->where(array('userid'=>$userid,'status'=>1))->sum('num');
		$this->assign('wk_hj',$wk_hj);
		$this->display();
	}

	/**
     * 资产管理
     */
	public function wallet(){
		$userid = session('userid');
		//昨日挖矿收益
		$yt_s = mktime(0,0,0,date('m'),date('d')-1,date('Y'));
		$yt_e = mktime(0,0,0,date('m'),date('d'),date('Y')) -1;
		$yt = M('sys_fl_log')->where(array('userid'=>$userid,'status'=>1,'createdate'=>array('between',array($yt_s,$yt_e))))->sum('num');
		//本月挖矿收益
		$by_s=mktime(0,0,0,date('m'),1,date('Y'));
		$by_e=mktime(23,59,59,date('m'),date('t'),date('Y'));
		$by = M('sys_fl_log')->where(array('userid'=>$userid,'status'=>1,'createdate'=>array('between',array($by_s,$by_e))))->sum('num');
		//合计挖矿收益
		$wk_hj =  M('sys_fl_log')->where(array('userid'=>$userid,'status'=>1))->sum('num');
		
		$this->assign('wk_zt',$yt);
		$this->assign('wk_by',$by);
		$this->assign('wk_hj',$wk_hj);
		$this->display();
	}
    /**
     * 我的转入页面
     */
    public function myzr()
    {

        $userid = session('userid');
        $phone = session('phone');
        $wallet = M('user_coin')->where(array('userid'=>$userid))->find();
		
		
		
		
        //没有钱包地址先生成
        if(!$wallet['lthb']){
            Vendor("Move.ext.client");
            $user = C('wallet_user');
            $pwd = C('wallet_pwd');
            $host = C('wallet_host');
            $port = C('wallet_port');
            //$client = new \client($user,$pwd,$host,$port, 5, [], 1); //暂时不能用 。。。。。
            $client = new \client('...','...', '..', 29416, 5, [], 1);

            if(!$client){
                $qianbao = '';
            }else{
                //从服务器上获取当前手机号的钱包地址
                $qianbao_addr = $client->getaddressesbyaccount($phone);
                //var_dump($qianbao_addr);exit;
                if (!is_array($qianbao_addr)) {
                    $qianbao_ad = $client->getnewaddress($phone);

                    if (!$qianbao_ad) {
                        $qianbao = '';
                    }else {
                        $qianbao = $qianbao_ad;
                        M('user_coin')->where(array('userid'=>$userid))->save(array('lthb'=>$qianbao));
                    }
                }else{
                    $qianbao = $qianbao_addr[0];
                    M('user_coin')->where(array('userid'=>$userid))->save(array('lthb'=>$qianbao));
                }
            }
        }else{
            $qianbao = $wallet['lthb'];
        }
		
        $this->assign('qianbao',$qianbao);
        $this->display();
    }

    public function myzrdetail()
    {
        $userid = session('userid');
        $p = I('param.p',1);
        $list = 5;
        $res = M('myzr')->where(array('userid'=>$userid))->order('id desc')->page($p.','.$list)->select();
        $this->assign('res',$res);
        $this->display();
    }
    /**
     * 转入记录
     */
    public function ajax_myzrdetail()
    {
        $userid = session('userid');
        $p = I('param.p',1);
        $list = 5;
        $res = M('myzr')->where(array('userid'=>$userid))->order('id desc')->page($p.','.$list)->select();
        foreach($res as &$v){
            $v['date'] = date('m月d日');
            $v['time'] = date('H:i');
        }
        echo json_encode($res);
    }

    /**
     * 转出页面
     */
    public function myzc()
    {
        //我的钱包地址
        $address = M('user_qianbao')->where(array('userid'=>session('userid')))->select();

        $this->assign('address',$address);
        $this->display();
    }
    /*
	地址列表
	*/
	public function address(){
		$userid = session('userid');
		$res = M('user_qianbao')->where(array('userid'=>$userid))->select();
		$this->assign('res',$res);
		$this->display();
	}
	public function ajax_address_del(){
		$id = I('post.id');
		$userid = session('userid');
		$info = M('user_qianbao')->where(array('id'=>$id,'userid'=>$userid))->find();
		if(!$info){
			echo ajax_return(0,'请求有误');exit;
		}
		$res = M('user_qianbao')->delete($id);
		if($res){
			echo ajax_return(1,'删除成功');
		}else{
			echo ajax_return(0,'删除失败');
		}
	}
	/*地址类型
	*/
	public function zcwallet(){
		$id = I('param.id');
		$userid = session('userid');
		if($id){ //存在id是编辑
			$info = M('user_qianbao')->where(array('id'=>$id,'userid'=>$userid))->find();
			if(!$info){
				redirect(U('finance/address'));
			}
			$this->assign('info',$info);
		}
		
		$this->display();
	}
    /**
     *添加我的转出钱包地址
     */
    public function ajax_add_myzc_wallet()
    {
        $name = I('post.name');
        $address = I('post.address');
        $id = I('post.id');
        if($name == '' || $address == ''){
            echo ajax_return(0,'钱包标识和钱包地址不能为空');exit;
        }
        $userid = session('userid');
		if($id){
			//编辑
			$info = M('user_qianbao')->where(array('id'=>$id,'userid'=>$userid))->find();
			if(!$info){
				echo ajax_return(0,'请求有误');exit;
			}
			$res = M('user_qianbao')->where(array('id'=>$id))->setField(array('name'=>$name,'address'=>$address));
		}else{
			//新增
			$res = M('user_qianbao')->add(array('userid'=>$userid,'name'=>$name,'address'=>$address,'createdate'=>time()));
		}
        
        if($res){
            echo ajax_return(1,'操作成功');exit;
        }else{
            echo ajax_return(0,'操作失败');exit;
        }
    }

    /**
     * 转出发送短信
     */
    public function ajax_send_sms_myzc()
    {
        $phone = session('phone');
        //如果短信存在则不让再发
        if(session($phone . 'myzc')){
            echo ajax_return(1,'短信已发送');exit;
        }
		if(!$this->check_certification()){
			echo ajax_return(0,'请先进行实名认证');exit;
		}
        $code = mt_rand(10000, 99999);
        $result = send_sms('78771', $phone, $code);
        if ($result['info'] == 'success') {
            session($phone . 'myzc', $code);
            echo ajax_return(1, '短信验证码发送成功');
        } else {
            echo ajax_return(0, $result['msg']);
        }
    }
    /**
     * 转出提交
     */
    public function ajax_myzc()
    {
        $num = I('post.num');
        $sms = I('post.sms');
        $address = I('post.address');
        $paypassword = I('post.paypassword');

        $userid = session('userid');
        $phone = session('phone');
        //判断短信验证码是否正确
        if($sms != session($phone . 'myzc')){
            echo ajax_return(0,'短信验证码不正确');exit;
        }
        //判断address 是否存在
        $address = M('user_qianbao')->where(array('userid'=>$userid,'id'=>$address))->find();
        if(!$address){
            echo ajax_return(0,'转出地址不存在');exit;
        }

        //判断交易密码是否正确
        $password = M('user')->where(array('id'=>$userid))->getField('paypassword');
        if($password != md5($paypassword)){
            echo ajax_return(0,'支付密码不正确');exit;
        }

        //判断数量是否正确
        if($num <= 0 || !is_numeric($num)){
            echo ajax_return(0,'数量格式不正确');exit;
        }
        $user_coin = M('user_coin')->where(array('userid'=>$userid))->find();
        if($user_coin['lth'] < $num){
            echo ajax_return(0,'数量不足');exit;
        }

        //可以转出
        $mo = M();
        $mo->startTrans();
        $rs = array();
        $rs[] = $mo->table('user_coin')->where(array('userid'=>$userid))->setDec('lth',$num);
        $rs[] = $mo->table('user_coin')->where(array('userid'=>$userid))->setInc('lthd',$num);
        $rs[] = $mo->table('myzc')->add(array('userid'=>$userid,'address'=>$address['address'],'num'=>$num,'createdate'=>time()));

        if(check_arr($rs)){
            $mo->commit();
            echo ajax_return(1,'转出申请提交成功，请等待后台审核');
        }else{
            $mo->rollback();
            echo ajax_return(0,'转出申请提交失败');
        }

    }

    public function myzcdetail()
    {
        $userid = session('userid');
        $p = I('param.p',1);
        $list = 5;
        $res = M('myzc')->where(array('userid'=>$userid))->order('id desc')->page($p.','.$list)->select();
        $this->assign('res',$res);
        $this->display();
    }
    /**
     * 转出记录
     */
    public function ajax_myzcdetail()
    {
        $userid = session('userid');
        $p = I('param.p',1);
        $list = 5;
        $res = M('myzc')->where(array('userid'=>$userid))->order('id desc')->page($p.','.$list)->select();
        foreach($res as &$v){
            $v['date'] = date('m月d日');
            $v['time'] = date('H:i');
        }
        echo json_encode($res);
    }

   
    /**
     * 会员转账
     */
    public function transfer()
    {
        $this->display();
    }
    public function ajax_transfer()
    {
        $userid = session('userid');

        $realname = I('post.realname');
        $phone = I('post.phone');
        $money = I('post.money');
        $password = I('post.password');

        if($realname == '' || $phone == ''){
            echo ajax_return(0,'手机号或真实姓名不能为空');exit;
        }
        if($money <=0 || !is_numeric($money)){
            echo ajax_return(0,'金额不正确');exit;
        }

        $from = M('user')->where(array('id'=>$userid))->find();
        if(!$from['is_cert']){
            echo ajax_return(0,'请先实名认证');exit;
        }
        $info = M('user')->where(array('phone'=>$phone,'realname'=>$realname))->find();
        if(!$info){
            echo ajax_return(0,'输入的对方信息不正确');exit;
        }

        if($from['paypassword'] != md5($password)){
            echo ajax_return(0,'支付密码不正确');exit;
        }

        $user_coin = M('user_coin')->where(array('userid'=>$userid))->lock(true)->find();

        if($user_coin['lth'] < $money){
            echo ajax_return(0,'余额不足');exit;
        }
        if($info['id'] == $userid){
            echo ajax_return(0,'不能给自己转账');exit;
        }
        //可以转
        $mo = M();
        $mo->startTrans();
        $rs = array();

        $rs[] = $mo->table('user_coin')->where(array('userid'=>$userid))->setDec('lth',$money);
        $rs[] = $mo->table('user_coin')->where(array('userid'=>$info['id']))->setInc('lth',$money);
        $rs[] = $mo->table('mytransfer')->add(array('userid'=>$userid,'peerid'=>$info['id'],'num'=>$money,'realname'=>$realname,'phone'=>$phone,'createdate'=>time()));

        if(check_arr($rs)){
            $mo->commit();
            echo ajax_return(1,'转账成功');
        }else{
            $mo->rollback();
            echo ajax_return(0,'转账失败');
        }
    }

    /**
     * 会员转账记录
     */
    public function transferlog()
    {
        $userid = session('userid');
        $p = I('param.p',1);
        $list = 5;
        $map['userid'] = $userid;
        $map['peerid'] = $userid;
        $map['_logic'] = 'or';
        $res = M('mytransfer')->where($map)->order('id desc')->page($p.','.$list)->select();
        foreach($res as &$v){
            if($v['userid'] == $userid){
                $v['type'] = 'zc';
				$v['phone'] = M('user')->where(array('id'=>$v['peerid']))->getField('phone');
            }
            if($v['peerid'] == $userid){
                $v['type'] = 'zr';
				$v['phone'] = M('user')->where(array('id'=>$v['userid']))->getField('phone');
            }
        }
        $this->assign('res',$res);
        $this->display();
    }
    /**
     * 会员转账记录
     */
    public function ajax_transferlog()
    {
        $userid = session('userid');
        $p = I('param.p',1);
        $list = 5;
        $map['userid'] = $userid;
        $map['peerid'] = $userid;
        $map['_logic'] = 'or';
        $res = M('mytransfer')->where($map)->order('id desc')->page($p.','.$list)->select();
        foreach($res as &$v){
            $v['date'] = date('m月d日');
            $v['time'] = date('H:i');
            if($v['userid'] == $userid){
                $v['type'] = 'zc';
				$v['phone'] = M('user')->where(array('id'=>$v['peerid']))->getField('phone');
            }
            if($v['peerid'] == $userid){
                $v['type'] = 'zr';
				$v['phone'] = M('user')->where(array('id'=>$v['userid']))->getField('phone');
            }
        }
        echo json_encode($res);
    }

}
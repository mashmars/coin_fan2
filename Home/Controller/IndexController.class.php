<?php
namespace Home\Controller;
use Think\Controller;
use Home\Controller\CommonController;

class IndexController extends CommonController {
	public function index(){

	    $userid = session('userid');
	    
		//24小时内待收取的  超过24小时作废
		$guoqi = time() - 24*3600;
		M('sys_fl_log')->where(array('userid'=>$userid,'status'=>2,'createdate'=>array('lt',$guoqi)))->setField('status',0);
		//待收取的
		$wait = M('sys_fl_log')->where(array('userid'=>$userid,'status'=>2))->select();
		//我的收取记录4条
		$shouqu = M('sys_fl_log')->where(array('userid'=>$userid,'status'=>1))->limit(4)->order('id desc')->select();
		if($shouqu[0]){
			foreach($shouqu as &$v){
				$v['createdate'] = format_date($v['createdate']);
			}
		}
		//我获取的算力 4条
		$suanli = M('myinvite')->where(array('userid'=>$userid,'type'=>2))->limit(4)->order('id desc')->select();
		
		//前三名算理最多的
		$paihang = M('user_coin')->alias('a')->join('left join user b on a.userid=b.id')->field('b.phone,a.lthz')->order('lthz desc,a.id desc')->limit(3)->select();
		
		$this->assign('wait',$wait);
		$this->assign('shouqu',$shouqu);
		$this->assign('suanli',$suanli);
		$this->assign('paihang',$paihang);
		
		$this->display();
		exit;

		Vendor("Move.ext.client");

		$client = new \client('a5c','543', '127.0.0.1', 31253, 5, [], 1);
		if (!$client) {
			var_dump('aaa');
		}else{
			var_dump('a');
			echo '<pre>';
			//var_dump($client);
			//$res = $client->execute("listtransactions", ["*", 20, 0]);
			//$res = $client->execute("getinfo");
			$res = $client->getnewaddress();//生成新地址			
			//var_dump($res);
			//$res = $client->getaddressesbyaccount('15890143123');//获取新地址
				var_dump($res);
		}
		var_dump('dd');exit;
		$this->display();
	}
	//收取能量
	public function ajax_shouqu(){
		$id = I('post.id');
		if(!$id){
			echo ajax_return(0,'请求有误');exit;
		}
		$userid = session('userid');
		$info = M('sys_fl_log')->where(array('id'=>$id,'userid'=>$userid,'status'=>2))->lock(true)->find();
		if(!$info){
			echo ajax_return(0,'请求有误');exit;
		}
		$mo = M();
		$rs = array();
		$mo->startTrans();
		$rs[] = $mo->table('sys_fl_log')->where(array('id'=>$id,'userid'=>$userid,'status'=>2))->setField('status',1);
		$rs[] = $mo->table('user_coin')->where(array('userid'=>$userid))->setInc('lth',$info['num']);
		
		if(check_arr($rs)){
			$mo->commit();
			echo ajax_return(1,'收取成功');
		}else{
			$mo->rollback();
		}
	}
	
	//申请pos 路由
	public function ajax_add_shenqing(){
		$userid = session('userid');
		$shr = I('post.xm');
		$lxfs = I('post.lxfs');
		$address = I('post.address');
		$area = I('post.area');
		$type = I('post.type');
		if($type !=1 && $type !=2){
			echo ajax_return(0,'请求参数不正确');exit;
		}
		if(!$shr || !$lxfs || !$address || !$area){
			echo ajax_return(0,'请求参数不正确');exit;
		}
		//
		$info = M('user_shenqing')->where(array('userid'=>$userid,'status'=>2,'type'=>$type))->find();
		if($info){
			echo ajax_return(0,'已经提交申请，无需重复申请，请等待管理人员与您联系');exit;
		}
		$res = M('user_shenqing')->add(array('userid'=>$userid,'shr'=>$shr,'lxfs'=>$lxfs,'address'=>$address,'area'=>$area,'type'=>$type,'createdate'=>time()));
		if($res){
			echo ajax_return(1,'申请提交成功，请耐心等待管理人员与您联系');
		}else{
			echo ajax_return(0,'申请提交失败');
		}
	}
}
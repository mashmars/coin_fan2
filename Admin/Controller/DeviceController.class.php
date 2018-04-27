<?php
namespace Admin\Controller;
use Think\Controller;

class DeviceController extends Controller {
	public function device(){
	    $p = I('param.p',1);
	    $list = 10;
	    $res = M('device')->page($p.','.$list)->select();
	    $count = M('device')->count();
	    $page = new \Think\Page($count,$list);
	    $show = $page->show();
	    $this->assign('res',$res);
	    $this->assign('count',$count);
	    $this->assign('page',$show);
	    $this->display();
	}
	public function ajax_device_add()
    {
        $data = I('post.');
        if($data['name'] == ''){
            echo ajax_return(0,'设备名称不能为空');exit;
        }
        $res = M('device')->add($data);
        if($res){
            echo ajax_return(1,'添加成功');
        }else{
            echo ajax_return(0,'添加失败');
        }
    }
    public function device_edit()
    {
        $id = I('param.id');
        $info = M('device')->where(array('id'=>$id))->find();
        $this->assign('info',$info);
        $this->display();
    }
    public function ajax_device_edit()
    {
        $data = I('post.');
        if($data['name'] == ''){
            echo ajax_return(0,'设备名称不能为空');exit;
        }
        $res = M('device')->save($data);
        if($res){
            echo ajax_return(1,'编辑成功');
        }else{
            echo ajax_return(0,'编辑失败');
        }
    }
    public function ajax_device_del()
    {
        $id = I('post.id');
        echo ajax_return(0,'不支持删除，否则对程序会造成很大影响，在下面验证消费记录那');exit;
        $res = M('device')->delete($id);
        if($res){
            echo ajax_return(1,'删除成功');
        }else{
            echo ajax_return(0,'删除失败');
        }
    }

    /**
     * SN管理
     */
    public function sn(){
        $p = I('param.p',1);
        $list = 10;
        $res = M('device_sn')->alias('a')->join('left join device b on a.device_id=b.id')->field('a.*,b.name')->page($p.','.$list)->select();
        $count = M('device_sn')->count();
        $page = new \Think\Page($count,$list);
        $show = $page->show();
        $this->assign('res',$res);
        $this->assign('count',$count);
        $this->assign('page',$show);
        $this->display();
    }
    public function sn_add()
    {
        $device = M('device')->select();

        $this->assign('device',$device);
        $this->display();
    }
    public function ajax_sn_add()
    {
        $data = I('post.');
        if($data['device_id'] == ''){
            echo ajax_return(0,'设备不能为空');exit;
        }
        $res = M('device_sn')->add($data);
        if($res){
            echo ajax_return(1,'添加成功');
        }else{
            echo ajax_return(0,'添加失败');
        }
    }
    public function sn_edit()
    {
        $device = M('device')->select();
        $id = I('param.id');
        $info = M('device_sn')->where(array('id'=>$id))->find();
        $this->assign('info',$info);
        $this->assign('device',$device);
        $this->display();
    }
    public function ajax_sn_edit()
    {
        $data = I('post.');
        if($data['device_id'] == ''){
            echo ajax_return(0,'设备不能为空');exit;
        }
        $res = M('device_sn')->save($data);
        if($res){
            echo ajax_return(1,'编辑成功');
        }else{
            echo ajax_return(0,'编辑失败');
        }
    }
    public function ajax_sn_del()
    {
        $id = I('post.id');

        $res = M('device_sn')->delete($id);
        if($res){
            echo ajax_return(1,'删除成功');
        }else{
            echo ajax_return(0,'删除失败');
        }
    }


    /**
     * 消费记录导入 先上传 再导入
     */
    public function import(){
        if(IS_POST){
            $up = new \Think\Upload();
            $up->exts = array('xls','xlsx');

            $up->subName  =''; // 子目录创建方式
            $up->rootPath  = '.' . UP_INFO;

            $info = $up->uploadOne($_FILES['info']);
            if(!$info){
                $this->error($up->getError());
            }else{
                $filename =  $info['savepath'] . $info['savename'];

                //导入数据库
                $this->import_info($filename);

            }
        }
    }
    public function device_log(){
        $p = I('param.p',1);
        $list = 10;
        $res = M('device_xiaofei_log')->page($p.','.$list)->select();
        $count = M('device_xiaofei_log')->count();
        $page = new \Think\Page($count,$list);
        $show = $page->show();
        $this->assign('res',$res);
        $this->assign('count',$count);
        $this->assign('page',$show);
        $this->display();
    }
    //导入数据库操作
    private function import_info($filename){
        vendor('PHPExcel');
        Vendor("PHPExcel.IOFactory");
        Vendor("PHPExcel.Reader.Excel5");
        Vendor("PHPExcel.Reader.Excel2007");

        $filename = '.' . UP_INFO . $filename; //文件位置
        if(!is_file($filename)){
            $this->error('excel文件有误,请检查!','',2);
        }
        /*$objReader = \PHPExcel_IOFactory::createReader('Excel5');
        $objPHPExcel = $objReader->load($filename,$encode='utf-8');
        */
        $extension = strtolower( pathinfo($filename, PATHINFO_EXTENSION) );
        if ($extension =='xlsx') {
            $objReader = new \PHPExcel_Reader_Excel2007();
            $objPHPExcel = $objReader ->load($filename);
        } else if ($extension =='xls') {
            $objReader = new \PHPExcel_Reader_Excel5();
            $objPHPExcel = $objReader ->load($filename);
        } else if ($extension=='csv') {
            $PHPReader = new \PHPExcel_Reader_CSV();
            //默认输入字符集
            $PHPReader->setInputEncoding('GBK');
            //默认的分隔符
            $PHPReader->setDelimiter(',');
            //载入文件
            $objPHPExcel = $PHPReader->load($filename);
        }


        $sheet = $objPHPExcel->getSheet(0);
        $columns = $sheet->getHighestColumn(); //获取最大列数

        if($columns != 'F'){
            $this->error('excel表格式列数不正确!','',1);
        }
        $rows = $sheet->getHighestRow();             //获取最大行数

        //要导入的字段名
        $fields = array('device_sn','order_sn','day','time','money','fee');

        $column =array('A','B','C','D','E','F');

        for($i=2;$i<=$rows;$i++){

            $data = array();
            for($j=0;$j<count($column);$j++){
                if($fields[$j] == 'order_sn'){
                    $d = $objPHPExcel->getActiveSheet()->getCell($column[$j].$i)->getValue();
                    if(M('device_xiaofei_log')->where(array('order_sn'=>$d))->getField('id')){
                        $data['no_insert'] = true;
                    }
                }
                $data[$fields[$j]] = $objPHPExcel->getActiveSheet()->getCell($column[$j].$i)->getValue();

            }

            if($data['no_insert']){
                continue;
            }

            $data['createdate'] = time();
            M('device_xiaofei_log')->add($data);
        }

        $this->success('导入数据库成功!','',1);

    }

    /**
     * 验证消费记录
     * 规则 都是pos验证， 如果sn码不在发布的里面 直接作废。 如果对应的设备未激活 先去激活 激活后的消费记录返算力
     */
    public function ajax_verify_xiaofei()
    {
        $device_sns = M('device_xiaofei_log')->distinct(true)->where(array('status'=>0))->getField('device_sn',true);
        if(!$device_sns){
            echo ajax_return(0,'没有可用的消费记录');exit;
        }
        $xiaofei = M('device_xiaofei_log')->where(array('device_sn'=>array('in',$device_sns),'status'=>0))->field('device_sn,sum(fee) as fee')->group('device_sn')->select();
        //找到pos机的设置
        $device = M('device')->where('id=1')->find();
        foreach($xiaofei as $v){
            $suanli = 0;//增加的算力
            //先找到这个sn被绑定没 ，如果没绑定直接作废 ， 如果有绑定 先判断该设备的状态是激活还是未激活
            // 如果激活只给自己返算力 没激活则判断激活条件 达到后给上级的冻结原力币去掉进可用 同时给你返算力
            $user_device = M('user_device')->where(array('sn'=>$v['device_sn']))->find();
            if(!$user_device){
                M('device_xiaofei_log')->where(array('device_sn'=>$v['device_sn']))->setField('status',2);//无效状态
                continue;
            }

            //已激活
            if($user_device['status'] == 1){
                $suanli = $v['fee'];
                $myself = M('user_coin')->where(array('userid'=>$user_device['userid']))->lock(true)->find();
                M('user_coin')->where(array('userid'=>$user_device['userid']))->setInc('lthz',$suanli);
                M('device_xiaofei_log')->where(array('device_sn'=>$v['device_sn']))->setField('status',1);
                M('myinvite')->add(array('userid'=>$user_device['userid'],'device_id'=>$user_device['id'],'type'=>2,'num'=>$suanli,'status'=>1,'createdate'=>time()));
            }else{
                //没哟激活
                if($v['fee'] >= $device['charge']){
                    //给上级返原力币 解冻 给自己返算力
                    $suanli = $v['fee'] - $device['charge'];
                    $myself = M('user_coin')->where(array('userid'=>$user_device['userid']))->lock(true)->find();

                    $mo = M();
                    $mo->startTrans();
                    $rs = array();
                    //给自己返算力
                    if($suanli > 0){
                        $rs[] =$mo->table('user_coin')->where(array('userid'=>$user_device['userid']))->setInc('lthz',$suanli);
                        $rs[] = $mo->table('myinvite')->add(array('userid'=>$user_device['userid'],'device_id'=>$user_device['id'],'type'=>2,'num'=>$suanli,'status'=>1,'createdate'=>time()));
                    }

                    //给推荐人激活原力币及给自己返算力
                    $myinvite = M('myinvite')->where(array('device_id'=>$user_device['id'],'type'=>1))->lock(true)->find();

                    if(!$myinvite){
                        continue;
                    }
                 //   var_dump($user_device['device_id']);exit;
                    $rs[] = $mo->table('myinvite')->where(array('id'=>$myinvite['id']))->setField('status',1);
                    $rs[] = $mo->table('user_device')->where(array('id'=>$user_device['id']))->setField('status',1);
                    $rs[] = $mo->table('user_coin')->where(array('userid'=>$myinvite['userid']))->setDec('lthd',$myinvite['num']);
                    $rs[] = $mo->table('user_coin')->where(array('userid'=>$myinvite['userid']))->setInc('lth',$myinvite['num']);
                    $rs[] = $mo->table('device_xiaofei_log')->where(array('device_sn'=>$v['device_sn']))->setField('status',1);

                    if(check_arr($rs)){
                        $mo->commit();
                    }else{
                        $mo->rollback();
                    }
                }else{
                    continue;
                }
            }
        }
        echo ajax_return(1,'验证完成');exit;
    }


    /**
     * 验证返利记录
     */
    public function xiaofei_verify_log()
    {
        $p = I('param.p',1);
        $list = 10;
        $res = M('myinvite')->alias('a')->join('left join user_device b on a.device_id=b.id')->join('left join user c on a.userid=b.id')->field('a.*,b.sn,c.phone')->page($p.','.$list)->order('a.id desc')->select();
        $count = M('myinvite')->count();
        $page = new \Think\Page($count,$list);
        $show = $page->show();
        $this->assign('res',$res);
        $this->assign('count',$count);
        $this->assign('page',$show);
        $this->display();
    }
}
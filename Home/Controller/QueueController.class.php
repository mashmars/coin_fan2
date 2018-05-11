<?php
namespace Home\Controller;
use Think\Controller;

class QueueController extends Controller
{

    /**
     * 钱包检查
     */
    public function qianbao()
    {
        Vendor("Move.ext.client");
        $client = new \client('a5c','543', '127.0.0.1', 31253, 5, [], 1);
        $json = $client->getinfo();

        if (!isset($json['version']) || !$json['version']) {
            echo '###ERR#####*****  connect fail  ***** ####ERR####>' . "\n";exit;
        }
        $listtransactions = $client->listtransactions('*', 100, 0);
        echo 'listtransactions:' . count($listtransactions) . "\n";
        krsort($listtransactions);
        echo '<pre>';
        //var_dump($listtransactions);exit;
        foreach ($listtransactions as $trans) {

            if (M('Myzr')->where(array('txid' => $trans['txid'], 'status' => '1'))->find()) {
                echo 'txid had found continue' . "\n";
                continue;
            }

            echo 'all check ok ' . "\n";

            if ($trans['category'] == 'receive') {
                //如果是接收的 通过账户获取用户信息
               /* if (!($user = M('user')->where(array('phone' => $trans['account']))->find())) {
                    echo 'no account find continue' . "\n";
                    continue;
                }*/
                if (!($user = M('user_coin')->where(array('lthb' => $trans['address']))->find())) {
                    echo 'no account find continue' . "\n";
                    continue;
                }
                print_r($trans);
                echo 'start receive do:' . "\n";
                $sfee = 0;
                $true_amount = $trans['amount'];

                //经过多少次确认
                if ($trans['confirmations'] < 5) {

                    echo 'confirmations <  c_zr_dz continue' . "\n";

                    if ($res = M('myzr')->where(array('txid' => $trans['txid']))->find()) {
                        M('myzr')->save(array('id' => $res['id'], 'createtime' => time(), 'status' => intval($trans['confirmations'] - 5)));
                    }else {
                        M('myzr')->add(array('userid' => $user['userid'], 'address' => $trans['address'] , 'txid' => $trans['txid'], 'num' => $true_amount, 'createdate' => time(), 'status' => intval($trans['confirmations'] - 5)));
                    }

                    continue;
                }
                else {
                    echo 'confirmations full' . "\n";
                }

                $mo = M();
                $mo->startTrans();
                $rs = array();
                $rs[] = $mo->table('user_coin')->where(array('userid' => $user['userid']))->setInc('lth', $trans['amount']);

                if ($res = $mo->table('myzr')->where(array('txid' => $trans['txid']))->find()) {
                    echo 'myzr find and set status 1';
                    $rs[] = $mo->table('myzr')->save(array('id' => $res['id'], 'createdate' => time(), 'status' => 1));
                }
                else {
                    echo 'myzr not find and add a new myzr' . "\n";
                    $rs[] = $mo->table('myzr')->add(array('userid' => $user['userid'], 'address' => $trans['address'], 'txid' => $trans['txid'], 'num' => $true_amount, 'createdate' => time(), 'status' => 1));
                }

                if (check_arr($rs)) {
                    $mo->commit();
                    echo $trans['address'] . ' receive ok '  . $trans['address'];

                    echo 'commit ok' . "\n";
                }else {
                    echo $trans['address'] . 'receive fail ' . $trans['address'];

                    $mo->rollback();
                    print_r($rs);
                    echo 'rollback ok' . "\n";
                }
            }
            ///////转出
            if ($trans['category'] == 'send') {
                echo 'start send do:' . "\n";

                if (3 <= $trans['confirmations']) {
                    $myzc = M('Myzc')->where(array('address' => $trans['address']))->find();

                    if ($myzc) {
                        if ($myzc['status'] == 0) {
                            M('Myzc')->where(array('id' => $myzc['id']))->save(array('status' => 1,'txid'=>$trans['txid']));
                            echo $trans['amount'] . '成功转出币确定';
                        }
                    }
                }
            }
        }
    }
	
	/**
     * 每天算力挖矿
     * 算力/难度=每日挖出来的可用原力币数量
       算力=消费手续费+各种设备增加的算力
       难度=预设数量*预设天数*人数
     * 每3个小时执行 数量为=》 算力/难度/8
     */
	public function miner()
    {
        $config = M('config')->where('id=1')->find();
		$count = M('user')->count();
        $nandu = $config['total'] * $config['days'] * $count;
        //当前算力大于0的会员
        $user_coin = M('user_coin')->where(array('lthz'=>array('gt',0)))->select();
        $mo = M();
        foreach($user_coin as $coin){
            $num = $coin['lthz']/$nandu;
            //$num = round($num/8,8);
            //保留四位小数 不四舍五入
			$num = $num/8;
			$num = substr(sprintf("%.5f",$num),0,-1);
			
            if($num < 0.0001){
                continue;
            }
            $mo->startTrans();
            $rs = array();
           // $rs[] = $mo->table('user_coin')->where(array('userid'=>$coin['userid']))->setInc('lth',$num);
            $rs[] = $mo->table('sys_fl_log')->add(array('userid'=>$coin['userid'],'nandu'=>$nandu,'suanli'=>$coin['lthz'],'num'=>$num,'createdate'=>time())) ;
            if(check_arr($rs)){
                $mo->commit();
            }else{
                $mo->rollback();
            }
        }
        echo 'successful';
    }
	
}
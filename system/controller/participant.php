<?php
//活动

require_once 'prepare.php';

$action = isset($_GET['action']) ? $_GET['action'] : '';
$party_id = isset($_GET['party_id']) ? $_GET['party_id'] : 0;
if(empty($party_id))
{
	$tpl->assign('msg',array('title'=>'活动报名','content'=>'缺少参数',));
	$tpl->display('msg.html');
	die;
}

switch ($action)
{

	case 'add':	//我要报名

			$party_id = $_GET['party_id'];
			$uid = $_GET['uid'];
			$arr = array(
							'party_id' => $party_id,
							'uid' => $uid,
							'is_passed' => 0,
							'create_time' => time(),
							);

			//是否重复报名
			$rs = $db->get_by_con('participant',"party_id = $party_id and uid = $uid");
			if($rs)
			{
				$tpl->assign('msg',array('title'=>'活动报名','content'=>'请勿重复报名',));
				$tpl->display('msg.html');
				die;
			}
			else
			{
				$result = $db->insert('participant',$arr);
				if($result)
				{
					$party = $db->get_by_id('party',$party_id);	//读取活动信息
					$user_info = $db->get_by_id('user',$_SESSION['uid']);	//读取活动信息
					//添加feed
					$arr = array(	'uid' 		=>$user_info['id'],
									'username' 	=>$user_info['username'],
									'type'		=>0,
									'title'		=>$party['title'],	//将活动标题存入
									'party_id'	=>$party_id,
									'create_time'=>time(),
								);

					$db->insert('feeds',$arr);

					$tpl->assign('msg',array('title'=>'活动报名','content'=>'参加活动成功，请等待组织者审批',));
					$tpl->display('msg.html');
					die;
				}
				else
				{
					$tpl->assign('msg',array('title'=>'活动报名','content'=>'参加活动失败，请联系客服人员',));
					$tpl->display('msg.html');
					die;
				}
			}

	break;

	case 'edit':	//修改状态

			//管理报名者必须是活动创建者  todo

			if($_GET['is_passed'] == 1)
			{
				$arr = array('is_passed' => '1');
				//通过报名者，相关信息表里的活动参与者+1
				$sql = "UPDATE party_info SET participants = participants+1 WHERE id =".$_GET['party_id'];
			}
			elseif($_GET['is_passed'] == 2)
			{
				$arr = array('is_passed' => '2');
				//拒绝报名者，相关信息表里的活动参与者-1
				$sql = "UPDATE party_info SET participants = participants-1 WHERE id =".$_GET['party_id'];
			}

			$uid = $_GET['uid'];
			$party_id = $_GET['party_id'];
			$rs = $db->get_one('participant',"party_id = $party_id AND uid = $uid");
			$result = $db->update_by_id('participant',$rs['id'],$arr);

			if($result)
			{
				//及时更新活动相关信息表
				$result_1 = $db->query($sql);

				//如果相关信息表里的活动参与者为负数，自动清零
				$rs = $db->get_one('party_info',"id =".$_GET['party_id']);
				if($rs['participants'] <0)
				{
					$re = $db->query("UPDATE party_info SET participants = 0 WHERE id =".$_GET['party_id']);
				}

				$tpl->assign('msg',array('title'=>'活动报名','content'=>'操作成功',));
				$tpl->display('msg.html');
				die;
			}
			else
			{
				$tpl->assign('msg',array('title'=>'活动报名','content'=>'操作失败',));
				$tpl->display('msg.html');
				die;
			}

	break;

	case 'del':	//删除

			$id = isset($_GET['id']) ? $_GET['id'] : 0;
			$result = $db->delete_by_id('participant',$id);

			if($result)
			{
				$tpl->assign('msg',array('title'=>'活动报名','content'=>'操作成功',));
				$tpl->display('msg.html');
				die;
			}
			else
			{
				$tpl->assign('msg',array('title'=>'活动报名','content'=>'操作失败',));
				$tpl->display('msg.html');
				die;
			}

	break;

	default :	//错误页面
        $tpl->assign('msg',array('title'=>'活动报名','content'=>'出错了',));
		$tpl->display('msg.html');
		die;
    break;
}


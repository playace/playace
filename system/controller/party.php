<?php
//活动

require_once 'prepare.php';

$action = isset($_GET['action']) ? $_GET['action'] : '';

if(!empty($_SESSION))
{
	$tpl->assign('user_session',$_SESSION);	//用户信息
	//读取用户收到短信数
	$sql = "SELECT id FROM message WHERE inbox_status != 1 AND to_uid =".$_SESSION['uid'];
	$result_4 = $db->query($sql);
	$tpl->assign('msg_num',$db->get_rows_num($result_4));
}

//当前时间
$time = time();
$tpl->assign('time',$time);

switch ($action)
{
	case '':	//活动聚会页
		show('party.php?action=party');
	break;

	case 'party':	//活动聚会页

		//区域
		$area = $db->get_by_con('area','has_node = 0');	//没有子节点的都显示
		$tpl->assign('area',$area);

		//最新活动
		//未结束的活动，结束时间大于现在时间，以开始时间降序，最早开始的显示在最前面
		$new_party = $db->get_by_con('party AS p, party_info AS i',"p.id = i.id AND p.end_time > $time ORDER BY p.start_time DESC limit 0,10");
		$tpl->assign('new_party',$new_party);

		//活动回顾，已结束的活动，结束时间大小于现在时间，以结束时间降序，最晚结束的显示在最前面
		$old_party = $db->get_by_con('party',"end_time < $time ORDER BY end_time DESC limit 0,5");
		$tpl->assign('old_party',$old_party);

		//最新评论
		$sql = "SELECT c.*, u.id AS uid, u.username,up.avatar FROM comment AS c , user AS u , user_profile AS up " .
				"WHERE c.create_uid = u.id AND u.id = up.uid AND c.class = 2 " .
				"ORDER BY c.create_time DESC LIMIT 0,10";
		$result_1 = $db->query($sql);
		$comment = $db->get_rows_array($result_1);
		$tpl->assign('comment',$comment);

		$tpl->assign('title','活动');
		$tpl->display('party.html');
	break;

	case 'filter':	//活动筛选

		$time = time();

		if(!empty($_GET['kind']))
		{
			if($_GET['kind'] == 0)
				$result = $db->get_by_con('party',"end_time > $time AND kind = 0 ORDER BY start_time DESC limit 0,10");	//官方活动
			elseif($_GET['kind'] == 1)
				$result = $db->get_by_con('party',"end_time > $time AND kind = 1 ORDER BY start_time DESC limit 0,10");	//会员活动
			elseif($_GET['kind'] == 'all')
				$result = $db->get_by_con('party',"end_time > $time ORDER BY start_time DESC limit 0,10");	//会员活动
		}
		elseif(!empty($_GET['area']))
		{


		}
		elseif(!empty($_GET['time']))
		{


		}


		$tpl->assign('party_filter',$result);
		$tpl->assign('title','活动');
		$tpl->display('party.html');
	break;

	case 'search':	//活动搜索

		$tpl->assign('title','活动搜索结果');
		$tpl->display('party_list.html');

	break;

	case 'list':	//列表

		if($_GET['class'] == 'new')
		{
			$party_list = $db->get_by_con('party AS p, party_info AS i',"p.id = i.id AND p.end_time > $time ORDER BY p.start_time DESC limit 0,10");
			$tpl->assign('party_list',$party_list);

			//最新评论
			$sql = "SELECT c.*, u.id AS uid, u.username,up.avatar FROM comment AS c , user AS u , user_profile AS up " .
					"WHERE c.create_uid = u.id AND u.id = up.uid AND c.class = 2 " .
					"ORDER BY c.create_time DESC LIMIT 0,10";
			$result_1 = $db->query($sql);
			$comment = $db->get_rows_array($result_1);
			$tpl->assign('comment',$comment);
			$tpl->assign('title','最新活动列表');
		}
		elseif($_GET['class'] == 'old')
		{
			$party_list = $db->get_by_con('party AS p, party_info AS i',"p.id = i.id AND p.end_time < $time ORDER BY p.start_time DESC limit 0,10");
			$tpl->assign('party_list',$party_list);

			//最新评论
			$sql = "SELECT c.*, u.id AS uid, u.username,up.avatar FROM comment AS c , user AS u , user_profile AS up " .
					"WHERE c.create_uid = u.id AND u.id = up.uid AND c.class = 2 " .
					"ORDER BY c.create_time DESC LIMIT 0,10";
			$result_1 = $db->query($sql);
			$comment = $db->get_rows_array($result_1);
			$tpl->assign('comment',$comment);
			$tpl->assign('title','活动回顾列表');
		}

		$tpl->display('party_list.html');

	break;

	case 'view':	//查看

		assert(intval($_GET['party_id']));
		$party_id = (isset($_GET['party_id']) && !empty($_GET['party_id'])) ? $_GET['party_id'] : 0;

		//查看数增加1
		$db->query("UPDATE party_info SET views = views+1 WHERE id = $party_id");

		//活动详情
		$party = $db->get_by_id('party',$party_id);

		//活动创建者
		$create_user = $db->get_by_id('user',$party['create_uid']);
		$party['create_username'] = $create_user['username'];

		//活动其他信息
		$party_info = $db->get_by_id('party_info',$party['id']);
		unset($party_info['id']);
		$party = array_merge((array)$party,(array)$party_info);	//数组合并

		$tpl->assign('party',$party);

		//活动参与者
		$party_id = isset($_GET['party_id']) ? $_GET['party_id'] : 0;
		//已经参加的
		$participant_passed = $db->get_by_con("participant AS p, user AS u, user_profile AS up","p.uid = u.id AND u.id = up.uid AND p.party_id = $party_id AND p.is_passed=1");
		$tpl->assign('participant_passed_num',count($participant_passed));	//参加活动人数
		$tpl->assign('participant_passed',$participant_passed);
		//需要审核的
		$participant_auditing = $db->get_by_con("participant AS p, user AS u, user_profile AS up","p.uid = u.id AND u.id = up.uid AND p.party_id = $party_id AND p.is_passed=0");
		$tpl->assign('participant_auditing_num',count($participant_auditing));	//需要审核的人数
		$tpl->assign('participant_auditing',$participant_auditing);
		//已拒绝的
		$participant_refuse = $db->get_by_con("participant AS p, user AS u,  user_profile AS up","p.uid = u.id AND u.id = up.uid AND p.party_id = $party_id AND p.is_passed=2");
		$tpl->assign('participant_refuse_num',count($participant_refuse));	//已拒绝的人数
		$tpl->assign('participant_refuse',$participant_refuse);

		//活动场地

		//活动评论
		$sql = "SELECT c.*, u.id AS uid, u.username,up.avatar FROM comment AS c , user AS u , user_profile AS up " .
				"WHERE c.create_uid = u.id AND u.id = up.uid AND c.topic_id = $party_id " .
				"ORDER BY c.create_time DESC";
		$result = $db->query($sql);
		$comment = $db->get_rows_array($result);
		$tpl->assign('comment',$comment);

		//活动图片

		$tpl->assign('user_session',$_SESSION);
		$tpl->assign('title','活动详情');
		$tpl->display('party_detail.html');

	break;

	case 'add':	//发起活动

		if ($_SERVER['REQUEST_METHOD'] == 'POST')
		{
			//格式化时间
			$_POST['start_time'] = strtotime($_POST['start_time'].' '.$_POST['start_hour'].':'.$_POST['start_min']);
			$_POST['end_time'] = strtotime($_POST['end_time'].' '.$_POST['end_hour'].':'.$_POST['end_min']);

			unset($_POST['start_hour']);
			unset($_POST['start_min']);
			unset($_POST['end_hour']);
			unset($_POST['end_min']);

			$_POST['kind'] = 1;	//用常量,会员活动

			//icon 临时处理
			$_POST['thumb'] = '../../static/img/demoicon/'.$_POST['thumb'].'.jpg';

			$_POST['create_time'] = time();
			$_POST['create_uid'] = $_SESSION['uid'];

			$result_1 = $db->insert('party',$_POST);	//插入到活动表
			$arr = array(	'id' 			=> $db->insert_id(),
							'views' 		=> 0,
							'comments'		=> 0,
							'participants' 	=> 0,
						);
			$result_2 = $db->insert('party_info',$arr);	//插入到活动信息表
			if($result_1 and $result_2)
			{
				show('party.php?action=party');
			}
		}
		else
		{
			//区域
			$area = $db->get_by_con('area','has_node = 0');	//没有子节点的都显示
			$tpl->assign('area',$area);

			//小时
			$hour = array();
			for($i=0;$i<24;$i++)
			{
				$hour["$i"] = array("hour"=>$i);
			}
			$tpl->assign('hour',$hour);

			//分钟
			$min = array(
							'0'=>array('min'=>'00'),
							'1'=>array('min'=>'10'),
							'2'=>array('min'=>'20'),
							'3'=>array('min'=>'30'),
							'4'=>array('min'=>'40'),
							'5'=>array('min'=>'50'),
						);
			$tpl->assign('min',$min);

			$tpl->assign('title','发起活动');
			$tpl->display('party_add.html');
		}

	break;

	case 'edit':	//修改活动

		if ($_SERVER['REQUEST_METHOD'] == 'POST')
		{
			//格式化时间
			$_POST['start_time'] = strtotime($_POST['start_time'].' '.$_POST['start_hour'].':'.$_POST['start_min']);
			$_POST['end_time'] = strtotime($_POST['end_time'].' '.$_POST['end_hour'].':'.$_POST['end_min']);

			unset($_POST['start_hour']);
			unset($_POST['start_min']);
			unset($_POST['end_hour']);
			unset($_POST['end_min']);

			$_POST['kind'] = 1;	//用常量

			$_POST['update_time'] = time();
			$_POST['update_uid'] = $_SESSION['uid'];
			$party_id = $_POST['party_id'];
			unset($_POST['party_id']);
			$result = $db->update_by_id('party',$party_id,$_POST);
			if($result)
			{
				$tpl->assign('msg',array('title'=>'活动','content'=>'修改成功',));
				$tpl->display('msg.html');
				die;
			}
			else
			{
				$tpl->assign('msg',array('title'=>'活动','content'=>'修改失败',));
				$tpl->display('msg.html');
				die;
			}
		}
		else
		{
			$party_id = isset($_GET['party_id']) ? $_GET['party_id'] : 0;
			$result = $db->get_by_id('party',$party_id);
			$result['start_time'] = date('Y-m-d H:i',$result['start_time']);
			$result['end_time'] = date('Y-m-d H:i',$result['end_time']);

			$tpl->assign('party_info',$result);

			//读取地区列表
			$result = $db->get_by_con('party_area','has_node = 0');
			$tpl->assign('area',$result);

			$tpl->assign('title','修改活动');
			$tpl->display('party_edit.html');
		}

	break;

	case 'del':	//删除活动
		$party_id = isset($_GET['party_id']) ? $_GET['party_id'] : 0;
		$result = $db->delete_by_id('party',$party_id);

		if($result)
		{
			$tpl->assign('msg',array('title'=>'活动','content'=>'删除活动成功',));
			$tpl->display('msg.html');
			die;
		}
		else
		{
			$tpl->assign('msg',array('title'=>'活动','content'=>'删除活动失败',));
			$tpl->display('msg.html');
			die;
		}
	break;

	default :	//错误页面
        $tpl->assign('msg','出错了');
		$tpl->display('msg.html');
		die;
    break;
}


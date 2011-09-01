<?php
//我的空间

require_once 'prepare.php';

$action = isset($_GET['action']) ? $_GET['action'] : '';

if(empty($_SESSION['uid']))
{
	$tpl->assign('msg',array('title'=>'个人空间','content'=>'请先登录',));
	$tpl->display('msg.html');
	die;
}

if(!empty($_SESSION))
{
	//读取用户收到短信数
	$sql = "SELECT id FROM message WHERE inbox_status != 1 AND to_uid =".$_SESSION['uid'];
	$result_4 = $db->query($sql);
	$tpl->assign('msg_num',$db->get_rows_num($result_4));

	//个人信息和个人资料
	$user = $db->get_by_id('user',$_SESSION['uid']);
	$user_profile = $db->get_by_id('user_profile',$_SESSION['uid']);
	$tpl->assign('user_session',$user);
	$tpl->assign('user_profile',$user_profile);
}
else
{
	$tpl->assign('msg',array('title'=>'个人空间','content'=>'请先登录',));
	$tpl->display('msg.html');
	die;
}

switch ($action)
{
	case '':	//ta的地盘
		show('space.php?action=ta_space');
	break;

	case 'ta_space':	//ta的地盘

		assert(intval($_GET['uid']));
		$ta_uid = (isset($_GET['uid']) && !empty($_GET['uid'])) ? $_GET['uid'] : 0;

		//读取ta的信息
		$user = $db->get_by_id('user',$ta_uid);
		$user_profile = $db->get_by_id('user_profile',$ta_uid);
		$tpl->assign('user',$user);
		$tpl->assign('user_profile',$user_profile);

		//ta发起的活动
		$added_party = $db->get_by_con('party',"create_uid = $ta_uid ORDER BY create_time DESC LIMIT 0,5");
		$tpl->assign('added_party',$added_party);

		//ta参加的活动
		$sql = "SELECT p.title,p.start_time,p.end_time,pa.party_id " .
				"FROM party AS p , participant AS pa " .
				"WHERE pa.party_id = p.id AND pa.uid = $ta_uid " .
				"ORDER BY p.create_time DESC LIMIT 0,5";
		$result = $db->query($sql);
		$taked_party = $db->get_rows_array($result);
		$tpl->assign('taked_party',$taked_party);

		//TA的话题 todo

		//TA的评论
		$my_comment = $db->get_by_con('comment',"create_uid = $ta_uid ORDER BY create_time DESC LIMIT 0,5");
		$tpl->assign('my_comment',$my_comment);

		//保留来访者足迹，自己访问自己页面不留下足迹
		if($ta_uid != $_SESSION['uid'])
		{
			$arr = array( 'uid' => $_SESSION['uid'],
					  'visit_uid' => $ta_uid,
					  'username' => $_SESSION['username'],
					  'visit_time' => time(),
					);
			$db->insert('visits',$arr);
		}

		//读取来访者足迹，每个来访者只读取一次
		$sql = "SELECT v.uid,v.username,v.visit_time,p.avatar " .
				"FROM visits AS v, user_profile AS p " .
				"WHERE v.uid = p.uid " .
				"AND v.visit_uid = $ta_uid " .
				"group by v.uid";
		$result = $db->query($sql);
		$visits = $db->get_rows_array($result);
		$tpl->assign('visits',$visits);

		$tpl->assign('title',$user['username'].'的地盘');
		$tpl->display('space_ta.html');
	break;

	default :	//错误页面
        $tpl->assign('msg',array('title'=>'TA的地盘','content'=>'出错了',));
		$tpl->display('msg.html');
		die;
    break;
}
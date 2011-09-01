<?php
//我的空间

require_once 'prepare.php';

$action = isset($_GET['action']) ? $_GET['action'] : '';

if(!empty($_SESSION))
{
	assert(intval($_SESSION['uid']));
	$uid = (isset($_SESSION['uid']) && !empty($_SESSION['uid'])) ? $_SESSION['uid'] : 0;

	//读取用户收到短信数
	$sql = "SELECT id FROM message WHERE inbox_status != 1 AND to_uid = $uid";
	$result_4 = $db->query($sql);
	$tpl->assign('msg_num',$db->get_rows_num($result_4));

	//个人信息和个人资料
	$user = $db->get_by_id('user',$uid);
	$user_profile = $db->get_by_id('user_profile',$uid);
	$tpl->assign('user',$user);
	$tpl->assign('user_session',$user);
	$tpl->assign('user_profile',$user_profile);

	//读取来访者足迹，每个来访者只读取一次
	$sql = "SELECT v.uid,v.username,v.visit_time,p.avatar " .
			"FROM visits AS v, user_profile AS p " .
			"WHERE v.uid = p.uid " .
			"AND v.visit_uid = $uid " .
			"group by v.uid";
	$result = $db->query($sql);
	$visits = $db->get_rows_array($result);
	$tpl->assign('visits',$visits);
}
else
{
	$tpl->assign('msg',array('title'=>'个人空间','content'=>'请先登录',));
	$tpl->display('msg.html');
	die;
}


$tpl->assign('time',time());	//当前时间

switch ($action)
{
	case '':	//我的地盘
		show('space.php?action=my_space');
	break;

	case 'my_space':	//我的地盘

		//发起的活动
		$added_party = $db->get_by_con('party',"create_uid = $uid ORDER BY create_time DESC LIMIT 0,5");
		$tpl->assign('added_party',$added_party);

		//参加的活动
		$sql = "SELECT p.title,p.start_time,p.end_time,pa.party_id " .
				"FROM party AS p , participant AS pa " .
				"WHERE pa.party_id = p.id AND pa.uid = $uid " .
				"ORDER BY p.create_time DESC LIMIT 0,5";
		$result = $db->query($sql);
		$taked_party = $db->get_rows_array($result);
		$tpl->assign('taked_party',$taked_party);

		//我的话题


		//我的评论
		$my_comment = $db->get_by_con('comment',"create_uid = $uid ORDER BY create_time DESC LIMIT 0,5");
		$tpl->assign('my_comment',$my_comment);

		$tpl->assign('title','我的地盘');
		$tpl->display('space.html');
	break;

	case 'added_party':	//发起的活动

		$added_party = $db->get_by_con('party',"create_uid = $uid ORDER BY create_time DESC");
		$tpl->assign('added_party',$added_party);
		$tpl->assign('title','我发起的活动');
		$tpl->display('space_party_added.html');

	break;

	case 'taked_party':	//参加的活动

		$sql = "SELECT p.title,p.start_time,p.end_time,pa.party_id " .
				"FROM party AS p , participant AS pa " .
				"WHERE pa.party_id = p.id AND pa.uid = $uid " .
				"ORDER BY p.create_time DESC";
		$result = $db->query($sql);
		$taked_party = $db->get_rows_array($result);
		$tpl->assign('taked_party',$taked_party);
		$tpl->assign('title','我参加的活动');
		$tpl->display('space_party_taked.html');

	break;

	case 'my_topic':	//我的话题

		$tpl->assign('title','我的话题');
		$tpl->display('space_topic.html');
	break;

	case 'my_comment':	//我的评论

		//读取主题 todo
		//读取评论
		$my_comment = $db->get_by_con('comment',"create_uid = $uid ORDER BY create_time DESC");
		$tpl->assign('my_comment',$my_comment);
		$tpl->assign('title','我的评论');
		$tpl->display('space_comment.html');
	break;


	case 'setup_password':	//修改密码

		if ($_SERVER['REQUEST_METHOD'] == 'POST')
		{
			//POST方法

			if(!($_SESSION['uid'] === $_POST['uid']))
			{
				//如果不是本人的设置，则不能修改
				$tpl->assign('msg',array('title'=>'个人空间','content'=>'不能修改别人的设置',));
				$tpl->display('msg.html');
				die;
			}

			assert(intval($_POST['uid']));
			$uid = (isset($_POST['uid']) && !empty($_POST['uid'])) ? $_POST['uid'] : 0;

			$rs = $db->get_by_id('user',$uid);

			if($rs['password'] != md5($_POST['old_password']))
			{
				$tpl->assign('msg',array('title'=>'个人空间','content'=>'原来的密码输入错误',));
				$tpl->display('msg.html');
				die;
			}

			if($_POST['new_password'] != $_POST['confirm_password'])
			{
				$tpl->assign('msg',array('title'=>'个人空间','content'=>'两次密码输入的不一致',));
				$tpl->display('msg.html');
				die;
			}

			$arr = array( 'password' =>md5($_POST['new_password']),);
			$result = $db->update_by_id('user',$uid,$arr);
			if($result)
			{
				$tpl->assign('msg',array('title'=>'个人空间','content'=>'密码修改成功',));
				$tpl->display('msg.html');
				die;
			}
		}
		else
		{
			$tpl->assign('user_session',$_SESSION);	//用户信息
			$tpl->assign('title','修改密码');
			$tpl->display('space_setup_password.html');
		}

	break;

	case 'setup_profile':	//个人设置


		if ($_SERVER['REQUEST_METHOD'] == 'POST')
		{
			if(!($_SESSION['uid'] === $_POST['uid']))
			{
				//如果不是本人的设置，则不能修改
				$tpl->assign('msg',array('title'=>'个人空间','content'=>'不能修改别人的设置',));
				$tpl->display('msg.html');
				die;
			}

			assert(intval($_POST['uid']));
			$uid = (isset($_POST['uid']) && !empty($_POST['uid'])) ? $_POST['uid'] : 0;

			$arr = array( 'username' =>$_POST['username'],);
			$result = $db->update_by_id('user',$uid,$arr);

			$arr_1 = array(	'sex' => $_POST['sex'],
							'idol' => $_POST['idol'],
							'birthday' => $_POST['birthday'],
							'constellation' => $_POST['constellation'],
							'tennis_age' => $_POST['tennis_age'],
							'tennis_area' => $_POST['tennis_area'],
							'tennis_level_own' => $_POST['tennis_level_own'],
							);
			$result_1 = $db->update_by_id('user_profile',$uid,$arr_1);


			if($result && $result_1)
			{
				$tpl->assign('msg',array('title'=>'个人空间','content'=>'基本信息修改成功',));
				$tpl->display('msg.html');
				die;
			}
		}
		else
		{
			$tpl->assign('user_session',$_SESSION);	//用户信息
			$tpl->assign('title','个人设置');
			$tpl->display('space_setup_profile.html');
		}

	break;

	default :	//错误页面
		$tpl->assign('msg',array('title'=>'系统错误','content'=>'出错了',));
		$tpl->display('msg.html');
		die;
    break;
}


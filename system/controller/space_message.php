<?php
//个人空间 - 短消息

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
	assert(intval($_SESSION['uid']));
	$uid = (isset($_SESSION['uid']) && !empty($_SESSION['uid'])) ? $_SESSION['uid'] : 0;

	//读取用户收到短信数
	$sql = "SELECT id FROM message WHERE inbox_status != 1 AND to_uid = $uid";
	$result_4 = $db->query($sql);
	$rs = $db->get_rows_num($result_4);
	$tpl->assign('msg_num',$rs);

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

$tpl->assign('time',time());	//当前时间

switch ($action)
{
	case '':	//收件箱
		show('space_message.php?action=inbox');
	break;

	case 'inbox':	//收件箱

		//读取已收到邮件
		$sql = "SELECT m.*,u.username " .
				"FROM message AS m , user AS u " .
				"WHERE m.create_uid = u.id AND m.inbox_status != 1 " .
				"AND m.to_uid = " . $_SESSION['uid'] . " " .
				"ORDER BY m.create_time DESC";
		$result = $db->query($sql);
		$inbox_msg = $db->get_rows_array($result);

		$tpl->assign('inbox_msg',$inbox_msg);
		$tpl->assign('title','收件箱');
		$tpl->display('space_inbox.html');

	break;

	case 'outbox':	//发件箱

		//读取已发送到邮件
		$sql = "SELECT m.*,u.username " .
				"FROM message AS m , user AS u " .
				"WHERE m.to_uid = u.id AND m.outbox_status != 1 " .
				"AND m.create_uid = " . $_SESSION['uid'] . " " .
				"ORDER BY m.create_time DESC";
		$result = $db->query($sql);
		$outbox_msg = $db->get_rows_array($result);

		$tpl->assign('outbox_msg',$outbox_msg);
		$tpl->assign('title','发件箱');
		$tpl->display('space_outbox.html');

	break;

	case 'send_msg':	//发消息

		//@todo  insert 标准格式
		if ($_SERVER['REQUEST_METHOD'] == 'POST')
		{
			$arr = array(	'title'			=>	$_POST['title'],
							'content'		=>	$_POST['content'],
							'to_uid'		=>	$_POST['to_uid'],
							'create_uid'	=>	$_SESSION['uid'],
							'create_time'	=>	time(),
						);

			if($db->insert('message',$arr))
			{
				show('space_message.php?action=outbox');
			}
			else
			{
				$tpl->assign('msg',array('title'=>'短消息','content'=>'发送失败',));
				$tpl->display('msg.html');
				die;
			}
		}
		else
		{
			$tpl->assign('title','发消息');
			$tpl->display('space_send_msg.html');
			die;
		}

	break;

	case 'read_msg':	//读消息

		assert(intval($_GET['msg_id']));
		$msg_id = (isset($_GET['msg_id']) && !empty($_GET['msg_id'])) ? $_GET['msg_id'] : 0;
		$msg = $db->get_by_id('message',$msg_id);

		if($_GET['msg_type'] == 'inbox')
		{
			$rs = $db->get_by_id('user',$msg['create_uid']);
			$msg['username'] = $rs['username'];
		}
		elseif($_GET['msg_type'] == 'outbox')
		{
			$rs = $db->get_by_id('user',$msg['to_uid']);
			$msg['username'] = $rs['username'];
		}

		$tpl->assign('msg_type',$_GET['msg_type']);	//读取已发送的消息还是收到的消息
		$tpl->assign('msg',$msg);
		$tpl->assign('title','发消息');
		$tpl->display('space_readmsg.html');

	break;

	case 'del':	//逻辑删除消息

		if($_GET['msg_type'] == 'inbox')
		{
			$arr = array('inbox_status'=>1);
			$rs = $db->update_by_id('message',$_GET['msg_id'],$arr);
			show('space_message.php?action=inbox');
		}
		elseif($_GET['msg_type'] == 'outbox')
		{
			$arr = array('outbox_status'=>1);
			$rs = $db->update_by_id('message',$_GET['msg_id'],$arr);
			show('space_message.php?action=outbox');
		}


	break;

	default :	//错误页面

		$tpl->assign('msg',array('title'=>'系统错误','content'=>'出错了',));
		$tpl->display('msg.html');
		die;

    break;
}


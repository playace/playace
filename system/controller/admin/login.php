<?php
require_once '../prepare.php';

$action = isset($_GET['action']) ? $_GET['action'] : '';

switch ($action)
{
	case 'login_sign':	//登录验证

		if ($_SERVER['REQUEST_METHOD'] == 'POST')
		{
			$username = $_POST['username'];
			$password = md5($_POST['password']);

			$user_info = $db->get_by_con('admin_user',"username = '".$username."' AND password = '".$password."'");

			if($user_info)
			{
				//更新session
				$_SESSION = array('uid'=>$user_info[0]['id'],
								  'username'=>$user_info[0]['username'],
									);

				//更新最后登录时间和IP
				$data = array(
					last_login_ip => $_SERVER["REMOTE_ADDR"],

					last_login_time => time(),
				);

				$result = $db->update_by_id('admin_user',$user_info['0']['id'],$data);

				show('court.php');
			}
			else
			{
				$tpl->assign('msg',array('title'=>'后台管理登录','content'=>'帐号密码错误',));
				$tpl->display('admin/msg.html');
				die;
			}
		}
		else
		{
			show('index.php?action=login');
		}

	break;

	case 'logout':	//退出

		unset($_SESSION['uid']);
		unset($_SESSION['email']);
		unset($_SESSION['username']);
		unset($_COOKIE['email']);
		unset($_COOKIE['password']);

		show('index.php');
		die;
	break;

	default :	//错误页面
        $tpl->assign('msg',array('title'=>'后台管理登录','content'=>'出错了',));
		$tpl->display('admin/msg.html');
		die;
    break;
}


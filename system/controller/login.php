<?php
//登录

require_once 'prepare.php';

$action = isset($_GET['action']) ? $_GET['action'] : '';

switch ($action)
{
	case '':	//登录页面
		show('login.php?action=login');
	break;

	case 'login':	//登录页面
		$tpl->assign('title','登录');
		$tpl->display('login.html');
	break;

	case 'login_sign':	//登录验证

		if ($_SERVER['REQUEST_METHOD'] == 'POST')
		{
			$email = $_POST['email'];
			$password = md5($_POST['password']);

			$user_info = $db->get_by_con('user',"email = '".$email."' AND password = '".$password."'");

			if($user_info)
			{
				//更新session
				$_SESSION = array('uid'=>$user_info[0]['id'],
								  'email'=>$user_info[0]['email'],
								  'username'=>$user_info[0]['username'],
									);

				if($_POST['remember_me'] == 'on')
				{
					//更新cookie
					setcookie("email", $user_info[0]['email']);
					setcookie("password", $password);
				}

				//更新最后登录时间和IP
				$data = array(
					last_login_ip => $_SERVER["REMOTE_ADDR"],
					last_login_time => time(),
				);

				$result = $db->update_by_id('user',$user_info['0']['id'],$data);

				show('index.php');
			}
			else
			{
				$tpl->assign('msg',array('title'=>'登录失败','content'=>'登录失败',));
				$tpl->display('msg.html');
				die;
			}
		}
		else
		{
			$tpl->assign('msg',array('title'=>'登录失败','content'=>'出错了',));
			$tpl->display('msg.html');
			die;
		}
	break;

	case 'logout':	//退出

		unset($_SESSION['uid']);
		unset($_SESSION['email']);
		unset($_SESSION['username']);
		unset($_COOKIE['email']);
		unset($_COOKIE['password']);

		$tpl->assign('msg',array('title'=>'退出成功','content'=>'您已经安全退出了',));
		$tpl->display('msg.html');
		die;
	break;

	case 'forget_password':	//忘记密码

	break;

	case 'user_active':	//邮件激活

	break;

	default :	//错误页面
        $tpl->assign('msg',array('title'=>'登录','content'=>'出错了',));
		$tpl->display('msg.html');
		die;
    break;

}

?>

<?php
//注册

require_once 'prepare.php';

$action = isset($_GET['action']) ? $_GET['action'] : '';

switch ($action)
{
	case '':	//注册页面
		show('register.php?action=register');
	break;

	case 'register':	//注册页面
    if(!isset($_SESSION['username'])) {
	   $tpl->assign('user_session', array('username' => ''));
    }
		$tpl->assign('title','免费注册');
		$tpl->display('register.html');
	break;

	case 'register_sign':	//注册用户

		if ($_SERVER['REQUEST_METHOD'] == 'POST')
		{

			//必须同意服务条款
			if($_POST['agreeservice'] != 'on')
			{
				$tpl->assign('msg',array('title'=>'注册失败',
										 'content'=>"请同意服务条款!" .
										 			"<br><br>" .
										 			'<a href="' . "register.php?action=register" . '">'.'» 免费注册</a>',
										 )
							);
				$tpl->display('msg.html');
				die;
			}

			//电子邮箱不许为空
			if (empty($_POST['email']))
			{
				$tpl->assign('msg',array('title'=>'注册失败',
										 'content'=>"电子邮箱不许为空!" .
										 			"<br><br>" .
										 			'<a href="' . "register.php?action=register" . '">'.'» 免费注册</a>',
										 )
							);
				$tpl->display('msg.html');
				die;
			}

			//用户名不许为空
			if (empty($_POST['username']))
			{
				$tpl->assign('msg',array('title'=>'注册失败',
										 'content'=>"用户名不许为空!" .
										 			"<br><br>" .
										 			'<a href="' . "register.php?action=register" . '">'.'» 免费注册</a>',
										 )
							);
				$tpl->display('msg.html');
				die;
			}

			//密码不许为空
			if (empty($_POST['password']))
			{
				$tpl->assign('msg',array('title'=>'注册失败',
										 'content'=>"密码不许为空!" .
										 			"<br><br>" .
										 			'<a href="' . "register.php?action=register" . '">'.'» 免费注册</a>',
										 )
							);
				$tpl->display('msg.html');
				die;
			}

			//密码重复不许为空
			if (empty($_POST['repeat_password']))
			{
				$tpl->assign('msg',array('title'=>'注册失败',
										 'content'=>"密码重复不许为空!" .
										 			"<br><br>" .
										 			'<a href="' . "register.php?action=register" . '">'.'» 免费注册</a>',
										 )
							);
				$tpl->display('msg.html');
				die;
			}

			//验证email
			$check_email = ereg("^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(\.[a-zA-Z0-9_-])+",$_POST['email']);
			if (empty($check_email))
			{
				$tpl->assign('msg',array('title'=>'注册失败',
										 'content'=>"电子邮箱格式不正确!" .
										 			"<br><br>" .
										 			'<a href="' . "register.php?action=register" . '">'.'» 免费注册</a>',
										 )
							);
				$tpl->display('msg.html');
				die;
			}

			//用户名必须小于15位
			if(strlen($_POST['username'])>15)
			{
				$tpl->assign('msg',array('title'=>'注册失败',
										 'content'=>"用户名必须小于15个字符!" .
										 			"<br><br>" .
										 			'<a href="' . "register.php?action=register" . '">'.'» 免费注册</a>',
										 )
							);
				$tpl->display('msg.html');
				die;
			}

			//密码必须大于6位，小于25位
			if(strlen($_POST['password'])<6 OR strlen($_POST['password'])>25)
			{
				$tpl->assign('msg',array('title'=>'注册失败',
										 'content'=>"密码必须大于6位且小于25个字符!" .
										 			"<br><br>" .
										 			'<a href="' . "register.php?action=register" . '">'.'» 免费注册</a>',
										 )
							);
				$tpl->display('msg.html');
				die;
			}

			//密码和密码重复必须相等
			if(!($_POST['password'] === $_POST['repeat_password']))
			{
				$tpl->assign('msg',array('title'=>'注册失败',
										 'content'=>"两次输入的密码必须相同!" .
										 			"<br><br>" .
										 			'<a href="' . "register.php?action=register" . '">'.'» 免费注册</a>',
										 )
							);
				$tpl->display('msg.html');
				die;
			}

			unset($_POST['repeat_password']);	//注销密码重复
			unset($_POST['agreeservice']);		//注销 同意服务协议 按钮

			//检查是否有相同的email
			if($db->get_by_con('user',"email = '".$_POST['email']."'"))
			{
				$tpl->assign('msg',array('title'=>'注册失败',
										 'content'=>"已经有相同的电子邮箱了!" .
										 			"<br><br>" .
										 			'<a href="' . "register.php?action=register" . '">'.'» 免费注册</a>',
										 )
							);
				$tpl->display('msg.html');
				die;
			}
			//检查是否有相同的用户名
			if($db->get_by_con('user',"username = '".$_POST['username']."'"))
			{
				$tpl->assign('msg',array('title'=>'注册失败',
										 'content'=>"已经有相同的用户名了!" .
										 			"<br><br>" .
										 			'<a href="' . "register.php?action=register" . '">'.'» 免费注册</a>',
										 )
							);
				$tpl->display('msg.html');
				die;
			}

			$_POST['create_time'] = time();
			$_POST['password'] = md5($_POST['password']);

			$result_1 = $db->insert('user',$_POST);
			$uid = $db->insert_id();

			$arr = array(	'id' => $db->insert_id(),
							'uid' => $db->insert_id(),
							'avatar' => '../../static/img/demoicon/member_default.jpg',	//默认头像
							);
			$result_2 = $db->insert('user_profile',$arr);
			if($result_1 and $result_2)
			{
				//注册成功，直接登录
				$tpl->assign('msg',array('title'=>'注册成功',
										 'content'=>"祝贺，注册成功！" .
										 			"<br><br>" .
													'<a href="' . "register.php?action=login_success&uid=" .$uid. '">'.'» 直接登录</a>',)
							);

//				发送注册成功邮件，内含激活码  ??todo
//				$tpl->assign('msg',array('title'=>'注册成功',
//										 'content'=>"祝贺，注册成功！<br><br>" .
//										 		    "我们已经向您注册时填写的电子邮箱发送了一封激活信，" .
//													"成功激活后就可以享受PlayAce.net的全方位服务。<br><br>" .
//													'<a href="' . "register.php?action=activation" . '">'.'» 立刻激活</a>',)
//							);

				$tpl->display('msg.html');
				die;
			}
			else
			{
				$tpl->assign('msg',array('title'=>'注册成功',
										 'content'=>"服务器出错!" .
										 			"<br><br>" .
													'<a href="' . "register.php?action=login_success&uid=" .$uid. '">'.'» 直接登录</a>',)
							);
				$tpl->display('msg.html');
				die;
			}
		}
	break;

	case 'activation':	//激活  todo
		$tpl->assign('msg',array('title'=>'激活','content'=> "祝贺，您的账户已经激活成功！<br><br>" .
															"您已经可以享受PlayAce.net的全方位服务，体验非凡的运动乐趣。<br><br>" .
															'<a href="' . "login.php" . '">'.'» 立即登录</a>',)
								);
		$tpl->display('msg.html');
		die;
	break;

	case 'login_success':	//直接登录,todo

		$uid = $_GET['uid'];

		$user_info = $db->get_by_id('user',$uid);

		//更新session
		$_SESSION = array('uid'=>$user_info['id'],
						  'email'=>$user_info['email'],
						  'username'=>$user_info['username'],
							);
		//更新最后登录时间和IP
		$data = array(
			last_login_ip => $_SERVER["REMOTE_ADDR"],
			last_login_time => time(),
		);

		$result = $db->update_by_id('user',$uid,$data);

		show('index.php');
	break;

	default :	//错误页面
        $tpl->assign('msg',array('title'=>'注册',
										 'content'=>"出错了" .
										 			"<br><br>" .
										 			'<a href="' . "register.php?action=register" . '">'.'» 免费注册</a>',
										 )
							);
		$tpl->display('msg.html');
		die;
    break;
}

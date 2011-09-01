<?php
require_once '../prepare.php';

$action = isset($_GET['action']) ? $_GET['action'] : '';

switch ($action)
{
	case '':	//进入登陆页
		show('index.php?action=login');
	break;

	case 'login':	//进入登陆页
		$tpl->display('/admin/login.html');
	break;

	case 'index':	//进入登陆页
		show('index.php?action=login');
	break;

	default :	//错误页面
        $tpl->assign('msg',array('title'=>'后台管理','content'=>'出错了',));
		$tpl->display('admin/msg.html');
		die;
    break;
}


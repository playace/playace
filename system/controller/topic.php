<?php
//主题帖吧

require_once 'prepare.php';

$action = isset($_GET['action']) ? $_GET['action'] : '';

switch ($action)
{

	case '':	//主题聚会页
		show('topic.php?action=topic');
	break;

	case 'topic':	//场地聚会页

			$tpl->assign('msg','正在建设中');
			$tpl->display('msg.html');
			die;
	break;

	default :	//错误页面
        $tpl->assign('msg','出错了');
		$tpl->display('msg.html');
		die;
    break;
}


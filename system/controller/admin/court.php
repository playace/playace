<?php
require_once '../prepare.php';

$action = isset($_GET['action']) ? $_GET['action'] : '';
$tpl->assign('page_class','court');	//页面类型

switch ($action)
{
	case '':	//列表
		show('court.php?action=list');
	break;

	case 'list':	//列表

		$court_list = $db->get_by_con('court','1=1 ORDER BY id ASC');

		$tpl->assign('court_list',$court_list);
		$tpl->display('/admin/court/court_list.html');
	break;

	case 'search':	//搜索

//		$court_list = $db->get_by_con('court','1=1 ORDER BY id ASC');

		$tpl->assign('court_list',$court_list);
		$tpl->display('/admin/court/court_list.html');
	break;


	case 'add':		//新增
		if ($_SERVER['REQUEST_METHOD'] == 'POST')
		{
			//POST方法
			$_POST['create_time'] = time();
			$_POST['create_uid'] = $_SESSION['uid'];

			$result = $db->insert('court',$_POST);
			if($result)
			{
				show('court.php?action=list');
			}
		}
		else
		{
			//GET方法

			//所属区域
			$area = $db->get_by_con('area','has_node = 0');	//没有子节点的都显示
			$tpl->assign('area',$area);

			$tpl->display('/admin/court/court_add.html');
		}
	break;

	case 'edit':	//修改

		if ($_SERVER['REQUEST_METHOD'] == 'POST')
		{
			//POST方法
			$_POST['update_time'] = time();
			$_POST['update_uid'] = $_SESSION['uid'];

			$court_id = (isset($_POST['court_id']) && !empty($_POST['court_id'])) ? $_POST['court_id'] : 0;
			unset($_POST['court_id']);
			$result = $db->update_by_id('court',$court_id,$_POST);

			if($result)
			{
				show('court.php?action=list');
			}
		}
		else
		{
			//GET方法

			assert(intval($_GET['court_id']));
			$court_id = (isset($_GET['court_id']) && !empty($_GET['court_id'])) ? $_GET['court_id'] : 0;

			$court = $db->get_by_id('court',$court_id);

			//所属区域
			$area = $db->get_by_con('area','has_node = 0');	//没有子节点的都显示
			$tpl->assign('area',$area);

			if ($court)
			{
				$tpl->assign('court',$court);
				$tpl->display('/admin/court/court_edit.html');
			}
			else
			{
				$tpl->assign('msg',array('title'=>'场地后台管理','content'=>'修改读取失败',));
				$tpl->display('admin/msg.html');
				die;
			}
		}
	break;

	case 'del':		//删除

		assert(intval($_GET['court_id']));
		$court_id = (isset($_GET['court_id']) && !empty($_GET['court_id'])) ? $_GET['court_id'] : 0;

		$result = $db->delete_by_id('court',$court_id);
		if($result)
		{
			show('court.php?action=list');
		}
	break;

	case 'view':	//查看

		assert(intval($_GET['court_id']));
		$court_id = (isset($_GET['court_id']) && !empty($_GET['court_id'])) ? $_GET['court_id'] : 0;

		$court = $db->get_by_id('court',$court_id);

		//所属区域
		$rs = $db->get_by_id('area',$court['area_id']);
		$court['area'] = $rs['area'];

		//创建者
		if($court['create_uid'] != 0)
		{
			$rs = $db->get_by_id('admin_user',$court['create_uid']);
			$court['create_username'] = $rs['username'];
		}

		//修改者
		if($court['update_uid'] != 0)
		{
			$rs = $db->get_by_id('admin_user',$court['update_uid']);
			$court['update_username'] = $rs['username'];
		}

		$tpl->assign('court',$court);
		$tpl->display('/admin/court/court_view.html');

	break;

	default :	//错误页面

        $tpl->assign('msg',array('title'=>'系统错误','content'=>'出错了',));
		$tpl->display('msg.html');
		die;

    break;
}
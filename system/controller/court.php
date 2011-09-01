<?php
//场地介绍

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


switch ($action)
{

	case '':	//场地聚会页
		show('court.php?action=court');
	break;

	case 'court':	//场地聚会页

		//区域
		$area = $db->get_by_con('area','has_node = 0');	//没有子节点的都显示
		$tpl->assign('area',$area);

		//类型
		$tpl->assign('court_type',$site_config['court_type']);

		//场地列表
		$court_list = $db->get_by_con('court','status = 0 ORDER BY recommend DESC,views DESC LIMIT 0,20');	//根据推荐指数和查看数排序
		$tpl->assign('court_list',$court_list);

		//场地评论
		$sql = "SELECT c.*, u.id AS uid, u.username,up.avatar FROM comment AS c , user AS u , user_profile AS up " .
				"WHERE c.create_uid = u.id AND u.id = up.uid AND c.class = 1 " .
				"ORDER BY c.create_time DESC LIMIT 0,20";
		$result = $db->query($sql);
		$court_comment = $db->get_rows_array($result);
		$tpl->assign('court_comment',$court_comment);

		$tpl->assign('title','场地');
		$tpl->display('court.html');
	break;

	case 'filter':	//筛选

		//筛选场地类型
		if(!empty($_GET['court_type']))
		{
			$court_list = $db->get_by_con('court',"court_type LIKE '%" . $_GET['court_type'] . "%' AND status = 0 ORDER BY recommend DESC,views DESC LIMIT 0,20");
			$tpl->assign('court_list',$court_list);
		}
		elseif(!empty($_GET['area_id']))
		{
			$court_list = $db->get_by_con('court',"area_id = " . $_GET['area_id'] . " AND status = 0 ORDER BY recommend DESC,views DESC LIMIT 0,20");
			$tpl->assign('court_list',$court_list);
		}

		//区域
		$area = $db->get_by_con('area','has_node = 0');	//没有子节点的都显示
		$tpl->assign('area',$area);

		//类型
		$tpl->assign('court_type',$site_config['court_type']);

		//场地评论
		$sql = "SELECT c.*, u.id AS uid, u.username,up.avatar FROM comment AS c , user AS u , user_profile AS up " .
				"WHERE c.create_uid = u.id AND u.id = up.uid AND c.class = 1 " .
				"ORDER BY c.create_time DESC LIMIT 0,20";
		$result = $db->query($sql);
		$court_comment = $db->get_rows_array($result);
		$tpl->assign('court_comment',$court_comment);

		$tpl->assign('title','场地');
		$tpl->display('court.html');
	break;

	case 'search':	//搜索
		if(!empty($_POST['keywords']))
		{
			//搜索场地名，地址，周边交通和简介
			$sql = "SELECT * FROM court " .
					"WHERE name LIKE '%" . $_POST['keywords'] . "%' OR " .
					"address LIKE '%" . $_POST['keywords'] . "%' OR " .
					"traffic LIKE '%" . $_POST['keywords'] . "%' OR " .
					"description LIKE '%" . $_POST['keywords'] . "%'";

			$result = $db->query($sql);
			$court_list = $db->get_rows_array($result);
			$tpl->assign('court_list',$court_list);

			//区域
			$area = $db->get_by_con('area','has_node = 0');	//没有子节点的都显示
			$tpl->assign('area',$area);

			//类型
			$tpl->assign('court_type',$site_config['court_type']);

			//场地评论
			$sql = "SELECT c.*, u.id AS uid, u.username,up.avatar FROM comment AS c , user AS u , user_profile AS up " .
					"WHERE c.create_uid = u.id AND u.id = up.uid AND c.class = 1 " .
					"ORDER BY c.create_time DESC LIMIT 0,20";
			$result = $db->query($sql);
			$court_comment = $db->get_rows_array($result);
			$tpl->assign('court_comment',$court_comment);

			$tpl->assign('title','场地');
			$tpl->display('court.html');

		};
	break;

	case 'view':	//场地详情页

		assert(intval($_GET['court_id']));
		$court_id = (isset($_GET['court_id']) && !empty($_GET['court_id'])) ? $_GET['court_id'] : 0;

		//查看数增加1
		$db->query("UPDATE court SET views = views+1 WHERE id = $court_id");

		//场地评论
		$sql = "SELECT c.*, u.id AS uid, u.username,up.avatar FROM comment AS c , user AS u , user_profile AS up " .
				"WHERE c.create_uid = u.id AND u.id = up.uid AND c.class = 1 AND c.topic_id = $court_id " .
				"ORDER BY c.create_time DESC";
		$result = $db->query($sql);
		$comment = $db->get_rows_array($result);
		$tpl->assign('comment',$comment);

		//场地详情
		$court_info = $db->get_by_id('court',$court_id);
		//所属区域
		$rs = $db->get_by_id('area',$court_info['area_id']);
		$court_info['area'] = $rs['area'];
		$tpl->assign('court_info',$court_info);

		$tpl->assign('title','场地详情');
		$tpl->display('court_detail.html');

	break;

	default :	//错误页面

		$tpl->assign('msg',array('title'=>'系统错误','content'=>'出错了',));
		$tpl->display('msg.html');
		die;

    break;
}


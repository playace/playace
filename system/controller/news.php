<?php
//新闻

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
	case 'news':	//新闻页

		//读取分类
		$category = $db->get_by_con('category','parent_id = 0');
		$tpl->assign('category',$category);

		//读取每个分类下的新闻各5条
		for($i = 0;$i<count($category);$i++)
		{
			$catid = $category["$i"]['id'];
			$rs["$i"] = $db->get_by_con('news',"catid = $catid LIMIT 0,5");
			$tpl->assign("news_$i",$rs["$i"]);
		}

		//读取分类
		$category = $db->get_by_con('category','1 = 1 ORDER BY id ASC LIMIT 0,6');

		//资讯,分类1
		$news = $db->get_by_con('news','catid = 1 ORDER BY views DESC LIMIT 0,5');
		$tpl->assign('category_1',$category['0']);
		$tpl->assign('news_1',$news);

		//资讯,分类2
		$news = $db->get_by_con('news','catid = 2 ORDER BY views DESC LIMIT 0,5');
		$tpl->assign('category_2',$category['1']);
		$tpl->assign('news_2',$news);

		//资讯,分类3
		$news = $db->get_by_con('news','catid = 3 ORDER BY views DESC LIMIT 0,5');
		$tpl->assign('category_3',$category['2']);
		$tpl->assign('news_3',$news);

		//资讯,分类4
		$news = $db->get_by_con('news','catid = 4 ORDER BY views DESC LIMIT 0,5');
		$tpl->assign('category_4',$category['3']);
		$tpl->assign('news_4',$news);

		//资讯,分类5
		$news = $db->get_by_con('news','catid = 5 ORDER BY views DESC LIMIT 0,5');
		$tpl->assign('category_5',$category['4']);
		$tpl->assign('news_5',$news);

		//资讯,分类6
		$news = $db->get_by_con('news','catid = 6 ORDER BY views DESC LIMIT 0,5');
		$tpl->assign('category_6',$category['5']);
		$tpl->assign('news_6',$news);

		//最新评论
		$sql = "SELECT c.*, u.id AS uid, u.username,up.avatar " .
				"FROM comment AS c , user AS u , user_profile AS up " .
				"WHERE c.create_uid = u.id AND u.id = up.uid AND c.class = 3 " .
				"ORDER BY c.create_time DESC LIMIT 0,10";
		$result = $db->query($sql);
		$news_comment = $db->get_rows_array($result);
		$tpl->assign('news_comment',$news_comment);

		$tpl->assign('title','资讯');
		$tpl->display('news.html');

	break;

	case 'view':	//查看

		assert(intval($_GET['news_id']));
		$news_id = (isset($_GET['news_id']) && !empty($_GET['news_id'])) ? $_GET['news_id'] : 0;

		//查看数增加1
		$db->query("UPDATE news SET views = views+1 WHERE id = $news_id");

		//新闻详情
		$news = $db->get_by_id('news',$news_id);
		$tpl->assign('news',$news);

		//分类
		$category = $db->get_by_id('category',$news['catid']);
		$tpl->assign('category',$category);

		//新闻内容
		$news_data = $db->get_by_id('news_data',$news_id);
		$tpl->assign('news_data',$news_data);

		//最新评论
		$sql = "SELECT c.*, u.id AS uid, u.username,up.avatar FROM comment AS c , user AS u , user_profile AS up " .
				"WHERE c.create_uid = u.id AND u.id = up.uid AND c.class = 3 " .
				"ORDER BY c.create_time DESC LIMIT 0,10";
		$result = $db->query($sql);
		$news_comment = $db->get_rows_array($result);
		$tpl->assign('news_comment',$news_comment);

		//本条资讯评论
		$sql = "SELECT c.*, u.id AS uid, u.username,up.avatar FROM comment AS c , user AS u , user_profile AS up " .
				"WHERE c.create_uid = u.id AND u.id = up.uid AND c.class = 3 AND c.topic_id = $news_id " .
				"ORDER BY c.create_time DESC";
		$result = $db->query($sql);
		$comment = $db->get_rows_array($result);
		$tpl->assign('comment',$comment);

		$tpl->assign('title','资讯详情');
		$tpl->display('news_detail.html');

	break;

	case 'list':	//资讯列表

		assert(intval($_GET['catid']));
		$catid = (isset($_GET['catid']) && !empty($_GET['catid'])) ? $_GET['catid'] : 0;

		//新闻列表
		$news_list = $db->get_by_con('news',"catid = $catid LIMIT 0,25");
		$tpl->assign('news_list',$news_list);

		//分类
		$category = $db->get_by_id('category',$catid);
		$tpl->assign('category',$category);

		//最新评论
		$sql = "SELECT c.*, u.id AS uid, u.username,up.avatar FROM comment AS c , user AS u , user_profile AS up " .
				"WHERE c.create_uid = u.id AND u.id = up.uid AND c.class = 3 " .
				"ORDER BY c.create_time DESC LIMIT 0,10";
		$result = $db->query($sql);
		$news_comment = $db->get_rows_array($result);
		$tpl->assign('news_comment',$news_comment);

		$tpl->assign('title','资讯详情');
		$tpl->display('news_list.html');

	break;

	default :	//错误页面

        $tpl->assign('msg',array('title'=>'系统错误','content'=>'出错了',));
		$tpl->display('msg.html');
		die;

    break;
}


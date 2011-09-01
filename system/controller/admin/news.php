<?php
require_once '../prepare.php';

$action = isset($_GET['action']) ? $_GET['action'] : '';
$tpl->assign('page_class','news');	//页面类型

switch ($action)
{
	case '':	//列表
		show('news.php?action=list');
	break;

	case 'list':	//进入登陆页

		$sql = "SELECT n.id,n.title,n.author_name,n.create_time,c.catname FROM news AS n,category AS c " .
				"WHERE n.catid = c.id ORDER BY create_time DESC";
		$news_list = $db->get_rows_array($db->query($sql));

		$tpl->assign('news_list',$news_list);
		$tpl->display('/admin/news/news_list.html');
	break;

	case 'search':	//搜索

	break;

	case 'fiter':	//筛选

	break;

	case 'add':		//新增
		if ($_SERVER['REQUEST_METHOD'] == 'POST')
		{

			//POST方法
			$_POST['create_time'] = time();
			$_POST['create_uid'] = $_SESSION['uid'];

			$content = $_POST['content'];
			unset($_POST['content']);
			$_POST['classid'] = 1;	//默认类型，资讯类

			//添加文章信息
			$result = $db->insert('news',$_POST);
			$news_id = $db->insert_id();
			//添加文章内容
			$arr = array( 'id'		=> $news_id,
						  'content' => $content,
							);
			$result = $db->insert('news_data',$arr);
			if($result)
			{
				show('news.php?action=list');
			}
			else
			{
				show('news.php?action=list');
			}
		}
		else
		{
			//GET方法

			//读取分类
			$category = $db->getAll('category');
			$tpl->assign('category',$category);
			$tpl->display('/admin/news/news_add.html');
		}
	break;

	case 'edit':	//修改
		if ($_SERVER['REQUEST_METHOD'] == 'POST')
		{
			//POST方法
			$content = $_POST['content'];
			$news_id = $_POST['news_id'];
			unset($_POST['content']);
			unset($_POST['news_id']);

			//修改文章信息
			$result = $db->update_by_id('news',$news_id,$_POST);

			//修改文章内容
			$arr = array( 'id'		=> $news_id,
						  'content' => $content,
							);
			$result_1 = $db->update_by_id('news_data',$news_id,$arr);

			if($result and $result_1)
			{
				show('news.php?action=list');
			}
			else
			{
				show('news.php?action=list');
			}
		}
		else
		{
			//GET方法
			assert(intval($_GET['news_id']));
			$news_id = (isset($_GET['news_id']) && !empty($_GET['news_id'])) ? $_GET['news_id'] : 0;

			$news = $db->get_by_id('news',$news_id);
			$news_data = $db->get_by_id('news_data',$news_id);

			if ($news and $news_data)
			{
				$tpl->assign('news',$news);
				$tpl->assign('news_data',$news_data);

				//读取分类
				$category = $db->getAll('category');
				$tpl->assign('category',$category);

				$tpl->display('/admin/news/news_edit.html');
			}
			else
			{
				$tpl->assign('msg',array('title'=>'资讯后台管理','content'=>'读取错误',));
				$tpl->display('admin/msg.html');
				die;
			}
		}
	break;

	case 'del':		//删除

		assert(intval($_GET['news_id']));
		$news_id = (isset($_GET['news_id']) && !empty($_GET['news_id'])) ? $_GET['news_id'] : 0;

		$result = $db->delete_by_id('news',$news_id);
		$result_1 = $db->delete_by_id('news_data',$news_id);
		if($result and $result_1)
		{
			show('news.php?action=list');
		}
		else
		{
			show('news.php?action=list');
		}
	break;

	case 'view':	//查看

		assert(intval($_GET['news_id']));
		$news_id = (isset($_GET['news_id']) && !empty($_GET['news_id'])) ? $_GET['news_id'] : 0;

		$news = $db->get_by_id('news',$news_id);
		$news_data = $db->get_by_id('news_data',$news_id);

		if($news and $news_data)
		{
			//读取分类
			$category = $db->get_by_id('category',$news['catid']);
			$tpl->assign('category',$category);

			$tpl->assign('news',$news);
			$tpl->assign('news_data',$news_data);
			$tpl->display('/admin/news/news_view.html');
		}
		else
		{
			$tpl->assign('msg',array('title'=>'后台管理资讯查看','content'=>'读取错误',));
			$tpl->display('admin/msg.html');
			die;
		}

	break;

	default :	//错误页面
        $tpl->assign('msg',array('title'=>'资讯后台管理','content'=>'出错了',));
		$tpl->display('admin/msg.html');
		die;
    break;
}
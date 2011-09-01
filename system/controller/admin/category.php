<?php
require_once '../prepare.php';

$action = isset($_GET['action']) ? $_GET['action'] : '';
$tpl->assign('page_class','category');	//页面类型

switch ($action)
{
	case '':	//列表
		show('category.php?action=list');
	break;

	case 'list':	//进入登陆页

		$category_list = $db->get_by_con('category','1=1 ORDER BY id ASC');

		$tpl->assign('category_list',$category_list);
		$tpl->display('/admin/category/category_list.html');
	break;

	case 'search':	//搜索

		//todo

		$tpl->assign('category_list',$category_list);
		$tpl->display('/admin/category/category_list.html');
	break;

	case 'add':		//新增
		if ($_SERVER['REQUEST_METHOD'] == 'POST')
		{
			//POST方法
			$_POST['create_time'] = time();
			$_POST['create_uid'] = $_SESSION['uid'];

			//不能有重复的分类名
			$catname = $_POST['catname'];
			$re = $db->get_by_con('category',"catname = '".$catname."'");
			if(empty($re))
			{
				//没有重复的分类名
				$result = $db->insert('category',$_POST);
				if($result)
				{
					//添加成功
					show('category.php?action=list');
				}
			}
			else
			{
				$tpl->assign('msg',array('title'=>'分类后台管理','content'=>'不能有重复的分类名',));
				$tpl->display('admin/msg.html');
				die;
			}
		}
		else
		{
			//GET方法
			$tpl->display('/admin/category/category_add.html');
		}
	break;

	case 'edit':	//修改

		if ($_SERVER['REQUEST_METHOD'] == 'POST')
		{
			//POST方法
			$_POST['update_time'] = time();
			$_POST['update_uid'] = $_SESSION['uid'];
			$catid = $_POST['catid'];
			unset($_POST['catid']);

			//修改文章信息
			$result = $db->update_by_id('category',$catid,$_POST);
			if($result)
			{
				//修改成功
				show('category.php?action=list');
			}
		}
		else
		{
			//GET方法
			$catid = isset($_GET['catid']) ? $_GET['catid'] : 0;
			$category = $db->get_by_id('category',$catid);

			if ($category)
			{
				$tpl->assign('category',$category);
				$tpl->display('/admin/category/category_edit.html');
			}
		}
	break;

	case 'del':		//删除
		assert(intval($_GET['catid']));
		$catid = (isset($_GET['catid']) && !empty($_GET['catid'])) ? $_GET['catid'] : 0;

		$result = $db->delete_by_id('category',$catid);
		if($result)
		{
			//删除成功
			show('category.php?action=list');
		}

	break;

	case 'view':	//查看

		assert(intval($_GET['catid']));
		$catid = (isset($_GET['catid']) && !empty($_GET['catid'])) ? $_GET['catid'] : 0;

		$category = $db->get_by_id('category',$catid);

		//创建者
		if($category['create_uid'] != 0)
		{
			$rs = $db->get_by_id('admin_user',$category['create_uid']);
			$category['create_username'] = $rs['username'];
		}

		//修改者
		if($category['update_uid'] != 0)
		{
			$rs = $db->get_by_id('admin_user',$category['update_uid']);
			$category['update_username'] = $rs['username'];
		}

		$tpl->assign('category',$category);
		$tpl->display('/admin/category/category_view.html');
	break;

	default :	//错误页面
        $tpl->assign('msg',array('title'=>'分类后台管理','content'=>'出错了',));
		$tpl->display('msg.html');
		die;
    break;
}
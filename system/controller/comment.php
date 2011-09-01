<?php
//评论

require_once 'prepare.php';

$action = isset($_GET['action']) ? $_GET['action'] : '';

switch ($action)
{
	case 'add':	//添加评论

		if($_SERVER['REQUEST_METHOD'] == 'POST')
		{
			$arr = array(	'content' =>$_POST['content'],
							'class' =>$_POST['class'],
							'topic_id' =>$_POST['topic_id'],
							'parent_id' =>$_POST['parent_id'],
							'create_time' =>time(),
							'create_uid' =>$_SESSION['uid'],
						);
			$result = $db->insert('comment',$arr);	//插入到评论表
			if($result)
			{
				//增加活动评论数
				if($arr['class'] == 1)
				{
					//场地评论
					$db->query("UPDATE court SET comments = comments+1 WHERE id =".$arr['topic_id']);
				}
				elseif($arr['class'] == 2)
				{
					//活动评论
					$db->query("UPDATE party_info SET comments = comments+1 WHERE id =".$arr['topic_id']);
				}
				elseif($arr['class'] == 3)
				{
					//新闻评论
					$db->query("UPDATE news SET comments = comments+1 WHERE id =".$arr['topic_id']);
				}

				$tpl->assign('msg',array('title'=>'评论','content'=>'评论成功',));
				$tpl->display('msg.html');
				die;
			}
		}
	break;

	case 'del':	//删除评论
		$id = isset($_GET['comment_id']) ? $_GET['comment_id'] : 0;
		$result = $db->delete_by_id('comment',$id);
		if($result)
		{
			$tpl->assign('msg','删除评论成功');
			$tpl->display('msg.html');
			die;
		}
		else
		{
			$tpl->assign('msg','删除评论失败');
			$tpl->display('msg.html');
			die;
		}

	break;

	default :	//错误页面
        exit('出错了');
    break;
}


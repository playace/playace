<?php
require_once 'prepare.php';

$action = isset($_GET['action']) ? $_GET['action'] : '';

switch ($action)
{
	case '':	//进入首页
		show('index.php?action=index');
	break;

	case 'index':	//进入首页
/*
		//如果发现有cookie，把用户名和密码到数据库里去验证一下
		if(!empty($_COOKIE["email"]) AND !empty($_COOKIE["password"]))
		{
			$email = $_COOKIE['email'];
			$password = $_COOKIE['password'];

			$user_info = $db->get_by_con('user',"email = '".$email."' AND password = '".$password."'");
			if($user_info)
			{
				//更新session
				$_SESSION = array('uid'=>$user_info[0]['id'],
								  'email'=>$user_info[0]['email'],
								  'username'=>$user_info[0]['username'],
									);

				//更新最后登录时间和IP
				$data = array(
					last_login_ip => $_SERVER["REMOTE_ADDR"],
					last_login_time => time(),
				);

				$result = $db->update_by_id('user',$user_info['0']['id'],$data);
			}
			else
			{
				$tpl->assign('msg','登录失败');
				$tpl->display('msg.html');
				die;
			}
		}
*/

		//当前时间
		$time = time();
		$tpl->assign('time',$time);

		//推荐活动
		$sql = "SELECT p.id,p.title,p.start_time,p.cost,p.address,p.thumb,p.number_limit,p.end_time,i.* " .
				"FROM party AS p,party_info AS i " .
				"WHERE p.end_time > $time AND p.id = i.id ORDER BY p.start_time DESC LIMIT 0,4";
		$result = $db->query($sql);
		$recommend_party = $db->get_rows_array($result);
		$tpl->assign('recommend_party',$recommend_party);

		//热门场地
		$hot_court = $db->get_by_con('court','1 = 1 ORDER BY views DESC LIMIT 0,4');
		$tpl->assign('hot_court',$hot_court);

		//todo 分类和资讯标题可以写在smarty插件里，从html上自动读取
		//读取分类
		$category = $db->get_by_con('category','1 = 1 ORDER BY id ASC LIMIT 0,6');

		//资讯,分类1
		$news = $db->get_by_con('news','catid = 1 ORDER BY views DESC LIMIT 0,2');
		$tpl->assign('category_1',$category['0']);
		$tpl->assign('news_1',$news);

		//资讯,分类2
		$news = $db->get_by_con('news','catid = 2 ORDER BY views DESC LIMIT 0,2');
		$tpl->assign('category_2',$category['1']);
		$tpl->assign('news_2',$news);

		//资讯,分类3
		$news = $db->get_by_con('news','catid = 3 ORDER BY views DESC LIMIT 0,2');
		$tpl->assign('category_3',$category['2']);
		$tpl->assign('news_3',$news);

		//资讯,分类4
		$news = $db->get_by_con('news','catid = 4 ORDER BY views DESC LIMIT 0,2');
		$tpl->assign('category_4',$category['3']);
		$tpl->assign('news_4',$news);

		//资讯,分类5
		$news = $db->get_by_con('news','catid = 5 ORDER BY views DESC LIMIT 0,2');
		$tpl->assign('category_5',$category['4']);
		$tpl->assign('news_5',$news);

		//资讯,分类6
		$news = $db->get_by_con('news','catid = 6 ORDER BY views DESC LIMIT 0,2');
		$tpl->assign('category_6',$category['5']);
		$tpl->assign('news_6',$news);

		//活动动态
		$sql = "SELECT f.*,p.avatar FROM feeds AS f,user_profile AS p " .
				"WHERE f.uid = p.uid AND f.type = 0 " .
				"ORDER BY create_time DESC LIMIT 0,10";
		$result_1 = $db->query($sql);
		$feeds_party = $db->get_rows_array($result_1);
		$tpl->assign('feeds_party',$feeds_party);

		//活动评论
		$sql = "SELECT c.*, u.id AS uid, u.username,up.avatar FROM comment AS c , user AS u , user_profile AS up " .
				"WHERE c.create_uid = u.id AND u.id = up.uid AND c.class = 2 " .
				"ORDER BY c.create_time DESC LIMIT 0,3";
		$result_1 = $db->query($sql);
		$party_comment = $db->get_rows_array($result_1);
		$tpl->assign('party_comment',$party_comment);

		//场地评论
		$sql = "SELECT c.*, u.id AS uid, u.username,up.avatar FROM comment AS c , user AS u , user_profile AS up " .
				"WHERE c.create_uid = u.id AND u.id = up.uid AND c.class = 1 " .
				"ORDER BY c.create_time DESC LIMIT 0,3";
		$result_2 = $db->query($sql);
		$court_comment = $db->get_rows_array($result_2);
		$tpl->assign('court_comment',$court_comment);

		//明星会员 TOP3
		$sql = "SELECT p.uid,u.username,count(p.uid) AS party_num FROM participant AS p,user AS u " .
				"WHERE u.id = p.uid AND p.is_passed = 1 GROUP BY p.uid ORDER BY party_num DESC LIMIT 0,3";
		$result_3 = $db->query($sql);
		//@todo fix empty
		$star_member = $db->get_rows_array($result_3);
		$tpl->assign('star_member',$star_member);

		//人物
		$people = $db->get_by_con('news AS n,news_data AS d','n.id = d.id AND catid = 7 ORDER BY recommend DESC LIMIT 0,1');
		$tpl->assign('people',$people['0']);

		if(!empty($_SESSION))
		{
			$tpl->assign('user_session',$_SESSION);	//用户信息
			//读取用户收到短信数
			$sql = "SELECT id FROM message WHERE inbox_status != 1 AND to_uid =".$_SESSION['uid'];
			$result_4 = $db->query($sql);
			$tpl->assign('msg_num',$db->get_rows_num($result_4));

			//我的评论数
			$my_comment = $db->get_by_con('comment','create_uid ='.$_SESSION['uid']);
			$tpl->assign('my_comment_num',$db->get_rows_num($my_comment));

			//我参加的活动数
			$added_party = $db->get_by_con('participant','is_passed = 1 AND uid ='.$_SESSION['uid']);
			$tpl->assign('added_party_num',$db->get_rows_num($added_party));

			//我的信息
			$user_profile = $db->get_by_con('user_profile ',"uid = ".$_SESSION['uid']);
			$tpl->assign('user_profile',$user_profile['0']);
		} else {
		  $tpl->assign('user_session', array('username' => ''));
		}

		$tpl->assign('title','首页');
		$tpl->display('index.html');
	break;

	default :	//错误页面
        $tpl->assign('msg',array('title'=>'系统错误','content'=>'出错了',));
		$tpl->display('msg.html');
		die;
    break;
}

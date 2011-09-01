<?php

/*
 * 跳转函数，跳转到某个action
 * 
 * @access public
 * @param string $url
 * @return void
 * @example
 * <code>
 * 		show('index.php?action=index');
 * </code>
 * @author ray_xu <raynorxyx@hotmail.com>
 */
function show($url='') 
{
    header(sprintf("Location: %s", $url));
    exit();
}


/*
 * 返回当前页  page参数的值
 * 如果没有该GET参数，返回1
 * 
 * @access public
 * @return mixed
 * @example
 * <code>
 * 		$page = _page();
 * </code>
 * @author ray_xu <raynorxyx@hotmail.com>
 */
function _page() 
{
    return (isset($_GET['page'])&&!empty($_GET['page'])) ? $_GET['page'] : 1;
}


/*
 * 返回指定的 $_GET 数据 
 * 如果没有数据，返回 null
 * 
 * @access public
 * @param string $key
 * @return mixed
 * @example
 * <code>
 * 		$name = _get('name');
 * </code>
 * @author ray_xu <raynorxyx@hotmail.com>
 */
function _get($key)
{
    return isset($_GET[$key]) ? $_GET[$key] : null;
}


/*
 * 返回指定的 $_POST 数据 
 * 如果没有数据，返回 null
 * 
 * @access public
 * @param string $key
 * @return mixed
 * @example
 * <code>
 * 		$name = _post('name');
 * </code>
 * @author ray_xu <raynorxyx@hotmail.com>
 */
function _post($key)
{
    return isset($_POST[$key]) ?  $_POST[$key] : null;
}


/*
 * 是否post请求? 
 * 
 * @access public
 * @return bool
 * @example
 * <code>
 * 		if(is_post() == 'POST')
 * 			//post 方法
 * 		elseif(is_post() == 'GET')
 * 			//get 方法
 * </code>
 * @author ray_xu <raynorxyx@hotmail.com>
 */
 
 /*
  * function is_post() 
{
    $REQUEST_METHOD=isset($_SERVER['REQUEST_METHOD'])?$_SERVER['REQUEST_METHOD']:'';
    return $REQUEST_METHOD=='POST';
}
  */
function is_post() 
{
    return $_SERVER['REQUEST_METHOD'];
}


/*
 * 返回当前 action 参数的值
 * 如果没有该GET参数，返回 null
 * 
 * @access public
 * @return mixed
 * @example
 * <code>
 * 		$action = _action();
 * </code>
 * @author ray_xu <raynorxyx@hotmail.com>
 */
function _action() 
{
    return isset($_GET['action']) ? $_GET['action'] : null;
}


/*
 * 返回路径地址来源
 * 如果没有来源，返回null
 * 
 * @access public
 * @return mixed
 * @example
 * <code>
 * 		$fromurl = _fromurl();
 * </code>
 * @author ray_xu <raynorxyx@hotmail.com>
 */
function _fromurl()
{
    return isset($_SERVER['HTTP_REFERER'])? $_SERVER['HTTP_REFERER']: null;
}









//——————————————————————————————————————————————————————————————————————————————
//——————————————————————————————————————————————————————————————————————————————

/*
 * showmessage(L('operation_success'), HTTP_REFERER);
 * showmessage(L('operation_success'), '?m=admin&c=author&a=init');
 */


/**
 * 页面url,包括静态资源和动态页面.
 * 
 * h('help/a.gif')    =>http://s1.example.com/a.gif
 * h('global/bp/a.css') =>http://s1.example.com/global/bp/a.css
 * h('help/c.js') => http://s1.example.com/help/c.js
 * h('admin/login.php') => admin.example.com/login.php  #自动按路径找到正确的子域名
 * h('/admin/login.php')=> #同上
 * h('admin')  => admin.example.com
 * h('/admin')=> admin.example.com
 * h('/admin','finance')=> finance.example.com/admin
 * h('admin','finance')=> #同上
 * h('','finance')=> finance.example.com
 * h()       => /
 * h('http://www.163.com') => http://www.163.com
 * h('http://www.163.com/') => http://www.163.com/
 * 
 * @param string $file 
 * @param string $sub 指定2级域名
 * @return string
 * @author caojian
 */
function h($file='', $sub=null)
{
    $cfg=get_config();
    $r='';
    if(!$file and !$sub)
        return '/';
    if(!$file and $sub)
        return sprintf('http://%s.%s', $sub, $cfg->DOMAIN);
    #后缀
    $t=explode('.', $file);
    $suffix=strtolower(array_pop($t));
    unset($t);
    #开始生成url
    if(in_array($suffix, array('js', 'css','ico','url',
          'gif', 'bmp', 'xml', 'jpg', 'jpeg', 'png', 'html', 'txt', 'swf')))
        $r=sprintf('%s/%s',$cfg->STATIC_URL,ltrim($file,'/'));
    elseif('http://'==substr($file,0,strlen('http://')))
        $r=$file;
    else
    {
        if($sub)
        {
            $path=ltrim($file, '/');
        }
        else
        {
            #页面路径
            $t=explode('/', ltrim($file,'/'), 2);
            $sub=strtolower($t[0]);
            $path=isset($t[1])?$t[1]:'';
            if(array_key_exists($sub, $cfg->DIR2DOMAIN))
                $sub = $cfg->DIR2DOMAIN[$sub];
            unset($t);
        }
        $r=sprintf('http://%s.%s/%s', $sub, $cfg->DOMAIN, $path);
    }
    return $r;
}


/**
 * 404页面 
 * 
 * @author caojian
 */
function _404() 
{
    $url=h();
    $wait=3;
    $msg='没有这个页面.正在返回首页中...';
    print <<<EOT
    <html><head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="robots" content="index,follow">
    <meta http-equiv="refresh" content="$wait;url=$url">
    <title>没有这个页面. 404 Error</title>
    <style type="text/css">
        body{ background: #fff; font:14px Verdana;}
        a{text-decoration: underline;}
        a:hover{text-decoration: none;}
        img{border:0;}
    </style>
    </head>
    <body>
    <center>
    <div style="padding:15px 60px;border:1px solid #D5E5E8;background:#EFF7FF; text-align:center; margin:20% auto auto; width:55%">
    <span style="font-weight:bold;color:#00537E">$msg</span><BR/><BR/>
    <a style="color:#909090;" href="$url">如果浏览器无法跳转,请点击此处</a>
    </div></center></body></html>
EOT;
    exit();
}

/**
 * 直接跳转,不等待
 * 
 * <code>
 * redirect(); #跳转到首页 
 * redirect('/'); #跳转到首页 
 * redirect('/new/index.php?id=1'); #内部会调用h()函数到正确的url
 * </code>
 *
 * @param string $url 
 * @return void
 * @author caojian
 */
function redirect($url='') 
{
    header(sprintf("Location: %s", h($url)));
    exit();
}

/**
 * 页面跳转,可设置跳转间隔时间
 * 
 * <code>
 * show('/new/index.php?id=1','操作成功！',3);#3秒后
 * </code>
 *
 * @param string $url 
 * @param string $msg 
 * @param int $wait 
 * @param string $more_msg
 * @access public
 * @return void
 * @author caojian
 */
function show_1($url='',$msg='',$wait=3,$more_msg='') 
{
    $url=h($url);
    $help_center_url = h('/misc/help_center.php');
    $bodybg = h('global/image/bodybg.png');
    $topLogo = h('global/image/topLogo.png');
    $tipicon = h('global/image/tipicon.gif');
    $messagebg = h('global/image/messagebg.png');
    print <<<EOT
            <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
            <html xmlns="http://www.w3.org/1999/xhtml">
            <head>
            <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
            <meta http-equiv="refresh" content="$wait;url=$url">
            <title>页面提示</title>
            <style type="text/css">
            *{margin:0; padding:0;}
            body{background:#4396ca url($bodybg) repeat-x 0 0; font-size:12px;}
            #wrap{width:960px; margin:0 auto;}
            #header{height:120px; background:url($topLogo) no-repeat center 42px;}
            .messageBox{height:400px; width:848px; margin:0 auto; background:url($messagebg) no-repeat 0 0;padding-top:112px}
            .mTitle{padding:41px 200px 41px 320px;background:url($tipicon) no-repeat 224px center}
            .mTitle h2{font-size:20px; line-height:35px; color:#F00;}
            .mTitle p a{font-size:14px; color:#999;}
            .mCont{width:600px; height:200px; margin:12px auto 0;overflow:hidden;}
            .mCont p{text-indent:2em; line-height:20px;}
            .footer{text-align:center; color:#fff; margin-top:12px;}
            .fBoxLink{line-height:50px;}
            .fBoxLink a{margin:0 6px; color:#fff;}
            </style>
            </head>
            <body>
                <div id="wrap">
                    <div id="header">
                </div>
                <div id="content">
                    <div class="messageBox">
                        <div class="mTitle">
                            <h2>$msg</h2>
                            <p><a href="$url">如果浏览器无法跳转，请点击此处</a></p>
                        </div>
                        <div class="mCont">
                            <p>$more_msg</p>
                        </div>
                    </div>
                </div>
                <div id="footer">
                    <div class="footer">
                        <!--fBoxLink-->
                        <div class="fBoxLink">
                            <a href="$help_center_url?action=site_map&link=0" target="_blank">关于我们</a>
                            <a href="$help_center_url?action=site_map&link=1" target="_blank">友情链接</a>
                            <a href="$help_center_url?action=site_map&link=2" target="_blank">免责声明</a>
                            <a href="$help_center_url?action=site_map&link=3" target="_blank">服务条款</a>
                            <a href="$help_center_url?action=site_map&link=4" target="_blank">隐私政策</a>
                            <a href="$help_center_url?action=site_map&link=5" target="_blank">版权所有</a>
                            <a href="$help_center_url?action=site_map&link=6" target="_blank">商务合作</a>
                            <a href="$help_center_url?action=site_map&link=7" target="_blank">招聘信息</a>
                            <a href="$help_center_url?action=site_map&link=8" target="_blank">联系我们</a>
                            <a href="$help_center_url?action=site_map&link=9" target="_blank">网站地图</a>
                            <a href="$help_center_url?action=help" target="_blank">帮助中心</a><br />
                        </div>
                        <!--fBoxLink end-->
                        <div class="fBoxRights">
                            Copyright &copy; 2009-2011 @ CCTV证券资讯 All Rights Reserved.
                        </div>
                    </div>
                </div>
            </div>
            </body>
            </html>
EOT;
    exit();
}


/**
 * 分页函数
 * 
 * @param $num 信息总数
 * @param $curr_page 当前分页
 * @param $perpage 每页显示数
 * @param $urlrule URL规则
 * @param $array 需要传递的数组，用于增加额外的方法
 * @return 分页
 */
function pages($num, $curr_page, $perpage = 20, $urlrule = '', $array = array(),$setpages = 10) {
	if(defined('URLRULE')) {
		$urlrule = URLRULE;
		$array = $GLOBALS['URL_ARRAY'];
		$urlrule = '/{$catdir}/index.shtml~/{$catdir}/index-{$page}.shtml';
	} elseif($urlrule == '') {
		$urlrule = url_par('page={$page}');
	}
	
	$multipage = '';
	if($num > $perpage) {
		$page = $setpages+1;
		$offset = ceil($setpages/2-1);
		$pages = ceil($num / $perpage);
		if (defined('IN_ADMIN') && !defined('PAGES')) define('PAGES', $pages);
		$from = $curr_page - $offset;
		$to = $curr_page + $offset;
		$more = 0;
		if($page >= $pages) {
			$from = 2;
			$to = $pages-1;
		} else {
			if($from <= 1) {
				$to = $page-1;
				$from = 2;
			}  elseif($to >= $pages) { 
				$from = $pages-($page-2);  
				$to = $pages-1;  
			}
			$more = 1;
		} 
		$multipage .= '<a class="a1">'.$num.L('page_item').'</a>';
		if($curr_page>0) {
			$multipage .= ' <a href="'.pageurl($urlrule, $curr_page-1, $array).'" class="a1">'.L('previous').'</a>';
			if($curr_page==1) {
				$multipage .= ' <span>1</span>';
			} elseif($curr_page>6 && $more) {
				$multipage .= ' <a href="'.pageurl($urlrule, 1, $array).'">1</a>..';
			} else {
				$multipage .= ' <a href="'.pageurl($urlrule, 1, $array).'">1</a>';
			}
		}
		for($i = $from; $i <= $to; $i++) { 
			if($i != $curr_page) { 
				$multipage .= ' <a href="'.pageurl($urlrule, $i, $array).'">'.$i.'</a>'; 
			} else { 
				$multipage .= ' <span>'.$i.'</span>'; 
			} 
		} 
		if($curr_page<$pages) {
			if($curr_page<$pages-5 && $more) {
				$multipage .= ' ..<a href="'.pageurl($urlrule, $pages, $array).'">'.$pages.'</a> <a href="'.pageurl($urlrule, $curr_page+1, $array).'" class="a1">'.L('next').'</a>';
			} else {
				$multipage .= ' <a href="'.pageurl($urlrule, $pages, $array).'">'.$pages.'</a> <a href="'.pageurl($urlrule, $curr_page+1, $array).'" class="a1">'.L('next').'</a>';
			}
		} elseif($curr_page==$pages) {
			$multipage .= ' <span>'.$pages.'</span> <a href="'.pageurl($urlrule, $curr_page, $array).'" class="a1">'.L('next').'</a>';
		} else {
			$multipage .= ' <a href="'.pageurl($urlrule, $pages, $array).'">'.$pages.'</a> <a href="'.pageurl($urlrule, $curr_page+1, $array).'" class="a1">'.L('next').'</a>';
		}
	}
	return $multipage;
}
/**
 * 返回分页路径
 * 
 * @param $urlrule 分页规则
 * @param $page 当前页
 * @param $array 需要传递的数组，用于增加额外的方法
 * @return 完整的URL路径
 */
function pageurl($urlrule, $page, $array = array()) {
	if(strpos($urlrule, '~')) {
		$urlrules = explode('~', $urlrule);
		$urlrule = $page < 2 ? $urlrules[0] : $urlrules[1];
	}
	$findme = array('{$page}');
	$replaceme = array($page);
	if (is_array($array)) foreach ($array as $k=>$v) {
		$findme[] = '{$'.$k.'}';
		$replaceme[] = $v;
	}
	$url = str_replace($findme, $replaceme, $urlrule);
	$url = str_replace(array('http://','//','~'), array('~','/','http://'), $url);
	return $url;
}

/**
 * URL路径解析，pages 函数的辅助函数
 *
 * @param $par 传入需要解析的变量 默认为，page={$page}
 * @param $url URL地址
 * @return URL
 */
function url_par($par, $url = '') {
	if($url == '') $url = get_url();
	$pos = strpos($url, '?');
	if($pos === false) {
		$url .= '?'.$par;
	} else {
		$querystring = substr(strstr($url, '?'), 1);
		parse_str($querystring, $pars);
		$query_array = array();
		foreach($pars as $k=>$v) {
			$query_array[$k] = $v;
		}
		$querystring = http_build_query($query_array).'&'.$par;
		$url = substr($url, 0, $pos).'?'.$querystring;
	}
	return $url;
}

/**
 * 判断email格式是否正确
 * @param $email
 */
function is_email($email) {
	return strlen($email) > 6 && preg_match("/^[\w\-\.]+@[\w\-\.]+(\.\w+)+$/", $email);
}

?>

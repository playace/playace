<?php
/*
 * 头文件
 * 如果只需要用 smarty ，导入 init.smarty.php 就可以了
 * 如果是一般的数据库应用 ，则导入 init.normal.php
 *
 */

//require_once dirname(dirname(dirname(__file__))) . '/include/init.simple.php';

require_once dirname(dirname(dirname(__file__))) . '/include/init.normal.php';

session_start();


//网站配置，todo，放到config/site_config文件下
$site_config = array();

$site_config['court_type'] = array(	array('type' => '硬地',),
									array('type' => '室外',),
									array('type' => '室内',),
									array('type' => '塑胶',),
									array('type' => '草地',),
									array('type' => '人工草皮',),
									array('type' => '红土',),
									array('type' => '黄土',),
									);

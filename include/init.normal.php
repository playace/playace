<?php
/*
 * 导入配置文件
 * 
 * @package include
 * @author ray_xu <raynorxyx@hotmail.com>
 */
 
$config = array(); 

//导入基本配置
require_once dirname(dirname(__file__)) . '/configs/base.php';

//导入smarty配置
require_once CONFIGS_PATH . '/smarty.php';

//导入mysql配置
require_once CONFIGS_PATH . '/mysql.php';

//导入DB类
require_once LIBS_PATH . '/mysql_db.php';

//初始化db类
$db = new mysql_db( $config['DB_HOST'],
					$config['DB_USERNAME'],
					$config['DB_PASSWORD'],
					$config['DB_DATABASE'],
					$config['DB_CHARSET']);

//导入帮助函数
require_once HELPER_PATH . '/func.php';

//后台news图片上传路径
define('NEWS_UPLOAD_DIR', dirname(__FILE__) . '/../static/img/news/');
/*EOF*/
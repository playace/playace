<?php
/*
 * 基础配置项
 *
 * @package configs
 * @author ray_xu <raynorxyx@hotmail.com>
 */

//url配置
$config['HTDOCS_BASE_URL']   = 'http://127.0.0.1/playace_laputa/system/controller';
$config['STATIC_URL']        = 'http://127.0.0.1/playace_laputa/static';

//分页设置
$config['DEFAULT_PAGE_PER']		= 10;	//默认每页显示记录条数
$config['DEFAULT_PAGE_STYLE']	= 1;	//默认分页风格
$config['DEFAULT_PAGE_DISPLAY']	= 4;	//默认显示页码数

//常量设置
define('BASE_PATH',       dirname(dirname(__FILE__)));
define('COMPLIE_PATH',    BASE_PATH . '/complie');
define('CONFIGS_PATH',    BASE_PATH . '/configs');
define('CRONTABS_PATH',   BASE_PATH . '/crontabs');
define('INCLUDE_PATH',    BASE_PATH . '/include');
define('HELPER_PATH',     BASE_PATH . '/include/helper');
define('LIBS_PATH',       BASE_PATH . '/include/libs');
define('STATIC_PATH',     BASE_PATH . '/static');
define('SYSTEM_PATH',     BASE_PATH . '/system');
define('CONTROLLER_PATH', BASE_PATH . '/system/controller');
define('MODELS_PATH',     BASE_PATH . '/system/models');
define('TPLS_PATH',       BASE_PATH . '/tpls');

/*
 * 产品标记
 * dev  => 开发环境
 * test => 测试环境
 * online => 线上生产环境
 * offline => 下线环境
 */
$config['product_tag'] = 'dev';

//第二配置文件
$current_path=dirname(__file__);
if(file_exists($current_path."/extend.php"))
    require_once $current_path."/extend.php";


/*EOF*/
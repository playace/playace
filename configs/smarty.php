<?php
/*
 * Smarty配置项，可直接调用
 * 
 * @package configs
 * @author ray_xu <raynorxyx@hotmail.com>
 */

$configs_path = dirname(__FILE__);

//基本配置
require_once $configs_path . '/base.php';

require_once LIBS_PATH . "/smarty/Smarty.class.php";

$tpl = new Smarty();

$tpl->template_dir   = TPLS_PATH;
$tpl->compile_dir    = COMPLIE_PATH . '/smarty_complie/';
$tpl->cache_dir      = COMPLIE_PATH . '/smarty_cache/';

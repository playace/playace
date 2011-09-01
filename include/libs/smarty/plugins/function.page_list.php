<?php
/**
 * Smarty plugin
 *
 * @package helpers
 * @subpackage global
 */

//导入基本配置
require_once dirname(dirname(dirname(dirname(dirname(__file__))))) . '/configs/base.php';

//导入分页类
require_once LIBS_PATH . '/page.php';

/**
 * page_list()
 *
 * Type:     function<br>
 * Name:     page_list<br>
 * Purpose:  分页
 *
 *
 * @link
 * @author xuyixing
 * @param  array $params
 * @param  object $template
 * @return string
 */
function smarty_function_page_list($params, $template)
{
    $total    =    $params['total'];
    $url      =    $params['url'];
    $page     =    $params['page'];
    $per      =    $params['per'];
    $style    =    $params['style']; 
    return page_list($total,$url,$page,$per,$style);
}

?>

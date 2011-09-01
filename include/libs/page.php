<?php
/*
 * 分页
 * @param int $total 数据总数
 * @param string $url 分页的url链接
 * @param int $page 当前页数
 * @param int $per 每页多少条记录
 * @param int $style css模板编号
 *
 * @return $string
 * @author xuyixing
 */
function page_list($total,$url,$page,$per,$style)
{	
    $total = (int)$total;
    if(empty($total)) //没有记录时
        return '';
    $page = _get_page_num($total,$page,$per);       //获取可靠的分页数
    $page_num = ceil($total/$per);                  //分页总数,有余数就加1
    $first_page = str_replace('#',1,$url);
    $end_page = str_replace('#',$page_num,$url);
    $pre_page = str_replace('#',(($page == 1) ? $page : $page - 1),$url);    //上一页
    $next_page = str_replace('#',(($page == $page_num) ? $page_num : $page + 1),$url);   //下一页
    
//    $first_page = h(str_replace('#',1,$url));
//    $end_page = h(str_replace('#',$page_num,$url));
//    $pre_page = h(str_replace('#',(($page == 1) ? $page : $page - 1),$url));    //上一页
//    $next_page = h(str_replace('#',(($page == $page_num) ? $page_num : $page + 1),$url));   //下一页
    
    $input = array(
        'page'      => $page,
        'page_num'  => $page_num,
        'first_page'=> $first_page,
        'end_page'  => $end_page,
        'pre_page'  => $pre_page,
        'next_page' => $next_page,
        'total'     => $total,
        'per'       => $per,
        'url'       => $url,
    );

    if(is_int($style) and $style>0)
    {
        $style = '_style_'.$style;
		return $style($input);
    }
    else
    {
        throw new Exception("no this page style:$style!");
    }
}

/*
 * 获取可靠的分页数
 *
 * 1,当前页小于首页时,返回首页页数
 * 2,当前页大于最大末页时,返回末页页数
 * 3,当前页是非数字时,返回首页页数
 * 4,其它情况直接返回
 * @access private
 */
function _get_page_num($total,$page,$per)
{
    if(!is_numeric($page) or (strpos($page,'.')!==false))
        return 1;
    $page_num=ceil($total/$per);
    if($page<1)
        $page = 1;
    elseif($page>$page_num)
        $page = $page_num;
    else
        $page=$page;
    return $page;
}

function _style_1($input)
{
    //生成html代码
    $link_string  = '<div class="pagesBar">';
    $link_string .= '<span class="current">'.'第'. $input['page'] .'页</span>';

    //如果是首页，则没有链接
    if( $input['page'] == 1)
    {
        $link_string .= '<span class="firstPage">首页</span>';
    }
    else
    {
        $link_string .= sprintf('<span class="firstPage"><a href="%s">首页</a></span> ', $input['first_page']);
    }
    //不是第一页，才显示上一页
    if ($input['page']>1)
    {
        $link_string .= sprintf('<span class="prePage"><a href="%s">上一页</a></span> ', $input['pre_page']);
    }
    //不是最后一页，才显示下一页
    if ($input['page']<$input['page_num'])
    {
        $link_string .= sprintf('<span class="nextPage"><a href="%s">下一页</a></span> ',$input['next_page']);
    }
    //如果是末页，则没有链接
    if($input['page'] == $input['page_num'])
    {
        $link_string .= '<span class="endPage">末页</span> ';
    }
    else
    {
        $link_string .= sprintf('<span class="endPage"><a href="%s">末页</a></span> ',$input['end_page']);
    }
    $link_string .= sprintf('<span class="totalPages">共%s页</span> ',$input['page_num']);
    $link_string .= sprintf('<span class="per">每页%s项</span> ',$input['per']);
    $link_string .= sprintf('<span class="totalItems">共%s项</span> ',$input['total']);
    $link_string .= "</div>";
    return $link_string;
}
/*
function _style_2($input)
{
    $url_replace = function($url,$i){return str_replace('#',$i,$url);};
	$display_page = $config['DEFAULT_PAGE_DISPLAY'];
	
    //生成html代码
    $link_string  = '<div class="pagesBar">';
    
    //不是第一页，才显示上一页
    if ($input['page']>1)
    {
        $link_string .= sprintf('<span class="prePage"><a href="%s">上一页</a></span> ', $input['pre_page']);
    }
    //总页数小于默认显示页数
    if($input['page_num']<=$display_page+2)
    {
    	for($i=1;$i<=$input['page_num'];$i++)
    	{
    		if($i == $input['page'])
            {
                $link_string .= sprintf('<span class="pageNumber page-cur">%s</span> ', $i);
            }
            else
            {
            	$link_string .= sprintf('<span class="pageNumber"><a href="%s">%s</a></span> ',$url_replace($input['url'],$i),$i);
            }
    	}
    }
    else 
    {
        //当前页数小于等于默认显示页数
        if ($input['page']<=$display_page)
        {
            //先显示前几页
            for($i=1;$i<=$display_page+1;$i++)
        	{
        		if($i == $input['page'])
                {
                    $link_string .= sprintf('<span class="pageNumber page-cur">%s</span> ', $i);
                }
                else
                {
                	$link_string .= sprintf('<span class="pageNumber"><a href="%s">%s</a></span> ',$url_replace($input['url'],$i),$i);
                }
        	}
        	//显示"..."
        	$link_string .= '...';
        	//显示最后两页
        	for($i=$input['page_num']-1;$i<=$input['page_num'];$i++)
        	{
            	$link_string .= sprintf('<span class="pageNumber"><a href="%s">%s</a></span> ',$url_replace($input['url'],$i),$i);
        	}
        }
        //当前页数大于默认显示页数，并且小于总页数减去默认显示页数
        elseif($input['page']>$display_page && $input['page']<$input['page_num']-$display_page)
        {
            //先显示前几页
            for($i=$input['page']-1;$i<=($input['page']-1)+$display_page;$i++)
        	{
        		if($i == $input['page'])
                {
                    $link_string .= sprintf('<span class="pageNumber page-cur">%s</span> ', $i);
                }
                else
                {
                	$link_string .= sprintf('<span class="pageNumber"><a href="%s">%s</a></span> ',$url_replace($input['url'],$i),$i);
                }
        	}
        	//显示"..."
        	$link_string .= '...';
            //显示最后两页
        	for($i=$input['page_num']-1;$i<=$input['page_num'];$i++)
        	{
            	$link_string .= sprintf('<span class="pageNumber"><a href="%s">%s</a></span> ',$url_replace($input['url'],$i),$i);
        	}
        }
        //当前页数大于等于总页数减去默认显示页数
        elseif ($input['page']>=$input['page_num']-$display_page)
        {
            //显示最后几页
        	for($i=($input['page_num']-$display_page)-1;$i<=$input['page_num'];$i++)
        	{
        	    if($i == $input['page'])
                {
                    $link_string .= sprintf('<span class="pageNumber page-cur">%s</span> ', $i);
                }
                else
                {
                	$link_string .= sprintf('<span class="pageNumber"><a href="%s">%s</a></span> ',$url_replace($input['url'],$i),$i);
                }
        	}
        
        }
    }
    //不是最后一页，才显示下一页
    if ($input['page']<$input['page_num'])
    {
        $link_string .= sprintf('<span class="nextPage"><a href="%s">下一页</a></span> ',$input['next_page']);
    }
    $link_string .= "</div>";
    return $link_string;
}



function _style_3($input)
{
    //生成html代码
    $link_string  = '<div class="pagesBar">';
    $link_string .= sprintf('<span class="firstPage"><a href="%s">首页</a></span> ', $input['first_page']);
    //总页数小于配置的页数
    if($input['page_num']<=$display_page)
    {
    	for($i=1;$i<=$input['page_num'];$i++)
    	{
    		if($i == $input['page'])
            {
                $link_string .= sprintf('<span class="pageNumber">%s</span> ', $i);
            }
            else
            {
            	$link_string .= sprintf('<span class="pageNumber"><a href="%s">%s</a></span> ',
                    $url_replace($input['url'],$i),$i);
            }
    	}
    }
    //当前页码小于默认显示页码数，显示前几个页码，后面加...
    else if($input['page']<=$display_page)
    {
        for($i=1;$i<=$display_page+1;$i++)
        {
            if($i == $input['page'])
            {
                $link_string .= sprintf('<span class="pageNumber">%s</span> ', $i);
            }
            else
            {
                $link_string .= sprintf('<span class="pageNumber"><a href="%s">%s</a></span> ',
                    $url_replace($input['url'],$i),$i);
            }
        }
        $link_string .= '...';
    }
    //当前页码大于总页码数减去默认显示页码数
    else if($input['page']>$input['page_num']-$display_page)
    {
        $link_string .= '...';
        $i = $input['page_num'] - $display_page;	
        for($i;$i<=$input['page_num'];$i++)
        {
            if($i == $input['page'])
            {
                $link_string .= sprintf('<span class="pageNumber">%s</span> ', $i);
            }
            else
            {
                $link_string .= sprintf('<span class="pageNumber"><a href="%s">%s</a></span> ',
                    $url_replace($input['url'],$i),$i);
            }
        }
    }
    //当前页码等于默认显示页码数,或者小于总页码数减去默认显示页码数
    else if($input['page'] > $display_page || $input['page']<=($input['page_num']-$display_page))
    {
        //左边隐藏页码
        if($input['page'] != ($display_page+1))
        	$link_string .= '...';
        //当前页码的左边显示N个页码，右边显示N个页码
        $left_page = $input['page'] - $display_page;
        $right_page = $input['page'] + $display_page;
        for($left_page; $left_page<=$right_page; $left_page++)
        {
            if($left_page == $input['page'])
            {
                $link_string .= sprintf('<span class="pageNumber">%s</span> ', $left_page);
            }
            else
            {
                $link_string .= sprintf('<span class="pageNumber"><a href="%s">%s</a></span> ',
                    $url_replace($input['url'],$left_page),$left_page);
            }
        }
        //右边隐藏页码
        if($input['page'] != $input['page_num'] - $display_page)
        	$link_string .= '...';
    }
    $link_string .= sprintf('<span class="endPage"><a href="%s">末页</a></span> ',$input['end_page']);
    $link_string .= sprintf('<span class="totalPages">共%s页</span> ',$input['page_num']);
    $link_string .= sprintf('<span class="per">每页%s项</span> ',$input['per']);
    $link_string .= sprintf('<span class="totalItems">共%s项</span> ',$input['total']);
    $link_string .= "</div>";
    return $link_string;
}
*/
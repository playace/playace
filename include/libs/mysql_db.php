<?php
/*
* mysql数据库 DB类
*
* @package libs
* @author ray_xu <raynorxyx@hotmail.com>
* @version 1.0 <2011-2-12>
*/

class mysql_db{
	private $Host = "";
	private $User = "";
	private $Password = "";
	private $DB = "";
	private $dbCharSet = "";

	private $Link_ID = 0;    			//数据库连接
	private $Query_ID = 0;   			//查询结果
	private $Row_Result = array();  	//结果集成组的数组
	private $Field_Result = array();  	//结果集字段名组成数组
	private $Affected_row;   			//影响行数
	private $Rows;   					//结果集中记录的行数
	private $Fields;  					//结果集字段数
	private $Row_Position; 				//记录指针位置索引
	private $Error;


	function __construct($hostname,$username,$password,$db,$dbcharset)
	{
		$this->Host = $hostname;
		$this->User = $username;
		$this->Password = $password;
		$this->DB = $db;
		$this->dbCharSet = $dbcharset;
	}
//=========================================================
//					以下为私有函数
//=========================================================

	//连接数据库
	private function connect()
	{
		if(0 == $this->Link_ID)
		{
			$this->Link_ID = mysql_connect($this->Host,$this->User,$this->Password);
			if(!$this->Link_ID)
			{
				$this->halt("连接数据库服务端失败!");
			}
			if(!mysql_select_db($this->DB,$this->Link_ID))
			{
				$this->halt("不能打开指定的数据库".$this->DB);
			}
			mysql_query("SET NAMES $this->dbCharSet");
		}
	}

	//查询数据
	public function query($Query_string)
	{
		if($this->Query_ID)
		{
			$this->free();
		}
		if(0 == $this->Link_ID)
		{
			$this->connect();
		}

		$this->Query_ID = mysql_query($Query_string);

		if(!$this->Query_ID)
		{
			$this->halt("SQL查询语句出错：".$Query_string);
		}
	  	return $this->Query_ID;
	}

	//释放内存
	private function free()
	{
		if(@mysql_free_result($this->Query_ID))
		{
			unset($this->Row_Result);   //释放由结果集组成的数组
		}
		$this->QueryID = 0;
	}

	//打印错误信息
	private function halt($msg)
	{
		$this->Error = mysql_error();
		printf("<br><b>数据库发生错误：</b>%s<br>\n",$msg);
		printf("<b>MySQL 返回错误信息:</b> %s <br>\n",$this->Error);
		die("脚本终止");
	}

   /*
	* 返回由查询结果中第一行记录组成的数组
	*
	* @access private
	* @return array
	* @author ray_xu <raynorxyx@hotmail.com>
	*/
	public function get_row_one()
	{
		return mysql_fetch_assoc($this->Query_ID);
	}

   /*
	* 返回结果集记录组成的数组
	*
	* @access private
	* @return array
	* @author ray_xu <raynorxyx@hotmail.com>
	*/
	public function get_rows_array()
	{
		$this->get_rows_num();
		for($i=0;$i<$this->Rows;$i++)
		{
			if(!mysql_data_seek($this->Query_ID,$i))
			{
				$this->halt("mysql_data_seek查询语句出错");
			}
			$this->Row_Result[$i] = mysql_fetch_array($this->Query_ID,MYSQL_ASSOC);
		}
		return empty($this->Row_Result) ? array() : $this->Row_Result;
	}

//=========================================================
//					以下为公开函数
//=========================================================

   /*
	* 返回结果集的记录行数
	*
	* @access public
	* @return int
	* @author ray_xu <raynorxyx@hotmail.com>
	*/
	public function get_rows_num()
	{
		$this->Rows = mysql_num_rows($this->Query_ID);
		return $this->Rows;
	}

   /*
	* 清空表
	*
	* @access public
	* @param string $table_name
	* @return bool
	* @author ray_xu <raynorxyx@hotmail.com>
	*/
	public function truncate($table_name)
	{
		assert(is_string($table_name));
        return $this->query(sprintf("TRUNCATE TABLE %s;", $table_name));
	}

   /*
	* 记录总数
	*
	* @access public
	* @param string $table_name
	* @return int
	* @author ray_xu <raynorxyx@hotmail.com>
	*/
	public function total($table_name)
	{
		assert(is_string($table_name));
		$this->query(sprintf("SELECT COUNT(*) AS total FROM %s;" , $table_name));
		$result = $this->get_row_one();
		return $result['total'];
	}

   /*
	* 字段详细
	*
	* @access public
	* @param string $table_name
	* @return array
	* @author ray_xu <raynorxyx@hotmail.com>
	*/
	public function columns($table_name)
	{
		assert(is_string($table_name));
		$this->query(sprintf("SHOW FULL COLUMNS FROM %s;" , $table_name));
		return $this->get_rows_array();
	}

   /*
	* 字段列表
	*
	* @access public
	* @param string $table_name
	* @return array
	* @author ray_xu <raynorxyx@hotmail.com>
	*/
	public function column_list($table_name)
	{
		assert(is_string($table_name));
		$this->query(sprintf("SHOW FULL COLUMNS FROM %s;" , $table_name));
		$result = $this->get_rows_array();

		$columns = array();
        foreach ($result as $row)
            $columns[] = $row['Field'];
        return $columns;
	}

   /*
	* 列出所有表
	*
	* @access public
	* @return array
	* @author ray_xu <raynorxyx@hotmail.com>
	*/
	public function tables()
	{
		$this->query("SHOW TABLES");
		return $this->get_rows_array();
	}

   /*
	* 获取全部记录
	*
	* @access public
	* @param string $table_name
	* @return array
	* @author ray_xu <raynorxyx@hotmail.com>
	*/
	public function getAll($table_name)
	{
		assert(is_string($table_name));
		$this->query(sprintf("SELECT * FROM %s WHERE 1;" , $table_name));
		return $this->get_rows_array();
	}

   /*
	* 根据条件查询记录列表
	*
	* @access public
	* @param string $table_name
	* @param string $con
	* @return array
	* @author ray_xu <raynorxyx@hotmail.com>
	*/
	public function get_by_con($table_name,$con)
	{
		assert(is_string($table_name) && is_string($con));
		$this->query(sprintf("SELECT * FROM %s WHERE %s;" , $table_name , $con));
		return $this->get_rows_array();
	}

   /*
	* 根据条件查询一条记录
	*
	* @access public
	* @param string $table_name
	* @param string $con
	* @return array
	* @author ray_xu <raynorxyx@hotmail.com>
	*/
	public function get_one($table_name,$con)
	{
		assert(is_string($table_name) && is_string($con));
		$this->query(sprintf("SELECT * FROM %s WHERE %s;" , $table_name , $con));
		return $this->get_row_one();
	}

   /*
	* 根据条件查询一条记录
	*
	* @access public
	* @param string $table_name
	* @param int $id
	* @return array
	* @author ray_xu <raynorxyx@hotmail.com>
	*/
	public function get_by_id($table_name,$id)
	{
		assert(is_string($table_name) && $id);
		$this->query(sprintf("SELECT * FROM %s WHERE id = %d;" , $table_name , $id));
		return $this->get_row_one();
	}

   /*
	* 新增记录
	*
	* @access public
	* @param string $table_name
	* @param array $data
	* @return bool
	* @author ray_xu <raynorxyx@hotmail.com>
	*/
	public function insert($table_name,$data)
	{
		assert(is_string($table_name) && is_array($data) && count($data));
		foreach ($data as $key=>$value)
		{
			$sqlfield .= $key.",";
			$sqlvalue .= "'".$value."',";
		}
		$sql = "INSERT INTO `".$table_name."`(".substr($sqlfield, 0, -1).") VALUES (".substr($sqlvalue, 0, -1).")";
		return $this->query($sql);
	}

   /*
	* 获取新增记录的主键id
	*
	* @access public
	* @return int
	* @author ray_xu <raynorxyx@hotmail.com>
	*/
	public function insert_id()
	{
		return mysql_insert_id($this->Link_ID);
	}

   /*
	* 根据id修改记录
	*
	* @access public
	* @param string $table_name
	* @param int $id
	* @param array $data
	* @return bool
	* @author ray_xu <raynorxyx@hotmail.com>
	*/
	public function update_by_id($table_name,$id,$data)
	{
		assert(is_string($table_name) && $id && is_array($data) && count($data));
		foreach ($data as $key=>$value)
		{
			$sqlud .= $key."= '".$value."',";
		}
		$sql = "UPDATE `".$table_name."` SET ".substr($sqlud, 0, -1)." WHERE "."id =".$id;
		return $this->query($sql);
	}

   /*
	* 根据条件修改记录
	*
	* @access public
	* @param string $table_name
	* @param string $con
	* @param array $data
	* @return bool
	* @author ray_xu <raynorxyx@hotmail.com>
	*/
	public function update_by_con($table_name,$con,$data)
	{
		assert(is_string($table_name) && is_string($con) && is_array($data) && count($data));
		foreach ($data as $key=>$value)
		{
			$sqlud .= $key."= '".$value."',";
		}
		$sql = "UPDATE `".$table_name."` SET ".substr($sqlud, 0, -1)." WHERE ".$con;
		return $this->query($sql);
	}

   /*
	* 根据id删除记录
	*
	* @access public
	* @param string $table_name
	* @param int $id
	* @return bool
	* @author ray_xu <raynorxyx@hotmail.com>
	*/
	public function delete_by_id($table_name,$id)
	{
		assert(is_string($table_name) && $id);
		$sql = "DELETE FROM `".$table_name."` WHERE id = ".$id;
		return $this->query($sql);
	}

   /*
	* 根据条件删除记录
	*
	* @access public
	* @param string $table_name
	* @param string $con
	* @return bool
	* @author ray_xu <raynorxyx@hotmail.com>
	*/
	public function delete_by_con($table_name,$con)
	{
		assert(is_string($table_name) && is_string($con));
		$sql = "DELETE FROM `".$table_name."` WHERE ".$con;
		return $this->query($sql);
	}

   /*
	* 影响记录数，仅对 INSERT，UPDATE 或者 DELETE
	*
	* @access public
	* @return int
	* @author ray_xu <raynorxyx@hotmail.com>
	*/
	public function affected_rows_num()
	{
		return mysql_affected_rows($this->Link_ID);
	}

}
?>

<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
/**
 * CodeIgniter
 *
 * An open source application development framework for PHP 5.1.6 or newer
 *
 * @package		CodeIgniter
 * @author		ExpressionEngine Dev Team
 * @copyright	Copyright (c) 2008 - 2011, EllisLab, Inc.
 * @license		http://codeigniter.com/user_guide/license.html
 * @link		http://codeigniter.com
 * @since		Version 1.0
 * @filesource
 */

// ------------------------------------------------------------------------

/**
 * CodeIgniter Application Controller Class
 *
 * This class object is the super class that every library in
 * CodeIgniter will be assigned to.
 *
 * @package		CodeIgniter
 * @subpackage	Libraries
 * @category	Libraries
 * @author		ExpressionEngine Dev Team
 * @link		http://codeigniter.com/user_guide/general/controllers.html
 */

require_once($system_path . "libraries/Smarty/Smarty.class.php");

class CI_Controller {

	private static $instance;
	protected static $smarty;

	/**
	 * Constructor
	 */
	public function __construct()
	{
		self::$instance =& $this;
		
		// Assign all the class objects that were instantiated by the
		// bootstrap file (CodeIgniter.php) to local class variables
		// so that CI can run as one big super object.
		foreach (is_loaded() as $var => $class)
		{
			$this->$var =& load_class($class);
		}

		$this->load =& load_class('Loader', 'core');

		$this->load->set_base_classes()->ci_autoloader();
		
		//log_message('debug', "Controller Class Initialized");
		
		$rootdir = substr(BASEPATH, 0, strlen(BASEPATH)-4);
		$this->smarty = new Smarty();
		$this->smarty->template_dir = $rootdir . 'app/tpls/html/';
		$this->smarty->compile_dir = $rootdir . 'app/tpls/compile/';
		$this->smarty->compile_dir = $rootdir . 'app/tpls/config/';
		$this->smarty->cache_dir = $rootdir . 'app/tpls/cache/';
	}

	public static function &get_instance()
	{
		return self::$instance;
	}
}
// END Controller class

/* End of file Controller.php */
/* Location: ./system/core/Controller.php */